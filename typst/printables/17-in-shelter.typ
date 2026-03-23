// Printable: In Shelter — Behaviour
#import "preamble.typ": *

#let in-shelter-content() = [
  #printable-header("In Shelter — Behaviour", colour: red-alert, icon-content: icon-alert)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Follow these rules every time you shelter. Do NOT leave until the all-clear.]
  #v(0.2cm)

  #block(
    width: 100%,
    inset: 10pt,
    fill: red-light,
    radius: 4pt,
    stroke: 1pt + red-alert,
  )[
    #text(size: 10pt, weight: "bold", fill: red-alert)[#fa-icon("triangle-exclamation") Wait for the all-clear.] Do NOT leave your protected space until you receive an all-clear from HFC (app, official media, or all-clear siren).
  ]

  #v(0.2cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-shield, [*Position* #critical],
    [#cr-line("Seated?", [*AGAINST INNER WALL*])
     #linebreak() #cr-line("Below window line?", [*YES*])],
    icon-door, [*Door* #critical],
    [#cr-line("Mamad/shelter door?", [*CLOSED*], d: "Keep closed until all-clear")],
    icon-shield, [*Elevators*],
    [#cr-line("Elevator use?", [*NONE*], d: "Do not use during or after an alert")],
    icon-phone, [*Photography*],
    [#cr-line("Going outside to film?", [*NO*], d: "Falling debris causes injuries")],
    icon-shield, [*Gas / Damage*],
    [#cr-line("Smell gas or see damage?", [*MOVE TO ALTERNATIVE SHELTER*], d: "Call 102 (Fire & Rescue)")],
    icon-phone, [*After All-Clear*],
    [#cr-line("Safety confirmation sent?", [*YES*], d: "Brief message to family group")
     #linebreak() #cr-line("Sharing unverified info?", [*NO*])],
  )

  #v(0.3cm)
  #text(size: 10pt, weight: "bold", fill: blue-dark)[With Children]
  #v(0.1cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-baby, [*Voice*],
    [#cr-line("Tone?", [*CALM AND STEADY*], d: "Children take cues from adults")],
    icon-baby, [*Explain*],
    [#cr-line("What to say?", [*"WE'RE IN OUR SAFE ROOM"*], d: "Do not lie — acknowledge and redirect to the plan")],
    icon-baby, [*Comfort*],
    [#cr-line("Comfort item?", [*READY*], d: "One in mamad, one in go bag")
     #linebreak() #cr-line("Physical contact?", [*HOLD CLOSE*])],
  )

  #v(0.3cm)
  #block(
    width: 100%,
    inset: 10pt,
    fill: rgb("#fff3cd"),
    radius: 4pt,
    stroke: 1pt + rgb("#856404"),
  )[
    #text(size: 9pt, weight: "bold")[No connectivity?] Stay in shelter. The default with no information is to remain in place. Do NOT assume it's over because it's quiet. If you have a radio, tune to a national station. When in doubt, stay longer.
  ]
]
