// Printable: Respiratory Protection
#import "preamble.typ": *

#let respiratory-content() = [
  #printable-header("Respiratory Protection", colour: rgb("#d35400"), icon-content: icon-mask)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Dust from a ballistic impact can fill a shelter in seconds. An N95 weighs almost nothing — keep one per person in your go bag.]
  #v(0.3cm)

  #block(width: 100%, inset: 10pt, fill: rgb("#fff3cd"), radius: 4pt, stroke: 1pt + rgb("#856404"))[
    #text(size: 9pt, weight: "bold", fill: rgb("#856404"))[Note:] #text(size: 9pt)[These are personal recommendations based on experience, not official HFC minimums. Adjust to your own comfort level and circumstances.]
  ]

  #v(0.3cm)

  #block(width: 100%, inset: (x: 14pt, y: 10pt), fill: blue-dark, radius: (top: 4pt))[
    #text(size: 12pt, weight: "bold", fill: white)[Go Bag Recommendation — N95 Masks]
  ]
  #block(width: 100%, stroke: 1.5pt + blue-dark, radius: (bottom: 4pt), inset: 12pt)[
    #table(
      columns: (1fr, 2.5fr),
      inset: 8pt,
      stroke: 0.5pt + grey-border,
      fill: (_, y) => if calc.odd(y) { grey-light } else { white },
      align: (left, left),
      [*What*], [N95 respirator mask (NIOSH-rated)],
      [*Quantity*], [One per person, sealed in ziplock bag],
      [*Why*], [Ballistic impacts fill shelters with concrete dust, glass particles, and debris. An N95 filters 95% of airborne particulates. Lightweight, flat, costs almost nothing.],
      [*Brands*], [3M 8210, 3M 9205+, or any NIOSH N95. Avoid KN95 knock-offs without certification.],
      [*Fit*], [Must seal around nose and chin. Pinch the nose clip. If glasses fog, it's not sealed.],
      [*Replace*], [After each use, or if the bag seal is broken. Check expiry date.],
      [*Children*], [Child-sized N95s exist (3M 1860S or Kimberly-Clark child size). Stock separately.],
    )
  ]

  #v(0.4cm)

  #block(width: 100%, inset: 12pt, fill: blue-light, radius: 6pt, stroke: 1pt + blue-accent)[
    #text(size: 10pt, weight: "bold", fill: blue-dark)[Checklist — Respiratory Readiness]
    #v(6pt)
    #cr-line("N95 in Go Bag?", [*ONE PER PERSON*, sealed])
    #linebreak() #cr-line("N95 Expiry?", [*NOT EXPIRED*])
    #linebreak() #cr-line("Fit Practised?", [*YES*, under 15 seconds to don])
    #linebreak() #cr-line("Children's Masks?", [*SIZED* and *PRACTISED*])
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#respiratory-content()
#printable-footer()
