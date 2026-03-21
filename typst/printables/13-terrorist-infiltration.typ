// Printable: Terrorist Infiltration SOP
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Terrorist Infiltration — Quick Reference", colour: red-alert, icon-content: icon-shield)

#v(0.2cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: red-light,
  radius: 6pt,
  stroke: 2pt + red-alert,
)[
  #text(size: 11pt, weight: "bold", fill: red-alert)[⚠ DIFFERENT PROTOCOL from rockets/missiles.]
  #v(4pt)
  #text(size: 10pt)[Stay *hidden*, not just sheltered. Do NOT follow standard shelter procedure.]
]

#v(0.3cm)

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
  + *Lock the house door*
  + *Leave lights on outside* the house — helps security forces navigate
  + *Enter the Mamad* (protected room), close the door properly, sit *below the window line*
  + If no Mamad — enter an *internal room* with a lockable door and no windows
  + *Do NOT exit* until official authorities announce the event has ended
]

#v(0.25cm)

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
  + *Immediately enter* the nearest protected place — building, shop, any solid structure
  + *Stay there* until official authorities announce the event has ended
]

#v(0.25cm)

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
  + If you can keep driving — *get to a safe location* as fast as possible
  + If you cannot drive — *stop and seek nearby shelter* offering maximum protection
  + *Stay in shelter* until official authorities announce the event has ended
]

#v(0.4cm)

// === CRITICAL REMINDERS ===
#block(
  width: 100%,
  inset: 14pt,
  fill: red-light,
  radius: 6pt,
  stroke: 2pt + red-alert,
)[
  #text(size: 11pt, weight: "bold", fill: red-alert)[Critical Reminders]
  #v(6pt)
  #set text(size: 10pt)
  - *Traffic in the area is prohibited* — entry banned until further notice
  - If a *rocket/missile alert sounds during infiltration* — do NOT go to a protected space outside the house. *Stay where you are*
  - *Do NOT dismantle the Mamad door handle.* To block entry from outside, barricade with a heavy object
  - *Do NOT share your location* on social networks or media
  - *Stay updated* via HFC app and official channels only
]

#v(0.2cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: grey-light,
  radius: 4pt,
)[
  #text(size: 9pt, weight: "bold")[Licensed weapon holders:] #text(size: 9pt)[ Aim at front door. Fire only on positive identification.]
]

#printable-footer()
