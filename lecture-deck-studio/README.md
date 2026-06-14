# lecture-deck-studio

A self-improving Claude Code plugin for building first-principles lecture decks.

It bundles two skills (deck pedagogy and Excalidraw diagrams), a `/new-deck` command,
two MCP servers (the 100x design wiki and Excalidraw), and a self-improving hook loop
that learns your house style from the corrections you make. A new collaborator gets your
whole deck setup on day one.

## What is inside

| Component | What it does |
|-----------|--------------|
| `skills/deck-design` | First-principles, Socratic, Feynman-style lecture pedagogy plus `deck-conventions.md` (your house style). |
| `skills/diagram-from-concept` | Maps bracketed visual cues (`[Diagram: ...]`) to animated Excalidraw diagrams via the Excalidraw MCP. |
| `skills/new-deck` | `/new-deck <topic>` scaffolds a deck spine and stops for your sign-off. (Slash commands and skills are unified, so this ships as a skill and is invoked the same way.) |
| `hooks/hooks.json` | **SessionStart** loads `deck-conventions.md` into context. **Stop** scans the session for corrections you made and appends durable ones back to `deck-conventions.md`. |
| `.mcp.json` | The `100x-design-wiki` and `excalidraw` HTTP MCP servers. |

### The self-improving loop
You correct a slide. The Stop hook notices and writes the lesson into `deck-conventions.md`.
Next session, the SessionStart hook loads that lesson back in. You never give the same
correction twice.

## Install

The plugin ships its own marketplace (`.claude-plugin/marketplace.json`, marketplace name
`100x-studio`). Install it from a checkout of this repo:

```bash
# 1. Add the marketplace (point at the plugin folder)
claude plugin marketplace add ./lecture-deck-studio

# 2. Install the plugin
claude plugin install lecture-deck-studio@100x-studio

# 3. Restart Claude Code so the hooks and MCP servers register.
```

Or interactively inside Claude Code:

```
/plugin marketplace add ./lecture-deck-studio
/plugin install lecture-deck-studio@100x-studio
```

Confirm it loaded:

```bash
claude plugin list          # status should read: enabled
claude plugin details lecture-deck-studio@100x-studio
```

`details` prints the component inventory (3 skills including `new-deck`, 2 hooks, 2 MCP
servers) and the projected token cost.

### Optional dependency
Rendered slides are produced by an external slide-rendering skill (for example
`ai-concept-slides`). That skill is **not** bundled here. Without it, the deck script
itself is the deliverable; diagrams still work through the bundled `diagram-from-concept`
skill and the Excalidraw MCP.

## How to test it

You do not need to install the plugin to verify it. All checks run from the repo root.

### 1. Validate the manifests
```bash
claude plugin validate lecture-deck-studio
```
Expect `Validation passed`.

### 2. Check every JSON file parses
```bash
for f in lecture-deck-studio/.claude-plugin/plugin.json \
         lecture-deck-studio/.claude-plugin/marketplace.json \
         lecture-deck-studio/.mcp.json \
         lecture-deck-studio/hooks/hooks.json; do
  jq empty "$f" && echo "OK   $f"
done
```

### 3. Run the SessionStart hook by hand
The hook emits the conventions as `additionalContext` JSON.
```bash
CLAUDE_PLUGIN_ROOT="$(pwd)/lecture-deck-studio" \
  bash lecture-deck-studio/hooks/load-conventions.sh | jq -r '.additionalContext'
```
Expect the contents of `deck-conventions.md`. Point `CLAUDE_PLUGIN_ROOT` at a path with no
conventions file to confirm the graceful fallback message instead of a crash.

### 4. Check the MCP endpoints are live
```bash
for url in https://100x-design-wiki.cohort-c62.workers.dev/mcp https://mcp.excalidraw.com/mcp; do
  curl -s -o /dev/null -w "%{http_code}  $url\n" -m 8 -X POST "$url" \
    -H 'Content-Type: application/json' \
    -H 'Accept: application/json, text/event-stream' \
    -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"test","version":"1"}}}'
done
```
Expect `200` for both.

### 5. End-to-end inside Claude Code
1. Restart Claude Code after install.
2. Start a session and confirm the deck conventions arrive as context (SessionStart hook).
3. Run `/new-deck "your topic"` and check it scaffolds the spine and stops for sign-off.
4. Correct a piece of deck work (remove an em dash, reorder an explanation, rework a
   framing), then end the session. The Stop hook should append a new rule to
   `skills/deck-design/deck-conventions.md`.
5. Start a fresh session and confirm the new rule is loaded.

## How to use it

1. **Start a deck:** `/new-deck "how transformers actually attend"`. The command restates
   the misconception, drafts the cold open and first question, proposes at most three
   principles, lists visual cues, and stops for your sign-off before full narration.
2. **Build diagrams:** every bracketed visual cue (`[Diagram: ...]`) becomes an animated
   Excalidraw diagram through the `diagram-from-concept` skill.
3. **Correct freely:** when you rewrite a slide or change an order, just say so. The Stop
   hook captures durable preferences into `deck-conventions.md` so you never repeat them.
4. **Edit conventions directly:** `skills/deck-design/deck-conventions.md` is yours to
   edit. The hook only appends; it never rewrites your existing rules.

## Standing rule
No em dashes in any output. Use colons, commas, semicolons, or parentheses instead.

## Uninstall
```bash
claude plugin uninstall lecture-deck-studio@100x-studio
claude plugin marketplace remove 100x-studio
```
