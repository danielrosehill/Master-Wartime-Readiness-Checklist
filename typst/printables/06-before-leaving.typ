// Printable: Before Leaving Home
#import "preamble.typ": *

#let before-leaving-content() = [
  #printable-header("Before Leaving Home", colour: rgb("#d35400"), icon-content: icon-door)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Run every time you leave the house during wartime or escalation.]
  #v(0.15cm)
  #cr-instructions()
  #v(0.2cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 10pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-bag, table.cell(colspan: 2)[#simple-line("Go Bag", [TAKING WITH ME]) #critical],
    icon-eye, table.cell(colspan: 2)[#simple-line("News Check", [SCANNED before departure], d: "Check HFC app and news for active alerts") #critical],
    icon-shield, [*Shelters* #critical],
    [#cr-line("Route Shelters?", [*IDENTIFIED*], d: "At destination and along route")],
    icon-clock, table.cell(colspan: 2)[#simple-line("Time To Shelter", [KNOWN for destination area])],
    icon-phone, [*Phone* #critical],
    [#cr-line("Charge Status?", [*CHARGED*])
     #linebreak() #cr-line("HFC App?", [*RUNNING*])
     #linebreak() #cr-line("Location?", [*ON*])],
    icon-car, table.cell(colspan: 2)[#simple-line("Car Fuel", [at least HALF a tank])],
    icon-people, table.cell(colspan: 2)[#simple-line("Household Notified", [destination and return time COMMUNICATED])],
  )

  #v(0.4cm)
  #block(width: 100%, inset: 12pt, fill: red-light, radius: 6pt, stroke: 1.5pt + red-alert)[
    #text(size: 10pt, weight: "bold", fill: red-alert)[⚠ If a siren sounds while driving:]
    #v(4pt)
    #set text(size: 10pt)
    + *Pull over* to the side of the road
    + *Exit the vehicle* and move away from it
    + *Enter the nearest building* or lie flat on the ground
    + *Protect your head* with your hands
    + *Wait 10 minutes* before returning to your vehicle
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#before-leaving-content()
#printable-footer()
