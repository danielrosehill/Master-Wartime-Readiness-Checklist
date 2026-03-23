// Printable: Mamad (Protected Space) Inspection
#import "preamble.typ": *

#let mamad-inspection-content() = [
  #printable-header("Mamad Inspection", colour: red-alert, icon-content: icon-shield)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Complete before escalation and recheck monthly. Based on HFC residential protected-space guidelines.]
  #v(0.15cm)
  #cr-instructions()
  #v(0.2cm)

  #text(size: 10pt, weight: "bold", fill: blue-dark)[Structural Inspection]
  #v(0.1cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-door, [*Blast Door* #critical],
    [#cr-line("Opens & closes?", [*SMOOTHLY*])
     #linebreak() #cr-line("Handle turn?", [*90° UPWARD*])
     #linebreak() #cr-line("Double lock?", [*FUNCTIONS*])],
    icon-shield, [*Door Seal* #critical],
    [#cr-line("Rubber insulation?", [*PRESENT*], d: "Replace if dried, cracked, or brittle")],
    icon-eye, [*Light Test* #critical],
    [#cr-line("Light when sealed?", [*NONE VISIBLE*], d: "Light penetration = inadequate seal")],
    icon-shield, [*Steel Outer Window*],
    [#cr-line("Opens & closes?", [*SMOOTHLY*])],
    icon-shield, [*Glass Inner Window*],
    [#cr-line("Functions?", [*CORRECTLY*], d: "Double-wing: remove both wings during escalation, store outside room")],
    icon-shield, [*Ventilation Pipes*],
    [#cr-line("Rubber insulation?", [*INTACT*])
     #linebreak() #cr-line("Steel cover screws?", [*TIGHT*])],
  )

  #v(0.3cm)
  #text(size: 10pt, weight: "bold", fill: blue-dark)[Contents & Safety]
  #v(0.1cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-fire, [*Flammable / Hazardous* #critical],
    [#cr-line("Hazardous materials?", [*NONE*])],
    icon-shield, [*Glass / Ceramics* #critical],
    [#cr-line("Glass, ceramic, porcelain?", [*NONE*], d: "Can shatter into projectiles")],
    icon-shield, [*Heavy Items*],
    [#cr-line("Shelves & heavy items?", [*FIXED TO WALLS*])],
    icon-fire, [*Gas Tanks*],
    [#cr-line("Distance from walls?", [*3+ METRES*])],
    icon-bag, [*Emergency Supplies*],
    [#cr-line("Supplies?", [*STORED INSIDE* or *NEARBY*])],
    icon-shield, [*Ceiling Fan*],
    [#cr-line("Ceiling fan installed?", [*NONE*], d: "Prohibited in mamads")],
    icon-shield, [*Ventilation*],
    [#cr-line("Room ventilated?", [*YES*], d: "Must NOT be used as kitchen, bathroom, or washroom")],
  )
]
