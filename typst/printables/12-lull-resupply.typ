// Printable: Lull / Resupply Checklist
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("During a Lull — Resupply & Maintenance", colour: green-calm)

#v(0.2cm)
#text(size: 9pt, style: "italic")[When there's a pause in alerts — hours or days — use the window wisely. Lulls don't last.]
#v(0.15cm)

#cr-instructions()

#v(0.15cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: red-light,
  radius: 4pt,
  stroke: 1pt + red-alert,
)[
  #text(size: 9pt, weight: "bold", fill: red-alert)[⚠ Stay alert even during quiet periods.] #text(size: 9pt)[ Phone on, HFC app running, shoes accessible. Lulls can end without warning.]
]

#v(0.2cm)

#text(size: 10pt, weight: "bold", fill: blue-dark)[Resupply — Priority Order]

#v(0.1cm)

#table(
  columns: (auto, 1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { green-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[CALL],
  text(fill: white, weight: "bold", size: 9pt)[RESPOND],

  icon-water, [*Water* #critical],
  [#call[Water Supply?] #h(3pt) #cr(d: "9L per person for 72 hours")[*TOPPED UP*]],

  icon-medkit, [*Medications* #critical],
  [#call[Prescriptions?] #h(3pt) #cr(d: "don't wait for the last pill")[*FILLED*]
   #linebreak() #call[First Aid Kit?] #h(3pt) #cr[*RESTOCKED*]],

  icon-phone, [*Power*],
  [#call[Phones?] #h(3pt) #cr[*CHARGED*]
   #linebreak() #call[Power Banks?] #h(3pt) #cr[*CHARGED*]
   #linebreak() #call[Torches?] #h(3pt) #cr[batteries *FRESH*]],

  icon-food, [*Food*],
  [#call[Pantry?] #h(3pt) #cr(d: "canned goods, shelf-stable — see Appendix I")[*RESTOCKED*]],

  icon-bag, [*Go Bag*],
  [#call[Bag Contents?] #h(3pt) #cr(d: "replace anything used, check expiry dates")[*REPACKED*]],

  icon-car, [*Transport*],
  [#call[Fuel Level?] #h(3pt) #cr(d: "queues may be long")[at least *HALF* a tank]
   #linebreak() #call[Cash?] #h(3pt) #cr(d: "ATMs may go offline; keep small bills")[*WITHDRAWN*]],

  icon-shirt, [*Laundry*],
  [#call[Clean Clothes?] #h(3pt) #cr(d: "ready for the next round")[*DONE*]],
)

#v(0.25cm)

#text(size: 10pt, weight: "bold", fill: blue-dark)[Home & Safety Checks]

#v(0.1cm)

#table(
  columns: (auto, 1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[CALL],
  text(fill: white, weight: "bold", size: 9pt)[RESPOND],

  icon-shield, [*Mamad / Shelter*],
  [#call[Shelter Condition?] #h(3pt) #cr(d: "anything displaced by shaking?")[*CHECKED*]
   #linebreak() #call[Door Seal?] #h(3pt) #cr[*INTACT*]],

  icon-fire, [*Safety*],
  [#call[Smoke Detector?] #h(3pt) #cr[*TESTED*]
   #linebreak() #call[Fire Extinguisher?] #h(3pt) #cr[*ACCESSIBLE*]
   #linebreak() #call[Gas Lines?] #h(3pt) #cr(d: "if you smell gas, shut off and call 102")[no *LEAKS*]],

  icon-people, [*People*],
  [#call[Family Contacted?] #h(3pt) #cr[*YES* — everyone safe, plans updated]
   #linebreak() #call[Neighbours Checked?] #h(3pt) #cr(d: "especially elderly / living alone")[*YES*]],
)

#v(0.25cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: blue-light,
  radius: 6pt,
  stroke: 1pt + blue-accent,
)[
  #text(size: 9pt, weight: "bold", fill: blue-dark)[Self-Care During Lulls]
  #v(4pt)
  #set text(size: 9pt)
  #call[Slept?] #h(3pt) #cr(d: "real sleep, not a nap — set an alarm if anxious")[*YES*]
  #h(8pt) #call[Showered?] #h(3pt) #cr[*YES*]
  #h(8pt) #call[Outside?] #h(3pt) #cr(d: "sunlight and fresh air if area is safe")[*YES*]
  #linebreak()
  #text(size: 8.5pt, style: "italic")[Prioritise ruthlessly: water and medications first, then power, then food, then everything else.]
]

#printable-footer()
