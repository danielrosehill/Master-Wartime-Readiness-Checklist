// Printable: Before Leaving Home
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

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
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[CALL],
  text(fill: white, weight: "bold", size: 9pt)[RESPOND],

  icon-bag, [*Go Bag* #critical],
  [#call[Bag?] #h(3pt) #cr[*TAKING* with me]],

  icon-eye, [*News Check* #critical],
  [#call[Situation?] #h(3pt) #cr(d: "check HFC app and news for active alerts")[*SCANNED* before departure]],

  icon-shield, [*Shelters* #critical],
  [#call[Route Shelters?] #h(3pt) #cr(d: "at destination and along route")[*IDENTIFIED*]],

  icon-clock, [*Time To Shelter*],
  [#call[Shelter Time?] #h(3pt) #cr[*KNOWN* for destination area]],

  icon-phone, [*Phone* #critical],
  [#call[Charge Status?] #h(3pt) #cr[*CHARGED*]
   #linebreak() #call[HFC App?] #h(3pt) #cr[*RUNNING*]
   #linebreak() #call[Location?] #h(3pt) #cr[*ON*]],

  icon-car, [*Car Fuel*],
  [#call[Fuel Level?] #h(3pt) #cr[at least *HALF* a tank]],

  icon-people, [*Household Notified*],
  [#call[Household?] #h(3pt) #cr[destination and return time *COMMUNICATED*]],
)

#v(0.4cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: red-light,
  radius: 6pt,
  stroke: 1.5pt + red-alert,
)[
  #text(size: 10pt, weight: "bold", fill: red-alert)[⚠ If a siren sounds while driving:]
  #v(4pt)
  #set text(size: 10pt)
  + *Pull over* to the side of the road
  + *Exit the vehicle* and move away from it
  + *Enter the nearest building* or lie flat on the ground
  + *Protect your head* with your hands
  + *Wait 10 minutes* before returning to your vehicle
]

#printable-footer()
