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
    icon-bag, [*Go Bag* #critical],
    [#cr-line("Bag?", [*TAKING* with me])],
    icon-eye, [*News Check* #critical],
    [#cr-line("Situation?", [*SCANNED* before departure], d: "check HFC app and news for active alerts")],
    icon-shield, [*Shelters* #critical],
    [#cr-line("Route Shelters?", [*IDENTIFIED*], d: "at destination and along route")],
    icon-clock, [*Time To Shelter*],
    [#cr-line("Shelter Time?", [*KNOWN* for destination area])],
    icon-phone, [*Phone* #critical],
    [#cr-line("Charge Status?", [*CHARGED*])
     #linebreak() #cr-line("HFC App?", [*RUNNING*])
     #linebreak() #cr-line("Location?", [*ON*])],
    icon-car, [*Car Fuel*],
    [#cr-line("Fuel Level?", [at least *HALF* a tank])],
    icon-people, [*Household Notified*],
    [#cr-line("Household?", [destination and return time *COMMUNICATED*])],
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
