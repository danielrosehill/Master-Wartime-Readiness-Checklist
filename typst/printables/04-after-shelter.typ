// Printable: After Returning From Shelter (Reset)
#import "preamble.typ": *

#let after-shelter-content() = [
  #printable-header("After Returning From Shelter — Reset", colour: rgb("#d35400"))
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Run immediately after the all-clear. Restore full readiness before the next alert.]
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
    icon-bag, [*Go Bag* #critical],
    [#cr-line("Bag Position?", [*BACK BY DOOR*])
     #linebreak() #cr-line("Bag Sealed?", [*RE-ZIPPED*], d: "did anything fall out?")],
    icon-phone, [*Phone* #critical],
    [#cr-line("Charge Status?", [*ON CHARGE*], d: "if battery dropped")
     #linebreak() #cr-line("HFC App?", [still *RUNNING*])],
    [], [*Power Bank*],
    [#cr-line("Power Bank?", [*ON CHARGE*], d: "may have been used in shelter")],
    icon-water, [*Water*],
    [#cr-line("Emergency Supply?", [*RESUPPLIED*], d: "if you drank from emergency stock")],
    icon-shirt, [*Clothes & Shoes*],
    [#cr-line("Position?", [*BACK IN POSITION*], d: "by bed at night, on person during day")],
    [], [*Torch*],
    [#cr-line("Torch?", [*BACK IN POSITION*], d: "nightstand or go bag")],
    icon-people, [*Dependents* #critical],
    [#cr-line("Headcount?", [all *ACCOUNTED* for and *SAFE*])],
  )

  #v(0.2cm)
  #block(width: 100%, inset: 10pt, fill: green-light, radius: 6pt, stroke: 1pt + green-calm)[
    #text(size: 10pt, weight: "bold", fill: green-calm)[Self-Care — Do these NOW, not later.]
    #text(size: 8.5pt)[ You don't know when the next alert comes.]
    #v(4pt)
    #set text(size: 9pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 10pt,
      row-gutter: 2pt,
      [#cr-line("Eaten?", [*YES*], d: "Stress suppresses appetite — eat anyway")],
      [#cr-line("Showered?", [*YES*], d: "If time and situation allow")],
      [#cr-line("Hydrated?", [*YES*])],
      [#cr-line("Groomed?", [*YES*], d: "Morale and normalcy matter")],
      [#cr-line("Toilet?", [*DONE*])],
      [#cr-line("Rested?", [*YES*], d: "When possible")],
    )
    #v(4pt)
    #line(length: 100%, stroke: 0.5pt + green-calm)
    #v(2pt)
    #text(weight: "bold")[Children:]
    #v(2pt)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 8pt,
      [#cr-line("Fed?", [*YES*])],
      [#cr-line("Hydrated?", [*YES*])],
      [#cr-line("Changed?", [*YES*])],
      [#cr-line("Cleaned?", [*YES*])],
      [#cr-line("Rested?", [*YES*])],
      [],
    )
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#after-shelter-content()
#printable-footer()
