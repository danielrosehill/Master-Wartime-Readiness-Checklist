// Printable: Daytime At-Home Posture
#import "preamble.typ": *

#let daytime-posture-content() = [
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
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-phone, [*Phone* #critical],
    [#cr-line("Phone Location?", [*ON PERSON*], d: "or within arm's reach")
     #linebreak() #cr-line("Charge Status?", [*CHARGED* or *CHARGING*])
     #linebreak() #cr-line("HFC App?", [*RUNNING*])],
    icon-shirt, [*Dressed* #critical],
    [#cr-line("Clothing?", [*FULLY CLOTHED*])
     #linebreak() #cr-line("Footwear?", [*CLOSED-TOE* shoes *ON*], d: "not slippers, not barefoot")],
    icon-key, [*Keys* #critical],
    [#cr-line("Keys?", [*ON PERSON* or *BY DOOR*])],
    icon-bag, [*Go Bag* #critical],
    [#cr-line("Bag Position?", [*BY DOOR*, *ZIPPED*])],
    icon-door, [*Exit Route* #critical],
    [#cr-line("Hallway?", [*CLEAR*])
     #linebreak() #cr-line("Front Door?", [*OPENS QUICKLY*])],
    icon-laptop, [*Browser Alert*],
    [#cr-line("Desktop Alert?", [Red Alert extension *ACTIVE*], d: "if working at desk")],
  )

  #v(0.3cm)
  #block(width: 100%, inset: 12pt, fill: blue-light, radius: 6pt, stroke: 1pt + blue-accent)[
    #text(size: 10pt, weight: "bold", fill: blue-dark)[Working from home during wartime:]
    #v(4pt)
    #set text(size: 9pt)
    - Stay dressed and shoed — do not slip into pyjamas "just at the desk"
    - Headphones: use one ear only, or keep volume low enough to hear a siren
    - Save work frequently — you may need to abandon your desk mid-sentence
    - At the start of any call: _"I'm in an active alert zone. I may need to leave abruptly."_
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#daytime-posture-content()
#printable-footer()
