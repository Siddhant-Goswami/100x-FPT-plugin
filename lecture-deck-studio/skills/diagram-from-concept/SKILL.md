---
name: diagram-from-concept
description: >
  Turn a bracketed visual cue in a lecture script into a hand-drawn Excalidraw concept
  diagram. Use when a deck beat calls for a pipeline, comparison, layered stack, zoom,
  or cycle, and you want an animated, progressively revealed visual rather than bullets.
---

# Diagram From Concept

When a script beat says "[Diagram: ...]" or "[Show image: ...]", build it as an animated
Excalidraw concept diagram by driving the Excalidraw MCP server (configured in this plugin's
`.mcp.json`) directly.

## Mapping cues to archetypes
- "trail / steps / how it finds X" -> Pipeline (grep then read then run then read).
- "X versus Y / stale versus live" -> Comparison, two columns.
- "zoom in / layers / wrapper on a wrapper" -> Layered stack, nested rectangles.
- "five extension points / build order" -> Layered stack with an upward build-order arrow.
- "prefix / what gets reused" -> Horizontal segmented bar with a cache breakpoint line.

## Rules
- One insight per diagram. 5 to 7 main elements.
- Camera is the storyteller: open on the title, step through each section, zoom out to synthesize.
- End on a formula or one-line takeaway in a yellow box.
- No em dashes in any diagram text. No emoji (Excalidraw will not render them).
