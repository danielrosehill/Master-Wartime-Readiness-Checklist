// Printable: After Returning From Shelter (Reset)
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("After Returning From Shelter — Reset", colour: rgb("#d35400"))

#v(0.2cm)
#text(size: 9pt, style: "italic")[Run immediately after the all-clear. Restore full readiness before the next alert.]
#v(0.15cm)

#cr-instructions()

#v(0.2cm)

#table(
  columns: (auto, 1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[CALL],
  text(fill: white, weight: "bold", size: 9pt)[RESPOND],

  icon-bag, [*Go Bag* #critical],
  [#call[Bag Position?] #h(3pt) #cr[*BACK BY DOOR*]
   #linebreak() #call[Bag Sealed?] #h(3pt) #cr(d: "did anything fall out?")[*RE-ZIPPED*]],

  icon-phone, [*Phone* #critical],
  [#call[Charge Status?] #h(3pt) #cr(d: "if battery dropped")[*ON CHARGE*]
   #linebreak() #call[HFC App?] #h(3pt) #cr[still *RUNNING*]],

  [], [*Power Bank*],
  [#call[Power Bank?] #h(3pt) #cr(d: "may have been used in shelter")[*ON CHARGE*]],

  icon-water, [*Water*],
  [#call[Emergency Supply?] #h(3pt) #cr(d: "if you drank from emergency stock")[*RESUPPLIED*]],

  icon-shirt, [*Clothes & Shoes*],
  [#call[Position?] #h(3pt) #cr(d: "by bed at night, on person during day")[*BACK IN POSITION*]],

  [], [*Torch*],
  [#call[Torch?] #h(3pt) #cr(d: "nightstand or go bag")[*BACK IN POSITION*]],

  icon-people, [*Dependents* #critical],
  [#call[Headcount?] #h(3pt) #cr[all *ACCOUNTED* for and *SAFE*]],
)

#v(0.25cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: green-light,
  radius: 6pt,
  stroke: 1pt + green-calm,
)[
  #text(size: 10pt, weight: "bold", fill: green-calm)[Self-Care — Do these NOW, not later.]
  #text(size: 9pt)[ You don't know when the next alert comes.]
  #v(6pt)
  #set text(size: 9.5pt)
  #call[Eaten?] #h(3pt) #cr(d: "stress suppresses appetite — eat anyway")[*YES*]
  #linebreak()
  #call[Hydrated?] #h(3pt) #cr[*YES*]
  #linebreak()
  #call[Toilet?] #h(3pt) #cr[*DONE*]
  #linebreak()
  #call[Showered?] #h(3pt) #cr(d: "if time and situation allow")[*YES*]
  #linebreak()
  #call[Groomed?] #h(3pt) #cr(d: "morale and normalcy matter")[*YES*]
  #linebreak()
  #call[Rested?] #h(3pt) #cr(d: "when possible")[*YES*]
  #v(8pt)
  *Children:*
  #linebreak()
  #call[Fed?] #h(3pt) #cr[*YES*] #h(8pt) #call[Hydrated?] #h(3pt) #cr[*YES*] #h(8pt) #call[Changed?] #h(3pt) #cr[*YES*]
  #linebreak()
  #call[Cleaned?] #h(3pt) #cr(d: "if possible")[*YES*] #h(8pt) #call[Rested?] #h(3pt) #cr(d: "nap if timing allows")[*YES*]
]

#printable-footer()
