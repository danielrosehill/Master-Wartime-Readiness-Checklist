// Checklist & Flowchart Booklet — Spiral-bound A4 portrait
// All printable checklists + decision flowcharts
// Single tab header per section. Coloured tabs for thumb-indexing.

#import "printables/preamble.typ": *
#import "@preview/fletcher:0.5.7": diagram, node, edge
#import "@preview/fletcher:0.5.7" as fletcher

// ═══════════════════════════════════════
// ACTIVATE BOOKLET MODE — suppresses printable-header in imported content
// ═══════════════════════════════════════

#booklet-mode.update(true)

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
#import "printables/16-mamad-inspection.typ": mamad-inspection-content
#import "printables/17-in-shelter.typ": in-shelter-content
#import "printables/18-pre-emergency-home.typ": pre-emergency-home-content
#import "printables/19-go-bag.typ": go-bag-content
#import "printables/20-advance-warning.typ": advance-warning-content
#import "printables/21-opsec.typ": infosec-content

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
// DOCUMENT TYPE ICONS — used throughout
// ═══════════════════════════════════════

#let doc-checklist = text(fill: blue-mid, size: 10pt)[#fa-icon("list-check")]
#let doc-sop = text(fill: red-alert, size: 10pt)[#fa-icon("clipboard-list")]
#let doc-flowchart = text(fill: green-calm, size: 10pt)[#fa-icon("diagram-project")]

// ═══════════════════════════════════════
// PAGE SETUP — single centred tab header, alternating page numbers
// Wide left margin for spiral binding punch holes
// ═══════════════════════════════════════

#let section-label = state("section-label", "")
#let section-tab-colour = state("section-tab-colour", blue-dark)

// Page number pill: white number on dark blue circle
#let page-number-pill() = context {
  let pg = counter(page).get().first()
  circle(
    radius: 10pt,
    fill: blue-dark,
    stroke: none,
  )[
    #align(center + horizon)[
      #text(size: 8pt, weight: "bold", fill: white)[#pg]
    ]
  ]
}

#set page(
  paper: "a4",
  margin: (top: 2.4cm, bottom: 1.5cm, left: 2.2cm, right: 1.5cm),
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
        inset: (x: 14pt, y: 10pt),
        fill: colour,
        radius: (bottom-left: 6pt, bottom-right: 6pt),
      )[
        #align(center)[
          #text(size: 14pt, fill: white, weight: "bold", tracking: 0.5pt)[#upper(name)]
        ]
      ]
      v(4pt)
    }
  },
  footer: context {
    let pg = counter(page).get().first()
    // Skip page number on page 1 (cover)
    if pg > 1 {
      // Odd pages: number on right (outside edge for recto)
      // Even pages: number on left (outside edge for verso)
      if calc.odd(pg) {
        align(right, page-number-pill())
      } else {
        align(left, page-number-pill())
      }
    }
  },
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
      Israel Wartime Readiness\
      Field Guide
    ]
    #v(8pt)
    #text(size: 16pt, fill: rgb("#a8c4e0"))[
      Preparedness Checklists & Flowcharts
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

// Helper: photo tile with overlay label — preserves natural aspect ratio
#let photo-tile(img-path, label, colour: blue-dark) = {
  block(
    width: 100%,
    clip: true,
    radius: 6pt,
  )[
    #image(img-path, width: 100%, fit: "contain")
    #place(bottom + left,
      block(
        width: 100%,
        inset: (x: 6pt, y: 5pt),
        fill: colour.transparentize(20%),
      )[
        #text(size: 8pt, weight: "bold", fill: white, tracking: 0.3pt)[#label]
      ]
    )
  ]
}

// ═══════════════════════════════════════
// WHY THIS EXISTS
// ═══════════════════════════════════════

#pagebreak()
#page(header: none)[
  #v(0.5cm)
  #text(size: 18pt, weight: "bold", fill: blue-dark)[Why This Exists]
  #v(0.6cm)

  #text(size: 10.5pt)[
    This booklet was created during the ongoing war between Israel and Iran. I lived through the twelve-day war in the summer of 2025 with my wife and family in Jerusalem, and I realised something: during protracted periods of stress, there is only so much you can do. Sometimes, having a systematic set of checklists — when you're tired, exhausted, and running on adrenaline — is the best way to know you're doing what you can, and to put your mind at rest.
  ]

  #v(0.4cm)
  #text(size: 10.5pt)[
    That's why this guide contains specific protocols for quick reference and decision flowcharts for high-pressure moments. It's not prescriptive — it's based on Home Front Command guidance and offered as a suggested framework. The idea is to build a kind of muscle memory so that you know the protocol as if it's second nature, long before you need it under fire.
  ]

  #v(0.4cm)
  #text(size: 10.5pt)[
    If you find it valuable, print a couple of copies. It's designed in A4 portrait for digital printing. Stick one on your _mamad_ door. But always refer to the latest advice from the authorities — official guidance changes, and this document reflects what was current when it was generated.
  ]

  #v(0.6cm)
  #line(length: 100%, stroke: 0.5pt + grey-border)
  #v(0.4cm)

  // Daniel
  #grid(
    columns: (auto, 1fr),
    gutter: 12pt,
    block()[
      #image("/images/avatars/daniel-headshot.png", width: 65pt)
    ],
    block()[
      #text(size: 11pt, weight: "bold", fill: blue-dark)[#link("https://danielrosehill.com")[Daniel Rosehill]]
      #v(4pt)
      #text(size: 9.5pt)[
        Technology communications specialist based in Jerusalem. Lives in Rehavia with his wife Hannah and two crocheted companions. This guide was written with AI assistance from Claude (Anthropic). All illustrations by Nano Banana.
      ]
    ],
  )

  #v(0.4cm)

  // Co-hosts
  #grid(
    columns: (auto, 1fr),
    gutter: 12pt,
    block()[
      #grid(
        columns: (auto, auto),
        gutter: 4pt,
        image("/images/avatars/herman/avatar.png", width: 50pt),
        image("/images/avatars/corn/avatar.png", width: 50pt),
      )
    ],
    block()[
      #text(size: 11pt, weight: "bold", fill: blue-dark)[Your Co-Hosts]
      #v(4pt)
      #text(size: 9.5pt)[
        *Herman the Donkey* — Health & Safety Expert. Steadfast, practical, always carrying the right gear.\
        *Corn the Sloth* — Wellness Expert. Calm, mindful, always reminding you to look after yourself.\
        Co-hosts of _My Weird Prompts_. Not government officials — just two friends who want to help you stay safe and sane.
      ]
    ],
  )

  #v(0.5cm)

  // Disclaimer
  #block(
    width: 100%,
    inset: 12pt,
    fill: rgb("#fff3cd"),
    radius: 6pt,
    stroke: 1pt + rgb("#856404"),
  )[
    #text(size: 9pt, weight: "bold", fill: rgb("#856404"))[#fa-icon("triangle-exclamation") Disclaimer] #h(6pt)
    #text(size: 9pt)[
      Generated *23 March 2026* based on HFC guidance current as of that date. This is not an official government publication. Always verify at #link("https://www.oref.org.il")[oref.org.il]. When in doubt, follow HFC, Israel Police, and IDF instructions.
    ]
  ]

  #v(0.3cm)
  #block(
    width: 100%,
    inset: 10pt,
    fill: blue-light,
    radius: 4pt,
    stroke: 0.5pt + blue-accent,
  )[
    #text(size: 9pt)[
      *Open source.* Print, photocopy, and share freely. Source: #link("https://github.com/danielrosehill/Israel-Wartime-Prep-Guide")[github.com/danielrosehill/Israel-Wartime-Prep-Guide]
    ]
  ]
]

// ═══════════════════════════════════════
// DOCUMENT TYPES & HOW TO USE
// ═══════════════════════════════════════

#pagebreak()
#page(header: none)[
  #v(0.3cm)
  #text(size: 18pt, weight: "bold", fill: blue-dark)[How to Use This Booklet]
  #v(0.5cm)

  #text(size: 10.5pt, weight: "bold", fill: blue-dark)[Document Types]
  #v(0.3cm)

  #text(size: 10pt)[This booklet contains three types of document, each with its own icon:]
  #v(0.3cm)

  // Checklist
  #block(
    width: 100%,
    inset: 12pt,
    fill: blue-light,
    radius: 6pt,
    stroke: 1pt + blue-accent,
  )[
    #text(size: 12pt, fill: blue-mid)[#fa-icon("list-check")] #h(6pt)
    #text(size: 11pt, weight: "bold", fill: blue-dark)[Checklist]
    #v(4pt)
    #text(size: 10pt)[A list of items to verify or actions to complete, one by one. Uses *call-and-response* format: one person reads the call, the other gives the expected response. Designed to be run repeatedly until the actions become automatic.]
  ]
  #v(0.3cm)

  // SOP
  #block(
    width: 100%,
    inset: 12pt,
    fill: red-light,
    radius: 6pt,
    stroke: 1pt + red-alert,
  )[
    #text(size: 12pt, fill: red-alert)[#fa-icon("clipboard-list")] #h(6pt)
    #text(size: 11pt, weight: "bold", fill: red-alert)[SOP — Standard Operating Procedure]
    #v(4pt)
    #text(size: 10pt)[A step-by-step protocol for a specific emergency scenario. Follow in order. SOPs tell you *what to do* when a particular situation arises — they are action sequences, not verification lists.]
  ]
  #v(0.3cm)

  // Flowchart
  #block(
    width: 100%,
    inset: 12pt,
    fill: green-light,
    radius: 6pt,
    stroke: 1pt + green-calm,
  )[
    #text(size: 12pt, fill: green-calm)[#fa-icon("diagram-project")] #h(6pt)
    #text(size: 11pt, weight: "bold", fill: green-calm)[Decision Flowchart]
    #v(4pt)
    #text(size: 10pt)[A visual decision tree for situations where the correct action depends on your circumstances. Start at the top, answer each question, follow the arrows to your action.]
  ]

  #v(0.5cm)
  #line(length: 100%, stroke: 0.5pt + grey-border)
  #v(0.4cm)

  #text(size: 10.5pt, weight: "bold", fill: blue-dark)[The Call-Response Protocol]
  #v(0.3cm)
  #text(size: 10pt)[
    Each checklist uses a *call-and-response* format — the same method used by pilots, surgeons, and military teams. One person reads the *call* (a question), the other gives the *response* (the expected answer). *Repetition builds memory.* The more you practise, the more automatic the responses become. When sirens sound and adrenaline spikes, your hands will already know what to do.
  ]

  #v(0.3cm)
  #block(
    width: 100%,
    inset: 10pt,
    fill: grey-light,
    radius: 4pt,
  )[
    #text(size: 9.5pt)[
      *Two-person drill:* One reads each call aloud, the other responds. Swap roles each time.\
      *Solo:* Read each call aloud, then answer it yourself. Say the words — don't just read silently.\
      *With children:* Make it a game. Kids respond well to routines they can "win" at.
    ]
  ]

  #v(0.4cm)
  #text(size: 10pt, fill: grey-text)[
    *Coloured header tabs* help you find sections by colour when flipping through. \
    *Review this booklet long before you need it.* Build the muscle memory in peacetime.
  ]
]

// ═══════════════════════════════════════
// PHOTO MONTAGE — single page, 4×3 grid
// ═══════════════════════════════════════

#pagebreak()
#page(margin: (x: 1cm, y: 1cm), header: none, footer: none)[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 5pt,
    photo-tile("/images/illustrations/full-guide/which-shelter.png", "Shelter Selection", colour: red-alert),
    photo-tile("/images/illustrations/full-guide/daytime-posture.png", "Daytime Posture", colour: rgb("#d35400")),
    photo-tile("/images/illustrations/full-guide/before-bed.png", "Before Bed", colour: blue-dark),
    photo-tile("/images/illustrations/full-guide/waking-up-to-alert.png", "Night Alarm", colour: red-alert),
    photo-tile("/images/illustrations/full-guide/before-shower.png", "Before Shower", colour: rgb("#8e44ad")),
    photo-tile("/images/illustrations/full-guide/before-leaving.png", "Before Leaving", colour: rgb("#0e7c47")),
    photo-tile("/images/illustrations/full-guide/leaving-shelter.png", "After Shelter", colour: rgb("#2563a0")),
    photo-tile("/images/illustrations/full-guide/resupplying.png", "Lull / Resupply", colour: rgb("#0e7c47")),
    photo-tile("/images/illustrations/full-guide/situational-awareness.png", "Sit. Awareness", colour: blue-dark),
    photo-tile("/images/illustrations/full-guide/n95-in-backpack.png", "Respiratory", colour: rgb("#d35400")),
    photo-tile("/images/illustrations/full-guide/shabbat.png", "Shabbat / Hag", colour: rgb("#8e44ad")),
    photo-tile("/images/illustrations/full-guide/bathing-children.jpeg", "Bathing a Baby", colour: rgb("#a0522d")),
  )
  #v(1fr)
  #align(center)[
    #text(size: 8pt, fill: grey-text, style: "italic")[
      Illustrations by Nano Banana, featuring Herman the Donkey and Corn the Sloth.
    ]
  ]
]

// ═══════════════════════════════════════
// CONTENTS
// ═══════════════════════════════════════

#pagebreak()
#section-label.update("Contents")
#section-tab-colour.update(blue-dark)
#metadata("Contents") <booklet-section>

// Legend
#block(
  width: 100%,
  inset: 8pt,
  fill: grey-light,
  radius: 4pt,
)[
  #text(size: 9pt)[
    #text(fill: blue-mid)[#fa-icon("list-check")] Checklist
    #h(12pt)
    #text(fill: red-alert)[#fa-icon("clipboard-list")] SOP
    #h(12pt)
    #text(fill: green-calm)[#fa-icon("diagram-project")] Flowchart
    #h(12pt)
    #text(fill: blue-mid)[#fa-icon("shield-halved")] Smoke Test
  ]
]

#v(0.3cm)

#set text(size: 10pt)

// --- PRE-EMERGENCY (PEACETIME) ---
#text(size: 11pt, weight: "bold", fill: blue-dark)[Pre-Emergency Preparation]
#v(0.15cm)
#block(inset: (left: 4pt))[
  #let pre-items = (
    (icon: fa-icon("house"), type-icon: doc-checklist, name: "Pre-Emergency Home Safety"),
    (icon: fa-icon("shield-halved"), type-icon: doc-checklist, name: "Mamad (Protected Space) Inspection"),
    (icon: fa-icon("bag-shopping"), type-icon: doc-checklist, name: "Go Bag Preparation Checklist"),
  )
  #for item in pre-items {
    box(width: 100%, inset: (y: 3pt))[
      #item.type-icon #h(4pt) #text(fill: blue-dark)[#item.icon] #h(4pt) #item.name
    ]
  }
]

#v(0.25cm)

// --- DAILY POSTURE ---
#text(size: 11pt, weight: "bold", fill: blue-dark)[Daily Posture & Routines]
#v(0.15cm)
#block(inset: (left: 4pt))[
  #let daily-items = (
    (icon: fa-icon("shield-halved"), type-icon: text(fill: blue-mid)[#fa-icon("shield-halved")], name: "Smoke Test — Are You Braced?"),
    (icon: fa-icon("sun"), type-icon: doc-checklist, name: "Daytime At-Home Posture"),
    (icon: fa-icon("moon"), type-icon: doc-checklist, name: "Before Bed"),
    (icon: fa-icon("shower"), type-icon: doc-checklist, name: "Before Showering"),
    (icon: fa-icon("door-open"), type-icon: doc-checklist, name: "Before Leaving Home"),
    (icon: fa-icon("star-of-david"), type-icon: doc-checklist, name: "Shabbat / Hag"),
    (icon: fa-icon("baby"), type-icon: doc-checklist, name: "Bathing a Baby"),
    (icon: fa-icon("newspaper"), type-icon: doc-checklist, name: "Situational Awareness — Standard & Vigilant"),
    (icon: fa-icon("laptop"), type-icon: doc-sop, name: "INFOSEC & Information Discipline"),
  )
  #for item in daily-items {
    box(width: 100%, inset: (y: 3pt))[
      #item.type-icon #h(4pt) #text(fill: blue-dark)[#item.icon] #h(4pt) #item.name
    ]
  }
]

#v(0.25cm)

// --- ACTIVE EMERGENCY ---
#text(size: 11pt, weight: "bold", fill: red-alert)[Active Emergency]
#v(0.15cm)
#block(inset: (left: 4pt))[
  #let active-items = (
    (icon: fa-icon("tower-broadcast"), type-icon: doc-sop, name: "The Alert Cadence"),
    (icon: fa-icon("diagram-project"), type-icon: doc-flowchart, name: "Shelter Selection — Decision Flowchart"),
    (icon: fa-icon("circle-question"), type-icon: doc-sop, name: "Shelter FAQ"),
    (icon: fa-icon("bolt"), type-icon: doc-checklist, name: "Night Alarm — From Drowsy to Go"),
    (icon: fa-icon("shield-halved"), type-icon: doc-sop, name: "In Shelter — Behaviour"),
    (icon: fa-icon("rotate-left"), type-icon: doc-checklist, name: "After Shelter — Reset"),
    (icon: fa-icon("head-side-mask"), type-icon: doc-checklist, name: "Respiratory Protection"),
    (icon: fa-icon("bag-shopping"), type-icon: doc-checklist, name: "Lull / Resupply"),
    (icon: fa-icon("phone"), type-icon: doc-checklist, name: "Emergency Numbers"),
  )
  #for item in active-items {
    box(width: 100%, inset: (y: 3pt))[
      #item.type-icon #h(4pt) #text(fill: red-alert)[#item.icon] #h(4pt) #item.name
    ]
  }
]

#v(0.25cm)

// --- SPECIAL SCENARIOS ---
#text(size: 11pt, weight: "bold", fill: rgb("#856404"))[Special Scenarios]
#v(0.15cm)
#block(inset: (left: 4pt))[
  #let special-items = (
    (icon: fa-icon("skull-crossbones"), type-icon: doc-flowchart, name: "Terrorist Infiltration — SOP & Flowchart"),
    (icon: fa-icon("plane"), type-icon: doc-flowchart, name: "UAV / Drone Alert — SOP & Flowchart"),
  )
  #for item in special-items {
    box(width: 100%, inset: (y: 3pt))[
      #item.type-icon #h(4pt) #text(fill: rgb("#856404"))[#item.icon] #h(4pt) #item.name
    ]
  }
]

#v(0.25cm)
#line(length: 100%, stroke: 0.5pt + grey-border)
#v(0.1cm)
#text(size: 9pt, fill: grey-text)[Hebrew Glossary at the back.]

// ═══════════════════════════════════════════════════════
//
//  PART 1 — PRE-EMERGENCY PREPARATION (PEACETIME)
//
// ═══════════════════════════════════════════════════════

#context booklet-section("Pre-Emergency Home Safety", pre-emergency-home-content())
#context booklet-section("Mamad Inspection", mamad-inspection-content())
#context booklet-section("Go Bag Preparation", go-bag-content())

// ═══════════════════════════════════════════════════════
//
//  PART 2 — DAILY POSTURE & ROUTINES
//
// ═══════════════════════════════════════════════════════

#context booklet-section("Smoke Test — Are You Braced?", quick-readiness-content())
#context booklet-section("Daytime At-Home Posture", daytime-posture-content())
#context booklet-section("Before Bed", before-bed-content())
#context booklet-section("Before Showering", before-shower-content())
#context booklet-section("Before Leaving Home", before-leaving-content())
#context booklet-section("Shabbat / Hag", shabbat-content())
#context booklet-section("Bathing a Baby", bathing-baby-content())
#context booklet-section("Situational Awareness — Standard", news-standard-content())
#context booklet-section("Situational Awareness — Vigilant", news-vigilant-content())
#context booklet-section("INFOSEC & Info Discipline", infosec-content())

// ═══════════════════════════════════════════════════════
//
//  PART 3 — ACTIVE EMERGENCY
//
// ═══════════════════════════════════════════════════════

// --- PAGE 1: The Alert Cadence ---
#pagebreak()
#section-label.update("The Alert Cadence")
#section-tab-colour.update(red-alert)
#metadata("The Alert Cadence") <booklet-section>

#v(0.3cm)
#text(size: 10pt)[There are three phases to every alert event. Understanding them is essential.]
#v(0.4cm)

// 1. Preliminary Warning
#block(
  width: 100%,
  inset: 14pt,
  fill: rgb("#fff3cd"),
  radius: 6pt,
  stroke: 1.5pt + rgb("#e67e22"),
)[
  #text(size: 14pt, weight: "bold", fill: rgb("#e67e22"))[1 #h(6pt) Preliminary Warning (_Hatra'a Makdima_)]
  #v(6pt)
  #text(size: 10pt)[
    An advance notification sent via the HFC app before the siren, typically for distant threats (e.g. Yemen, Iraq). Intended to give you time to prepare.
  ]
  #v(6pt)
  #block(inset: 8pt, fill: rgb("#fff8e1"), radius: 4pt)[
    #text(size: 9pt, weight: "bold", fill: rgb("#856404"))[#fa-icon("triangle-exclamation") Important:] #text(size: 9pt)[This warning is *not guaranteed* and from experience can come as little as *30 seconds* before the siren. If you rely on a public shelter, it is prudent to get there immediately — do not count on having minutes.]
  ]
  #v(4pt)
  #text(size: 9.5pt)[*Action:* Shoes on. Phone located. Know where you're going. If using a public shelter, *go now*.]
]

#v(0.15cm)
#align(center)[#text(size: 16pt, fill: rgb("#e67e22"))[#fa-icon("arrow-down")]]
#v(0.15cm)

// 2. Red Alert
#block(
  width: 100%,
  inset: 14pt,
  fill: red-light,
  radius: 6pt,
  stroke: 1.5pt + red-alert,
)[
  #text(size: 14pt, weight: "bold", fill: red-alert)[2 #h(6pt) Red Alert / Siren (_Azakat Tzeva Adom_)]
  #v(6pt)
  #text(size: 10pt)[
    The siren means *shelter now*. Enter your protected space immediately and close the door. Do not stop to collect belongings. Do not check your phone until you are inside.
  ]
  #v(4pt)
  #text(size: 9.5pt)[*Action:* Enter shelter. Close door. Sit against inner wall, below window line. *Wait for all-clear.*]
]

#v(0.15cm)
#align(center)[#text(size: 16pt, fill: red-alert)[#fa-icon("arrow-down")]]
#v(0.15cm)

// 3. All-Clear
#block(
  width: 100%,
  inset: 14pt,
  fill: green-light,
  radius: 6pt,
  stroke: 1.5pt + green-calm,
)[
  #text(size: 14pt, weight: "bold", fill: green-calm)[3 #h(6pt) All-Clear (_HaEru'a Hastayem_)]
  #v(6pt)
  #text(size: 10pt)[
    A message — typically in Hebrew, often written as "האירוע הסתיים" ("the event has ended") — delivered via the HFC app, official media, or a steady all-clear siren tone.
  ]
  #v(4pt)
  #text(size: 9.5pt)[*Rule:* Stay for *10 minutes OR until the all-clear* — whichever comes *later*. During active wartime the IDF may override this with specific instructions. Always follow the latest guidance.]
  #v(4pt)
  #text(size: 9pt, weight: "bold", fill: red-alert)[Do NOT leave shelter before the all-clear is given. Many casualties occur because people leave prematurely.]
]

// --- PAGE 2: Shelter Selection Flowchart ---
#pagebreak()
#section-label.update("Flowchart: Shelter Selection")
#section-tab-colour.update(red-alert)
#metadata("Flowchart: Shelter Selection") <booklet-section>

#v(0.1cm)

// Helper: priority box with dark title pill + light note body
#let priority-node(title, notes) = align(center)[
  #box(fill: green-calm, inset: (x: 6pt, y: 3pt), radius: 3pt)[#text(size: 8pt, weight: "bold", fill: white)[#title]]
  #v(2pt)
  #text(size: 7.5pt)[#notes]
]

// Main decision tree — compact to fit A4
#align(center)[
  #diagram(
    spacing: (10pt, 7pt),
    node-stroke: 1pt + blue-mid,
    edge-stroke: 1pt + blue-mid,

    node((0, 0), text(fill: white, weight: "bold", size: 9pt)[RED ALERT], fill: red-alert, stroke: 1.5pt + red-alert, corner-radius: 6pt, inset: 7pt, name: <start>),

    node((0, 1), align(center)[#text(size: 8pt)[Do you have a] \ #text(size: 8pt, weight: "bold")[MAMAD / MAMAK / MAMAM?]], fill: blue-light, corner-radius: 5pt, inset: 6pt, shape: fletcher.shapes.diamond, name: <q1>),
    edge(<start>, <q1>, "->"),

    node((2, 1), priority-node[PRIORITY 1: MAMAD][Close blast door (handle 90°) \ Close steel + glass windows \ Sit against inner wall], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 6pt, name: <a1>),
    edge(<q1>, <a1>, "->", label: text(fill: green-calm, weight: "bold", size: 9pt)[Y]),

    node((0, 2), align(center)[#text(size: 8pt)[Can you reach a] \ #text(size: 8pt, weight: "bold")[PUBLIC SHELTER] #text(size: 8pt)[in time?]], fill: blue-light, corner-radius: 5pt, inset: 6pt, shape: fletcher.shapes.diamond, name: <q2>),
    edge(<q1>, <q2>, "->", label: text(fill: red-alert, weight: "bold", size: 9pt)[N]),

    node((2, 2), priority-node[PRIORITY 2: PUBLIC SHELTER][Enter and close the door \ Stay inside until all-clear], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 6pt, name: <a2>),
    edge(<q2>, <a2>, "->", label: text(fill: green-calm, weight: "bold", size: 9pt)[Y]),

    node((0, 3), align(center)[#text(size: 8pt, weight: "bold")[BUILDING STAIRWELL] \ #text(size: 8pt)[(no windows)?]], fill: blue-light, corner-radius: 5pt, inset: 6pt, shape: fletcher.shapes.diamond, name: <q3>),
    edge(<q2>, <q3>, "->", label: text(fill: red-alert, weight: "bold", size: 9pt)[N]),

    node((2, 3), priority-node[PRIORITY 3: BUILDING STAIRWELL][≥2 floors above ground level \ 3-storey bldg: middle floor only \ Stay on staircase, not hallway], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 6pt, name: <a3>),
    edge(<q3>, <a3>, "->", label: text(fill: green-calm, weight: "bold", size: 9pt)[Y]),

    node((0, 4), align(center)[#text(size: 8pt, weight: "bold")[INNER ROOM] \ #text(size: 8pt)[(max walls, min windows)?]], fill: blue-light, corner-radius: 5pt, inset: 6pt, shape: fletcher.shapes.diamond, name: <q4>),
    edge(<q3>, <q4>, "->", label: text(fill: red-alert, weight: "bold", size: 9pt)[N]),

    node((2, 4), priority-node[PRIORITY 4: INNER ROOM][Inner wall, below window line \ Not facing door. Close all doors.], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 6pt, name: <a4>),
    edge(<q4>, <a4>, "->", label: text(fill: green-calm, weight: "bold", size: 9pt)[Y]),

    node((0, 5), align(center)[#box(fill: rgb("#856404"), inset: (x: 6pt, y: 3pt), radius: 3pt)[#text(size: 8pt, weight: "bold", fill: white)[PRIORITY 5: LAST RESORT]] \ #v(2pt) #text(size: 7.5pt)[Lie flat on ground \ Protect head with hands]], fill: rgb("#fff3cd"), stroke: 1pt + rgb("#856404"), corner-radius: 5pt, inset: 6pt, name: <a5>),
    edge(<q4>, <a5>, "->", label: text(fill: red-alert, weight: "bold", size: 9pt)[N]),

    // Terminal node — all priorities lead here
    node((1, 6), text(fill: white, weight: "bold", size: 9pt)[SHELTER AND WAIT FOR ALL-CLEAR], fill: blue-dark, stroke: 1.5pt + blue-dark, corner-radius: 6pt, inset: 8pt, name: <wait>),
    edge(<a1>, <wait>, "->", stroke: 1pt + blue-mid),
    edge(<a2>, <wait>, "->", stroke: 1pt + blue-mid),
    edge(<a3>, <wait>, "->", stroke: 1pt + blue-mid),
    edge(<a4>, <wait>, "->", stroke: 1pt + blue-mid),
    edge(<a5>, <wait>, "->", stroke: 1pt + blue-mid),
  )
]

#v(0.2cm)

#block(
  width: 100%,
  inset: 8pt,
  fill: red-light,
  radius: 4pt,
  stroke: 1pt + red-alert,
)[
  #text(size: 8pt)[*⛔ NOT valid shelter:* Kitchen · Bathroom · Toilet · Entrance lobby · Caravans/prefab · Areas with ceramics/glass · Room with only exterior walls · Room directly beneath the roof]
]

// --- PAGE 3: Shelter FAQ ---
#pagebreak()
#section-label.update("Shelter — FAQ")
#section-tab-colour.update(red-alert)
#metadata("Shelter — FAQ") <booklet-section>

#v(0.2cm)

#let faq(q, a) = {
  block(
    width: 100%,
    inset: 10pt,
    below: 8pt,
    fill: grey-light,
    radius: 4pt,
  )[
    #text(size: 10pt, weight: "bold", fill: blue-dark)[#q]
    #v(4pt)
    #text(size: 9.5pt)[#a]
  ]
}

#faq([What if the alert sounds while I'm outside?], [Enter the nearest solid building immediately. Go to the most protected space — not the entrance hall. If no building is reachable, lie flat on the ground and protect your head with both hands.])

#faq([What if I'm on a bus?], [The driver is *legally obliged* to stop at the roadside and open the doors. Crouch below the window line and protect your head. On inter-city buses, passengers may exit to reach a nearby shelter if time permits.])

#faq([What if I'm driving?], [Pull over to the side of the road. Exit the vehicle and move away from it. Lie on the ground and protect your head. Wait 10 minutes before returning to the vehicle.])

#faq([What if I'm on a train?], [The driver slows to 30 km/h. Stay in the carriage, crouch below the window line, and protect your head.])

#faq([How long do I stay in shelter?], [10 minutes OR until the all-clear — whichever comes *later*. During active wartime the IDF may issue specific instructions that override this. Never leave based on quiet alone.])

#faq([What if I have no signal or internet in shelter?], [Stay in shelter. The default with no information is to *remain in place*. Do not assume it's over because it's quiet. If you have a radio, tune to a national station. When in doubt, stay longer.])

#faq([Can I shelter in a stairwell?], [Yes, if it is an *internal* stairwell with no windows. Position yourself at least 2 floors above ground level. In a 3-storey building, use the middle floor only. Never shelter on the top floor or ground floor of a stairwell.])

// --- Remaining active emergency checklists ---
#context booklet-section("Night Alarm — From Drowsy to Go", night-alarm-content())
#context booklet-section("In Shelter — Behaviour", in-shelter-content())
#context booklet-section("After Shelter — Reset", after-shelter-content())
#context booklet-section("Respiratory Protection", respiratory-content())
#context booklet-section("Lull / Resupply", lull-resupply-content())
#context booklet-section("Emergency Numbers", emergency-numbers-content())

// ═══════════════════════════════════════════════════════
//
//  PART 4 — SPECIAL SCENARIOS (at the very end)
//
// ═══════════════════════════════════════════════════════

// --- Terrorist Infiltration ---
#pagebreak()
#section-label.update("Flowchart: Terrorist Infiltration")
#section-tab-colour.update(rgb("#c0392b"))
#metadata("Flowchart: Terrorist Infiltration") <booklet-section>

#v(0.5cm)

#align(center)[
  #diagram(
    spacing: (10pt, 10pt),
    node-stroke: 1pt + blue-mid,
    edge-stroke: 1pt + blue-mid,

    node((0, 0), text(fill: white, weight: "bold", size: 9pt)[TERRORIST INFILTRATION ALERT], fill: red-alert, stroke: 1.5pt + red-alert, corner-radius: 5pt, inset: 8pt, name: <start>),

    node((0, 1), align(center)[#text(size: 9pt)[Where are you?]], fill: blue-light, corner-radius: 5pt, inset: 8pt, shape: fletcher.shapes.diamond, name: <where>),
    edge(<start>, <where>, "->"),

    node((-2, 2), align(center)[#text(size: 9pt, weight: "bold")[INDOORS]], fill: blue-light, corner-radius: 5pt, inset: 8pt, name: <indoors>),
    edge(<where>, <indoors>, "->"),
    node((-2, 3), align(center)[#text(size: 8pt)[Lock door · Lights on outside \ Enter *Mamad* or inner room \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 8pt, name: <a-in>),
    edge(<indoors>, <a-in>, "->"),

    node((0, 2), align(center)[#text(size: 9pt, weight: "bold")[OUTDOORS]], fill: blue-light, corner-radius: 5pt, inset: 8pt, name: <outdoors>),
    edge(<where>, <outdoors>, "->"),
    node((0, 3), align(center)[#text(size: 8pt)[Enter nearest building \ or shop immediately \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 8pt, name: <a-out>),
    edge(<outdoors>, <a-out>, "->"),

    node((2, 2), align(center)[#text(size: 9pt, weight: "bold")[IN VEHICLE]], fill: blue-light, corner-radius: 5pt, inset: 8pt, name: <vehicle>),
    edge(<where>, <vehicle>, "->"),
    node((2, 3), align(center)[#text(size: 8pt)[Can drive? → *safe location* \ Can't? → *stop & seek shelter* \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 8pt, name: <a-veh>),
    edge(<vehicle>, <a-veh>, "->"),

    node((0, 4.2), text(fill: white, weight: "bold", size: 8pt)[⚠ Rocket alert during infiltration: STAY PUT — do NOT leave your room], fill: red-alert, stroke: 1.5pt + red-alert, corner-radius: 5pt, inset: 8pt, name: <critical>),
  )
]

#v(0.5cm)

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

// Terrorist infiltration SOP checklist
#context booklet-section("Terrorist Infiltration SOP", terrorist-infiltration-content())

// --- UAV / Drone ---
#pagebreak()
#section-label.update("Flowchart: UAV / Drone Alert")
#section-tab-colour.update(rgb("#d35400"))
#metadata("Flowchart: UAV / Drone Alert") <booklet-section>

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
    spacing: (10pt, 10pt),
    node-stroke: 1pt + blue-mid,
    edge-stroke: 1pt + blue-mid,

    node((0, 0), text(fill: white, weight: "bold", size: 9pt)[UAV / DRONE ALERT], fill: red-alert, stroke: 1.5pt + red-alert, corner-radius: 6pt, inset: 8pt, name: <start>),

    node((0, 1), align(center)[#text(size: 9pt)[Where are you?]], fill: blue-light, corner-radius: 5pt, inset: 7pt, shape: fletcher.shapes.diamond, name: <where>),
    edge(<start>, <where>, "->"),

    node((-1.5, 2), align(center)[#text(size: 8pt, weight: "bold")[INDOORS]], fill: blue-light, corner-radius: 5pt, inset: 7pt, name: <indoors>),
    edge(<where>, <indoors>, "->"),

    node((-1.5, 3.2), align(center)[#text(size: 7.5pt)[Go to *most protected* \ space (Mamad, shelter, \ stairwell, inner room) \ Stay *10 minutes* \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 7pt, name: <a-in>),
    edge(<indoors>, <a-in>, "->"),

    node((0, 2), align(center)[#text(size: 8pt, weight: "bold")[OUTDOORS] \ #text(size: 7.5pt)[(built-up)]], fill: blue-light, corner-radius: 5pt, inset: 7pt, name: <built>),
    edge(<where>, <built>, "->"),

    node((0, 3.2), align(center)[#text(size: 7.5pt)[Enter nearest \ *building* — go to \ protected space \ *Not the entrance hall* \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 7pt, name: <a-built>),
    edge(<built>, <a-built>, "->"),

    node((1.5, 2), align(center)[#text(size: 8pt, weight: "bold")[OUTDOORS] \ #text(size: 7.5pt)[(open area)]], fill: blue-light, corner-radius: 5pt, inset: 7pt, name: <open>),
    edge(<where>, <open>, "->"),

    node((1.5, 3.2), align(center)[#text(size: 7.5pt)[*Lie flat on ground* \ Protect head with hands \ ★ WAIT FOR ALL-CLEAR]], fill: rgb("#fff3cd"), stroke: 1pt + rgb("#856404"), corner-radius: 5pt, inset: 7pt, name: <a-open>),
    edge(<open>, <a-open>, "->"),

    node((3, 2), align(center)[#text(size: 8pt, weight: "bold")[IN VEHICLE]], fill: blue-light, corner-radius: 5pt, inset: 7pt, name: <vehicle>),
    edge(<where>, <vehicle>, "->"),

    node((3, 3.2), align(center)[#text(size: 7.5pt)[*Exit vehicle → enter* \ *nearest building* \ If no building: move \ away, lie flat \ ★ WAIT FOR ALL-CLEAR]], fill: green-light, stroke: 1pt + green-calm, corner-radius: 5pt, inset: 7pt, name: <a-veh>),
    edge(<vehicle>, <a-veh>, "->"),

    node((0.75, 4.5), text(fill: white, weight: "bold", size: 8pt)[⚠ Shelter time: 10 MIN — wait for explicit all-clear], fill: red-alert, stroke: 1.5pt + red-alert, corner-radius: 6pt, inset: 8pt, name: <time>),
  )
]

#v(0.6cm)

#text(size: 9pt, style: "italic")[Means of alert: HFC App · National Emergency Portal (oref.org.il) · Sirens · Media broadcasts]

// UAV SOP checklist
#context booklet-section("UAV / Drone Alert SOP", uav-drone-content())

// ═══════════════════════════════════════════════════════
//
//  GLOSSARY
//
// ═══════════════════════════════════════════════════════

#pagebreak()
#section-label.update("Hebrew Glossary")
#section-tab-colour.update(blue-dark)
#metadata("Hebrew Glossary") <booklet-section>

#v(0.2cm)

#text(size: 9pt, style: "italic")[Key Hebrew terms you will hear in alerts, news broadcasts, and official communications.]

#v(0.3cm)

#table(
  columns: (1.2fr, 2.8fr),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (left, left),
  text(fill: white, weight: "bold", size: 9pt)[Term], text(fill: white, weight: "bold", size: 9pt)[Meaning],

  [*Azaka*], [Alert / warning (general term for any HFC alert)],
  [*Azakat Tzeva Adom*], [Red Alert — rocket / missile warning],
  [*Mamad*], [Residential protected space (_Merchav Mugan Dirati_) — the reinforced room in your apartment],
  [*Mamak*], [Floor-level protected space (_Merchav Mugan Komati_) — shared between apartments on a floor],
  [*Mamam*], [Building-level protected space (_Merchav Mugan Mossadi_) — communal shelter in a building],
  [*Miklat*], [Public bomb shelter — usually underground, shared by the neighbourhood],
  [*Pikud HaOref*], [Home Front Command (HFC) — the IDF branch responsible for civilian protection],
  [*Hatra'a Makdima*], [Preliminary / advance warning — HFC app notification before a siren],
  [*Kol Shaon*], [All-clear siren — a steady tone (distinct from the wailing alert siren)],
  [*Delet Plada*], [Blast door — the heavy steel mamad door],
  [*Chalon Plada*], [Steel outer window of the mamad],
  [*Hathanat Agaf*], [Handle rotation — turning the mamad door handle 90° upward to seal],
  [*Magen David Adom*], [MDA — Israel's national emergency medical service (101)],
  [*Tzir*], [Axis / corridor — used in news for military fronts (e.g. _tzir tzafon_ = northern front)],
  [*Arutz*], [Channel (TV/radio) — e.g. _Arutz 14_ = Channel 14],
  [*HaGal HaShaket*], [The Quiet Wave — emergency broadcast channel activated during wartime for official instructions],
  [*Galei Tzahal*], [IDF Radio (Galatz) — military news source (FM 102.3 / AM 657)],
  [*Kol Yisrael*], [Voice of Israel / Kan Reshet Bet — public radio (FM 95.5 / AM 711)],
)

// ═══════════════════════════════════════
// GENERAL DOS AND DON'TS
// ═══════════════════════════════════════

#pagebreak()
#section-label.update("General Dos and Don'ts")
#section-tab-colour.update(red-alert)
#metadata("General Dos and Don'ts") <booklet-section>

#v(0.3cm)

#let dont-item(title, body) = {
  block(
    width: 100%,
    inset: 12pt,
    below: 10pt,
    fill: red-light,
    radius: 5pt,
    stroke: 1pt + red-alert,
  )[
    #text(size: 10pt, weight: "bold", fill: red-alert)[⛔ #title]
    #v(4pt)
    #text(size: 9.5pt)[#body]
  ]
}

#text(size: 12pt, weight: "bold", fill: red-alert)[Things Not To Do]
#v(0.3cm)

#dont-item([Don't run without looking on the way to shelter])[Many injuries happen *on the way to shelter*, not from the threat itself. Move quickly but watch your step — stairs, doorways, and corridors are where people trip, collide, and fall. Speed matters, but arriving injured helps no one.]

#dont-item([Don't leave shelter because someone else did])[Public shelters often see a *cascade effect*: one person decides they heard the boom so the threat must be over, and others follow suit. Do not do this. Wait for the official all-clear. The person who left may be wrong — and you leaving encourages others to leave too.]

#dont-item([Don't rely on public shelters without preparation])[At the outbreak of conflict, public shelters may be hard to find or closed. If you're new to a neighbourhood and will be relying on them, *familiarise yourself with the nearest 3 public shelters* and how to get to them *before you need them*. Consider taking photos and videos of routes for reference. Know which ones are locked, which are always open, and who holds the keys.]

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
        Based on Home Front Command (Pikud HaOref) guidance as of March 2026. \
        Always verify with current HFC guidance at *oref.org.il*
      ]
      #v(10pt)
      #text(size: 9pt, fill: grey-text)[
        Open source · Print and share freely
      ]
    ]
  ]
  #v(1fr)
]
