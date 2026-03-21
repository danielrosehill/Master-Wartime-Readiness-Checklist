// Printable: News Review Schedule
#import "preamble.typ": *

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

#printable-header("News Review Schedule", colour: blue-dark, icon-content: icon-news)

#v(0.2cm)
#text(size: 9pt, style: "italic")[Structured news monitoring prevents both under-awareness and doom-scrolling. Pick the schedule that matches your threat level.]
#v(0.4cm)

// === STANDARD WARTIME ===

#block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: blue-accent,
  radius: (top: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: white)[Standard Wartime Schedule]
]

#block(
  width: 100%,
  stroke: (left: 1.5pt + blue-accent, right: 1.5pt + blue-accent, bottom: 1.5pt + blue-accent),
  radius: (bottom: 4pt),
  inset: 0pt,
  clip: true,
)[
  #table(
    columns: (1.2fr, 1.2fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { blue-light } else { white },
    align: (center, left, left),
    text(fill: white, weight: "bold", size: 9pt)[OFFSET],
    text(fill: white, weight: "bold", size: 9pt)[REVIEW POINT],
    text(fill: white, weight: "bold", size: 9pt)[WHAT TO CHECK],

    [Wake +0], [*Morning Scan*],
    [HFC app alerts · overnight incidents · current threat level],

    [Wake +3h], [*Mid-Morning Brief*],
    [News headlines · any new HFC advisories · shelter status],

    [Wake +6h], [*Midday Check*],
    [Situation development · HFC updates · any area changes],

    [Wake +9h], [*Afternoon Update*],
    [Escalation indicators · supply situation · travel advisories],

    [Wake +12h], [*Evening Review*],
    [Daily summary · overnight forecast · any curfew/guidance changes],

    [Before bed], [*Sleep Assessment*],
    [Safe to sleep at home? · alerts configured? · overnight threat level],
  )
]

#v(0.15cm)
#text(size: 8pt, style: "italic")[Example for 07:00 wake: checks at 07:00, 10:00, 13:00, 16:00, 19:00, and before bed.]

#v(0.5cm)

// === EXTRA VIGILANT ===

#block(
  width: 100%,
  inset: (x: 14pt, y: 10pt),
  fill: red-alert,
  radius: (top: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: white)[Extra Vigilant — Active Escalation]
]

#block(
  width: 100%,
  stroke: (left: 1.5pt + red-alert, right: 1.5pt + red-alert, bottom: 1.5pt + red-alert),
  radius: (bottom: 4pt),
  inset: 0pt,
  clip: true,
)[
  #table(
    columns: (1.5fr, 2.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { red-light } else { white },
    align: (left, left),
    text(fill: white, weight: "bold", size: 9pt)[TRIGGER],
    text(fill: white, weight: "bold", size: 9pt)[ACTION],

    [*Every 90 minutes*],
    [Quick HFC app scan — 30 seconds. Check for new alerts or area changes.],

    [*Before leaving home*],
    [Full situation check. Active alerts? Route shelters identified?],

    [*Before shower*],
    [Are there active alerts in your area right now?],

    [*After any siren / alert*],
    [Developing situation? Follow-up strikes expected? Stay in shelter until confirmed clear.],

    [*Before bed*],
    [Extended assessment — check multiple sources. Safe to sleep? HFC app override set?],

    [*If woken at night*],
    [Quick scan before returning to sleep. New alerts? Escalation?],
  )
]

#v(0.4cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: green-light,
  radius: 6pt,
  stroke: 1pt + green-calm,
)[
  #text(size: 10pt, weight: "bold", fill: green-calm)[Healthy monitoring habits:]
  #v(4pt)
  #set text(size: 9pt)
  - *Set a timer.* Check at scheduled times, then put the phone down. Constant scrolling increases anxiety without improving safety.
  - *One reliable source.* HFC app is ground truth. Cross-reference with one trusted news outlet. Ignore social media rumours.
  - *Share the load.* In a household, take turns being the "news person." Not everyone needs to watch simultaneously.
  - *Night discipline.* Unless on extra-vigilant, trust your phone alerts overnight. You do not need to set an alarm to check news.
]

#printable-footer()
