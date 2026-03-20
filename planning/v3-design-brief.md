# V3 Design Brief — Israel Wartime Readiness Field Guide

## Objective

Create a professionally designed, printable A4 PDF field guide from the existing v2 markdown content. The current PDF has essentially no layout — it's raw text with tables. V3 should be a visually appealing, well-typeset document that feels approachable and less intimidating.

## Tool Chain

- **Typst** — Primary typesetting engine (not LaTeX, not pandoc)
- **fal.ai** — Generate additional graphics/icons as needed (MCP available)
- **Nano Banana** — Additional image generation tool available

## Typography

- **Primary font**: Atkinson Hyperlegible (the font Daniel originally used)
- Designed for maximum legibility, especially important for an emergency document read under stress

## Design Requirements

### Page Layout
- **A4 paper size**
- Print-optimised (consider margins for binding/stapling)
- Clear visual hierarchy with section headers, sub-headers, and body text
- Professional colour scheme (suggest: blue/white/grey to match Israeli flag theme and beyahad.png branding)

### Visual Elements

#### Avatars (Mascots)
- **Herman** — Donkey mascot. Available as:
  - `images/avatars/herman/avatar.png` — Circular avatar (orange background, crocheted toy)
  - `images/avatars/herman/photo.png` — Original photo of crocheted donkey
  - `assets/generated/herman-test.png` — Cartoon version in orange hi-vis vest
- **Corn** — Sloth mascot. Available as:
  - `images/avatars/corn/avatar.png` — Circular avatar (teal background, cartoon in green jacket)
  - `images/avatars/corn/photo.png` — Original photo of stuffed sloth

**Usage**: Integrate avatars throughout the document to make it less intimidating. Use them as:
- Section header companions
- Callout box illustrations
- Tip/note indicators
- Possibly assign roles (e.g., Herman for critical safety items, Corn for wellness/comfort items)

#### Beyahad Banner
- `images/other/beyahad.png` — "ביחד ננצח" (Together We Will Win) banner with Israeli flag ribbons
- **Use as footer** on pages (as Daniel originally had it)
- Could also appear on cover page

#### Flowcharts
- **Decision trees** (especially Appendix D — Protected Space Decision Tree) should be rendered as proper flowcharts
- Use Typst's drawing/diagramming capabilities or Fletcher package
- The current ASCII art decision tree should become a visual diagram

#### Icons
- Use icons throughout checklists to replace/supplement emoji markers
- Generate custom icons via fal.ai if needed for:
  - Phone/alerts
  - Water/supplies
  - Shelter/building
  - Go bag/backpack
  - People/family
  - Medical/first aid
  - Warning/critical items

### Structural Design Ideas
- **Cover page** with title, beyahad banner, both mascots, version info
- **Table of contents** with page numbers
- **Colour-coded sections** (e.g., red for critical/wartime, blue for preparation, green for wellness)
- **Checkbox styling** — proper styled checkboxes, not raw ☐ characters
- **Callout boxes** for tips, warnings, and important notes
- **Page headers/footers** — section name in header, beyahad in footer, page numbers
- **Emergency numbers** page designed as a tear-out reference card

## Content Source

- Primary content: `iterations/edits/v2/Israel Wartime Readiness Checklist.md`
- All content from v2 should be preserved — this is a design iteration, not a content rewrite

## Assets Inventory

```
images/avatars/herman/avatar.png    — Herman circular avatar
images/avatars/herman/photo.png     — Herman original photo
images/avatars/corn/avatar.png      — Corn circular avatar
images/avatars/corn/photo.png       — Corn original photo
images/other/beyahad.png            — "Together We Will Win" banner
assets/generated/herman-test.png    — Herman cartoon (hi-vis vest)
```

## Output

- Final PDF: `output/Israel-Wartime-Readiness-Field-Guide-v3.pdf`
- Typst source: `typst/guide.typ` (+ any supporting .typ files)
- Generated assets: `assets/generated/`

## Notes

- The repo name is "Master-Wartime-Readiness-Checklist" — file names within should reflect this
- Previous iterations in `iterations/` and `original/` are kept for history but v3 is the focus
- The guide is designed to be printed, bound/stapled, and kept physically accessible
- Reflective tape note on cover is a real instruction — keep it
