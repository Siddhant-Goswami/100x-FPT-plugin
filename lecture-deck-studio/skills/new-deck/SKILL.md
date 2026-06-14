---
name: new-deck
description: >
  Start a new first-principles lecture deck from a topic. Use when the user wants to
  scaffold a deck spine, kick off a new talk, workshop, or lecture script, or asks to
  begin a deck on some subject (often invoked as /new-deck <topic>). Produces the
  misconception, cold open, first question, principles, and visual cues, then stops for
  sign-off before full narration.
---

# New Deck

You are starting a new lecture deck. Follow the `deck-design` skill.

Topic: $ARGUMENTS

Do this in order:
1. Restate the single misconception this lecture will correct.
2. Draft the cold open, the promise, and the first question (the one whose obvious answer is wrong).
3. Propose at most three principles, each as: question, reveal, demo idea, takeaway, source-to-verify, bridge.
4. List every visual cue and mark which become Excalidraw diagrams (built with the `diagram-from-concept` skill).
5. Stop and get the user's sign-off on the spine before writing full narration.

Honour the deck conventions already loaded this session. No em dashes.
