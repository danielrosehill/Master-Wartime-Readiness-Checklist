// Printable: Night Alarm Procedure
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Night Alarm — The 30-Second Drill", colour: red-alert, icon-content: icon-moon)

#v(0.2cm)
#text(size: 9pt, style: "italic")[Post this by your bed. Everything here exists so you don't have to think at 3am.]
#v(0.4cm)

#block(
  width: 100%,
  inset: 14pt,
  fill: red-light,
  radius: 8pt,
  stroke: 2pt + red-alert,
)[
  #text(size: 14pt, weight: "bold", fill: red-alert)[The First 5 Seconds]
  #v(6pt)
  #set text(size: 12pt)
  + *Siren / Alert* — Do not process. Just move. #h(1fr) #ci[AWAKE — MOVING]
  + *Shoes* — Same spot every night. #h(1fr) #ci[ON FEET]
  + *Glasses & Phone* — From nightstand. #h(1fr) #ci[IN HAND]
  + *Caffeine pill _(optional)_* — Sip of water. #h(1fr) #ci[TAKEN]
]

#v(0.3cm)

#block(
  width: 100%,
  inset: 14pt,
  fill: rgb("#fff8e1"),
  radius: 8pt,
  stroke: 2pt + orange-warm,
)[
  #text(size: 14pt, weight: "bold", fill: orange-warm)[The Next 10–20 Seconds]
  #v(6pt)
  #set text(size: 12pt)
  5. *Clothes* — Pull on whatever is laid out. Speed over appearance. #h(1fr) #ci[ON]
  6. *Torch* — From nightstand if power is out. #h(1fr) #ci[IN HAND]
  7. *Protected space* — Move to shelter or front door. #h(1fr) #ci[IN POSITION]
]

#v(0.3cm)

#block(
  width: 100%,
  inset: 14pt,
  fill: blue-light,
  radius: 8pt,
  stroke: 2pt + blue-accent,
)[
  #text(size: 14pt, weight: "bold", fill: blue-dark)[For Parents]
  #v(6pt)
  #set text(size: 12pt)
  8. *Children* — One parent → child/children. Other → go bag. #h(1fr) #ci[ROLES EXECUTING]
  9. *Baby* — In babywear by door. Do not stop to dress them. #h(1fr) #ci[SECURED]
]

#v(0.5cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: grey-light,
  radius: 6pt,
  stroke: 1pt + grey-border,
)[
  #set text(size: 11pt, weight: "bold", fill: blue-dark)
  #align(center)[
    Do not think. Follow the procedure. \
    Do not check your phone. The siren means go. \
    It gets easier. After 2–3 nights, the routine becomes automatic.
  ]
]

#printable-footer()
