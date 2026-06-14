# lecture-deck-studio

A self-improving Claude Code harness for building first-principles lecture decks.

This is the plugin equivalent of the lesson in the deck itself: the harness beats the
model. It bundles the deck-design skill, an Excalidraw diagram skill, the design-wiki and
Excalidraw MCP servers, and a self-improving hook loop, into one installable package so a
new collaborator gets your whole deck setup on day one.

## What is in here
- `skills/deck-design` : the first-principles lecture pedagogy and `deck-conventions.md` (house style).
- `skills/diagram-from-concept` : maps bracketed visual cues to Excalidraw diagrams.
- `hooks/hooks.json` :
  - SessionStart loads `deck-conventions.md` into context so every session knows your style.
  - Stop reviews the corrections you made this session and appends durable ones to `deck-conventions.md`.
- `.mcp.json` : design-wiki and Excalidraw MCP servers.
- `skills/new-deck` : `/new-deck <topic>` to scaffold a deck spine.

## Optional dependency
Rendered slides are produced by an external slide-rendering skill (for example
`ai-concept-slides`). That skill is not bundled here. If it is not installed, the deck
script itself is the deliverable; diagrams still work via the bundled diagram-from-concept
skill and the Excalidraw MCP.

## The self-improving loop
You correct a slide. The Stop hook notices, writes the lesson into `deck-conventions.md`.
Next session, the SessionStart hook loads that lesson back in. You never give the same
correction twice. That is loop engineering: the harness improves itself while you sleep.

## Install
1. From a git repo containing this folder:
   `/plugin marketplace add <your-repo>`
   `/plugin install lecture-deck-studio@100x-studio`
2. Restart Claude Code so the hooks register.
3. Run `/new-deck "your topic"`.

## Standing rule
No em dashes in any output. Colons, commas, semicolons, or parentheses instead.
