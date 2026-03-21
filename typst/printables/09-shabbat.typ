// Printable: Shabbat / Hag Preparation
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Shabbat / Hag — Pre-Candle-Lighting Checklist", colour: rgb("#8e44ad"))

#v(0.2cm)
#text(size: 9pt, style: "italic")[Complete before candle-lighting. When phones are off, sirens are your only alert.]
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

  icon-alert, [*TV / Channel 14* #critical],
  [#call[TV On?] #h(3pt) #cr[*PLAYING* before Shabbat]
   #linebreak() #call[TV Volume?] #h(3pt) #cr(d: "verify not muted")[*AUDIBLE* from bedrooms]],

  icon-radio, [*Emergency Radio* #critical],
  [#call[Radio Frequency?] #h(3pt) #cr[*VERIFIED*]
   #linebreak() #call[Radio Volume?] #h(3pt) #cr[at *MAXIMUM*]
   #linebreak() #call[Radio Power?] #h(3pt) #cr[*AC* or *BATTERIES* confirmed]],

  icon-bag, [*Go Bag*],
  [#call[Bag Position?] #h(3pt) #cr[*BY DOOR*]
   #linebreak() #call[Bag Contents?] #h(3pt) #cr[*VERIFIED*]],

  icon-bag, [*Shabbat Supplies*],
  [#call[Shabbat Kit?] #h(3pt) #cr(d: "siddur, kiddush cup, snacks for shelter")[*PACKED*]],

  icon-shoe, [*Shoes* #critical],
  [#call[Footwear?] #h(3pt) #cr(d: "not slippers")[*CLOSED-TOE* by bed and by door]],

  icon-shirt, [*Clothes*],
  [#call[Outfit?] #h(3pt) #cr(d: "full outfit, not just pyjamas")[*LAID OUT* by bed]],

  icon-key, [*Keys*],
  [#call[Keys?] #h(3pt) #cr[*BY FRONT DOOR*]],

  [], [*Torch*],
  [#call[Torch?] #h(3pt) #cr(d: "pre-set on nightstand")[*ARM'S REACH*]],

  [], [*Windows*],
  [#call[Windows?] #h(3pt) #cr(d: "to hear outdoor sirens")[*SLIGHTLY OPEN*]],
)

#v(0.25cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: rgb("#f3e5f5"),
  radius: 6pt,
  stroke: 1.5pt + rgb("#8e44ad"),
)[
  #text(size: 10pt, weight: "bold", fill: rgb("#8e44ad"))[Pikuach Nefesh]
  #v(4pt)
  #text(size: 9.5pt)[
    Preservation of life overrides all Shabbat prohibitions. If a siren sounds, you *may and must* use your phone, carry items, and do whatever is needed to reach shelter safely. This is not a leniency — it is *halacha*.
  ]
]

#v(0.2cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: red-light,
  radius: 6pt,
  stroke: 1pt + red-alert,
)[
  #text(size: 9.5pt, weight: "bold", fill: red-alert)[During Shabbat:]
  #text(size: 9pt)[ Keep windows open for sirens · TV/radio must stay audible · Know your shelter route in the dark · Stay in shelter 10 min or until all-clear on TV/radio]
]

#printable-footer()
