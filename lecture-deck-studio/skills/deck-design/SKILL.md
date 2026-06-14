---
name: deck-design
description: >
  Design first-principles, Socratic, Feynman-style lecture decks and delivery scripts.
  Use when the user wants to build or restructure a teaching deck, talk, workshop, or
  lecture script, sequence an explanation from intuition to formalism, write a cold open
  or a "first question" hook, add takeaways and verified citations, or turn a technical
  topic into a narrative that derives before it names. Pairs with the bundled
  diagram-from-concept skill (for visuals) and, if installed, an external slide-rendering
  skill such as ai-concept-slides (for rendered slides).
---

# Deck Design (First-Principles Lecture Studio)

Build lectures that make the audience *derive* the idea before you hand them the word for it. The deck is a script with stage directions, not a wall of bullets.

## Read this first
Load `deck-conventions.md` (in this skill folder) before writing anything. It is the accumulated house style and it grows every time the user corrects a deck. The standing rule that never drifts: **no em dashes anywhere; use colons, commas, semicolons, or parentheses.**

## The teaching spine (apply in order)
1. **Why before what.** Open on a problem the audience already feels, not a definition.
2. **Derive before name.** Let them guess, get it wrong, then reveal the mechanism. Name the concept only after they can see why it must be true.
3. **Mechanism, not vibe.** Every claim resolves to something the audience can point at. "A mechanism. You will be able to point at it."
4. **One idea per beat.** A beat is a single move: a question, a reveal, a demo, a takeaway. Never stack two.
5. **Earn each principle with a question.** Precede a principle with a question whose obvious answer is wrong.

## Script structure that works
- **Cold open**: a 30-second current hook, one laugh, then a hard pivot to the thesis.
- **The promise**: ask the audience to write down the concrete failure they will learn to diagnose. Promise a mechanism, not a vibe.
- **The first question**: pose the question whose common answer is the misconception the lecture corrects.
- **Principles**: 3 is the ceiling. Each = question, reveal, demo, takeaway, transition.
- **The close**: walk back through the principles against the failure they wrote down. End on one action to run tonight.

## Every principle ends the same way
Close each principle with this fixed shape so the audience can feel the rhythm:
1. **Run this tonight**: one concrete action, phrased as a command.
2. **Takeaway** (boxed): the single sentence they keep.
3. **Source** (boxed): the verified citation. Title, author or org, date, URL. Verify recent sources by web search before presenting; never cite from memory.
4. **Bridge**: one short paragraph that turns the resolved principle into the question the next principle answers.

## Citations
- Verify every source against the live web before the talk. Recent posts move; confirm exact title, author, and date.
- Quote sparingly and under 15 words. Prefer paraphrase. One quote per source maximum.
- Prefer primary sources (the vendor's own blog, the docs, the paper) over aggregators.

## Producing the artifact
- For visuals (pipeline, comparison, layered stack, zoom), invoke the bundled `diagram-from-concept` skill. Use a diagram wherever the script has a bracketed visual cue.
- For rendered slides, invoke an external slide-rendering skill (for example `ai-concept-slides`) if one is installed. It is not bundled with this plugin; if it is unavailable, deliver the script as the artifact.
- Keep the script and the slides in sync: the script is the source of truth, slides follow it.

## Self-check before finishing
- [ ] No em dashes anywhere.
- [ ] Each principle was earned by a question with a wrong obvious answer.
- [ ] Every principle has Run-tonight, Takeaway, Source, Bridge.
- [ ] Every source verified against the live web today.
- [ ] Every bracketed visual cue has a plan or a built diagram.
- [ ] The close maps each principle back to the audience's written-down failure.
