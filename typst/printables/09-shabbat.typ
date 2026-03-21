// Printable: Shabbat / Hag Preparation
#import "preamble.typ": *

#let shabbat-content() = [
  #printable-header("Shabbat / Hag — Pre-Candle-Lighting Checklist", colour: purple-shab)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Complete before candle-lighting. When phones are off, sirens are your only alert.]
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
    icon-alert, [*TV / Channel 14* #critical],
    [#cr-line("TV On?", [*PLAYING* before Shabbat])
     #linebreak() #cr-line("TV Volume?", [*AUDIBLE* from bedrooms], d: "verify not muted")],
    icon-radio, [*Emergency Radio* #critical],
    [#cr-line("Radio Frequency?", [*VERIFIED*])
     #linebreak() #cr-line("Radio Volume?", [at *MAXIMUM*])
     #linebreak() #cr-line("Radio Power?", [*AC* or *BATTERIES* confirmed])],
    icon-bag, [*Go Bag*],
    [#cr-line("Bag Position?", [*BY DOOR*])
     #linebreak() #cr-line("Bag Contents?", [*VERIFIED*])],
    icon-bag, [*Shabbat Supplies*],
    [#cr-line("Shabbat Kit?", [*PACKED*], d: "siddur, kiddush cup, snacks for shelter")],
    icon-shoe, [*Shoes* #critical],
    [#cr-line("Footwear?", [*CLOSED-TOE* by bed and by door], d: "not slippers")],
    icon-shirt, [*Clothes*],
    [#cr-line("Outfit?", [*LAID OUT* by bed], d: "full outfit, not just pyjamas")],
    icon-key, [*Keys*],
    [#cr-line("Keys?", [*BY FRONT DOOR*])],
    [], [*Torch*],
    [#cr-line("Torch?", [*ARM'S REACH*], d: "pre-set on nightstand")],
    [], [*Windows*],
    [#cr-line("Windows?", [*SLIGHTLY OPEN*], d: "to hear outdoor sirens")],
  )
  #v(0.25cm)
  #block(width: 100%, inset: 12pt, fill: rgb("#f3e5f5"), radius: 6pt, stroke: 1.5pt + purple-shab)[
    #text(size: 10pt, weight: "bold", fill: purple-shab)[Pikuach Nefesh]
    #v(4pt)
    #text(size: 9.5pt)[Preservation of life overrides all Shabbat prohibitions. If a siren sounds, you *may and must* use your phone, carry items, and do whatever is needed to reach shelter safely. This is not a leniency — it is *halacha*.]
  ]
  #v(0.2cm)
  #block(width: 100%, inset: 10pt, fill: red-light, radius: 6pt, stroke: 1pt + red-alert)[
    #text(size: 9.5pt, weight: "bold", fill: red-alert)[During Shabbat:]
    #text(size: 9pt)[ Keep windows open for sirens · TV/radio must stay audible · Know your shelter route in the dark · Stay in shelter 10 min or until all-clear on TV/radio]
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#shabbat-content()
#printable-footer()
