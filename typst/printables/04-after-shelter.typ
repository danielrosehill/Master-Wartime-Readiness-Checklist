// Printable: After Returning From Shelter (Reset)
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("After Returning From Shelter — Reset", colour: rgb("#d35400"))

#v(0.2cm)
#text(size: 9pt, style: "italic")[Run immediately after the all-clear. Restore full readiness before the next alert.]
#v(0.3cm)

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-bag, [*Go Bag* #critical], [#ci[BACK BY DOOR] #linebreak() #ci(d: "Did anything fall out?")[RE-ZIPPED]],
  icon-phone, [*Phone* #critical], [#ci(d: "If battery dropped")[ON CHARGE] #linebreak() #ci[HFC APP STILL RUNNING]],
  [], [*Power Bank*], [#ci(d: "May have been used in shelter")[ON CHARGE]],
  icon-water, [*Water*], [#ci(d: "If you drank from emergency stock")[RESUPPLIED]],
  icon-shirt, [*Clothes & Shoes*], [#ci(d: "By bed (night) or on person (day)")[BACK IN POSITION]],
  [], [*Torch*], [#ci(d: "Nightstand or go bag")[BACK IN POSITION]],
  icon-people, [*Dependents* #critical], [#ci[ALL ACCOUNTED FOR AND SAFE]],
)

#v(0.3cm)

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
  #ci(d: "Stress suppresses appetite — eat anyway. You need the energy.")[EATEN]
  #linebreak()
  #ci[HYDRATED]
  #linebreak()
  #ci[TOILET — DONE]
  #linebreak()
  #ci(d: "If time and situation allow")[SHOWERED]
  #linebreak()
  #ci(d: "Morale and normalcy matter")[GROOMED]
  #linebreak()
  #ci(d: "When possible")[RESTED]
  #v(8pt)
  *Children:*
  #linebreak()
  #ci[FED] #h(6pt) #ci[HYDRATED] #h(6pt) #ci[TOILETED / CHANGED]
  #linebreak()
  #ci(d: "If possible")[CLEANED] #h(6pt) #ci(d: "Nap if timing allows")[RESTED]
]

#v(0.2cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: grey-light,
  radius: 4pt,
)[
  #text(size: 9pt)[
    *Date:* #h(3cm) #box(width: 4cm, stroke: (bottom: 0.5pt + grey-text))[] #h(1cm)
    *Completed by:* #h(0.5cm) #box(width: 4cm, stroke: (bottom: 0.5pt + grey-text))[]
  ]
]

#printable-footer()
