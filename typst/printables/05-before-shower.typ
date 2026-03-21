// Printable: Before Showering
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Before Showering — Vulnerability Checklist", colour: blue-accent, icon-content: icon-water)

#v(0.2cm)
#text(size: 9pt, style: "italic")[You are at your most vulnerable in the shower. Minimise time and maximise readiness.]
#v(0.3cm)

#table(
  columns: (auto, 1fr, 2fr),
  inset: 10pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-eye, [*News Check* #critical], [#ci(d: "No active alerts in your area")[SITUATION SCANNED]],
  icon-phone, [*Phone* #critical], [#ci(d: "Must be audible over water")[VOLUME AT MAXIMUM] #linebreak() #ci[IN BATHROOM OR JUST OUTSIDE DOOR]],
  icon-shirt, [*Clothes* #critical], [#ci(d: "Not in another room")[FULL OUTFIT IN BATHROOM]],
  icon-shoe, [*Footwear* #critical], [#ci[CLOSED-TOE SHOES BY BATHROOM DOOR]],
  [], [*Towel*], [#ci(d: "For rapid dry-off")[WITHIN REACH]],
  icon-door, [*Door*], [#ci[BATHROOM DOOR UNLOCKED]],
  icon-clock, [*Keep It Short* #critical], [#ci(d: "Be quick — get in, get out")[TIME MINIMISED]],
)

#v(0.5cm)

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

#v(0.3cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: grey-light,
  radius: 4pt,
)[
  #text(size: 8pt, style: "italic")[Post this on the bathroom door or mirror. Review before every shower during wartime.]
]

#printable-footer()
