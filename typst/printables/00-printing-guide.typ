// Printable: Printing & Binding Specifications
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Printing & Binding Guide", colour: blue-dark)

#v(0.3cm)

#text(size: 9pt, style: "italic")[This page is for the person ordering the print job. Do not include this page in the bound booklet.]

#v(0.4cm)

// === FORMAT RECOMMENDATION ===

#text(size: 12pt, weight: "bold", fill: blue-dark)[Recommended Format]

#v(0.2cm)

#table(
  columns: (1.2fr, 2.5fr),
  inset: 10pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if calc.odd(y) { grey-light } else { white },
  align: (left, left),
  [*Paper Size*], [*A4 portrait* (210 × 297 mm). All pages are designed for A4 — do not scale.],
  [*Card Stock*], [*250–300 gsm coated card* (מנייר כרום). Matte or silk finish preferred — avoids glare under torchlight. Glossy is acceptable but harder to read at 3am.],
  [*Print*], [*Single-sided* (one checklist per sheet). Back of each sheet is blank. This allows wall posting of individual sheets.],
  [*Colour*], [*Full colour* (CMYK). Colour coding is functional — red = critical, green = self-care, blue = information. Greyscale loses meaning.],
  [*Binding*], [*Wire-O spiral binding along the top (short) edge.* This allows the booklet to lie flat when flipped open, and pages hang naturally when posted on a hook or clip.],
  [*Cover*], [*350 gsm card*, same stock or heavier. Front cover: title page. Back cover: emergency numbers (printable #08).],
  [*Lamination*], [Optional: laminate the cover only. Do NOT laminate interior pages — you lose the ability to write on checkboxes with a pen.],
)

#v(0.4cm)

// === DIGITAL PRINTING SPECS ===

#text(size: 12pt, weight: "bold", fill: blue-dark)[Digital Printing Specifications]

#v(0.2cm)

#table(
  columns: (1.2fr, 2.5fr),
  inset: 10pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if calc.odd(y) { grey-light } else { white },
  align: (left, left),
  [*Colour Space*], [CMYK. Source PDFs use RGB — request the print shop convert to CMYK on RIP. Colours are high-contrast and survive conversion well.],
  [*Resolution*], [Vector PDF (Typst output). No rasterisation needed. All text and graphics are vector.],
  [*Bleed*], [Not required for card stock cut to A4. If the print shop requires bleed, add 3mm on all sides and extend background colours.],
  [*Trim*], [Standard A4 (210 × 297 mm). No custom trim.],
  [*Registration*], [Not critical — single-sided printing, no front/back alignment needed.],
  [*Fonts*], [All fonts embedded in PDF. Atkinson Hyperlegible (body) + FontAwesome (icons). No font substitution needed.],
  [*Ink Coverage*], [Header bars are solid colour fills. Ensure even ink coverage on card stock — request a proof if ordering 10+ copies.],
)

#v(0.4cm)

// === PAGE ORDER ===

#text(size: 12pt, weight: "bold", fill: blue-dark)[Booklet Page Order (recommended)]

#v(0.2cm)

#table(
  columns: (auto, 2fr, 1.5fr),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  text(fill: white, weight: "bold", size: 9pt)[No.],
  text(fill: white, weight: "bold", size: 9pt)[CHECKLIST],
  text(fill: white, weight: "bold", size: 9pt)[POST LOCATION],
  [1], [Quick Readiness Check], [Fridge / front door],
  [2], [Daytime At-Home Posture], [Fridge / home office],
  [3], [Before Bed], [Bedroom door / nightstand],
  [4], [After Shelter — Reset], [Mamad / shelter],
  [5], [Before Showering], [Bathroom mirror / door],
  [6], [Before Leaving Home], [Front door (inside)],
  [7], [Night Alarm — 30-Second Drill], [Wall by bed],
  [8], [Emergency Numbers], [Fridge + mamad + go bag],
  [9], [Shabbat / Hag], [Kitchen / dining area],
  [10], [News Review Schedule], [Fridge / home office],
  [11], [Respiratory Protection], [With go bag / mamad],
  [12], [Lull / Resupply], [Fridge / front door],
  [13], [Terrorist Infiltration], [Mamad / front door],
  [14], [UAV / Drone Alert], [Mamad / front door],
  [15], [Bathing a Baby], [Bathroom — near baby bath],
)

#v(0.3cm)

// === ORDERING IN ISRAEL ===

#text(size: 12pt, weight: "bold", fill: blue-dark)[Ordering in Israel]

#v(0.2cm)

#set text(size: 9.5pt)

Most Israeli digital print shops (בתי דפוס דיגיטליים) handle this format routinely. When ordering:

- Ask for: *"הדפסה דיגיטלית על קרטון 250 גרם, A4 צד אחד, כריכת ספירלה עליונה"*
  - _(Digital print on 250gsm card, A4 single-sided, top spiral binding)_
- Typical cost: ₪40–80 per booklet for 1–5 copies; less in bulk
- Turnaround: Same day or next day at most print shops
- Bring the `All-Printables-Combined.pdf` file on USB or send by email

#v(0.2cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: blue-light,
  radius: 4pt,
  stroke: 1pt + blue-accent,
)[
  #text(size: 9pt, weight: "bold", fill: blue-dark)[Why A4 and not A5?]
  #v(4pt)
  #text(size: 9pt)[
    These checklists are designed to be read in low light, under stress, possibly without glasses. Scaling to A5 reduces the 10pt body text to ~7pt — too small for emergency use. A4 card with spiral binding is compact enough for a go bag and large enough to read at 3am.
  ]
]

#printable-footer()
