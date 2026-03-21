// Printable: Bathing a Baby — Vulnerability Checklist
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Bathing a Baby — Vulnerability Checklist", colour: green-calm, icon-content: icon-baby)

#v(0.2cm)
#text(size: 9pt, style: "italic")[A wet baby is harder to carry and slower to dress. Minimise bath time and maximise readiness.]
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
  [#call[Volume?] #h(3pt) #cr(d: "audible over splashing")[at *MAXIMUM*]
   #linebreak() #call[Phone Location?] #h(3pt) #cr[*IN BATHROOM* or just outside]],

  icon-baby, [*Baby Prep* #critical],
  [#call[Towel?] #h(3pt) #cr(d: "large enough to wrap quickly")[*ARM'S REACH*]
   #linebreak() #call[Nappy & Clothes?] #h(3pt) #cr(d: "not in another room")[*IN BATHROOM*, ready to go]
   #linebreak() #call[Babywear / Carrier?] #h(3pt) #cr(d: "for emergency evacuation")[*BY BATHROOM DOOR*]],

  icon-shirt, [*Your Clothes* #critical],
  [#call[Your Outfit?] #h(3pt) #cr(d: "you may need to move fast while holding baby")[*ON* — fully dressed]
   #linebreak() #call[Your Shoes?] #h(3pt) #cr[*CLOSED-TOE*, *ON FEET*]],

  icon-door, [*Door*],
  [#call[Bathroom Door?] #h(3pt) #cr[*UNLOCKED*]],

  icon-shield, [*Shelter Route*],
  [#call[Route Clear?] #h(3pt) #cr(d: "can you get from bathroom to shelter holding a wet baby?")[*YES*]],

  icon-clock, [*Keep It Short* #critical],
  [#call[Time?] #h(3pt) #cr(d: "quick wash, not a play session")[*MINIMISED*]],
)

#v(0.4cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: red-light,
  radius: 6pt,
  stroke: 1.5pt + red-alert,
)[
  #text(size: 10pt, weight: "bold", fill: red-alert)[⚠ If a siren sounds while bathing baby:]
  #v(4pt)
  #set text(size: 10pt)
  + *Lift baby out of water* — one motion
  + *Wrap in towel* — do NOT dry off, just wrap
  + *Do NOT dress the baby* — a towel-wrapped baby is fine for shelter
  + If carrier/babywear is by the door — *use it* (faster than carrying by hand)
  + *Move to shelter* — you are already dressed and shoed
  + Dress the baby *in the shelter*, not before
]

#v(0.3cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: green-light,
  radius: 6pt,
  stroke: 1pt + green-calm,
)[
  #text(size: 10pt, weight: "bold", fill: green-calm)[Two-parent protocol]
  #v(4pt)
  #set text(size: 9.5pt)
  - *Parent A* — lifts and carries baby
  - *Parent B* — grabs go bag and opens doors
  - Assign roles *before* bath time, not during the siren
  - If solo: baby first, bag only if it's on your route
]

#v(0.2cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: grey-light,
  radius: 4pt,
)[
  #text(size: 8pt, style: "italic")[Post near the baby bath. Consider bath time the highest-vulnerability window with an infant in the house.]
]

#printable-footer()
