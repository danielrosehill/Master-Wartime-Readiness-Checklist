// Printable: Before Showering
#import "preamble.typ": *

#let before-shower-content() = [
  #printable-header("Before Showering — Vulnerability Checklist", colour: blue-accent, icon-content: icon-water)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[You are at your most vulnerable in the shower. Minimise time and maximise readiness.]
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
    [#cr-line("Volume?", [at *MAXIMUM*], d: "must be audible over water")
     #linebreak() #cr-line("Phone Location?", [*IN BATHROOM* or just outside door])],
    icon-shirt, [*Clothes* #critical],
    [#cr-line("Outfit?", [*FULL OUTFIT* in bathroom], d: "not in another room")],
    icon-shoe, [*Footwear* #critical],
    [#cr-line("Shoes?", [*CLOSED-TOE* by bathroom door])],
    [], [*Towel*],
    [#cr-line("Towel?", [*WITHIN REACH*], d: "for rapid dry-off")],
    icon-door, [*Door*],
    [#cr-line("Bathroom Door?", [*UNLOCKED*])],
    icon-clock, [*Keep It Short* #critical],
    [#cr-line("Time?", [*MINIMISED*], d: "be quick — get in, get out")],
  )

  #v(0.4cm)
  #block(width: 100%, inset: 12pt, fill: red-light, radius: 6pt, stroke: 1.5pt + red-alert)[
    #text(size: 10pt, weight: "bold", fill: red-alert)[⚠ If a siren sounds while showering:]
    #v(4pt)
    #set text(size: 10pt)
    + *Turn off water* (1 second)
    + *Grab towel* — wrap as you move (don't dry off)
    + *Step into shoes* by door
    + *Move to protected space* — clothes can wait, shelter cannot
  ]
  #v(0.2cm)
  #block(width: 100%, inset: 10pt, fill: grey-light, radius: 4pt)[
    #text(size: 8pt, style: "italic")[Post this on the bathroom door or mirror. Review before every shower during wartime.]
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#before-shower-content()
#printable-footer()
