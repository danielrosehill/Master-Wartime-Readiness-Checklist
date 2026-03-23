// Wall Printables — Selected checklists WITHOUT headers, footers, or page numbers.
// Designed for printing and posting on doors or walls.

#import "printables/preamble.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "printables/18-pre-emergency-home.typ": pre-emergency-home-content
#import "printables/16-mamad-inspection.typ": mamad-inspection-content
#import "printables/01-braced.typ": quick-readiness-content
#import "printables/02-daytime-posture.typ": daytime-posture-content
#import "printables/03-before-bed.typ": before-bed-content
#import "printables/05-before-shower.typ": before-shower-content
#import "printables/06-before-leaving.typ": before-leaving-content
#import "printables/15-bathing-baby.typ": bathing-baby-content
#import "printables/22-situational-awareness.typ": situational-awareness-content
#import "printables/23-shelter-flowchart.typ": shelter-flowchart-content
#import "printables/07-night-alarm.typ": night-alarm-content
#import "printables/04-after-shelter.typ": after-shelter-content
#import "printables/12-lull-resupply.typ": lull-resupply-content

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
#let wall-card(body) = {
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

#wall-card[#pre-emergency-home-content()]

#pagebreak()
#wall-card[#mamad-inspection-content()]

#pagebreak()
#wall-card[#quick-readiness-content()]

#pagebreak()
#wall-card[#daytime-posture-content()]

#pagebreak()
#wall-card[#before-bed-content()]

#pagebreak()
#wall-card[#before-shower-content()]

#pagebreak()
#wall-card[#before-leaving-content()]

#pagebreak()
#wall-card[#bathing-baby-content()]

#pagebreak()
#wall-card[#situational-awareness-content()]

#pagebreak()
#wall-card[#shelter-flowchart-content()]

#pagebreak()
#wall-card[#night-alarm-content()]

#pagebreak()
#wall-card[#after-shelter-content()]

#pagebreak()
#wall-card[#lull-resupply-content()]
