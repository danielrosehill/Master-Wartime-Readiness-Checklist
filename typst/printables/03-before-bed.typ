// Printable: Before Bed Checklist
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

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
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[CALL],
  text(fill: white, weight: "bold", size: 9pt)[RESPOND],

  icon-eye, [*News Check*],
  [#call[Situation?] #h(3pt) #cr(d: "assess if safe to sleep at home")[*SCANNED*]],

  icon-phone, [*Phone* #critical],
  [#call[Charge Status?] #h(3pt) #cr[*CHARGING* or *CHARGED*]
   #linebreak() #call[Phone Mode?] #h(3pt) #cr(d: "DND/silent OK")[*ACTIVE*, not in airplane mode]
   #linebreak() #call[Location Services?] #h(3pt) #cr[*ON*]
   #linebreak() #call[HFC Override?] #h(3pt) #cr[*PERMISSIONS SET*]],

  icon-shirt, [*Clothes* #critical],
  [#call[Outfit?] #h(3pt) #cr(d: "full outfit ready in seconds")[*LAID OUT* by bed]],

  icon-shoe, [*Footwear* #critical],
  [#call[Shoes?] #h(3pt) #cr(d: "ready to step into")[*CLOSED-TOE* by bed]],

  [], [*Torch*],
  [#call[Torch?] #h(3pt) #cr(d: "on nightstand, not in go bag")[*ARM'S REACH*]],

  [], [*Glasses*],
  [#call[Glasses?] #h(3pt) #cr(d: "same spot every night")[*BY BED*]],

  icon-key, [*Keys*],
  [#call[Keys?] #h(3pt) #cr(d: "by bed or on hook by front door")[*ACCESSIBLE*]],

  icon-bag, [*Go Bag* #critical],
  [#call[Bag Position?] #h(3pt) #cr[*BY DOOR*]
   #linebreak() #call[Bag Contents?] #h(3pt) #cr[*VERIFIED*]
   #linebreak() #call[Power Bank?] #h(3pt) #cr[*ON CHARGE*]],

  icon-door, [*Exit Route* #critical],
  [#call[Hallway?] #h(3pt) #cr(d: "can navigate in the dark")[*CLEAR*]
   #linebreak() #call[Front Door?] #h(3pt) #cr[*NOT* double-locked]],

  icon-alert, [*Hearing* #critical],
  [#call[Earplugs?] #h(3pt) #cr(d: "must hear siren + phone alert")[*NONE* — ears clear]],

  icon-baby, [*Dependents* #critical],
  [#call[Headcount?] #h(3pt) #cr[all *ACCOUNTED* for]
   #linebreak() #call[Baby?] #h(3pt) #cr[*CLOTHES* by bed, *BABYWEAR* by door]],
)

#printable-footer()
