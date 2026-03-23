// Checklist & Flowchart Booklet — Spiral-bound A4 portrait
// All printable checklists + shelter/terrorist/UAV decision flowcharts
// No page numbers. Coloured section header tabs for thumb-indexing.

#import "printables/preamble.typ": *
#import "@preview/fletcher:0.5.7": diagram, node, edge
#import "@preview/fletcher:0.5.7" as fletcher

// ═══════════════════════════════════════
// IMPORTS: all checklist content functions
// ═══════════════════════════════════════

#import "printables/01-braced.typ": quick-readiness-content
#import "printables/02-daytime-posture.typ": daytime-posture-content
#import "printables/03-before-bed.typ": before-bed-content
#import "printables/04-after-shelter.typ": after-shelter-content
#import "printables/05-before-shower.typ": before-shower-content
#import "printables/06-before-leaving.typ": before-leaving-content
#import "printables/07-night-alarm.typ": night-alarm-content
#import "printables/08-emergency-numbers.typ": emergency-numbers-content
#import "printables/09-shabbat.typ": shabbat-content
#import "printables/10-news-schedule.typ": news-standard-content, news-vigilant-content
#import "printables/11-respiratory-protection.typ": respiratory-content
#import "printables/12-lull-resupply.typ": lull-resupply-content
#import "printables/13-terrorist-infiltration.typ": terrorist-infiltration-content
#import "printables/14-uav-drone.typ": uav-drone-content
#import "printables/15-bathing-baby.typ": bathing-baby-content

// ═══════════════════════════════════════
// COLOUR ROTATION for section tabs
// ═══════════════════════════════════════

#let tab-colours = (
  rgb("#1a3a5c"),  // navy
  rgb("#c0392b"),  // red
  rgb("#27774e"),  // green
  rgb("#d35400"),  // orange
  rgb("#8e44ad"),  // purple
  rgb("#0e7c47"),  // emerald
  rgb("#2563a0"),  // mid-blue
  rgb("#a0522d"),  // sienna
)

#let tab-idx = counter("tab-idx")

// ═══════════════════════════════════════
// PAGE SETUP — section name in header tab, no page numbers
// Wide left margin for spiral binding punch holes
// ═══════════════════════════════════════

#let section-label = state("section-label", "")
#let section-tab-colour = state("section-tab-colour", blue-dark)

#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 1.5cm, left: 2.2cm, right: 1.5cm),
  header: context {
    let all-markers = query(<booklet-section>)
    let current-page = here().page()
    let on-page = all-markers.filter(m => m.location().page() == current-page)
    let before = all-markers.filter(m => m.location().page() < current-page)
    let latest = if on-page.len() > 0 { on-page.first() } else if before.len() > 0 { before.last() } else { none }
    if latest != none {
      let name = section-label.at(latest.location())
      let colour = section-tab-colour.at(latest.location())
      block(
        width: 100%,
        inset: (x: 14pt, y: 8pt),
        fill: colour,
        radius: (bottom-left: 6pt, bottom-right: 6pt),
      )[
        #text(size: 11pt, fill: white, weight: "bold", tracking: 0.5pt)[#upper(name)]
      ]
      v(4pt)
    }
  },
  footer: none,
)

#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

// ═══════════════════════════════════════
// COVER PAGE
// ═══════════════════════════════════════

#page(margin: 0pt, header: none, footer: none)[
  // Full-bleed cover photo
  #block(
    width: 100%,
    height: 65%,
    clip: true,
    image("/images/illustrations/checklists/cover.jpg", width: 100%, height: 100%, fit: "cover"),
  )

  // Title block
  #block(
    width: 100%,
    inset: (x: 2cm, y: 1.2cm),
    fill: rgb("#1a3a5c"),
  )[
    #text(size: 28pt, weight: "bold", fill: white, tracking: 0.5pt)[
      Checklists &\
      Decision Flowcharts
    ]
    #v(8pt)
    #text(size: 13pt, fill: rgb("#a8c4e0"))[
      Israel Wartime Readiness Field Guide
    ]
    #v(4pt)
    #text(size: 10pt, fill: rgb("#7a9bbf"))[
      Based on Home Front Command (Pikud HaOref) guidance
    ]
  ]

  // Bottom strip
  #v(1fr)
  #block(
    width: 100%,
    inset: (x: 2cm, y: 10pt),
    fill: rgb("#f0f2f5"),
  )[
    #text(size: 8pt, fill: rgb("#666666"))[
      danielrosehill.com
      #h(1fr)
      Print · Spiral-bind · Post visibly
      #h(1fr)
      #datetime.today().display("[month repr:long] [year]")
    ]
  ]
]

// ═══════════════════════════════════════
// HELPER: section wrapper
// ═══════════════════════════════════════

#let booklet-section(name, content) = {
  pagebreak()
  let idx = tab-idx.get().first()
  let colour = tab-colours.at(calc.rem(idx, tab-colours.len()))
  tab-idx.step()
  section-label.update(name)
  section-tab-colour.update(colour)
  [#metadata(name) <booklet-section>]
  content
}

// ═══════════════════════════════════════
// INSIDE COVER — quick reference
// ═══════════════════════════════════════

#pagebreak()
#section-label.update("Quick Reference")
#section-tab-colour.update(blue-dark)
[#metadata("Quick Reference") <booklet-section>]

#v(0.3cm)
#block(
  width: 100%,
  inset: 14pt,
  fill: blue-light,
  radius: 6pt,
  stroke: 1.5pt + blue-accent,
)[
  #text(size: 12pt, weight: "bold", fill: blue-dark)[How to use this booklet]
  #v(8pt)
  #set text(size: 10pt)
  - *Two-person drill:* one person reads each call aloud, the other responds. Alternate roles.
  - *Solo:* read each call aloud, then answer it yourself.
  - *Coloured header tabs* help you find sections by colour when flipping through.
  - *Flowcharts* at the back cover the three main decision scenarios.
  - *Post individual sheets* on bathroom mirror, bedroom door, fridge, and front door.
]

#v(0.6cm)

#text(size: 12pt, weight: "bold", fill: blue-dark)[Contents]
#v(0.3cm)

#set text(size: 10pt)

#block(inset: (left: 4pt))[
  #let toc-items = (
    (icon: fa-icon("shield-halved"), name: "BRACED — Quick Readiness Check", colour: tab-colours.at(0)),
    (icon: fa-icon("sun"), name: "Daytime At-Home Posture", colour: tab-colours.at(1)),
    (icon: fa-icon("moon"), name: "Before Bed Checklist", colour: tab-colours.at(2)),
    (icon: fa-icon("bolt"), name: "Night Alarm — 30-Second Drill", colour: tab-colours.at(3)),
    (icon: fa-icon("shower"), name: "Before Showering", colour: tab-colours.at(4)),
    (icon: fa-icon("door-open"), name: "Before Leaving Home", colour: tab-colours.at(5)),
    (icon: fa-icon("rotate-left"), name: "After Shelter — Reset", colour: tab-colours.at(6)),
    (icon: fa-icon("baby"), name: "Bathing a Baby", colour: tab-colours.at(7)),
    (icon: fa-icon("star-of-david"), name: "Shabbat / Hag", colour: tab-colours.at(0)),
    (icon: fa-icon("phone"), name: "Emergency Numbers", colour: tab-colours.at(1)),
    (icon: fa-icon("newspaper"), name: "Situational Awareness — Standard", colour: tab-colours.at(2)),
    (icon: fa-icon("newspaper"), name: "Situational Awareness — Extra Vigilant", colour: tab-colours.at(3)),
    (icon: fa-icon("head-side-mask"), name: "Respiratory Protection", colour: tab-colours.at(4)),
    (icon: fa-icon("bag-shopping"), name: "Lull / Resupply", colour: tab-colours.at(5)),
    (icon: fa-icon("skull-crossbones"), name: "Terrorist Infiltration SOP", colour: tab-colours.at(6)),
    (icon: fa-icon("plane"), name: "UAV / Drone Alert SOP", colour: tab-colours.at(7)),
  )

  #for item in toc-items {
    box(
      width: 100%,
      inset: (y: 4pt),
    )[
      #box(width: 6pt, height: 6pt, fill: item.colour, radius: 1pt)
      #h(6pt)
      #text(fill: item.colour, size: 10pt)[#item.icon]
      #h(6pt)
      #text(size: 10pt)[#item.name]
    ]
  }

  #v(0.4cm)
  #line(length: 100%, stroke: 0.5pt + grey-border)
  #v(0.2cm)
  #text(weight: "bold", size: 10pt, fill: blue-dark)[Decision Flowcharts]
  #v(4pt)
  #box(width: 6pt, height: 6pt, fill: red-alert, radius: 1pt)
  #h(6pt)
  #text(size: 10pt)[Protected Space (Shelter) Selection]
  #linebreak()
  #box(width: 6pt, height: 6pt, fill: red-alert, radius: 1pt)
  #h(6pt)
  #text(size: 10pt)[Terrorist Infiltration]
  #linebreak()
  #box(width: 6pt, height: 6pt, fill: red-alert, radius: 1pt)
  #h(6pt)
  #text(size: 10pt)[UAV / Drone Alert]
]

// ═══════════════════════════════════════
// CHECKLISTS
// ═══════════════════════════════════════

#context booklet-section("BRACED — Quick Readiness", quick-readiness-content())
#context booklet-section("Daytime At-Home Posture", daytime-posture-content())
#context booklet-section("Before Bed", before-bed-content())
#context booklet-section("Night Alarm — 30s Drill", night-alarm-content())
#context booklet-section("Before Showering", before-shower-content())
#context booklet-section("Before Leaving Home", before-leaving-content())
#context booklet-section("After Shelter — Reset", after-shelter-content())
#context booklet-section("Bathing a Baby", bathing-baby-content())
#context booklet-section("Shabbat / Hag", shabbat-content())
#context booklet-section("Emergency Numbers", emergency-numbers-content())
#context booklet-section("Situational Awareness — Standard", news-standard-content())
#context booklet-section("Situational Awareness — Vigilant", news-vigilant-content())
#context booklet-section("Respiratory Protection", respiratory-content())
#context booklet-section("Lull / Resupply", lull-resupply-content())
#context booklet-section("Terrorist Infiltration SOP", terrorist-infiltration-content())
#context booklet-section("UAV / Drone Alert SOP", uav-drone-content())

// ═══════════════════════════════════════
// DECISION FLOWCHARTS
// ═══════════════════════════════════════

// --- Shelter Selection ---
#pagebreak()
#section-label.update("Flowchart: Shelter Selection")
#section-tab-colour.update(red-alert)
[#metadata("Flowchart: Shelter Selection") <booklet-section>]

#v(0.2cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: red-light,
  radius: 4pt,
  stroke: 1pt + red-alert,
)[
  #text(size: 9pt, fill: red-alert, weight: "bold")[When a Red Alert sounds, choose the highest-priority option you can reach.]
]

#v(0.3cm)

// Alert sequence
#align(center)[
  #diagram(
    spacing: (18pt, 12pt),
    node-stroke: 1.2pt + rgb("#e67e22"),
    edge-stroke: 1.5pt + rgb("#e67e22"),

    node((0, 0), align(center)[#text(fill: white, weight: "bold", size: 9pt)[PRELIMINARY WARNING] \ #text(fill: white, size: 8pt)[via HFC app — get to shelter]], fill: rgb("#e67e22"), corner-radius: 8pt, inset: 10pt, name: <s1>),
    node((1, 0), align(center)[#text(fill: white, weight: "bold", size: 9pt)[RED ALERT / SIREN] \ #text(fill: white, size: 8pt)[Shelter immediately]], fill: red-alert, corner-radius: 8pt, inset: 10pt, name: <s2>),
    node((2, 0), align(center)[#text(fill: white, weight: "bold", size: 9pt)[ALL-CLEAR] \ #text(fill: white, size: 8pt)[via app, TV/radio, or siren]], fill: green-calm, corner-radius: 8pt, inset: 10pt, name: <s3>),
    edge(<s1>, <s2>, "->"),
    edge(<s2>, <s3>, "->"),
  )
  #v(4pt)
  #text(fill: red-alert, weight: "bold", size: 9pt)[Do NOT leave shelter before the all-clear is given.]
]

#v(0.3cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: red-light,
  radius: 4pt,
  stroke: 1pt + red-alert,
)[
  *⛔ NOT valid shelter:* Kitchen · Bathroom · Toilet · Building entrance lobby · Caravans / prefab · Areas with ceramics, porcelain, or glass · Room with only exterior walls · Room directly beneath the roof
]

#v(0.1cm)
#text(size: 9pt)[*Stairwell positioning:* 3+ floors: at least 2 floors above you. 3-storey building: middle floor only.]

#v(0.3cm)

// Main decision tree
#align(center)[
  #diagram(
    spacing: (12pt, 12pt),
    node-stroke: 1.2pt + blue-mid,
    edge-stroke: 1.2pt + blue-mid,

    node((0, 0), text(fill: white, weight: "bold", size: 10pt)[RED ALERT SOUNDS], fill: red-alert, stroke: 2pt + red-alert, corner-radius: 8pt, inset: 10pt, name: <start>),

    node((0, 1), align(center)[Do you have a \ *MAMAD / MAMAK / MAMAM*?], fill: blue-light, corner-radius: 6pt, inset: 8pt, shape: fletcher.shapes.diamond, name: <q1>),
    edge(<start>, <q1>, "->"),

    node((2, 1), align(center)[*PRIORITY 1: MAMAD* \ Close blast door (handle 90°) \ Close steel + glass windows \ Sit against inner wall \ ★ WAIT FOR ALL-CLEAR], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 8pt, name: <a1>),
    edge(<q1>, <a1>, "->", label: text(fill: green-calm, weight: "bold", size: 11pt)[Y]),

    node((0, 2.1), align(center)[Can you reach a \ *SHELTER* in time?], fill: blue-light, corner-radius: 6pt, inset: 8pt, shape: fletcher.shapes.diamond, name: <q2>),
    edge(<q1>, <q2>, "->", label: text(fill: red-alert, weight: "bold", size: 11pt)[N]),

    node((2, 2.1), align(center)[*PRIORITY 2: SHELTER* \ Building or public shelter \ Enter and close the door \ ★ WAIT FOR ALL-CLEAR], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 8pt, name: <a2>),
    edge(<q2>, <a2>, "->", label: text(fill: green-calm, weight: "bold", size: 11pt)[Y]),

    node((0, 3.2), align(center)[*INNER STAIRWELL* \ (no windows)?], fill: blue-light, corner-radius: 6pt, inset: 8pt, shape: fletcher.shapes.diamond, name: <q3>),
    edge(<q2>, <q3>, "->", label: text(fill: red-alert, weight: "bold", size: 11pt)[N]),

    node((2, 3.2), align(center)[*PRIORITY 3: STAIRWELL* \ Centre floor — not top, not ground \ Stay on staircase, not hallway \ ★ WAIT FOR ALL-CLEAR], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 8pt, name: <a3>),
    edge(<q3>, <a3>, "->", label: text(fill: green-calm, weight: "bold", size: 11pt)[Y]),

    node((0, 4.3), align(center)[*INNER ROOM* \ (max walls, min windows)?], fill: blue-light, corner-radius: 6pt, inset: 8pt, shape: fletcher.shapes.diamond, name: <q4>),
    edge(<q3>, <q4>, "->", label: text(fill: red-alert, weight: "bold", size: 11pt)[N]),

    node((2, 4.3), align(center)[*PRIORITY 4: INNER ROOM* \ Inner wall, below window line \ Not facing door. Close all doors. \ ★ WAIT FOR ALL-CLEAR], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 8pt, name: <a4>),
    edge(<q4>, <a4>, "->", label: text(fill: green-calm, weight: "bold", size: 11pt)[Y]),

    node((0, 5.3), align(center)[*PRIORITY 5: LAST RESORT* \ Lie flat on the ground \ Protect head with hands \ ★ WAIT FOR ALL-CLEAR], fill: rgb("#fff3cd"), stroke: 1.5pt + rgb("#856404"), corner-radius: 6pt, inset: 8pt, name: <a5>),
    edge(<q4>, <a5>, "->", label: text(fill: red-alert, weight: "bold", size: 11pt)[N]),
  )
]

// --- Terrorist Infiltration ---
#pagebreak()
#section-label.update("Flowchart: Terrorist Infiltration")
#section-tab-colour.update(rgb("#c0392b"))
[#metadata("Flowchart: Terrorist Infiltration") <booklet-section>]

#v(0.5cm)

#align(center)[
  #diagram(
    spacing: (12pt, 14pt),
    node-stroke: 1pt + blue-mid,
    edge-stroke: 1pt + blue-mid,

    node((0, 0), text(fill: white, weight: "bold", size: 11pt)[TERRORIST INFILTRATION ALERT], fill: red-alert, stroke: 2pt + red-alert, corner-radius: 6pt, inset: 12pt, name: <start>),

    node((0, 1), align(center)[#text(size: 11pt)[Where are you?]], fill: blue-light, corner-radius: 5pt, inset: 10pt, shape: fletcher.shapes.diamond, name: <where>),
    edge(<start>, <where>, "->"),

    node((-2, 2), align(center)[#text(size: 10pt, weight: "bold")[INDOORS]], fill: blue-light, corner-radius: 5pt, inset: 10pt, name: <indoors>),
    edge(<where>, <indoors>, "->"),
    node((-2, 3), align(center)[#text(size: 10pt)[Lock door · Lights on outside \ Enter *Mamad* or inner room \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 10pt, name: <a-in>),
    edge(<indoors>, <a-in>, "->"),

    node((0, 2), align(center)[#text(size: 10pt, weight: "bold")[OUTDOORS]], fill: blue-light, corner-radius: 5pt, inset: 10pt, name: <outdoors>),
    edge(<where>, <outdoors>, "->"),
    node((0, 3), align(center)[#text(size: 10pt)[Enter nearest building \ or shop immediately \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 10pt, name: <a-out>),
    edge(<outdoors>, <a-out>, "->"),

    node((2, 2), align(center)[#text(size: 10pt, weight: "bold")[IN VEHICLE]], fill: blue-light, corner-radius: 5pt, inset: 10pt, name: <vehicle>),
    edge(<where>, <vehicle>, "->"),
    node((2, 3), align(center)[#text(size: 10pt)[Can drive? → *safe location* \ Can't? → *stop & seek shelter* \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 10pt, name: <a-veh>),
    edge(<vehicle>, <a-veh>, "->"),

    node((0, 4.5), text(fill: white, weight: "bold", size: 10pt)[⚠ Rocket alert during infiltration: STAY PUT — do NOT leave your room], fill: red-alert, stroke: 2pt + red-alert, corner-radius: 6pt, inset: 12pt, name: <critical>),
  )
]

#v(1cm)

#block(
  width: 100%,
  inset: 12pt,
  fill: red-light,
  radius: 4pt,
  stroke: 0.5pt + red-alert,
)[
  #text(size: 10pt)[
    - *Traffic in the area is prohibited* — entry banned until further notice
    - *Do NOT dismantle the Mamad door handle.* To block entry, barricade with a heavy object
    - *Do NOT share your location* on social networks or media channels
    - *Stay updated* via Home Front Command messages on official platforms
  ]
]

// --- UAV / Drone ---
#pagebreak()
#section-label.update("Flowchart: UAV / Drone Alert")
#section-tab-colour.update(rgb("#d35400"))
[#metadata("Flowchart: UAV / Drone Alert") <booklet-section>]

#v(0.3cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: rgb("#fff3cd"),
  radius: 4pt,
  stroke: 1pt + rgb("#856404"),
)[
  #text(size: 9pt, weight: "bold")[Key difference from rockets:] #text(size: 9pt)[UAV alerts use the *same siren* but require *10-minute shelter time* and an explicit all-clear. Do not self-release.]
]

#v(0.4cm)

#align(center)[
  #diagram(
    spacing: (12pt, 14pt),
    node-stroke: 1.2pt + blue-mid,
    edge-stroke: 1.2pt + blue-mid,

    node((0, 0), text(fill: white, weight: "bold", size: 11pt)[UAV / DRONE ALERT], fill: red-alert, stroke: 2pt + red-alert, corner-radius: 8pt, inset: 10pt, name: <start>),

    node((0, 1.2), align(center)[#text(size: 11pt)[Where are you?]], fill: blue-light, corner-radius: 6pt, inset: 9pt, shape: fletcher.shapes.diamond, name: <where>),
    edge(<start>, <where>, "->"),

    node((-1.5, 2.4), align(center)[#text(size: 10pt, weight: "bold")[INDOORS]], fill: blue-light, corner-radius: 6pt, inset: 9pt, name: <indoors>),
    edge(<where>, <indoors>, "->"),

    node((-1.5, 3.8), align(center)[#text(size: 10pt)[Go to *most protected* \ space (Mamad, shelter, \ stairwell, inner room) \ Stay *10 minutes* \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 9pt, name: <a-in>),
    edge(<indoors>, <a-in>, "->"),

    node((0, 2.4), align(center)[#text(size: 10pt, weight: "bold")[OUTDOORS] \ #text(size: 9pt)[(built-up)]], fill: blue-light, corner-radius: 6pt, inset: 9pt, name: <built>),
    edge(<where>, <built>, "->"),

    node((0, 3.8), align(center)[#text(size: 10pt)[Enter nearest \ *building* — go to \ protected space \ *Not the entrance hall* \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 9pt, name: <a-built>),
    edge(<built>, <a-built>, "->"),

    node((1.5, 2.4), align(center)[#text(size: 10pt, weight: "bold")[OUTDOORS] \ #text(size: 9pt)[(open area)]], fill: blue-light, corner-radius: 6pt, inset: 9pt, name: <open>),
    edge(<where>, <open>, "->"),

    node((1.5, 3.8), align(center)[#text(size: 10pt)[*Lie flat on ground* \ Protect head with hands \ ★ WAIT FOR ALL-CLEAR]], fill: rgb("#fff3cd"), stroke: 1.5pt + rgb("#856404"), corner-radius: 6pt, inset: 9pt, name: <a-open>),
    edge(<open>, <a-open>, "->"),

    node((3, 2.4), align(center)[#text(size: 10pt, weight: "bold")[IN VEHICLE]], fill: blue-light, corner-radius: 6pt, inset: 9pt, name: <vehicle>),
    edge(<where>, <vehicle>, "->"),

    node((3, 3.8), align(center)[#text(size: 10pt)[*Exit vehicle → enter* \ *nearest building* \ If no building: move \ away, lie flat \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 9pt, name: <a-veh>),
    edge(<vehicle>, <a-veh>, "->"),

    node((0.75, 5.4), text(fill: white, weight: "bold", size: 10pt)[⚠ Shelter time: 10 MIN — wait for explicit all-clear], fill: red-alert, stroke: 2pt + red-alert, corner-radius: 8pt, inset: 10pt, name: <time>),
  )
]

#v(0.8cm)

#text(size: 9pt, style: "italic")[Means of alert: HFC App · National Emergency Portal (oref.org.il) · Sirens · Media broadcasts]

// ═══════════════════════════════════════
// BACK COVER
// ═══════════════════════════════════════

#page(margin: (x: 2cm, y: 2cm), header: none, footer: none)[
  #v(1fr)
  #align(center)[
    #block(
      width: 80%,
      inset: 20pt,
      fill: blue-light,
      radius: 8pt,
      stroke: 1.5pt + blue-accent,
    )[
      #text(size: 14pt, weight: "bold", fill: blue-dark)[Stay prepared. Stay calm.]
      #v(10pt)
      #text(size: 10pt, fill: grey-text)[
        This booklet is based on Home Front Command (Pikud HaOref) guidance as of March 2026. \
        Always verify with current HFC guidance at *oref.org.il*
      ]
      #v(10pt)
      #text(size: 9pt, fill: grey-text)[
        danielrosehill.com · Open source · Print and share freely
      ]
    ]
  ]
  #v(1fr)
]
