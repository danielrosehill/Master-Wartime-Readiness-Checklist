// Printable: Printing & Binding Specifications
// This page is for the print shop, not the end user
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("Print Shop Instructions / הוראות לבית הדפוס", colour: blue-dark)

#v(0.2cm)

#text(size: 9pt, style: "italic")[This sheet is for the print shop operator. Do not include this page in the finished booklet.]

#v(0.3cm)

// ═══════════════════════════════════════
// ENGLISH INSTRUCTIONS
// ═══════════════════════════════════════

#text(size: 12pt, weight: "bold", fill: blue-dark)[Digital Printing Instructions]

#v(0.1cm)

#table(
  columns: (1.2fr, 2.8fr),
  inset: 7pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (left, left),
  text(fill: white, weight: "bold", size: 8pt)[PARAMETER],
  text(fill: white, weight: "bold", size: 8pt)[SPECIFICATION],
  [*Pages*], [All pages *except this instruction sheet* (pages 3+)],
  [*Paper*], [*A4 portrait* (210 × 297 mm) — do NOT scale or fit-to-page],
  [*Stock*], [*250–300 gsm coated card* — matte or silk finish preferred],
  [*Sides*], [*Single-sided only* — back of each sheet blank],
  [*Colour*], [*Full colour (CMYK).* Safety-critical colour coding — do NOT print greyscale],
  [*Bleed*], [*Not required.* All content within 15mm margins. No edge-to-edge colour],
  [*Scaling*], [*100% actual size.* Do not shrink-to-fit or auto-scale],
  [*Colour mgmt*], [Source RGB → convert to CMYK on RIP. High-contrast, no critical matching],
  [*Fonts / PDF*], [All fonts embedded. Vector PDF — no rasterisation. Do not outline],
  [*Binding*], [*Wire-O spiral along TOP (short) edge.* Booklet flips upward],
  [*Cover*], [350 gsm card. Front: first checklist. Back: Emergency Numbers (sheet 8)],
  [*Lamination*], [Cover only (optional). Do NOT laminate interior pages],
)

#v(0.3cm)

// ═══════════════════════════════════════
// HEBREW INSTRUCTIONS
// ═══════════════════════════════════════

#block(
  width: 100%,
  inset: (x: 14pt, y: 8pt),
  fill: blue-dark,
  radius: 4pt,
)[
  #text(size: 12pt, weight: "bold", fill: white)[הוראות הדפסה דיגיטלית]
]

#v(0.1cm)

#set text(dir: rtl)

#table(
  columns: (2.8fr, 1.2fr),
  inset: 7pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (right, right),
  text(fill: white, weight: "bold", size: 8pt)[פירוט],
  text(fill: white, weight: "bold", size: 8pt)[פרמטר],
  [כל העמודים *מלבד דף ההוראות* (מעמוד 3+)], [*עמודים*],
  [*A4 לאורך* (210 × 297 מ"מ) — לא לשנות גודל], [*גודל נייר*],
  [*קרטון מצופה 250–300 גרם* — מט או סילק עדיף], [*נייר*],
  [*צד אחד בלבד* — גב ריק], [*צדדיות*],
  [*צבע מלא (CMYK).* לא להדפיס שחור-לבן — הצבעים מקודדים לפי סיכון], [*צבע*],
  [*לא נדרש.* כל התוכן בתוך שוליים של 15 מ"מ], [*בליד*],
  [*100% — גודל אמיתי.* לא לכווץ], [*קנה מידה*],
  [*ספירלה (Wire-O) בצד העליון (הקצר).* נפתח כלפי מעלה], [*כריכה*],
  [350 גרם. קדמי: צ'קליסט ראשון. אחורי: מספרי חירום], [*כריכה ק/א*],
  [לכריכה בלבד (אופציונלי). *לא* ללמנט דפים פנימיים], [*למינציה*],
)

#set text(dir: ltr)

#v(0.15cm)

#block(
  width: 100%,
  inset: 8pt,
  fill: blue-light,
  radius: 4pt,
  stroke: 1pt + blue-accent,
)[
  #text(size: 9.5pt, weight: "bold", fill: blue-dark)[Summary / סיכום:]
  #text(size: 9pt)[ A4 · 250g card · single-sided · full colour · Wire-O spiral (top edge)]
  #v(2pt)
  #set text(dir: rtl)
  #text(size: 9pt)[A4 · קרטון 250 גרם · צד אחד · צבע מלא · כריכת ספירלה עליונה]
]

#pagebreak()

// ═══════════════════════════════════════
// PAGE ORDER TABLE + CUSTOMER NOTES
// ═══════════════════════════════════════

#text(size: 12pt, weight: "bold", fill: blue-dark)[Booklet Page Order / סדר העמודים בחוברת]

#v(0.1cm)

#table(
  columns: (auto, 2fr, auto, 1.5fr),
  inset: 6pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, center, left),
  text(fill: white, weight: "bold", size: 9pt)[No.],
  text(fill: white, weight: "bold", size: 9pt)[Checklist],
  text(fill: white, weight: "bold", size: 9pt)[Pages],
  text(fill: white, weight: "bold", size: 9pt)[Post Location],
  [1], [Quick Readiness Check], [1], [Fridge / front door],
  [2], [Daytime At-Home Posture], [1], [Fridge / home office],
  [3], [Before Bed], [1], [Bedroom door / nightstand],
  [4], [After Shelter — Reset], [2], [Mamad / shelter],
  [5], [Before Showering], [1], [Bathroom mirror / door],
  [6], [Before Leaving Home], [1], [Front door (inside)],
  [7], [Night Alarm — 30-Second Drill], [1], [Wall by bed],
  [8], [Emergency Numbers], [1], [Fridge + mamad + go bag],
  [9], [Shabbat / Hag], [1], [Kitchen / dining area],
  [10], [News Review Schedule], [2], [Fridge / home office],
  [11], [Respiratory Protection], [2], [With go bag / mamad],
  [12], [Lull / Resupply], [2], [Fridge / front door],
  [13], [Terrorist Infiltration], [1], [Mamad / front door],
  [14], [UAV / Drone Alert], [2], [Mamad / front door],
  [15], [Bathing a Baby], [2], [Bathroom — near baby bath],
)

#v(0.1cm)

#text(size: 8pt, style: "italic")[Total: 15 checklists, 21 printed sheets.]

#v(0.25cm)

#text(size: 11pt, weight: "bold", fill: blue-dark)[Notes for the Customer / הערות ללקוח]

#v(0.1cm)

#set text(size: 9pt)

- *File to print:* `All-Printables-Combined.pdf` — skip the first pages (this instruction sheet)
- *Typical cost:* ₪40–80 per booklet for 1–5 copies; less in bulk
- *Turnaround:* Same day or next day at most Israeli print shops
- *Deliver file:* USB stick, email, or WhatsApp
- *Check the proof:* Header colours solid (no banding), text sharp, checkboxes visible
- *Extra copies:* Print extra sheets of Emergency Numbers (#8) for fridge, mamad, and go bag
- *Wall posting:* Also print sheets 3, 5, 7, 8 individually (unbound) for bathroom, bedroom, fridge

#printable-footer()
