// Printable: Bathing a Baby — Vulnerability Checklist
#import "preamble.typ": *

#let bathing-baby-content() = [
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
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-eye, [*News Check* #critical],
    [#cr-line("Active Alerts?", [*NONE*], d: "no active alerts in your area")],
    icon-phone, [*Phone* #critical],
    [#cr-line("Volume?", [at *MAXIMUM*], d: "audible over splashing")
     #linebreak() #cr-line("Phone Location?", [*IN BATHROOM* or just outside])],
    icon-baby, [*Baby Prep* #critical],
    [#cr-line("Towel?", [*ARM'S REACH*], d: "large enough to wrap quickly")
     #linebreak() #cr-line("Nappy & Clothes?", [*IN BATHROOM*, ready to go], d: "not in another room")
     #linebreak() #cr-line("Babywear / Carrier?", [*BY BATHROOM DOOR*], d: "for emergency evacuation")],
    icon-shirt, [*Your Clothes* #critical],
    [#cr-line("Your Outfit?", [*ON* — fully dressed], d: "you may need to move fast while holding baby")
     #linebreak() #cr-line("Your Shoes?", [*CLOSED-TOE*, *ON FEET*])],
    icon-door, [*Door*],
    [#cr-line("Bathroom Door?", [*UNLOCKED*])],
    icon-shield, [*Shelter Route*],
    [#cr-line("Route Clear?", [*YES*], d: "can you get from bathroom to shelter holding a wet baby?")],
    icon-clock, [*Keep It Short* #critical],
    [#cr-line("Time?", [*MINIMISED*], d: "quick wash, not a play session")],
  )
  #v(0.4cm)
  #block(width: 100%, inset: 12pt, fill: red-light, radius: 6pt, stroke: 1.5pt + red-alert)[
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
  #block(width: 100%, inset: 12pt, fill: green-light, radius: 6pt, stroke: 1pt + green-calm)[
    #text(size: 10pt, weight: "bold", fill: green-calm)[Two-parent protocol]
    #v(4pt)
    #set text(size: 9.5pt)
    - *Parent A* — lifts and carries baby
    - *Parent B* — grabs go bag and opens doors
    - Assign roles *before* bath time, not during the siren
    - If solo: baby first, bag only if it's on your route
  ]
  #v(0.2cm)
  #block(width: 100%, inset: 10pt, fill: grey-light, radius: 4pt)[
    #text(size: 8pt, style: "italic")[Post near the baby bath. Consider bath time the highest-vulnerability window with an infant in the house.]
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#bathing-baby-content()
#printable-footer()
