// Printable: Lull / Resupply Checklist
#import "preamble.typ": *

#let lull-resupply-content() = [
  #printable-header("During a Lull — Resupply & Maintenance", colour: green-calm)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[When there's a pause in alerts — hours or days — use the window wisely. Lulls don't last.]
  #v(0.15cm)
  #cr-instructions()
  #v(0.15cm)

  #block(width: 100%, inset: (x: 10pt, y: 6pt), fill: blue-light, radius: 3pt)[
    #text(size: 12pt, weight: "bold", fill: blue-dark)[Resupply — Priority Order]
  ]
  #v(0.1cm)
  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { green-light } else { white },
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-water, [*Water* #critical],
    [#cr-line("Water Supply?", [*TOPPED UP*], d: "9L per person for 72 hours")],
    icon-medkit, [*Medications* #critical],
    [#cr-line("Prescriptions?", [*FILLED*], d: "Don't wait for the last pill")
     #linebreak() #cr-line("First Aid Kit?", [*RESTOCKED*])],
    icon-phone, [*Power*],
    [#cr-line("Phones?", [*CHARGED*])
     #linebreak() #cr-line("Power Banks?", [*CHARGED*])
     #linebreak() #cr-line("Torches?", [batteries *FRESH*])],
    icon-food, [*Food*],
    [#cr-line("Pantry?", [*RESTOCKED*], d: "Canned goods, shelf-stable — see Appendix I")],
    icon-bag, [*Go Bag*],
    [#cr-line("Bag Contents?", [*REPACKED*], d: "Replace anything used, check expiry dates")],
    icon-car, [*Transport*],
    [#cr-line("Fuel Level?", [at least *HALF* a tank], d: "Queues may be long")
     #linebreak() #cr-line("Cash?", [*WITHDRAWN*], d: "ATMs may go offline; keep small bills")],
    icon-shirt, [*Laundry*],
    [#cr-line("Clean Clothes?", [*DONE*], d: "Ready for the next round")],
  )
  #v(0.25cm)
  #block(width: 100%, inset: (x: 10pt, y: 6pt), fill: blue-light, radius: 3pt)[
    #text(size: 12pt, weight: "bold", fill: blue-dark)[Home & Safety Checks]
  ]
  #v(0.1cm)
  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-shield, [*Mamad / Shelter*],
    [#cr-line("Shelter Condition?", [*CHECKED*], d: "Anything displaced by shaking?")
     #linebreak() #cr-line("Door Seal?", [*INTACT*])],
    icon-fire, [*Safety*],
    [#cr-line("Smoke Detector?", [*TESTED*])
     #linebreak() #cr-line("Fire Extinguisher?", [*ACCESSIBLE*])
     #linebreak() #cr-line("Gas Lines?", [no *LEAKS*], d: "If you smell gas, shut off and call 102")],
    icon-people, [*People*],
    [#cr-line("Family Contacted?", [*YES* — everyone safe, plans updated])
     #linebreak() #cr-line("Neighbours Checked?", [*YES*], d: "Especially elderly / living alone")],
  )
  #v(0.25cm)
  #block(width: 100%, inset: 10pt, fill: blue-light, radius: 6pt, stroke: 1pt + blue-accent)[
    #text(size: 9pt, weight: "bold", fill: blue-dark)[Self-Care During Lulls]
    #v(4pt)
    #set text(size: 9pt)
    #cr-line("Slept?", [*YES*], d: "Real sleep, not a nap")
    #h(6pt) #cr-line("Showered?", [*YES*])
    #h(6pt) #cr-line("Outside?", [*YES*], d: "Sunlight if safe")
    #linebreak()
    #text(size: 8.5pt, style: "italic")[Prioritise ruthlessly: water and medications first, then power, then food, then everything else.]
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#lull-resupply-content()
#printable-footer()
