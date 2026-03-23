// Printable: Lull / Resupply Checklist
#import "preamble.typ": *

#let lull-resupply-content() = [
  #printable-header("During a Lull — Resupply & Maintenance", colour: green-calm)
  #v(0.15cm)
  #text(size: 9pt, style: "italic")[When there's a pause in alerts — use the window wisely. Lulls don't last.]
  #v(0.1cm)
  #cr-instructions()
  #v(0.1cm)

  #block(width: 100%, inset: (x: 10pt, y: 5pt), fill: blue-light, radius: 3pt)[
    #text(size: 11pt, weight: "bold", fill: blue-dark)[Resupply — Priority Order]
  ]
  #v(0.05cm)
  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 7pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { green-light } else { white },
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-water, [*Water* #critical],
    [#cr-line("Water Supply?", [*TOPPED UP*], d: "9L/person for 72h")],
    icon-medkit, [*Medications* #critical],
    [#cr-line("Prescriptions?", [*FILLED*]) #linebreak() #cr-line("First Aid Kit?", [*RESTOCKED*])],
    icon-phone, [*Power*],
    [#cr-line("Phones?", [*CHARGED*]) #linebreak() #cr-line("Power Banks?", [*CHARGED*]) #linebreak() #cr-line("Torches?", [batteries *FRESH*])],
    icon-food, [*Food*],
    [#cr-line("Pantry?", [*RESTOCKED*], d: "Canned goods, shelf-stable")],
    icon-bag, [*Go Bag*],
    [#cr-line("Bag Contents?", [*REPACKED*], d: "Replace used items, check expiry")],
    icon-car, [*Transport / Cash*],
    [#cr-line("Fuel?", [at least *HALF* tank]) #linebreak() #cr-line("Cash?", [*WITHDRAWN*], d: "ATMs may go offline")],
    icon-shirt, [*Laundry*],
    [#cr-line("Clean Clothes?", [*DONE*])],
  )
  #v(0.15cm)
  #block(width: 100%, inset: (x: 10pt, y: 5pt), fill: blue-light, radius: 3pt)[
    #text(size: 11pt, weight: "bold", fill: blue-dark)[Home & Safety Checks]
  ]
  #v(0.05cm)
  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 7pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-shield, [*Mamad / Shelter*],
    [#cr-line("Condition?", [*CHECKED*]) #linebreak() #cr-line("Door Seal?", [*INTACT*])],
    icon-fire, [*Safety*],
    [#cr-line("Smoke Detector?", [*TESTED*]) #linebreak() #cr-line("Fire Extinguisher?", [*ACCESSIBLE*]) #linebreak() #cr-line("Gas Lines?", [no *LEAKS*], d: "Smell gas → shut off, call 102")],
    icon-people, [*People*],
    [#cr-line("Family?", [*CONTACTED* — everyone safe]) #linebreak() #cr-line("Neighbours?", [*CHECKED*], d: "Especially elderly / alone")],
  )
  #v(0.1cm)
  #block(width: 100%, inset: 8pt, fill: blue-light, radius: 4pt, stroke: 1pt + blue-accent)[
    #text(size: 8.5pt, weight: "bold", fill: blue-dark)[Self-Care] #h(6pt)
    #text(size: 8.5pt)[
      #cr-line("Slept?", [*YES*])
      #h(4pt) #cr-line("Showered?", [*YES*])
      #h(4pt) #cr-line("Outside?", [*YES*])
    ]
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#lull-resupply-content()
#printable-footer()
