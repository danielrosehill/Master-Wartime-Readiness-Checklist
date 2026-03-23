// Printable: Pre-Emergency Home Safety
#import "preamble.typ": *

#let pre-emergency-home-content() = [
  #printable-header("Pre-Emergency Home Safety", colour: blue-dark, icon-content: icon-house)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Complete during routine periods — not wartime-active checks. Schedule a walk-through every 6 months or after moving. Takes 1–2 hours.]
  #v(0.15cm)
  #cr-instructions()
  #v(0.2cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-house, [*Bookcases & Shelves*],
    [#cr-line("Secured to walls?", [*L-BRACKETS* or *STRAPS*])
     #linebreak() #cr-line("Heavy objects?", [*STORED LOW*], d: "Not above head height")],
    icon-house, [*Appliances*],
    [#cr-line("Wheeled appliances?", [*WHEELS LOCKED*])
     #linebreak() #cr-line("Heavy appliances?", [*STABLE AND SECURED*])],
    icon-fire, [*Gas Shutoff* #critical],
    [#cr-line("Location known?", [*BY ALL MEMBERS*])
     #linebreak() #cr-line("All know how to shut off?", [*YES*], d: "Turn clockwise 90° to close")
     #linebreak() #cr-line("Operation tested?", [*YES*])],
    icon-bolt, [*Electricity Shutoff* #critical],
    [#cr-line("Main breaker location?", [*KNOWN*])
     #linebreak() #cr-line("All know how to shut off?", [*YES*])],
    icon-fire, [*Fire Extinguisher* #critical],
    [#cr-line("Accessible?", [*YES*])
     #linebreak() #cr-line("Expired?", [*NO*])
     #linebreak() #cr-line("All know how to use?", [*YES*])],
    icon-alert, [*Smoke Detector*],
    [#cr-line("Installed?", [*ONE PER FLOOR MIN*])
     #linebreak() #cr-line("Tested?", [*WORKING*], d: "Test monthly")
     #linebreak() #cr-line("Batteries?", [*REPLACED ANNUALLY*])],
    icon-house, [*Water Heater*],
    [#cr-line("Strapped to wall?", [*YES*], d: "Prevents toppling")],
    icon-house, [*Windows*],
    [#cr-line("Glass on windowsills?", [*NONE*], d: "Can shatter into projectiles")
     #linebreak() #cr-line("Blinds / shutters?", [*FUNCTIONAL*])],
  )
]
