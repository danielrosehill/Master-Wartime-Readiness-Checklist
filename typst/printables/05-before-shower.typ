// Printable: Before Showering
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Before Showering — Vulnerability Checklist", colour: blue-accent, icon-content: icon-water)

#v(0.2cm)
#text(size: 9pt, style: "italic")[You are at your most vulnerable in the shower. Minimise time and maximise readiness.]
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

  icon-eye, [*News Check* #critical],
  [#call[Active Alerts?] #h(3pt) #cr(d: "no active alerts in your area")[*NONE*]],

  icon-phone, [*Phone* #critical],
  [#call[Volume?] #h(3pt) #cr(d: "must be audible over water")[at *MAXIMUM*]
   #linebreak() #call[Phone Location?] #h(3pt) #cr[*IN BATHROOM* or just outside door]],

  icon-shirt, [*Clothes* #critical],
  [#call[Outfit?] #h(3pt) #cr(d: "not in another room")[*FULL OUTFIT* in bathroom]],

  icon-shoe, [*Footwear* #critical],
  [#call[Shoes?] #h(3pt) #cr[*CLOSED-TOE* by bathroom door]],

  [], [*Towel*],
  [#call[Towel?] #h(3pt) #cr(d: "for rapid dry-off")[*WITHIN REACH*]],

  icon-door, [*Door*],
  [#call[Bathroom Door?] #h(3pt) #cr[*UNLOCKED*]],

  icon-clock, [*Keep It Short* #critical],
  [#call[Time?] #h(3pt) #cr(d: "be quick — get in, get out")[*MINIMISED*]],
)

#v(0.4cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: red-light,
  radius: 6pt,
  stroke: 1.5pt + red-alert,
)[
  #text(size: 10pt, weight: "bold", fill: red-alert)[⚠ If a siren sounds while showering:]
  #v(4pt)
  #set text(size: 10pt)
  + *Turn off water* (1 second)
  + *Grab towel* — wrap as you move (don't dry off)
  + *Step into shoes* by door
  + *Move to protected space* — clothes can wait, shelter cannot
]

#v(0.2cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: grey-light,
  radius: 4pt,
)[
  #text(size: 8pt, style: "italic")[Post this on the bathroom door or mirror. Review before every shower during wartime.]
]

#printable-footer()
