// Israel Wartime Readiness Field Guide — Typst Source
// V4: Expanded edition — Ch6 Shabbat, quick ref cards, new appendices (G/H/I)

#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#import "@preview/fontawesome:0.5.0": *

// ──────────────────────────────────────────────
// COLOUR PALETTE
// ──────────────────────────────────────────────
#let blue-dark   = rgb("#1a3a5c")
#let blue-mid    = rgb("#2563a0")
#let blue-light  = rgb("#e8f0fe")
#let blue-accent = rgb("#0066cc")
#let red-alert   = rgb("#c0392b")
#let red-light   = rgb("#fde8e8")
#let green-calm  = rgb("#27774e")
#let green-light = rgb("#e8f5e9")
#let grey-text   = rgb("#444444")
#let grey-light  = rgb("#f5f5f5")
#let grey-border = rgb("#cccccc")
#let white       = rgb("#ffffff")
#let orange-warm = rgb("#e67e22")

// ──────────────────────────────────────────────
// IMAGES
// ──────────────────────────────────────────────
#let img-dir = "../images/"
#let asset-dir = "../assets/generated/"
#let herman-avatar = img-dir + "avatars/herman/avatar.png"
#let herman-cartoon = asset-dir + "herman-test.png"
#let corn-avatar = img-dir + "avatars/corn/avatar.png"
#let beyahad = img-dir + "other/beyahad.png"

// ──────────────────────────────────────────────
// SECTION TRACKING (name + colour for header pill)
// ──────────────────────────────────────────────
#let current-section = state("current-section", "")
#let current-section-colour = state("current-section-colour", blue-mid)
#let set-section(name, colour: blue-mid) = {
  current-section.update(name)
  current-section-colour.update(colour)
}

// Section colour palette (alternates by section for thumb-indexing)
#let sec-col-ch1 = rgb("#2563a0")  // Blue — How To Use
#let sec-col-ch2 = rgb("#0e7c47")  // Green — PAWS BED
#let sec-col-ch3 = rgb("#c0392b")  // Red — Master Checklist
#let sec-col-ch4 = rgb("#d35400")  // Orange — Situational
#let sec-col-ch5 = rgb("#2980b9")  // Light Blue — Guidance
#let sec-col-ch6 = rgb("#8e44ad")  // Purple — Shabbat/Hag
#let sec-col-app = rgb("#7b4ea3")  // Plum — Appendices

// ──────────────────────────────────────────────
// PAGE SETUP
// ──────────────────────────────────────────────
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.8cm, left: 2cm, right: 2cm),
  header: context {
    if counter(page).get().first() > 2 {
      let sec-colour = current-section-colour.get()
      let sec-name = current-section.get()
      grid(
        columns: (auto, 1fr, auto),
        column-gutter: 8pt,
        align(left + horizon,
          block(
            fill: sec-colour,
            radius: 10pt,
            inset: (x: 10pt, y: 4pt),
            text(size: 8pt, fill: white, weight: "bold")[#sec-name]
          )
        ),
        [],
        align(right + horizon,
          block(
            fill: sec-colour,
            radius: 10pt,
            inset: (x: 8pt, y: 4pt),
            text(size: 8pt, fill: white, weight: "bold")[#counter(page).display()]
          )
        ),
      )
      v(2pt)
      line(length: 100%, stroke: 1pt + sec-colour)
    }
  },
  footer: context {
    if counter(page).get().first() > 2 {
      line(length: 100%, stroke: 0.5pt + grey-border)
      v(3pt)
      grid(
        columns: (1fr, auto, 1fr),
        column-gutter: 8pt,
        align(left, text(size: 7pt, fill: grey-text)[
          Israel Wartime Readiness Field Guide · V4 · 20 March 2026 \
          Daniel Rosehill + Claude Opus
        ]),
        align(center + horizon, image(beyahad, height: 0.8cm)),
        align(right + horizon,
          text(size: 9pt, fill: grey-text, weight: "bold")[#counter(page).display()]
        ),
      )
    }
  },
)

// ──────────────────────────────────────────────
// TYPOGRAPHY
// ──────────────────────────────────────────────
#set text(
  font: "Atkinson Hyperlegible",
  size: 10pt,
  fill: grey-text,
)

#set par(
  leading: 0.7em,
  justify: true,
)

#set heading(numbering: none)

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(0.3cm)
  block(
    width: 100%,
    inset: (x: 14pt, y: 12pt),
    fill: blue-dark,
    radius: 4pt,
    text(size: 16pt, weight: "bold", fill: white)[#it.body]
  )
  v(0.3cm)
}

#show heading.where(level: 2): it => {
  v(0.4cm)
  block(
    width: 100%,
    below: 8pt,
    {
      text(size: 13pt, weight: "bold", fill: blue-mid)[#it.body]
      v(-2pt)
      line(length: 100%, stroke: 2pt + blue-accent)
    }
  )
}

#show heading.where(level: 3): it => {
  v(0.3cm)
  text(size: 11pt, weight: "bold", fill: blue-dark)[#it.body]
  v(0.1cm)
}

// ──────────────────────────────────────────────
// ICON HELPERS
// ──────────────────────────────────────────────
#let icon(name, colour: blue-mid) = text(fill: colour, size: 11pt, fa-icon(name))
#let icon-phone = icon("mobile-screen")
#let icon-sun = icon("sun", colour: orange-warm)
#let icon-moon = icon("moon", colour: blue-dark)
#let icon-water = icon("droplet", colour: blue-accent)
#let icon-bag = icon("bag-shopping")
#let icon-house = icon("house")
#let icon-bolt = icon("bolt", colour: orange-warm)
#let icon-medkit = icon("kit-medical", colour: red-alert)
#let icon-shirt = icon("shirt")
#let icon-shoe = icon("shoe-prints")
#let icon-key = icon("key", colour: orange-warm)
#let icon-baby = icon("baby", colour: green-calm)
#let icon-people = icon("people-group")
#let icon-radio = icon("radio")
#let icon-shield = icon("shield-halved", colour: green-calm)
#let icon-door = icon("door-open")
#let icon-eye = icon("eye")
#let icon-alert = icon("tower-broadcast", colour: red-alert)
#let icon-fire = icon("fire-extinguisher", colour: red-alert)
#let icon-laptop = icon("laptop")
#let icon-backpack = icon("briefcase")
#let icon-food = icon("utensils")
#let icon-car = icon("car")
#let icon-clock = icon("clock")

// ──────────────────────────────────────────────
// COMPONENT FUNCTIONS
// ──────────────────────────────────────────────

// Styled checkbox
#let checkbox = box(
  width: 11pt, height: 11pt,
  stroke: 1.5pt + blue-mid,
  radius: 2pt,
  inset: 0pt,
)

// Critical marker
#let critical = text(fill: red-alert, weight: "bold", size: 12pt)[ ⚠]

// Checklist item: response bolded, description on new line in italics
// Usage: #ci[RESPONSE] or #ci(d: "description")[RESPONSE]
#let ci(d: none, response) = {
  checkbox
  h(4pt)
  text(weight: "bold")[#response]
  if d != none {
    linebreak()
    h(18pt)
    text(style: "italic", size: 9pt)[#d]
  }
}

// Callout box — tip (Herman)
#let tip-box(avatar: herman-cartoon, body) = {
  block(
    width: 100%,
    inset: 12pt,
    fill: blue-light,
    radius: 6pt,
    stroke: 1pt + blue-accent,
    grid(
      columns: (auto, 1fr),
      column-gutter: 12pt,
      align(top, image(avatar, width: 1.8cm)),
      align(horizon, body),
    )
  )
}

// Callout box — warning
#let warning-box(body) = {
  block(
    width: 100%,
    inset: 12pt,
    fill: red-light,
    radius: 6pt,
    stroke: 1.5pt + red-alert,
    grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align(top, text(size: 22pt)[⚠️]),
      align(horizon, body),
    )
  )
}

// Callout box — wellness/calm (Corn)
#let calm-box(body) = {
  block(
    width: 100%,
    inset: 12pt,
    fill: green-light,
    radius: 6pt,
    stroke: 1pt + green-calm,
    grid(
      columns: (auto, 1fr),
      column-gutter: 12pt,
      align(top, image(corn-avatar, width: 1.8cm)),
      align(horizon, body),
    )
  )
}

// ══════════════════════════════════════════════
// COVER PAGE
// ══════════════════════════════════════════════
#page(
  margin: (top: 2.5cm, bottom: 2cm, left: 2cm, right: 2cm),
  header: none,
  footer: none,
)[
  #align(center)[
    #v(0.5cm)
    #block(width: 100%, height: 6pt, fill: blue-mid, radius: 3pt)
    #v(0.8cm)

    #text(size: 34pt, weight: "bold", fill: blue-dark)[
      ISRAEL WARTIME\ READINESS
    ]
    #v(0.2cm)
    #text(size: 18pt, fill: blue-mid)[
      FIELD GUIDE & CHECKLISTS
    ]
    #v(0.1cm)
    #block(width: 60%, height: 2pt, fill: blue-accent, radius: 1pt)

    #v(0.6cm)

    // Mascots — equal sizing
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1cm,
      align(center)[
        #box(clip: true, radius: 50%, width: 4.5cm, height: 4.5cm,
          image(herman-cartoon, width: 6cm)
        )
        #v(4pt)
        #text(size: 10pt, weight: "bold", fill: blue-dark)[Herman]
        #linebreak()
        #text(size: 9pt, fill: grey-text, style: "italic")[Donkey · Health & Safety Expert]
      ],
      align(center)[
        #image(corn-avatar, width: 4.5cm)
        #v(4pt)
        #text(size: 10pt, weight: "bold", fill: blue-dark)[Corn]
        #linebreak()
        #text(size: 9pt, fill: grey-text, style: "italic")[Sloth · Wellness Expert]
      ],
    )

    #v(0.3cm)

    #text(size: 8pt, fill: grey-text, style: "italic")[
      Your guides through this document. Neither is a government official.
    ]

    #v(0.5cm)
    #image(beyahad, width: 7cm)
    #v(0.5cm)

    // Version info
    #block(
      width: 75%,
      inset: 10pt,
      fill: grey-light,
      radius: 6pt,
      stroke: 0.5pt + grey-border,
    )[
      #set text(size: 9pt)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 12pt,
        row-gutter: 5pt,
        [*Version*], [4],
        [*Date*], [20 March 2026],
        [*Author*], [Daniel Rosehill + Claude Opus],
        [*Warranty*], [None — use/modify as desired],
      )
    ]

    #v(0.3cm)
    #text(size: 8pt, fill: grey-text, style: "italic")[
      Not an official government resource. Based on HFC (Pikud HaOref) published guidance.\ Official source: oref.org.il
    ]
    #v(0.2cm)
    #block(width: 100%, height: 6pt, fill: blue-mid, radius: 3pt)
  ]
]

// ══════════════════════════════════════════════
// TABLE OF CONTENTS (with page numbers)
// ══════════════════════════════════════════════
#page(header: none, footer: none)[
  #v(0.5cm)
  #align(center, text(size: 20pt, weight: "bold", fill: blue-dark)[CONTENTS])
  #v(0.4cm)

  #set text(size: 10pt)
  #set par(leading: 0.5em)

  // We use outline for automatic page numbers
  #outline(title: none, depth: 2)

  #v(1fr)

  #tip-box(avatar: herman-cartoon)[
    #text(size: 9pt)[
      *Print this guide and keep it accessible.* Affix reflective tape to the cover so it's visible by torchlight. Prepare at least 3 copies: by the front door, in the go bag, and in the mamad.
    ]
  ]
]

// ══════════════════════════════════════════════
// QUICK REFERENCE CARDS
// ══════════════════════════════════════════════
#page(header: none, footer: none)[
  #v(0.3cm)
  #align(center, text(size: 18pt, weight: "bold", fill: blue-dark)[QUICK REFERENCE])
  #align(center, text(size: 10pt, fill: grey-text, style: "italic")[Tear out or photocopy this page. Post on fridge, in mamad, and in go bag.])
  #v(0.4cm)

  // Daytime card
  #block(
    width: 100%,
    inset: 12pt,
    fill: rgb("#fff8e1"),
    radius: 8pt,
    stroke: 2pt + orange-warm,
  )[
    #text(size: 13pt, weight: "bold", fill: blue-dark)[#icon-sun DAYTIME AT-HOME POSTURE]
    #v(4pt)
    #set text(size: 9pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 12pt,
      [
        #ci[PHONE — ON PERSON, CHARGED, HFC APP]
        #linebreak()
        #ci[DRESSED — FULL CLOTHES, CLOSED-TOE SHOES]
        #linebreak()
        #ci[KEYS — ON PERSON OR IN/BY DOOR]
      ],
      [
        #ci[GO BAG — BY DOOR, ZIPPED]
        #linebreak()
        #ci[EXIT — HALLWAY CLEAR, DOOR OPENS QUICKLY]
        #linebreak()
        #ci[BROWSER ALERT — ACTIVE (if at desk)]
      ],
    )
  ]

  #v(0.4cm)

  // Nighttime card
  #block(
    width: 100%,
    inset: 12pt,
    fill: rgb("#e8eaf6"),
    radius: 8pt,
    stroke: 2pt + blue-dark,
  )[
    #text(size: 13pt, weight: "bold", fill: blue-dark)[#icon-moon BEFORE BED POSTURE]
    #v(4pt)
    #set text(size: 9pt)
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 12pt,
      [
        #ci[PHONE — CHARGING, NOT AIRPLANE MODE]
        #linebreak()
        #ci[CLOTHES — LAID OUT BY BED]
        #linebreak()
        #ci[SHOES — CLOSED-TOE BY BED]
        #linebreak()
        #ci[TORCH — NIGHTSTAND, ARM'S REACH]
        #linebreak()
        #ci[GLASSES — BY BED]
      ],
      [
        #ci[KEYS — BY BED OR BY DOOR]
        #linebreak()
        #ci[GO BAG — BY DOOR, POWER BANK CHARGING]
        #linebreak()
        #ci[EXIT — HALLWAY CLEAR, NOT DOUBLE-LOCKED]
        #linebreak()
        #ci[HEARING — NO EARPLUGS]
        #linebreak()
        #ci[DEPENDENTS — ALL ACCOUNTED FOR]
      ],
    )
  ]

  #v(0.4cm)

  // Night alarm sequence
  #block(
    width: 100%,
    inset: 12pt,
    fill: red-light,
    radius: 8pt,
    stroke: 2pt + red-alert,
  )[
    #text(size: 13pt, weight: "bold", fill: red-alert)[⚠ NIGHT ALARM — FIRST 30 SECONDS]
    #v(4pt)
    #set text(size: 9.5pt)
    + *Feet on floor → into shoes* (same spot every night)
    + *Grab glasses + phone* from nightstand
    + *Pull on clothes* laid out by bed
    + *Torch* if power is out
    + *Move to protected space* or front door
    + *Parents:* one → children, other → go bag (pre-assigned)
  ]
]

// ══════════════════════════════════════════════
// LEGEND / KEY
// ══════════════════════════════════════════════
#page(header: none, footer: none)[
  #v(0.5cm)
  #align(center, text(size: 20pt, weight: "bold", fill: blue-dark)[LEGEND & SYMBOLS])
  #v(0.5cm)

  #table(
    columns: (auto, 1fr),
    inset: 10pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
    align: (center, left),
    text(fill: white, weight: "bold", size: 9pt)[SYMBOL],
    text(fill: white, weight: "bold", size: 9pt)[MEANING],

    checkbox, [Checkbox — physically verify and tick off],
    text(fill: red-alert, weight: "bold", size: 14pt)[⚠], [*Critical item* — do not skip under any circumstances],
    icon-sun, [Daytime-specific action],
    icon-moon, [Nighttime-specific action],
    icon-phone, [Smartphone / phone-related],
    icon-water, [Water / hydration],
    icon-shield, [Shelter / protection],
    icon-bag, [Go bag / supplies],
    icon-house, [Home environment],
    icon-medkit, [Medical / first aid],
    icon-alert, [Alerts / emergency communications],
    icon-baby, [Children / dependents],
  )

  #v(0.5cm)

  === Your Guides

  #grid(
    columns: (auto, 1fr),
    column-gutter: 12pt,
    row-gutter: 12pt,
    image(herman-cartoon, width: 2cm),
    align(horizon)[
      *Herman the Donkey — Health & Safety Expert* \
      Appears alongside safety checklists, shelter procedures, and critical items.
    ],
    image(corn-avatar, width: 2cm),
    align(horizon)[
      *Corn the Sloth — Wellness Expert* \
      Appears alongside self-care, wellness, and mental health guidance.
    ],
  )

  #v(0.3cm)

  #block(
    width: 100%,
    inset: 10pt,
    fill: grey-light,
    radius: 4pt,
  )[
    #text(size: 9pt, style: "italic")[
      Herman and Corn are the duo behind myweirdprompts.com. They live with Daniel and his wife Hannah in Rehavia, Jerusalem. Neither is a government official, military advisor, or emergency services professional — just two friends who want to help you stay safe and sane.
    ]
  ]
]

// ══════════════════════════════════════════════
// CHAPTER 1: HOW TO USE THIS DOCUMENT
// ══════════════════════════════════════════════
#set-section("Ch. 1: How To Use", colour: sec-col-ch1)

= Chapter 1: How To Use This Document

== 1.1 Preparation (Before Emergencies)

#tip-box()[
  *Print and prepare this checklist before you need it.* Do not wait for a siren to figure out what to do.
]

#v(0.3cm)

During routine periods:

- *Print multiple copies* on durable paper (or laminate if possible)
- *Affix a strip of reflective tape* to the cover or top edge — visible when swept with a torch in the dark
- *Bind or staple* the pages together. A document folder or plastic sleeve works well
- Prepare at least *3 copies*:
  - On the fridge or by the front door (the working copy)
  - In the go bag
  - In the mamad / protected space
- *Review and reprint* whenever the checklist is updated

== 1.2 Running The Checklist

*Two-person method (recommended).* One person reads each item aloud. The other physically verifies it and responds (e.g. "CHECK", "DONE", "NOT YET"). This is the challenge-and-response method used in aviation and military checklists.

#v(0.3cm)

#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[CHECKLIST],
  text(fill: white, weight: "bold", size: 9pt)[WHEN TO RUN],
  [*Full Master Checklist* (Ch. 3)], [Start of any escalation or war · After evacuation · Weekly during sustained conflict],
  [*Quick Smoke Test — PAWS BED* (Ch. 2)], [Daily during wartime · Weekly during elevated tension · Monthly during routine],
  [*Situational Checklists* (Ch. 4)], [Every time, during wartime or escalation],
)

#v(0.3cm)
#warning-box[Items marked with #critical are *critical* — do not skip these under any circumstances.]

// ══════════════════════════════════════════════
// CHAPTER 2: PAWS BED
// ══════════════════════════════════════════════
#set-section("Ch. 2: PAWS BED", colour: sec-col-ch2)

= Chapter 2: Quick Smoke Test — "PAWS BED"

_Periodic rapid readiness check. Can be completed in under 2 minutes._

#v(0.3cm)

#block(
  width: 100%,
  radius: 6pt,
  clip: true,
  stroke: 1.5pt + blue-accent,
)[
  #table(
    columns: (auto, auto, 1fr),
    inset: 10pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { blue-light } else { white },
    align: (center, left, left),
    text(fill: white, weight: "bold")[\#],
    text(fill: white, weight: "bold")[CHECK],
    text(fill: white, weight: "bold")[VERIFY],
    text(size: 18pt, weight: "bold", fill: blue-dark)[P], [#icon-phone *Phone*], [#ci[ON · CHARGED · HFC APP RUNNING · CORRECT AREA]],
    text(size: 18pt, weight: "bold", fill: blue-dark)[A], [#icon-alert *Alerts*], [#ci[WIRELESS ALERTS ENABLED · DND OVERRIDE VERIFIED]],
    text(size: 18pt, weight: "bold", fill: blue-dark)[W], [#icon-water *Water*], [#ci[72-HOUR SUPPLY ACCESSIBLE · NOT EXPIRED]],
    text(size: 18pt, weight: "bold", fill: blue-dark)[S], [#icon-shield *Shelter*], [#ci[NEAREST 3 SHELTERS KNOWN · ROUTES WALKABLE]],
    text(size: 18pt, weight: "bold", fill: blue-dark)[B], [#icon-bag *Bag*], [#ci[BY DOOR · ZIPPED · CONTENTS VERIFIED]],
    text(size: 18pt, weight: "bold", fill: blue-dark)[E], [#icon-door *Exit*], [#ci[HALLWAY CLEAR · DOOR UNLOCKABLE QUICKLY]],
    text(size: 18pt, weight: "bold", fill: blue-dark)[D], [#icon-people *Dependents*], [#ci[ALL HOUSEHOLD MEMBERS PRESENT OR ACCOUNTED FOR]],
  )
]

#v(0.5cm)

#block(
  width: 100%,
  inset: 14pt,
  fill: blue-light,
  radius: 8pt,
  stroke: 1.5pt + blue-accent,
)[
  #align(center)[
    #text(size: 16pt, weight: "bold", fill: blue-dark)[Mnemonic: PAWS BED]
    #v(4pt)
    #text(size: 12pt, fill: grey-text, style: "italic")["Check your PAWS before BED"]
  ]
]

// ══════════════════════════════════════════════
// CHAPTER 3: MASTER CHECKLIST
// ══════════════════════════════════════════════
#set-section("Ch. 3: Master Checklist", colour: sec-col-ch3)

= Chapter 3: Master Checklist

== 3.1 Technical Systems & Alerts

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  text(fill: white, weight: "bold", size: 9pt)[],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-phone, [*Smartphone* #critical],
  [#ci(d: "or location known")[ON PERSON]
   #linebreak()
   #ci(d: "or charging")[BATTERY LEVEL — OK]],

  icon-alert, [*Smartphone Config* #critical],
  [#ci(d: "DND okay; airplane mode not okay")[POWERED ON]
   #linebreak()
   #ci[LOCATION SERVICES — ENABLED]
   #linebreak()
   Home Front Command App:
   #linebreak()
   #ci[INSTALLED] #h(6pt) #ci(d: "See Appendix A")[CONFIGURED]
   #linebreak()
   #ci[RUNNING] #h(6pt) #ci[CORRECT ALERT AREA — VALIDATED]
   #linebreak()
   Emergency Wireless Alerts:
   #linebreak()
   #ci(d: "Ensure 'Extreme' threats are alerting")[ACTIVATED]],

  icon-laptop, [*Computer*],
  [Red Alert app for browser:
   #linebreak()
   #ci[ACTIVE] #h(6pt) #ci[CORRECT LOCATION SET]
   #linebreak()
   #ci[TESTED AND VALIDATED WORKING]],
)

#pagebreak()
== 3.2 Home Environment

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  text(fill: white, weight: "bold", size: 9pt)[],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-water, [*Water* #critical],
  [#ci(d: "Calc 3L/Person/Day. Resupply when necessary")[72 HOURS SUPPLY — READY]],

  icon-food, [*Food* #critical],
  [#ci(d: "See Appendix H for Israeli pantry staples")[PANTRY GOODS — STOCKED]],

  [], [*Torch*],
  [#ci(d: "Hand crank or battery with reserve")[ACCESSIBLE]],

  icon-door, [*Hallway* #critical],
  [#ci(d: "No obstructions")[CLEAR]],

  icon-fire, [*Fire Extinguisher*],
  [#ci[ACCESSIBLE]
   #linebreak()
   #ci[SMOKE DETECTOR — INSTALLED AND TESTED]],

  icon-door, [*Escape Routes*],
  [#ci[PRIMARY EXIT IDENTIFIED]
   #linebreak()
   #ci(d: "Back door, porch, emergency stairs")[SECONDARY EXIT IDENTIFIED]
   #linebreak()
   #ci[ROUTES CLEAR OF OBSTACLES]],

  icon-baby, [*Baby Carry*],
  [#ci[BY FRONT DOOR]],

  icon-shield, [*Mamad*],
  [#ci(d: "See Appendix C — Mamad Inspection")[PREPARED]],
)

#v(0.2cm)
#block(
  width: 100%,
  inset: 8pt,
  fill: grey-light,
  radius: 4pt,
)[
  #text(size: 8pt, fill: grey-text, style: "italic")[
    Heavy furniture securing, gas/electricity shutoffs, and fire safety — see *Appendix G: Pre-Emergency Home Safety*. These are preparation tasks, not wartime-active checks.
  ]
]

#pagebreak()
== 3.3 Go Bag #h(6pt) #icon-bag

_See Chapter 5 §5.1 and Appendix G for detailed go bag guidance._

#table(
  columns: (1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  [*Prepared* #critical],
  [#ci[BY DOOR]
   #linebreak()
   #ci[ZIPPED / SEALED]],

  [*Contents (Basic)* #critical],
  [#ci[PHONE CHARGER AND CABLE — PACKED]
   #linebreak()
   #ci(d: "Level verified or charging")[POWER BANK — PACKED]
   #linebreak()
   Medications:
   #linebreak()
   #h(1em) #ci[ESSENTIAL MEDS — PACKED]
   #linebreak()
   #h(1em) #ci[SUPPLY CHECKED AND REPLENISHED]
   #linebreak()
   #ci[TORCH — INSIDE AND CHARGED]
   #linebreak()
   #ci(d: "One per person")[N95 — PACKED]],

  [*Contents (Additionals)*],
  [#ci[EMERGENCY WHISTLE — PACKED]
   #linebreak()
   #ci(d: "Battery or charge OK")[AM/FM RADIO — PACKED]
   #linebreak()
   #ci[FIRST AID KIT — PACKED AND SUPPLIED]
   #linebreak()
   #ci[TRAVEL ROUTER — PACKED]],

  [*Overnight Stays*],
  [#ci(d: "Siddur, Tefilin")[RELIGIOUS EFFECTS — PACKED]
   #linebreak()
   #ci(d: "For longer stays")[FOOD / DRINK — PACKED]
   #linebreak()
   #ci(d: "If sleeping in shelter")[EYE MASK AND EARPLUGS — PACKED]
   #linebreak()
   #ci[WATER BOTTLES]
   #linebreak()
   #ci[UMBRELLAS]
   #linebreak()
   #ci[TRAVEL ROUTER + ETHERNET + AC SUPPLY]
   #linebreak()
   #ci[PLUG ADAPTERS / SPLITTERS]
   #linebreak()
   #ci[TENT / BLANKET]],

  [*Travel Docs*],
  [#ci[PASSPORTS — PACKED AND VALIDATED]
   #linebreak()
   #ci[CASH — ON HAND / PACKED]
   #linebreak()
   #ci[NATIONAL IDS — PACKED]
   #linebreak()
   #ci[TRAVEL DOCS — PACKED]],
)

#pagebreak()
== 3.4 People & Dependents #h(6pt) #icon-people

#table(
  columns: (1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  [*Dependents* #critical],
  [All household members:
   #linebreak()
   #ci[PRESENT] #h(8pt) or #h(8pt) #ci[ACCOUNTED FOR AND CONTACTABLE]],
)

== 3.5 Babies & Young Children #h(6pt) #icon-baby

#table(
  columns: (1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  [*Essential Supplies* #critical],
  [PACKED in Go Bag:
   #linebreak()
   #ci[Diapers] #h(4pt) #ci[Wipes] #h(4pt) #ci[Pacifier]
   #linebreak()
   #ci[Formula] #h(4pt) #ci[Bottle] #h(4pt) #ci[Changing mat + privacy]],

  [*Ready To Go* #critical],
  [#ci(d: "Or clothes by bed")[CLOTHED]
   #linebreak()
   #ci[BABYWEAR BY DOOR]
   #linebreak()
   #ci(d: "If needed")[FED] #h(8pt) #ci(d: "If needed")[CLEANED]],
)

== 3.6 Person & Personal Effects

#table(
  columns: (auto, 1fr, 1.3fr, 1.3fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[#icon-sun DAYTIME],
  text(fill: white, weight: "bold", size: 9pt)[#icon-moon NIGHT],

  icon-shirt, [*Clothing* #critical], [#ci(d: "For weather")[DRESSED]], [#ci[BY DOOR / BY BED / SLEEPING IN]],
  icon-shoe, [*Footwear* #critical], [#ci[WEARING — CLOSED TOE]], [#ci[BY DOOR / BY BED — CLOSED TOE]],
  icon-key, [*Keys* #critical], [#ci[ON PERSON OR BY DOOR]], [],
  [], [*Wallet*], [], [],
  icon-medkit, [*Meds*], [#ci[TAKEN ON SCHEDULE]], [],
  [], [*Rest*], [#ci[TAKEN WHEN POSSIBLE]], [],
  [], [*Hygiene*], [#ci(d: "As soon as possible")[SHOWER] #linebreak() #ci[BRUSH TEETH] #linebreak() #ci[TENDED TO GENERALLY]], [],
  [], [*Toilet*], [#ci[TAKEN AS SOON AS POSSIBLE]], [],
)

#pagebreak()
== 3.7 Situational Awareness #h(6pt) #icon-eye

#table(
  columns: (auto, 0.8fr, 1.5fr, 1fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[CATEGORY],
  text(fill: white, weight: "bold", size: 9pt)[ACTIONS],
  text(fill: white, weight: "bold", size: 9pt)[FREQUENCY],

  icon-eye, [*News*], [#ci[SCANNED]], [_Every 1–3 hours_],
  icon-alert, [*Alert Area*], [#ci[KNOWN]], [],
  icon-shield, [*Shelters*],
  [#ci[NEAREST 3 KNOWN]
   #linebreak() #ci[ACCESSIBILITY VERIFIED]
   #linebreak() #ci[OPEN / HOURS NOTED]
   #linebreak() #ci[EXIT TIMED]],
  [_Once per emergency_],
  icon-phone, [*HFC App*], [#ci(d: "Current advice")[CHECKED]], [_Once per day_],
  icon-clock, [*Supplies*],
  [#ci[WATER + FOOD REPLACED]
   #linebreak() #ci[BATTERIES + ELECTRONICS CHECKED]],
  [_Water/food: 3 months_ \ _Batteries: 6 months_],
)

// ══════════════════════════════════════════════
// CHAPTER 4: SITUATIONAL CHECKLISTS
// ══════════════════════════════════════════════
#set-section("Ch. 4: Situational", colour: sec-col-ch4)

= Chapter 4: Situational Checklists

== 4.1 Daytime At-Home Posture #h(6pt) #icon-sun

_Quick status check while at home during the day. Run after waking, and repeat after any disruption._

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-phone, [*Phone* #critical], [#ci(d: "Or within arm's reach")[ON PERSON] #linebreak() #ci[CHARGED OR CHARGING] #linebreak() #ci[HFC APP RUNNING]],
  icon-shirt, [*Dressed* #critical], [#ci[FULLY CLOTHED] #linebreak() #ci(d: "Not slippers, not barefoot")[CLOSED-TOE SHOES ON]],
  icon-key, [*Keys* #critical], [#ci[ON PERSON OR IN/BY DOOR]],
  icon-bag, [*Go Bag* #critical], [#ci[BY DOOR] #h(6pt) #ci[ZIPPED]],
  icon-door, [*Exit Route* #critical], [#ci[HALLWAY CLEAR] #linebreak() #ci[FRONT DOOR CAN BE OPENED QUICKLY]],
  icon-laptop, [*Browser Alert*], [#ci(d: "If working at desk")[RED ALERT EXTENSION ACTIVE]],
)

#v(0.3cm)

#tip-box()[
  *Working from home during wartime:* \
  #set text(size: 9pt)
  - Stay dressed and shoed — do not slip into pyjamas "just at the desk"
  - Headphones: use one ear only, or keep volume low enough to hear a siren
  - Save work frequently — you may need to abandon your desk mid-sentence
  - At the start of any call: _"I'm in an active alert zone. I may need to leave abruptly."_
]

#pagebreak()
== 4.2 After Returning From Shelter (Reset)

_Run immediately after the all-clear. Restore full readiness before the next alert._

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-bag, [*Go Bag* #critical], [#ci[BACK BY DOOR] #linebreak() #ci(d: "Did anything fall out? Put it back now")[RE-ZIPPED]],
  icon-phone, [*Phone* #critical], [#ci(d: "If battery dropped")[PUT ON CHARGE] #linebreak() #ci[HFC APP STILL RUNNING]],
  [], [*Power Bank*], [#ci(d: "May have been used in shelter")[PUT ON CHARGE]],
  icon-water, [*Water*], [#ci(d: "If you drank from emergency stock")[RESUPPLY]],
  icon-shirt, [*Clothes & Shoes*], [#ci(d: "By bed (night) or on person (day)")[BACK IN POSITION]],
  [], [*Torch*], [#ci(d: "Nightstand or go bag")[BACK IN POSITION]],
  icon-people, [*Dependents* #critical], [#ci[ALL ACCOUNTED FOR AND SAFE]],
)

#v(0.3cm)

#calm-box[
  *Self-Care — Do these NOW, not later.* You don't know when the next alert comes.
  #set text(size: 9.5pt)
  #v(6pt)
  #ci(d: "Stress suppresses appetite — eat anyway. You need the energy.")[EAT FOOD]
  #linebreak()
  #ci[DRINK WATER]
  #linebreak()
  #ci[USE THE TOILET]
  #linebreak()
  #ci(d: "If time and situation allow")[SHOWER]
  #linebreak()
  #ci(d: "When possible")[REST]
  #v(8pt)
  *Children:*
  #linebreak()
  #ci[FED] #h(6pt) #ci[WATERED] #h(6pt) #ci[TOILETED / CHANGED]
  #linebreak()
  #ci(d: "If possible")[CLEANED] #h(6pt) #ci(d: "Put down for nap if timing allows")[RESTED]
]

#pagebreak()
== 4.3 Before Showering #h(6pt) #icon-water

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-eye, [*News Check* #critical], [#ci(d: "No active alerts in your area")[SITUATION SCANNED]],
  icon-phone, [*Phone* #critical], [#ci(d: "Must be audible over water")[VOLUME AT MAXIMUM] #linebreak() #ci[IN BATHROOM OR JUST OUTSIDE DOOR]],
  icon-shirt, [*Clothes* #critical], [#ci(d: "Ready to throw on immediately — not in another room")[FULL OUTFIT IN BATHROOM]],
  icon-shoe, [*Footwear* #critical], [#ci[CLOSED-TOE SHOES BY BATHROOM DOOR]],
  [], [*Towel*], [#ci(d: "For rapid dry-off")[WITHIN REACH]],
  icon-door, [*Door*], [#ci[BATHROOM DOOR UNLOCKED]],
  icon-clock, [*Keep It Short* #critical], [#ci(d: "You are at your most vulnerable; be quick")[MINIMISE TIME]],
)

== 4.4 Before Bed #h(6pt) #icon-moon

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-eye, [*News Check*], [#ci(d: "Assess if safe to sleep at home")[SITUATION SCANNED]],
  icon-phone, [*Phone* #critical], [#ci[CHARGING OR CHARGED] #linebreak() #ci(d: "DND/silent OK")[NOT IN AIRPLANE MODE] #linebreak() #ci[LOCATION SERVICES ON] #linebreak() #ci[HFC APP — NOTIFICATION + OVERRIDE PERMISSIONS]],
  icon-shirt, [*Clothes* #critical], [#ci(d: "Full outfit ready in seconds")[LAID OUT BY BED]],
  icon-shoe, [*Footwear* #critical], [#ci(d: "Ready to step into immediately")[CLOSED-TOE SHOES BY BED]],
  [], [*Torch*], [#ci(d: "On nightstand, not buried in go bag")[WITHIN ARM'S REACH]],
  [], [*Glasses*], [#ci(d: "Same spot every night")[BY BED]],
  icon-key, [*Keys*], [#ci(d: "By bed or on hook by front door")[ACCESSIBLE]],
  icon-bag, [*Go Bag* #critical], [#ci[BY DOOR] #h(4pt) #ci[CONTENTS VERIFIED] #linebreak() #ci[POWER BANK ON CHARGE]],
  icon-door, [*Exit Route* #critical], [#ci(d: "Can navigate in the dark")[HALLWAY CLEAR] #linebreak() #ci[FRONT DOOR NOT DOUBLE-LOCKED]],
  icon-alert, [*Hearing* #critical], [#ci(d: "You must hear the siren and phone alert")[NO EARPLUGS]],
  icon-baby, [*Dependents* #critical], [#ci[ALL ACCOUNTED FOR] #linebreak() #ci[BABY — CLOTHED OR CLOTHES BY BED, BABYWEAR BY DOOR]],
)

#pagebreak()
== 4.5 Before Leaving Home #h(6pt) #icon-door

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-bag, [*Go Bag* #critical], [#ci[TAKING WITH YOU]],
  icon-eye, [*News Check* #critical], [#ci(d: "Check HFC app and news for active alerts")[SITUATION SCANNED BEFORE DEPARTURE]],
  icon-shield, [*Shelters* #critical], [#ci(d: "At destination and along route")[NEAREST SHELTERS IDENTIFIED]],
  icon-clock, [*Time To Shelter*], [#ci[KNOWN FOR DESTINATION AREA]],
  icon-phone, [*Phone* #critical], [#ci[CHARGED] #h(4pt) #ci[HFC APP RUNNING] #h(4pt) #ci[LOCATION ON]],
  icon-car, [*Car Fuel*], [#ci[AT LEAST HALF A TANK]],
  icon-people, [*Household Notified*], [#ci[DESTINATION AND RETURN TIME COMMUNICATED]],
)

// ══════════════════════════════════════════════
// CHAPTER 5: GUIDANCE NOTES
// ══════════════════════════════════════════════
#set-section("Ch. 5: Guidance Notes", colour: sec-col-ch5)

= Chapter 5: Guidance Notes

== 5.1 Choosing a Go Bag #h(6pt) #icon-bag

#tip-box()[
  Your go bag is the single most important physical item in your readiness kit. *Use a backpack, not a tote bag.* See Appendix G for a full packing list.
]

#v(0.3cm)

You need both hands free. You may be carrying a child, holding a torch, opening doors, or navigating stairs in the dark.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  block(
    width: 100%,
    inset: 10pt,
    fill: green-light,
    radius: 6pt,
    stroke: 1pt + green-calm,
  )[
    #text(weight: "bold", fill: green-calm)[✓ What to look for]
    #v(4pt)
    - *Two shoulder straps* with padding
    - *Chest strap and/or waist strap*
    - *Water-resistant material*
    - *30–40 litre capacity*
    - *Multiple compartments* — find things in the dark by feel
    - *Durable zips*
    - *Dark or neutral colour*
  ],
  block(
    width: 100%,
    inset: 10pt,
    fill: red-light,
    radius: 6pt,
    stroke: 1pt + red-alert,
  )[
    #text(weight: "bold", fill: red-alert)[✗ What to avoid]
    #v(4pt)
    - Tote bags, drawstring bags, single-strap slings
    - Wheeled luggage — useless on stairs or rubble
    - Very large bags (60L+) — too heavy
    - Fashion bags with no structure
  ],
)

#v(0.3cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: blue-light,
  radius: 6pt,
  stroke: 1pt + blue-accent,
)[
  #text(weight: "bold", fill: blue-dark)[Once selected]
  #v(4pt)
  - Affix *reflective tape* to straps
  - Assign each item a *fixed pocket*
  - Keep it *by the front door*
]

#pagebreak()
== 5.2 In Shelter — When To Leave

#warning-box[
  *Wait for the all-clear.* Do NOT leave your protected space until you receive an all-clear from HFC (via the app, official media, or the all-clear siren pattern).
]

#v(0.2cm)

*If you have no connectivity* (phone dead, no signal, no internet):
- *Stay in shelter.* The default when you have no information is to remain in place
- Do NOT assume the situation is over because it has been quiet
- If you have a radio, tune to a national station
- *When in doubt, stay longer.* Leaving too early is far more dangerous than staying too long

Many casualties occur because people leave shelter prematurely.

== 5.3 In Shelter — Behaviour

=== #icon-baby Children

- #text(weight: "bold")[Use a calm, steady voice.] Children take their cues from adults
- #text(weight: "bold")[Explain simply:] _"We're in our safe room. We wait here until we're told it's safe"_
- #text(weight: "bold")[Have a comfort item ready] — one in the mamad, one in the go bag
- #text(weight: "bold")[Hold young children close] — physical contact is reassuring
- #text(weight: "bold")[Do not lie] — children hear sirens. Acknowledge and redirect to the plan

=== #icon-shield General

- #icon-shield *Sit against an inner wall,* below window line
- #text(fill: red-alert, weight: "bold")[Do NOT use elevators] during or after an alert
- #text(fill: red-alert, weight: "bold")[Do NOT go outside to photograph interceptions] — falling debris causes injuries
- #icon-door *Keep the mamad/shelter door closed* until the all-clear
- #icon-bolt If you smell gas or see structural damage, *move to alternative shelter* and call *102*
- #icon-phone After the all-clear, *send a brief safety confirmation* to family
- #text(fill: red-alert, weight: "bold")[Do not spread unverified information]

== 5.4 Moving Safely to a Public Shelter

The journey to shelter is one of the most dangerous moments.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  [
    === Before you move
    - Know where you're going
    - Grab go bag only if on the route
    - Secure children first, then move

    === On the stairs
    - *Hold the handrail*
    - Do NOT run — fast, controlled walk
    - Stay to one side
  ],
  [
    === Outside
    - *Watch the ground* — glass, uneven pavement
    - Do NOT run across roads without looking
    - Wear closed-toe shoes
    - If shelter unreachable, enter nearest building or lie flat

    === At the shelter door
    - Let children, elderly, mobility-limited enter first
    - Move away from entrance once inside
  ],
)

#v(0.3cm)
#warning-box[
  *Common injuries:* Falls on stairs (wet, dark, socks) · Tripping on uneven ground · Cuts from bare feet on debris · Collisions in narrow hallways · Panic-related sprains
]

#pagebreak()
== 5.5 Waking Up to a Night Alarm #h(6pt) #icon-moon

This is one of the hardest scenarios. Everything in §4.4 exists to make this moment survivable on autopilot.

#block(
  width: 100%,
  inset: 12pt,
  fill: blue-light,
  radius: 6pt,
  stroke: 1pt + blue-accent,
)[
  === The first 5 seconds
  + *Siren or phone alert wakes you.* Do not process. Just move
  + *Feet on floor → into shoes.* Same spot every night
  + *Grab glasses* and *phone*

  === The next 10–20 seconds
  4. *Clothes:* Pull on whatever is laid out. Speed over appearance
  5. *Grab torch* from nightstand if power is out
  6. *Move to protected space* or front door

  === For parents
  7. One parent → child/children. Other → go bag (pre-assigned roles)
  8. Carry baby in babywear that's by the door. Do not stop to dress them
]

#v(0.3cm)
#tip-box()[
  #set text(size: 9pt)
  *Do not think. Follow the procedure.* Every decision at 3am is one you should have made before bed. \
  *Do not check your phone.* The siren means go. Read details in the shelter. \
  *It gets easier.* After 2–3 night alarms, the routine becomes automatic.
]

== 5.6 Fighting Alert Fatigue

#calm-box[
  After days or weeks of alerts, the temptation to stop reacting is enormous. This is *alert fatigue* — a normal neurological process, not a character flaw. But it kills people.
]

#v(0.2cm)

*Why it happens:*
- Repeated exposure reduces your response — normal neurology
- Most alerts end without personal impact, reinforcing false safety beliefs
- Fatigue, stress, and disrupted sleep degrade motivation
- Social pressure: if neighbours aren't sheltering, you feel permission to stop

*How to fight it:*
- *Reframe every alert as the first one.* The one you skip could be the one that matters
- *Use the checklist mechanically.* They work when your judgment doesn't
- *Keep your shoes on.* The single biggest predictor of whether someone will shelter
- *Lower the effort, not the standard.* Sleep in clothes by the door — that's adapting
- *Talk about it.* "I'm feeling alert fatigue. Let's keep going to shelter."
- *Remember:* Civilian injuries spike in weeks 2–3, when alert fatigue peaks

#pagebreak()
== 5.7 Wellness During Protracted Conflict

#calm-box[
  Wars lasting weeks create cumulative strain different from acute stress. Readiness includes taking care of yourself.
]

#v(0.2cm)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  [
    === Physical
    - *Sleep when you can.* Any sleep is better than none
    - *Eat regular meals.* Stress suppresses appetite — eat anyway
    - *Drink water.* Dehydration amplifies fatigue
    - *Shower when you can.* Hygiene is a morale multiplier
    - *Move your body.* Even 10 minutes of stretching
    - *Manage medication.* Maintain a 72-hour buffer
  ],
  [
    === Psychological
    - *Limit news* to every 1–3 hours — don't doom-scroll
    - *Maintain routines.* Even small ones stabilise
    - *Stay connected.* Isolation amplifies stress
    - *Acknowledge the difficulty.* "This is hard" is not weakness
    - *Watch for warning signs* — insomnia, inability to eat, withdrawal, rage, numbness
    - Call *ERAN (1201)* or *NATAL (1-800-363-363)*
  ],
)

#v(0.2cm)

*Children* need extra reassurance. Maintain bedtime routines. Don't dismiss fears — validate and redirect: _"Yes, it's scary. And we have a plan, and our safe room works, and we're together."_

*Give yourself permission to function imperfectly.* Safety first, then wellbeing, then everything else.

== 5.8 Caring for Elderly Neighbours & Vulnerable People

=== Before the escalation
- *Know your neighbours* — especially those living alone or with limitations
- *Exchange phone numbers*
- *Establish a buddy system* — check on each other after every alert
- *Know who holds a spare key*

=== During alerts
- Check on elderly/mobility-limited neighbours *on your way* (only if safe)
- Help them to safest position: inner wall, away from windows
- After the all-clear, *knock on their door* — 10 seconds

=== Ongoing support
- Check *food, water, medications*
- Help with *technology* — phone charged, HFC app configured
- *Offer to include them* in supply runs
- If distressed: *118* (Welfare Ministry) or *\*8840* (Senior Citizens)

#pagebreak()
== 5.9 Using Communal / Public Shelters #h(6pt) #icon-shield

#warning-box[
  HFC maintains official shelter information. Check the HFC app or oref.org.il. This guidance supplements — does not replace — official instructions.
]

#v(0.2cm)

*Finding shelters:* HFC app, building committee (vaad bayit), or physically walk to your nearest 3.

*Access:* Many are locked — find the keyholder. Some have restricted hours. Report storage/access issues to municipality.

*Etiquette:*
- Make space — move to the back
- *Priority:* children, elderly, pregnant women, people with disabilities
- Keep noise down
- Share resources with those who arrive without supplies
- *Pets:* many shelters do not allow animals — check in advance
- Bring something for children to do

== 5.10 OPSEC & Information Discipline

#warning-box[During wartime, what you share online can endanger lives — including your own.]

#v(0.2cm)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  [
    === Do NOT share
    - *Exact locations of impacts*
    - *Military or emergency activity*
    - *Photos/videos* revealing locations
    - *Casualty info* before families notified
  ],
  [
    === Do NOT believe
    - Unverified reports on X, Telegram, WhatsApp
    - "Breaking" news from unknown accounts
    - Dramatic unconfirmed claims
    - Screenshots from unverified sources
  ],
)

#v(0.2cm)

*Do:* Use *official sources* (HFC app, IDF Spokesperson, Israel Police, established media). Check before sharing. Tell others to delete sensitive location info.

#block(
  width: 100%,
  inset: 10pt,
  fill: grey-light,
  radius: 4pt,
)[
  #align(center, text(style: "italic")[Even well-intentioned sharing can be lethal OPSEC. When in doubt, don't post.])
]

#pagebreak()
== 5.11 Preliminary Guidelines (Advance Warning) #h(6pt) #icon-alert

HFC provides *3–5 minute advance warning* for attacks from distant sources (e.g. Yemen).

- Notification via HFC app *before* the siren
- Does *NOT* require shelter entry
- It means: *prepare.* Shoes on. Phone located. Know where you're going

*What to do:*
- *At home:* Ensure shoes, keys, phone, go bag in position
- *Driving:* Look for a solid building to pull over near
- *On public transport:* Follow crew instructions; bend below window line
- *Outside with children:* Identify nearest shelter; gather children close

*When the actual alert sounds:* follow standard shelter procedure (Appendix D).

== 5.12 Terrorist Infiltration / Hostile Aerial Vehicle

#warning-box[*Different protocol* from rocket/missile response. Do NOT follow standard shelter procedure.]

#v(0.2cm)

+ *Enter the nearest building* immediately
+ *Lock the door.* Barricade if needed
+ *Lights off.* Stay in darkness
+ *Stay silent.* TV, radio, noise off
+ *Below window line.* Away from windows and exterior walls
+ *Do NOT share your location on social media*
+ *Do NOT open the door* except for identified security forces
+ *If rocket alert sounds during infiltration: stay where you are*
+ *Wait for security forces* — may take hours

*Mamad door:* Do NOT remove the handle. Block from inside with heavy object.

*Licensed weapon holders:* Aim at front door. Fire only on positive ID.#footnote[Based on Home Front Command protocol as of 20 March 2026. Always verify with current HFC guidance at oref.org.il.]

// ══════════════════════════════════════════════
// CHAPTER 6: SHABBAT / HAG
// ══════════════════════════════════════════════
#set-section("Ch. 6: Shabbat / Hag", colour: sec-col-ch6)

= Chapter 6: Shabbat / Hag (Observant Jews)

_When phones are off and sirens are the only alert. Prepare before candle-lighting._

#v(0.3cm)

== 6.1 Before Shabbat / Hag

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-alert, [*Channel 14 / Gal Shaket* #critical], [#ci[PLAYING ON TV BEFORE SHABBAT] #linebreak() #ci(d: "Verify TV not muted")[VOLUME TESTED — AUDIBLE FROM BEDROOMS]],
  icon-radio, [*Emergency Radio* #critical], [#ci[FREQUENCY AND OPERATION VERIFIED] #linebreak() #ci[VOLUME AT MAXIMUM] #linebreak() #ci[POWER SUPPLY — AC OR BATTERIES]],
  icon-bag, [*Go Bag*], [#ci[BY DOOR] #h(4pt) #ci[CONTENTS VERIFIED]],
  icon-bag, [*Shabbat Supplies*], [#ci(d: "Siddur, kiddush cup, snacks for shelter")[PACKED]],
  icon-shoe, [*Shoes* #critical], [#ci(d: "Do not rely on slippers")[CLOSED-TOE BY BED AND BY DOOR]],
  icon-shirt, [*Clothes*], [#ci(d: "Full outfit, not just pyjamas")[LAID OUT BY BED]],
  icon-key, [*Keys*], [#ci[BY FRONT DOOR]],
  [], [*Torch*], [#ci(d: "Pre-set on nightstand")[WITHIN ARM'S REACH]],
)

#v(0.3cm)

#tip-box()[
  #set text(size: 9pt)
  *Pikuach nefesh* (preservation of life) overrides all Shabbat prohibitions. If a siren sounds, you may — and *must* — use your phone, carry items, and do whatever is needed to reach shelter safely. This is not a leniency; it is *halacha*.
]

== 6.2 During Shabbat / Hag

- *Sirens are your primary alert.* Keep windows slightly open so you can hear outdoor sirens
- *TV or radio must stay on and audible* throughout Shabbat — this is your only real-time information source
- *Know your shelter route in the dark* — no phone torch available (unless siren sounds)
- After an alert, *stay in shelter for 10 minutes or until all-clear on TV/radio*

#v(0.2cm)

#warning-box[
  *If you hear a siren on Shabbat:* Move to shelter immediately. Carry children, phone, go bag — whatever you need. There is no halachic question here. #footnote[Based on Home Front Command protocol as of 20 March 2026. Consult your rabbi for specific halachic guidance.]
]

// ══════════════════════════════════════════════
// APPENDICES
// ══════════════════════════════════════════════

#set-section("Appendix A: HFC App", colour: sec-col-app)

= Appendix A: Home Front Command App (Android)

#table(
  columns: (1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  [*Installed*], [#ci[VERIFIED]],
  [*Up To Date*], [#ci(d: "No pending updates")[VERIFIED]],
  [*Alerting Area*], [#ci[SET AND IDENTIFIED]],
  [*Permissions*], [#ci[DND EXEMPTION — VERIFIED]
   #linebreak() #ci[REMOVE PERMISSIONS IF UNUSED — DISABLED]
   #linebreak() #ci[BATTERY OPTIMISATIONS — DISABLED]
   #linebreak() #ci[BACKGROUND DATA ACCESS — PERMITTED]
   #linebreak() #ci[DISPLAY OVER OTHER APPS — GRANTED]],
)

#set-section("Appendix B: Emergency Numbers", colour: sec-col-app)

= Appendix B: Emergency Numbers

#block(
  width: 100%,
  radius: 6pt,
  clip: true,
  stroke: 2pt + red-alert,
)[
  #table(
    columns: (auto, 1fr, 1.5fr),
    inset: 9pt,
    stroke: 0.5pt + grey-border,
    fill: (_, y) => if y == 0 { red-alert } else if calc.odd(y) { red-light } else { white },
    align: (center, left, left),
    text(fill: white, weight: "bold", size: 9pt)[NUMBER],
    text(fill: white, weight: "bold", size: 9pt)[SERVICE],
    text(fill: white, weight: "bold", size: 9pt)[NOTES],

    text(weight: "bold", size: 14pt)[100], [*Israel Police*], [Unexploded ordnance, security incidents \ _SMS: 052-2020100_],
    text(weight: "bold", size: 14pt)[101], [*Magen David Adom*], [Injuries, first aid, medical emergencies \ _SMS: 052-7000101_],
    text(weight: "bold", size: 14pt)[102], [*Fire & Rescue*], [Fires, trapped persons, structural collapse \ _SMS: 050-5960735_],
    text(weight: "bold", size: 14pt)[103], [*Electric Corp.*], [Power outages, electrical hazards \ _SMS: 055-7000103_],
    text(weight: "bold", size: 14pt)[104], [*Home Front Command*], [Guidelines, alerts, emergency info \ _SMS: 052-9104104_],
    text(weight: "bold", size: 14pt)[106–109], [*Municipality*], [Local information, municipal assistance],
    text(weight: "bold", size: 14pt)[110], [*Police Info*], [Road blocks, police information],
  )
]

#v(0.4cm)

#table(
  columns: (auto, 1fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { green-light } else { white },
  align: (center, left),
  text(fill: white, weight: "bold", size: 9pt)[NUMBER],
  text(fill: white, weight: "bold", size: 9pt)[SUPPORT & WELFARE],

  text(weight: "bold")[118], [Welfare Ministry — Information and assistance],
  text(weight: "bold")[1201], [ERAN — Emotional first aid hotline],
  text(weight: "bold")[\*8840], [Senior Citizens — Ministry of Social Equality],
  text(weight: "bold")[\*9696], [National Insurance — Counselling],
  text(weight: "bold")[105], [Missing persons hotline],
  text(weight: "bold")[1-800-363-363], [NATAL — Trauma support],
  text(weight: "bold")[03-6919765], [NAAN — Youth crisis line],
  text(weight: "bold")[\*4954], [Tax Authority — War property damage claims],
  text(weight: "bold")[1-700-707-889], [Population Authority — Foreign workers],
  text(weight: "bold")[04-7702651], [Immigration assistance (English)],
)

#v(0.3cm)
#warning-box[
  #ci(d: "Fridge or front door, and in go bag. Do NOT rely on phone alone.")[PRINTED COPY POSTED AT HOME]
]

#set-section("Appendix C: Mamad Inspection", colour: sec-col-app)

= Appendix C: Mamad (Protected Space) Inspection

_Based on Home Front Command guidelines for residential protected spaces._ #footnote[HFC mamad inspection protocol as of 20 March 2026.]

=== Structural Inspection

#table(
  columns: (1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  [*Blast Door*], [#ci[OPENS AND CLOSES EASILY] #linebreak() #ci[HANDLE TURNS 90° UPWARD] #linebreak() #ci[DOUBLE LOCK FUNCTIONS]],
  [*Door Seal*], [#ci(d: "Not dried out or cracked — replace if brittle")[RUBBER INSULATION PRESENT]],
  [*Light Test*], [#ci(d: "Light = inadequate seal")[NO LIGHT PENETRATION WHEN SEALED]],
  [*Steel Outer Window*], [#ci[OPENS AND CLOSES EASILY]],
  [*Glass Inner Window*], [#ci[FUNCTIONS CORRECTLY] #linebreak() _Double-wing: *remove both wings* during escalation and store outside room_],
  [*Ventilation Pipes*], [#ci[RUBBER INSULATION INTACT] #linebreak() #ci[STEEL COVER SCREWS TIGHTEN FULLY]],
)

=== Contents & Safety

#table(
  columns: (1fr, 2.5fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  [*Flammable / Hazardous*], [#ci(d: "No flammable, hazardous, or toxic materials")[NONE]],
  [*Glass / Ceramics*], [#ci(d: "No glass, ceramic, porcelain that could shatter")[NONE]],
  [*Heavy Items*], [#ci[SHELVES AND HEAVY ITEMS FIXED TO WALLS]],
  [*Gas Tanks*], [#ci[3+ METRES FROM PROTECTED ROOM WALLS]],
  [*Emergency Supplies*], [#ci[STORED INSIDE OR IMMEDIATELY NEARBY]],
  [*Ceiling Fan*], [#ci(d: "Prohibited in mamads")[NONE INSTALLED]],
  [*Ventilation*], [#ci[ROOM IS VENTILATED IF USED AS BEDROOM] #linebreak() _Must NOT be used as kitchen, bathroom, or washroom_],
)

#set-section("Appendix D: Decision Tree", colour: sec-col-app)

= Appendix D: Protected Space Decision Tree

_When a Red Alert sounds, choose the highest-priority option you can reach._ #footnote[Based on Home Front Command protocol as of 20 March 2026.]

#warning-box[
  *WHEN TO LEAVE:* Stay for *10 minutes OR until all-clear* — whichever comes later. \
  *Siren duration = defense time.* Border areas may have 15 seconds or less.
]

#v(0.5cm)

#align(center)[
  #diagram(
    spacing: (15pt, 20pt),
    node-stroke: 1.2pt + blue-mid,
    edge-stroke: 1.2pt + blue-mid,

    node((0, 0), text(fill: white, weight: "bold", size: 11pt)[RED ALERT SOUNDS], fill: red-alert, stroke: 2pt + red-alert, corner-radius: 8pt, inset: 14pt, name: <start>),

    node((0, 1.2), align(center)[Do you have a \ *MAMAD / MAMAK / MAMAM*?], fill: blue-light, corner-radius: 6pt, inset: 12pt, shape: fletcher.shapes.diamond, name: <q1>),
    edge(<start>, <q1>, "->"),

    node((2, 1.2), align(center)[*PRIORITY 1: MAMAD* \ Close blast door (handle 90°) \ Close steel + glass windows \ Sit against inner wall \ ★ WAIT FOR ALL-CLEAR], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 10pt, name: <a1>),
    edge(<q1>, <a1>, "->", label: text(fill: green-calm, weight: "bold", size: 12pt)[Y]),

    node((0, 2.6), align(center)[Can you reach a \ *SHELTER* in time?], fill: blue-light, corner-radius: 6pt, inset: 12pt, shape: fletcher.shapes.diamond, name: <q2>),
    edge(<q1>, <q2>, "->", label: text(fill: red-alert, weight: "bold", size: 12pt)[N]),

    node((2, 2.6), align(center)[*PRIORITY 2: SHELTER* \ Building or public shelter \ Enter and close the door \ ★ WAIT FOR ALL-CLEAR], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 10pt, name: <a2>),
    edge(<q2>, <a2>, "->", label: text(fill: green-calm, weight: "bold", size: 12pt)[Y]),

    node((0, 4.0), align(center)[*INNER STAIRWELL* \ (no windows)?], fill: blue-light, corner-radius: 6pt, inset: 12pt, shape: fletcher.shapes.diamond, name: <q3>),
    edge(<q2>, <q3>, "->", label: text(fill: red-alert, weight: "bold", size: 12pt)[N]),

    node((2, 4.0), align(center)[*PRIORITY 3: STAIRWELL* \ Centre floor — not top, not ground \ Stay on staircase, not hallway \ ★ WAIT FOR ALL-CLEAR], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 10pt, name: <a3>),
    edge(<q3>, <a3>, "->", label: text(fill: green-calm, weight: "bold", size: 12pt)[Y]),

    node((0, 5.4), align(center)[*INNER ROOM* \ (max walls, min windows)?], fill: blue-light, corner-radius: 6pt, inset: 12pt, shape: fletcher.shapes.diamond, name: <q4>),
    edge(<q3>, <q4>, "->", label: text(fill: red-alert, weight: "bold", size: 12pt)[N]),

    node((2, 5.4), align(center)[*PRIORITY 4: INNER ROOM* \ Inner wall, below window line \ Not facing door. Close all doors. \ ★ WAIT FOR ALL-CLEAR], fill: green-light, stroke: 1.5pt + green-calm, corner-radius: 6pt, inset: 10pt, name: <a4>),
    edge(<q4>, <a4>, "->", label: text(fill: green-calm, weight: "bold", size: 12pt)[Y]),

    node((0, 6.6), align(center)[*PRIORITY 5: LAST RESORT* \ Lie flat on the ground \ Protect head with hands \ ★ WAIT FOR ALL-CLEAR], fill: rgb("#fff3cd"), stroke: 1.5pt + rgb("#856404"), corner-radius: 6pt, inset: 12pt, name: <a5>),
    edge(<q4>, <a5>, "->", label: text(fill: red-alert, weight: "bold", size: 12pt)[N]),
  )
]

#v(0.5cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: red-light,
  radius: 4pt,
  stroke: 1pt + red-alert,
)[
  *⛔ NOT valid:* Kitchen · Bathroom · Toilet · Building entrance lobby · Caravans / prefab · Areas with ceramics, porcelain, or glass
]

*Stairwell positioning:* 3+ floors: at least 2 floors above you. 3-storey building: middle floor only.

#set-section("Appendix E: Hebrew Glossary", colour: sec-col-app)

= Appendix E: Hebrew Glossary

_Key terms you will hear on the news, in alerts, and from neighbours._

#table(
  columns: (auto, auto, 1fr),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (right, left, left),
  text(fill: white, weight: "bold", size: 9pt)[HEBREW],
  text(fill: white, weight: "bold", size: 9pt)[TRANSLITERATION],
  text(fill: white, weight: "bold", size: 9pt)[MEANING],

  [אזעקה], [*Azaka*], [Alert / siren],
  [צבע אדום], [*Tzeva Adom*], ["Red Color" — the Red Alert warning],
  [ממ״ד], [*Mamad*], [Apartment-level protected space],
  [ממ״ק], [*Mamak*], [Floor-level protected space],
  [ממ״מ], [*Mamam*], [Institutional protected space],
  [מקלט], [*Miklat*], [Public bomb shelter],
  [חדר מדרגות], [*Khadar Madregot*], [Stairwell],
  [פיקוד העורף], [*Pikud HaOref*], [Home Front Command (HFC)],
  [התרעה מקדימה], [*Hatra'a Makdima*], [Preliminary guideline],
  [הנחיה מיוחדת], [*Hankhaya Meyukhedet*], [Special instruction],
  [ירי רקטות], [*Yeri Raketot*], [Rocket fire],
  [חדירת כלי טיס עוין], [*Khadirat Kli Tis Oyein*], [Hostile aerial vehicle],
  [חדירת מחבלים], [*Khadirat Mekhabblim*], [Terrorist infiltration],
  [רעידת אדמה], [*Re'idat Adama*], [Earthquake],
  [חומרים מסוכנים], [*Khomarim Mesukanim*], [Hazardous materials],
  [ניתן לצאת], [*Nitan Latzeit*], ["You may exit" — all-clear],
  [היכנסו למרחב המוגן], [*Hikansu LaMerkhav HaMugan*], ["Enter the protected space"],
  [שהו במרחב המוגן], [*Shehu BaMerkhav HaMugan*], ["Remain in the protected space"],
  [דלת פלדה], [*Delet Plada*], [Steel/blast door],
  [חלון פלדה], [*Khalon Plada*], [Steel window],
  [תריס], [*Tris*], [Shutter],
  [פנס], [*Panas*], [Torch / flashlight],
  [תיק חירום], [*Tik Kherum*], [Emergency bag (go bag)],
  [מד״א], [*Mada*], [Magen David Adom],
  [צה״ל], [*Tzahal*], [IDF],
  [משטרה], [*Mishtara*], [Police],
  [כבאות], [*Kaba'ut*], [Fire service],
  [ועד בית], [*Va'ad Bayit*], [Building committee],
  [עורף], [*Oref*], [Home front (civilian rear)],
)

#set-section("Appendix F: Radio Frequencies", colour: sec-col-app)

= Appendix F: Emergency Radio Frequencies #h(6pt) #icon-radio

_If phone and internet are down, a battery-powered or hand-crank AM/FM radio is your lifeline._

#table(
  columns: (1fr, auto, auto, 1.5fr),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[STATION],
  text(fill: white, weight: "bold", size: 9pt)[FM],
  text(fill: white, weight: "bold", size: 9pt)[AM],
  text(fill: white, weight: "bold", size: 9pt)[NOTES],

  [*Reshet Bet* (כאן ב׳)], [95.5 / 97.8], [657 / 1206], [Primary national news; HFC announcements],
  [*Galei Tzahal* (גלצ)], [102.3 / 103.0], [—], [IDF Radio; security updates],
  [*Reshet Aleph* (כאן א׳)], [100.3 / 104.0], [531 / 1008], [National talk and news],
  [*Reshet Gimel* (כאן ג׳)], [97.0 / 99.0], [—], [Hebrew music + news bulletins],
  [*Kol Israel Arabic*], [99.5], [576 / 711], [Arabic-language alerts],
  [*Reka* (כאן רק״ע)], [101.5 / 104.5], [972], [Russian/Amharic/French/English],
)

#v(0.3cm)
#tip-box()[
  #set text(size: 9pt)
  - FM frequencies vary by region — scan nearby if no signal
  - *AM is more reliable* during emergencies — longer range, works better inside buildings
  - During emergencies, all stations simulcast HFC announcements
  - *Write your local frequencies on the radio itself* with a permanent marker
]

// ══════════════════════════════════════════════
// APPENDIX G: PRE-EMERGENCY HOME SAFETY
// ══════════════════════════════════════════════
#set-section("Appendix G: Home Safety", colour: sec-col-app)

= Appendix G: Pre-Emergency Home Safety

_These tasks should be completed before an emergency — during routine periods. They are not wartime-active checks._

#v(0.3cm)

#table(
  columns: (auto, 1fr, 2fr),
  inset: 9pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  text(fill: white, weight: "bold", size: 9pt)[],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],

  icon-house, [*Bookcases & Shelves*],
  [#ci[SECURED TO WALLS WITH L-BRACKETS OR STRAPS]
   #linebreak()
   #ci(d: "Not above head height")[HEAVY OBJECTS STORED LOW]],

  icon-house, [*Appliances*],
  [#ci[WHEELED APPLIANCES — WHEELS LOCKED]
   #linebreak()
   #ci[HEAVY APPLIANCES — STABLE AND SECURED]],

  icon-bolt, [*Gas Shutoff* #critical],
  [#ci(d: "By all household members")[LOCATION KNOWN]
   #linebreak()
   #ci[ALL MEMBERS KNOW HOW TO SHUT OFF]
   #linebreak()
   #ci(d: "Turn clockwise 90° to close")[OPERATION TESTED]],

  icon-bolt, [*Electricity Shutoff* #critical],
  [#ci(d: "Main breaker box")[LOCATION KNOWN]
   #linebreak()
   #ci[ALL MEMBERS KNOW HOW TO SHUT OFF]],

  icon-fire, [*Fire Extinguisher*],
  [#ci[ACCESSIBLE AND NOT EXPIRED]
   #linebreak()
   #ci[ALL MEMBERS KNOW HOW TO USE]],

  icon-fire, [*Smoke Detector*],
  [#ci[INSTALLED — ONE PER FLOOR MINIMUM]
   #linebreak()
   #ci(d: "Test monthly")[TESTED AND WORKING]
   #linebreak()
   #ci[BATTERIES REPLACED ANNUALLY]],

  icon-water, [*Water Heater*],
  [#ci(d: "To prevent toppling")[STRAPPED TO WALL]],

  icon-house, [*Windows*],
  [#ci(d: "Can shatter into projectiles")[NO GLASS OBJECTS ON WINDOWSILLS]
   #linebreak()
   #ci[BLINDS / SHUTTERS — FUNCTIONAL]],
)

#v(0.3cm)
#tip-box()[
  #set text(size: 9pt)
  *Schedule a home safety walk-through* every 6 months, or immediately after moving. These items take 1–2 hours to set up but dramatically reduce injury risk during shaking from nearby impacts.
]

// ══════════════════════════════════════════════
// APPENDIX H: GO BAG RECOMMENDATIONS
// ══════════════════════════════════════════════
#set-section("Appendix H: Go Bag", colour: sec-col-app)

= Appendix H: Go Bag Recommendations #h(6pt) #icon-bag

_A detailed packing list. Adapt to your household size and needs._

#v(0.3cm)

=== Tier 1 — Always Packed (Critical)

#table(
  columns: (auto, 1fr, 1.5fr),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { red-alert } else if calc.odd(y) { red-light } else { white },
  align: (center, left, left),
  text(fill: white, weight: "bold", size: 9pt)[],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[NOTES],

  icon-phone, [Phone charger + cable], [One per device type],
  icon-phone, [Power bank], [10,000+ mAh; check charge weekly],
  icon-medkit, [Essential medications], [7-day supply; rotate monthly],
  [], [Torch + spare batteries], [Or hand-crank torch],
  [], [N95 masks], [One per person; sealed in bag],
  icon-water, [Water bottle], [1L minimum per person],
  [], [Emergency whistle], [Audible from under debris],
  icon-medkit, [First aid kit], [Bandages, antiseptic, pain relief, scissors],
  [], [Copies of this guide], [Laminated or in waterproof sleeve],
)

=== Tier 2 — Recommended Additions

#table(
  columns: (auto, 1fr, 1.5fr),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { blue-light } else { white },
  align: (center, left, left),
  text(fill: white, weight: "bold", size: 9pt)[],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[NOTES],

  icon-radio, [AM/FM radio], [Battery or crank; write frequencies on it],
  [], [Travel router + ethernet], [For shelter with wired internet],
  [], [Plug adapters / splitters], [Shelter outlets are shared],
  [], [Cash (NIS)], [Small bills; ATMs may be down],
  [], [Passports + national IDs], [Copies in waterproof pouch],
  [], [Emergency contact list], [Printed; phones die],
  [], [Multi-tool or Swiss Army knife], [Blade, opener, screwdriver],
  [], [Duct tape + zip ties], [Universal repair],
  [], [Permanent marker + paper], [For notes if no phone],
)

=== Tier 3 — Extended Stay (4+ Hours / Overnight)

#table(
  columns: (auto, 1fr, 1.5fr),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: (center, left, left),
  text(fill: white, weight: "bold", size: 9pt)[],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[NOTES],

  icon-food, [Non-perishable snacks], [Energy bars, nuts, dried fruit, crackers],
  icon-water, [Extra water], [3L per person per day],
  [], [Eye mask + earplugs], [Sleep in shared shelter],
  [], [Blanket or emergency bivvy], [Aluminium emergency blankets are compact],
  [], [Change of clothes], [Including socks and underwear],
  [], [Toiletries bag], [Toothbrush, wet wipes, hand sanitiser],
  [], [Entertainment], [Book, cards, colouring for children],
  icon-bag, [Religious items], [Siddur, tefillin (if applicable)],
  [], [Umbrella], [For walking to shelter in rain],
)

#v(0.3cm)
#tip-box()[
  #set text(size: 9pt)
  *Rotation schedule:* Check medications and power bank monthly. Rotate food and water every 3 months. Replace batteries every 6 months. Update documents annually.
]

// ══════════════════════════════════════════════
// APPENDIX I: EMERGENCY PANTRY STAPLES
// ══════════════════════════════════════════════
#set-section("Appendix I: Pantry Staples", colour: sec-col-app)

= Appendix I: Emergency Pantry Staples (Israel)

_Items commonly available in Israeli supermarkets. Focus on shelf-stable, calorie-dense, minimal-preparation foods. All items below are available kosher._

#v(0.3cm)

=== Water

- *3 litres per person per day* (drinking + basic hygiene)
- *Minimum 72-hour supply* → 9L per person
- Store in sealed containers away from sunlight
- Rotate every 6 months
- *Tip:* freeze extra bottles — they keep food cold if power fails and become drinking water as they melt

=== Staple Foods

#table(
  columns: (1fr, 1.5fr, auto),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[CATEGORY],
  text(fill: white, weight: "bold", size: 9pt)[ITEMS],
  text(fill: white, weight: "bold", size: 9pt)[SHELF LIFE],

  [*Canned Goods*],
  [Tuna (שימורי טונה) · Chickpeas (חומוס) · Corn · Beans · Tomatoes · Sardines],
  [2–5 years],

  [*Grains & Starches*],
  [Rice · Pasta · Couscous · Matza / crackers · Instant oatmeal],
  [1–2 years],

  [*Proteins*],
  [Canned tuna/sardines · Tahini (טחינה) · Halva (חלווה) · Peanut butter · Canned hummus],
  [6–24 months],

  [*Dried Goods*],
  [Lentils (עדשים) · Dried fruits · Nuts · Sunflower seeds · Bamba],
  [6–12 months],

  [*Quick Energy*],
  [Energy bars · Chocolate · Honey · Jam · Sugar · Dates (תמרים)],
  [6–24 months],

  [*Beverages*],
  [Instant coffee · Tea bags · Powdered milk · Juice boxes (UHT)],
  [6–12 months],

  [*Cooking Aids*],
  [Salt · Cooking oil · Instant soup mix (קנורר) · Spices],
  [1–2 years],

  [*Baby / Special*],
  [Formula · Baby food jars · Gluten-free alternatives · Ensure/Ensure-type drinks],
  [Check labels],
)

#v(0.3cm)

=== Practical Tips

#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  [
    - *Buy items you actually eat* — rotate through normal cooking
    - *FIFO:* First In, First Out — new stock to the back
    - *Label everything* with purchase date
    - *No power = no fridge:* plan for shelf-stable only
    - *Can opener:* keep one with the pantry supplies (not in a drawer you won't find in the dark)
  ],
  [
    - *Kashrut:* all items above are available with hechsher at major Israeli chains (Shufersal, Rami Levy, Yochananof)
    - *Pesach:* maintain a separate small stock of kitniyot-free / Pesach-suitable items if needed
    - *Babies:* maintain *at least 2 weeks* of formula at all times
    - *Special diets:* stock according to medical needs first
  ],
)

#v(0.3cm)

#calm-box[
  #set text(size: 9pt)
  *Don't panic-buy.* Build your stock gradually over 2–3 weeks. Add a few extra items to each regular shop. This is sustainable and doesn't empty shelves for others.
]

// ══════════════════════════════════════════════
// REFERENCES
// ══════════════════════════════════════════════
#set-section("References", colour: sec-col-app)

= References

_All sources from the Israel Home Front Command (Pikud HaOref) English-language National Emergency Portal. Accessed and archived: 20 March 2026._

#v(0.3cm)

#table(
  columns: (1fr, 2fr),
  inset: 8pt,
  stroke: 0.5pt + grey-border,
  fill: (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white },
  align: left,
  text(fill: white, weight: "bold", size: 9pt)[TOPIC],
  text(fill: white, weight: "bold", size: 9pt)[SOURCE],

  [Protection Guidelines],
  [oref.org.il/eng/emergencies/protection-guidelines],

  [Emergency Supplies],
  [oref.org.il/eng/articles/info/preparing-protected-space/1201],

  [Reaching Shelter],
  [oref.org.il/eng/articles/protection-guidelines/preparing-protected-space/1103],

  [Residential Protected Space],
  [oref.org.il/eng/articles/info/preparing-protected-space/1205],

  [Types of Protected Area],
  [oref.org.il/eng/articles/info/preparing-protected-space/1212],

  [Communal Shelter Preparation],
  [oref.org.il/eng/articles/protection-guidelines/preparing-protected-space/1704],

  [Emergency Phone Numbers],
  [oref.org.il/eng/articles/emergency-preparedness/preparing-routine/1211],

  [FAQs — All],
  [oref.org.il/eng/questions-answers/faq],

  [FAQs — Rockets & Missiles],
  [oref.org.il/eng/questions-answers/rockets-missles-faq],

  [FAQs — Defensive Guidelines],
  [oref.org.il/eng/questions-answers/defensive-guidelines-faq],

  [FAQs — Receiving Alerts],
  [oref.org.il/eng/questions-answers/receiving-alerts-faq],

  [FAQs — Emergency Preparedness],
  [oref.org.il/eng/questions-answers/emergency-coping-faq],
)

#v(0.3cm)

#block(
  width: 100%,
  inset: 10pt,
  fill: grey-light,
  radius: 4pt,
)[
  #text(size: 9pt, style: "italic")[
    Source HTML files are preserved in the `sources/hfc-official/` directory of this repository for transparency and verification. Always consult oref.org.il for the most current guidance.
  ]
]

// ══════════════════════════════════════════════
// DISCLAIMER (LAST PAGE)
// ══════════════════════════════════════════════
#set-section("Disclaimer", colour: sec-col-app)

#pagebreak()

#block(
  width: 100%,
  inset: 16pt,
  fill: grey-light,
  radius: 8pt,
  stroke: 1pt + grey-border,
)[
  #align(center, text(size: 14pt, weight: "bold", fill: blue-dark)[Disclaimer])
  #v(0.3cm)

  This document is *not an official government resource*. It is a community-authored field guide compiled by Daniel Rosehill with AI assistance (Claude Opus), based on publicly available guidance from the Israel Home Front Command (Pikud HaOref / פיקוד העורף).

  #v(0.2cm)
  *Grounding source:* Cross-referenced against official HFC guidance from oref.org.il, archived *20 March 2026*. Source HTML files preserved in the `sources/hfc-official/` directory.

  #v(0.2cm)
  *Always defer to official instructions* from HFC, the IDF, Israel Police, and local authorities. This document is provided as-is, with no warranty.

  #v(0.3cm)
  #align(center)[
    *Official source:* oref.org.il  |  *HFC Hotline:* 104
    #v(0.3cm)
    #image(beyahad, width: 5cm)
    #v(0.3cm)
    _Share freely with attribution. Modify as needed for your household._
  ]
]
