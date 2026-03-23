// Printable: Situational Awareness
#import "preamble.typ": *

#let situational-awareness-content() = [
  #printable-header("Situational Awareness", colour: rgb("#d35400"), icon-content: icon-eye)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Ongoing awareness during wartime or escalation. Check frequencies vary — maintain a rhythm.]
  #v(0.15cm)
  #cr-instructions()
  #v(0.2cm)

  #table(
    columns: (auto, 1fr, 2.5fr, 1fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
    align: (center, left, left, left),
    [],
    text(fill: white, weight: "bold", size: 9pt)[CATEGORY],
    text(fill: white, weight: "bold", size: 9pt)[ACTIONS],
    text(fill: white, weight: "bold", size: 9pt)[FREQUENCY],

    icon-eye, [*News*], [#ci[SCANNED]], [_Every 1–3 hours_],
    icon-alert, [*Alert Area*], [#ci[KNOWN]], [],
    icon-shield, [*Shelters*],
    [#ci[NEAREST 3 KNOWN]
     #linebreak() #ci[ACCESSIBILITY VERIFIED]
     #linebreak() #ci[OPEN / HOURS NOTED]
     #linebreak() #ci[EXIT TIMED]],
    [_Once per emergency_],
    icon-phone, [*HFC App*], [#ci(d: "Current advice")[CHECKED]], [_Once per day_],
    icon-clock, [*Supplies*],
    [#ci[WATER + FOOD REPLACED]
     #linebreak() #ci[BATTERIES + ELECTRONICS CHECKED]],
    [_Water/food: 3 months_ \ _Batteries: 6 months_],
  )
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#situational-awareness-content()
#printable-footer()
