// Printable: Before Bed Checklist
#import "preamble.typ": *

#let before-bed-content() = [
  #printable-header("Before Bed Checklist", colour: blue-dark, icon-content: icon-moon)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Run every night. Everything here exists so a 3am siren is survivable on autopilot.]
  #v(0.15cm)
  #cr-instructions()
  #v(0.2cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 8pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-eye, [*Situation Check*],
    [#cr-line("News?", [*SCANNED*], d: "HFC app + gov sources. Assess if safe to sleep at home")
     #linebreak() #cr-line("Threat Level?", [*NOTED*], d: "Standard or extra-vigilant tonight?")],
    icon-phone, [*Phone* #critical],
    [#cr-line("Charge Status?", [*CHARGING* or *CHARGED*])
     #linebreak() #cr-line("Phone Mode?", [*ACTIVE*, not airplane mode], d: "DND/silent OK")
     #linebreak() #cr-line("Location Services?", [*ON*])
     #linebreak() #cr-line("HFC Override?", [*PERMISSIONS SET*])],
    icon-shirt, [*Clothes* #critical],
    [#cr-line("Outfit?", [*LAID OUT* by bed], d: "full outfit ready in seconds")],
    icon-shoe, [*Footwear* #critical],
    [#cr-line("Shoes?", [*CLOSED-TOE* by bed], d: "ready to step into")],
    [], [*Torch*],
    [#cr-line("Torch?", [*ARM'S REACH*], d: "on nightstand, not in go bag")],
    [], [*Glasses*],
    [#cr-line("Glasses?", [*BY BED*], d: "same spot every night")],
    icon-key, [*Keys*],
    [#cr-line("Keys?", [*ACCESSIBLE*], d: "by bed or on hook by front door")],
    icon-bag, [*Go Bag* #critical],
    [#cr-line("Bag Position?", [*BY DOOR*])
     #linebreak() #cr-line("Bag Contents?", [*VERIFIED*])
     #linebreak() #cr-line("Power Bank?", [*ON CHARGE*])],
    icon-door, [*Exit Route* #critical],
    [#cr-line("Hallway?", [*CLEAR*], d: "can navigate in the dark")
     #linebreak() #cr-line("Front Door?", [*NOT* double-locked])],
    icon-alert, [*Hearing* #critical],
    [#cr-line("Earplugs?", [*NONE* — ears clear], d: "must hear siren + phone alert")],
    icon-baby, [*Dependents* #critical],
    [#cr-line("Headcount?", [all *ACCOUNTED* for])
     #linebreak() #cr-line("Baby?", [*CLOTHES* by bed, *BABYWEAR* by door])],
  )
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#before-bed-content()
#printable-footer()
