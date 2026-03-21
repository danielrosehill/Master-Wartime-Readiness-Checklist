// Printable: Daytime At-Home Posture
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Daytime At-Home Posture", colour: rgb("#d35400"), icon-content: icon-sun)

#v(0.2cm)
#text(size: 9pt, style: "italic")[Run after waking and repeat after any disruption. Maintain this posture throughout the day.]
#v(0.15cm)

#cr-instructions()

#v(0.2cm)

#table(
  columns: (auto, 1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[CALL],
  text(fill: white, weight: "bold", size: 9pt)[RESPOND],

  icon-phone, [*Phone* #critical],
  [#call[Phone Location?] #h(3pt) #cr(d: "or within arm's reach")[*ON PERSON*]
   #linebreak() #call[Charge Status?] #h(3pt) #cr[*CHARGED* or *CHARGING*]
   #linebreak() #call[HFC App?] #h(3pt) #cr[*RUNNING*]],

  icon-shirt, [*Dressed* #critical],
  [#call[Clothing?] #h(3pt) #cr[*FULLY CLOTHED*]
   #linebreak() #call[Footwear?] #h(3pt) #cr(d: "not slippers, not barefoot")[*CLOSED-TOE* shoes *ON*]],

  icon-key, [*Keys* #critical],
  [#call[Keys?] #h(3pt) #cr[*ON PERSON* or *BY DOOR*]],

  icon-bag, [*Go Bag* #critical],
  [#call[Bag Position?] #h(3pt) #cr[*BY DOOR*, *ZIPPED*]],

  icon-door, [*Exit Route* #critical],
  [#call[Hallway?] #h(3pt) #cr[*CLEAR*]
   #linebreak() #call[Front Door?] #h(3pt) #cr[*OPENS QUICKLY*]],

  icon-laptop, [*Browser Alert*],
  [#call[Desktop Alert?] #h(3pt) #cr(d: "if working at desk")[Red Alert extension *ACTIVE*]],
)

#v(0.3cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: blue-light,
  radius: 6pt,
  stroke: 1pt + blue-accent,
)[
  #text(size: 10pt, weight: "bold", fill: blue-dark)[Working from home during wartime:]
  #v(4pt)
  #set text(size: 9pt)
  - Stay dressed and shoed — do not slip into pyjamas "just at the desk"
  - Headphones: use one ear only, or keep volume low enough to hear a siren
  - Save work frequently — you may need to abandon your desk mid-sentence
  - At the start of any call: _"I'm in an active alert zone. I may need to leave abruptly."_
]

#printable-footer()
