// Printable: Advance Warning (Hatra'a Makdima)
#import "preamble.typ": *

#let advance-warning-content() = [
  #printable-header("Advance Warning (Hatra'a Makdima)", colour: orange-warm, icon-content: icon-alert)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[HFC provides 3–5 minute advance warning for distant threats (e.g. Yemen). This is NOT the siren — prepare now, shelter when the siren sounds.]
  #v(0.15cm)
  #cr-instructions()
  #v(0.2cm)

  #block(
    width: 100%,
    inset: 10pt,
    fill: rgb("#fff3cd"),
    radius: 4pt,
    stroke: 1pt + rgb("#856404"),
  )[
    #text(size: 9pt, weight: "bold")[Advance warning ≠ siren.] You have 3–5 minutes. Use them to prepare. When the actual alert sounds, follow standard shelter procedure.
  ]

  #v(0.2cm)

  #text(size: 10pt, weight: "bold", fill: blue-dark)[At Home]
  #v(0.1cm)
  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-shoe, [*Shoes* #critical],
    [#cr-line("Shoes on?", [*CLOSED-TOE — ON*])],
    icon-key, [*Keys*],
    [#cr-line("Keys?", [*ON PERSON*])],
    icon-phone, [*Phone*],
    [#cr-line("Phone?", [*ON PERSON — CHARGED*])],
    icon-bag, [*Go Bag*],
    [#cr-line("Position?", [*BY DOOR — READY*])],
    icon-door, [*Shelter route*],
    [#cr-line("Route clear?", [*YES*])],
  )

  #v(0.2cm)
  #text(size: 10pt, weight: "bold", fill: blue-dark)[Driving]
  #v(0.1cm)
  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-car, [*Action*],
    [#cr-line("Solid building nearby?", [*PULL OVER NEAR IT*], d: "Identify before the siren sounds")],
  )

  #v(0.2cm)
  #text(size: 10pt, weight: "bold", fill: blue-dark)[Public Transport / Outdoors]
  #v(0.1cm)
  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-people, [*Public transport*],
    [#cr-line("Action?", [*FOLLOW CREW INSTRUCTIONS*], d: "Bend below window line")],
    icon-baby, [*With children*],
    [#cr-line("Action?", [*IDENTIFY NEAREST SHELTER*], d: "Gather children close")],
  )
]
