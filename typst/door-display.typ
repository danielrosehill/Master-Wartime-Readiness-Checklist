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
  margin: (top: 1.2cm, bottom: 1.2cm, left: 1.2cm, right: 1.2cm),
  header: none,
  footer: none,
  fill: rgb("#e8ecf0"),
)

#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

// Wrapper: white card with subtle border and shadow effect
#let door-card(body) = {
  block(
    width: 100%,
    height: 100%,
    inset: (x: 18pt, y: 16pt),
    fill: white,
    radius: 8pt,
    stroke: 0.75pt + rgb("#c0c8d0"),
  )[
    #body
    #v(1fr)
    #line(length: 100%, stroke: 0.4pt + grey-border)
    #v(3pt)
    #align(center)[
      #text(size: 7pt, fill: rgb("#999999"))[
        Israel Wartime Readiness Field Guide · danielrosehill.com · Print and post visibly
      ]
    ]
  ]
}

// Each checklist on its own page, wrapped in a card

#door-card[#quick-readiness-content()]

#pagebreak()
#door-card[#daytime-posture-content()]

#pagebreak()
#door-card[#before-bed-content()]

#pagebreak()
#door-card[#before-shower-content()]

#pagebreak()
#door-card[#before-leaving-content()]

#pagebreak()
#door-card[#after-shelter-content()]

#pagebreak()
#door-card[#bathing-baby-content()]
