// Printable: Respiratory Protection
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Respiratory Protection", colour: rgb("#d35400"), icon-content: icon-mask)

#v(0.2cm)
#text(size: 9pt, style: "italic")[Dust from a ballistic impact can fill any shelter in seconds. An N95 weighs almost nothing — keep one per person in your go bag.]
#v(0.4cm)

// === GO BAG MINIMUM ===

#block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: blue-dark,
  radius: (top: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: white)[Go Bag Minimum — N95 Masks]
]

#block(
  width: 100%,
  stroke: 1.5pt + blue-dark,
  radius: (bottom: 4pt),
  inset: 12pt,
)[
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

#v(0.5cm)

// === CBRN PROTECTION ===

#block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: red-alert,
  radius: (top: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: white)[Enhanced Protection — Chemical / Nuclear Threat]
]

#block(
  width: 100%,
  stroke: 1.5pt + red-alert,
  radius: (bottom: 4pt),
  inset: 12pt,
)[
  #text(size: 10pt, weight: "bold", fill: red-alert)[Israeli Civilian Gas Mask (IDF-issued)]
  #v(4pt)
  #set text(size: 9.5pt)
  Israel distributes civilian protective kits through Israel Post and HFC distribution points. If you have not collected yours, do so immediately during escalation.

  #v(8pt)

  #table(
    columns: (1fr, 2.5fr),
    inset: 8pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if calc.odd(y) { red-light } else { white },
    align: (left, left),
    [*Mask*], [Israeli civilian gas mask (4A1 or equivalent). Issued by HFC.],
    [*Filter*], [40mm NATO-thread CBRN canister (NBC filter). Comes with the kit.],
    [*Shelf life*], [Sealed filter: ~10 years. Once opened: replace immediately. Check the date printed on the canister.],
    [*Storage*], [Keep in original sealed bag. Store in a cool, dry place. Accessible within 60 seconds.],
    [*Fit test*], [Practice putting it on: you should be able to don the mask in under 15 seconds. Do a seal check — inhale with filter blocked, mask should suck to face.],
    [*Children*], [Child-specific hoods and masks are distributed for ages 0–8. Practice with children so they are not frightened.],
    [*Collection*], [Israel Post branches or HFC emergency distribution points. Bring your Teudat Zehut.],
  )

  #v(8pt)

  #text(size: 10pt, weight: "bold", fill: blue-dark)[Half-Face Respirator Alternative]
  #v(4pt)

  If the IDF kit is unavailable, a commercial half-face respirator with appropriate filters provides meaningful protection:

  #v(4pt)

  #table(
    columns: (1fr, 2.5fr),
    inset: 8pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if calc.odd(y) { grey-light } else { white },
    align: (left, left),
    [*Respirator*], [3M 6200 (medium) or 6300 (large) half-face respirator],
    [*CBRN filters*], [3M 60926 multi-gas/vapour P100 cartridge (OV/AG/FM/CD/HF/HS/HC/P100). Broadest protection available commercially.],
    [*Particulate only*], [3M 2097 P100 filters — for dust, smoke, and radiological particulate. Lighter than multi-gas cartridges.],
    [*Spare filters*], [Keep 2 extra sets sealed. Filters have a shelf life (~5 years sealed).],
    [*Limitations*], [A half-face respirator does not protect eyes. For full CBRN protection, the IDF full-face mask is superior. A half-face is a backup, not a replacement.],
  )
]

#v(0.4cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: blue-light,
  radius: 6pt,
  stroke: 1pt + blue-accent,
)[
  #text(size: 10pt, weight: "bold", fill: blue-dark)[Checklist — Respiratory Readiness]
  #v(6pt)
  #call[N95 in Go Bag?] #h(3pt) #cr[*ONE PER PERSON*, sealed]
  #linebreak()
  #call[N95 Expiry?] #h(3pt) #cr[*NOT EXPIRED*]
  #linebreak()
  #call[Gas Mask Collected?] #h(3pt) #cr[*YES*, from HFC / Israel Post]
  #linebreak()
  #call[Gas Mask Accessible?] #h(3pt) #cr[within *60 SECONDS*]
  #linebreak()
  #call[Filter Seal?] #h(3pt) #cr[*INTACT*, not opened]
  #linebreak()
  #call[Filter Expiry?] #h(3pt) #cr[date *CHECKED*]
  #linebreak()
  #call[Fit Practised?] #h(3pt) #cr[*YES*, under 15 seconds to don]
  #linebreak()
  #call[Children's Masks?] #h(3pt) #cr[*SIZED* and *PRACTISED*]
]

#printable-footer()
