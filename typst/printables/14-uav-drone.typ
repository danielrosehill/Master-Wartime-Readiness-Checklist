// Printable: UAV / Drone Alert SOP
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Hostile Aerial Vehicle (UAV / Drone) Alert", colour: red-alert, icon-content: icon-alert)

#v(0.2cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: red-light,
  radius: 6pt,
  stroke: 2pt + red-alert,
)[
  #text(size: 11pt, weight: "bold", fill: red-alert)[⚠ Same siren as rockets — DIFFERENT procedure.]
  #v(4pt)
  #text(size: 10pt)[Shelter time is *10 minutes*. You must wait for an *explicit all-clear* — do not self-release based on quiet.]
]

#v(0.2cm)

#text(size: 9pt, style: "italic")[Alert comes via: HFC App (with "Infiltration of a Hostile Aerial Vehicle" caption) · Sirens · Media · National Emergency Portal (oref.org.il)]

#v(0.25cm)

// === IF INDOORS ===
#block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: blue-dark,
  radius: (top: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: white)[If Indoors]
]

#block(
  width: 100%,
  stroke: 1.5pt + blue-dark,
  radius: (bottom: 4pt),
  inset: 14pt,
)[
  #set text(size: 11pt)
  + Go immediately to the *most protected space* — Mamad, Mamak, Mamam, shelter, inner stairwell, or inner room
  + *Stay for 10 minutes* unless another alert or additional guideline is received
]

#v(0.2cm)

// === IF OUTDOORS ===
#block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: orange-warm,
  radius: (top: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: white)[If Outdoors]
]

#block(
  width: 100%,
  stroke: 1.5pt + orange-warm,
  radius: (bottom: 4pt),
  inset: 14pt,
)[
  #set text(size: 11pt)
  *In a built-up area:*
  + Enter the optimal protected space in a nearby building
  + *Do not stay in the entrance hall*

  *In an open area:*
  + *Lie on the ground* and protect your head with your hands
  + If you cannot lie down — *crouch as much as possible* and protect your head
  + *Wait* until an explicit guideline allows you to leave
]

#v(0.2cm)

// === IF IN A VEHICLE ===
#block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: rgb("#8e44ad"),
  radius: (top: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: white)[If In a Vehicle]
]

#block(
  width: 100%,
  stroke: 1.5pt + rgb("#8e44ad"),
  radius: (bottom: 4pt),
  inset: 14pt,
)[
  #set text(size: 11pt)
  + *Stop at the side of the road*, exit, enter nearest building's protected space
  + If no building reachable — exit and move *away from the vehicle* beyond the shoulder, lie down, protect your head
  + Only if you *cannot exit* — pull over, *open the windows*, crouch below window line
]

#v(0.2cm)

// === PUBLIC TRANSPORT ===
#block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: blue-accent,
  radius: (top: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: white)[If On Public Transport]
]

#block(
  width: 100%,
  stroke: 1.5pt + blue-accent,
  radius: (bottom: 4pt),
  inset: 14pt,
)[
  #set text(size: 10.5pt)
  - *Inter-city / school buses:* Driver stops and opens doors. Crouch below window line, protect head
  - *Urban buses:* Driver stops and opens doors for passengers to reach protected space. If not reachable, crouch below window line
  - *Trains:* Driver slows to 30 km/h. Crouch below window line in carriages, protect head
]

#v(0.3cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: blue-light,
  radius: 4pt,
  stroke: 1pt + blue-accent,
)[
  #text(size: 9.5pt, weight: "bold", fill: blue-dark)[Key difference from rockets:] #text(size: 9pt)[ UAV alerts require a 10-minute shelter time and you must wait for an explicit "all clear" — do not self-release based on quiet.]
]

#printable-footer()
