// Printable: BRACED — Quick Readiness Check
#import "preamble.typ": *

// Content function — called by standalone (below) and combined.typ
#let quick-readiness-content() = [
  #printable-header("BRACED — Quick Readiness Check", colour: rgb("#0e7c47"))

  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Daily during wartime · Weekly during elevated tension · Monthly during routine. Under 2 minutes.]
  #v(0.15cm)

  #cr-instructions()

  #v(0.2cm)

  #block(
    width: 100%,
    radius: 6pt,
    clip: true,
    stroke: 1.5pt + blue-accent,
  )[
    #table(
      columns: (auto, 1fr, 2.5fr),
      inset: 9pt,
      stroke: 0.5pt + grey-border,
      fill: checklist-table-fill,
      align: (center, left, left),
      ..checklist-table-headers(),

      icon-bag, [*Bag* #critical],
      [#cr-line("Position?", [*BY DOOR*, *ZIPPED*])
       #linebreak() #cr-line("Contents?", [*VERIFIED*])],

      icon-door, [*Route*],
      [#cr-line("Hallway?", [*CLEAR*])
       #linebreak() #cr-line("Door?", [*UNLOCKABLE* quickly])],

      icon-phone, [*Alerts* #critical],
      [#cr-line("Phone?", [*ON*, *CHARGED*, HFC app *RUNNING*, area *CORRECT*])
       #linebreak() #cr-line("Wireless Alerts?", [*ENABLED*])
       #linebreak() #cr-line("DND Override?", [*VERIFIED*])],

      icon-shield, [*Cover*],
      [#cr-line("Nearest Shelters?", [*THREE KNOWN*, routes *WALKABLE*])],

      icon-water, [*Essentials*],
      [#cr-line("Water Supply?", [*ACCESSIBLE*, not *EXPIRED*], d: "72-hour minimum")],

      icon-people, [*Dependents*],
      [#cr-line("Headcount?", [all *PRESENT* or *ACCOUNTED* for])],
    )
  ]

  #v(0.3cm)

  #block(
    width: 100%,
    inset: 14pt,
    fill: blue-light,
    radius: 8pt,
    stroke: 1.5pt + blue-accent,
  )[
    #align(center)[
      #text(size: 16pt, weight: "bold", fill: blue-dark)[Mnemonic: BRACED]
      #v(4pt)
      #text(size: 12pt, fill: grey-text, style: "italic")["Stay BRACED"]
    ]
  ]
]

// === Standalone compilation ===
#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#quick-readiness-content()
#printable-footer()
