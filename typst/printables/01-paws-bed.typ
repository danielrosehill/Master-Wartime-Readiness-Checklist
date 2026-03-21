// Printable: Quick Readiness Check
#import "preamble.typ": *

// Content function — called by standalone (below) and combined.typ
#let quick-readiness-content() = [
  #printable-header("Quick Readiness Check", colour: rgb("#0e7c47"))

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

      icon-phone, [*Phone* #critical],
      [#cr-line("Charge Status?", [*CHARGED* or *CHARGING*])
       #linebreak() #cr-line("HFC App?", [*RUNNING*, area *CORRECT*])],

      icon-alert, [*Alerts* #critical],
      [#cr-line("Wireless Alerts?", [*ENABLED*])
       #linebreak() #cr-line("DND Override?", [*VERIFIED*])],

      icon-water, [*Water*],
      [#cr-line("Emergency Supply?", [*ACCESSIBLE*, not *EXPIRED*], d: "72-hour minimum")],

      icon-shield, [*Shelter*],
      [#cr-line("Nearest Shelters?", [*THREE KNOWN*, routes *WALKABLE*])],

      icon-bag, [*Go Bag* #critical],
      [#cr-line("Position?", [*BY DOOR*, *ZIPPED*])
       #linebreak() #cr-line("Contents?", [*VERIFIED*])],

      icon-door, [*Exit*],
      [#cr-line("Hallway?", [*CLEAR*])
       #linebreak() #cr-line("Door?", [*UNLOCKABLE* quickly])],

      icon-people, [*Dependents*],
      [#cr-line("Headcount?", [all *PRESENT* or *ACCOUNTED* for])],
    )
  ]

  #v(0.3cm)

  #block(
    width: 100%,
    inset: 12pt,
    fill: blue-light,
    radius: 8pt,
    stroke: 1.5pt + blue-accent,
  )[
    #align(center)[
      #text(size: 11pt, weight: "bold", fill: blue-dark)[Memory Aids]
      #v(4pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 12pt,
        block(inset: 6pt)[
          #text(size: 9pt, fill: blue-dark)[#icon-sun *Daytime*] \
          #text(size: 9pt, style: "italic")["Phone, dressed, keys, bag — \
          can I get out the door in 60 seconds?"]
        ],
        block(inset: 6pt)[
          #text(size: 9pt, fill: blue-dark)[#icon-moon *Nighttime*] \
          #text(size: 9pt, style: "italic")["Charged, laid out, unlocked — \
          can I survive a 3am siren on autopilot?"]
        ],
      )
    ]
  ]
]

// === Standalone compilation ===
#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#quick-readiness-content()
#printable-footer()
