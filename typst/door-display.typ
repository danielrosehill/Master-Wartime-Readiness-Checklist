// Door Display — Selected checklists WITHOUT headers, footers, or page numbers.
// Designed for printing and posting on doors or walls.

#import "printables/preamble.typ": *
#import "printables/01-braced.typ": quick-readiness-content
#import "printables/02-daytime-posture.typ": daytime-posture-content
#import "printables/03-before-bed.typ": before-bed-content
#import "printables/05-before-shower.typ": before-shower-content
#import "printables/06-before-leaving.typ": before-leaving-content
#import "printables/04-after-shelter.typ": after-shelter-content
#import "printables/15-bathing-baby.typ": bathing-baby-content

#set page(
  paper: "a4",
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
  header: none,
  footer: none,
)

#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

// Each checklist on its own page, no headers/footers/page numbers

#quick-readiness-content()

#pagebreak()
#daytime-posture-content()

#pagebreak()
#before-bed-content()

#pagebreak()
#before-shower-content()

#pagebreak()
#before-leaving-content()

#pagebreak()
#after-shelter-content()

#pagebreak()
#bathing-baby-content()
