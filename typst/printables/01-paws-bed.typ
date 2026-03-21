// Printable: Quick Readiness Check
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

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
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { blue-light } else { white },
    align: (center, left, left),
    [],
    text(fill: white, weight: "bold", size: 9pt)[CALL],
    text(fill: white, weight: "bold", size: 9pt)[RESPOND],

    icon-phone, [*Phone* #critical],
    [#call[Charge Status?] #h(3pt) #cr[*CHARGED* or *CHARGING*]
     #linebreak() #call[HFC App?] #h(3pt) #cr[*RUNNING*, area *CORRECT*]],

    icon-alert, [*Alerts* #critical],
    [#call[Wireless Alerts?] #h(3pt) #cr[*ENABLED*]
     #linebreak() #call[DND Override?] #h(3pt) #cr[*VERIFIED*]],

    icon-water, [*Water*],
    [#call[Emergency Supply?] #h(3pt) #cr(d: "72-hour minimum")[*ACCESSIBLE*, not *EXPIRED*]],

    icon-shield, [*Shelter*],
    [#call[Nearest Shelters?] #h(3pt) #cr[*THREE KNOWN*, routes *WALKABLE*]],

    icon-bag, [*Go Bag* #critical],
    [#call[Position?] #h(3pt) #cr[*BY DOOR*, *ZIPPED*]
     #linebreak() #call[Contents?] #h(3pt) #cr[*VERIFIED*]],

    icon-door, [*Exit*],
    [#call[Hallway?] #h(3pt) #cr[*CLEAR*]
     #linebreak() #call[Door?] #h(3pt) #cr[*UNLOCKABLE* quickly]],

    icon-people, [*Dependents*],
    [#call[Headcount?] #h(3pt) #cr[all *PRESENT* or *ACCOUNTED* for]],
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

#printable-footer()
