// How to Use — Instructions page for the booklet
#import "preamble.typ": *

#let how-to-use-content() = [
  #printable-header("How to Use These Checklists", colour: blue-dark)

  #v(0.4cm)

  #text(size: 10pt)[
    These checklists use a *call-and-respond* format — the same method used in aviation pre-flight checks, military readiness drills, and surgical safety protocols. It works because it forces you to *verify* each item, not just glance at it.
  ]

  #v(0.5cm)

  // === WITH A PARTNER ===

  #block(
    width: 100%,
    inset: 14pt,
    fill: blue-light,
    radius: 8pt,
    stroke: 1.5pt + blue-accent,
  )[
    #text(size: 13pt, weight: "bold", fill: blue-dark)[With a Partner or Family]
    #v(8pt)
    #set text(size: 10pt)

    Form a pair. One person is the *Caller*, the other is the *Responder*.

    #v(6pt)

    #block(
      width: 100%,
      inset: 12pt,
      fill: white,
      radius: 6pt,
      stroke: 1pt + blue-accent,
    )[
      #text(size: 9pt, fill: grey-text, style: "italic")[Example — Before Bed Checklist:]
      #v(6pt)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 10pt,
        row-gutter: 8pt,
        text(weight: "bold", fill: blue-dark)[Caller:],
        ["Phone — charge status?"],
        text(weight: "bold", fill: rgb("#0e7c47"))[Responder:],
        [#text(weight: "bold")["CHARGING."] _(checks the box)_],
        text(weight: "bold", fill: blue-dark)[Caller:],
        ["Phone — phone mode?"],
        text(weight: "bold", fill: rgb("#0e7c47"))[Responder:],
        [#text(weight: "bold")["ACTIVE — not in airplane mode."] _(checks the box)_],
        text(weight: "bold", fill: blue-dark)[Caller:],
        ["Clothes — outfit?"],
        text(weight: "bold", fill: rgb("#0e7c47"))[Responder:],
        [#text(weight: "bold")["LAID OUT by bed."] _(checks the box)_],
      )
    ]

    #v(8pt)

    *Alternate roles.* The Caller for tonight's Before Bed checklist becomes the Responder for tomorrow's. This ensures both people know every item.

    #v(4pt)

    With children old enough to participate, let them be the Caller — it teaches them the drill and gives them a sense of control.
  ]

  #v(0.5cm)

  // === SOLO ===

  #block(
    width: 100%,
    inset: 14pt,
    fill: green-light,
    radius: 8pt,
    stroke: 1.5pt + green-calm,
  )[
    #text(size: 13pt, weight: "bold", fill: green-calm)[Solo — Read Aloud]
    #v(8pt)
    #set text(size: 10pt)

    Read each call name aloud, then answer it yourself — out loud, not in your head.

    #v(6pt)

    #block(
      width: 100%,
      inset: 12pt,
      fill: white,
      radius: 6pt,
      stroke: 1pt + green-calm,
    )[
      #text(size: 9pt, fill: grey-text, style: "italic")[Example — solo:]
      #v(6pt)
      #text(size: 10pt)[
        _"Charge status?"_ — look at phone — #text(weight: "bold")["Charging."] _(check)_ \
        _"Phone mode?"_ — check screen — #text(weight: "bold")["Active."] _(check)_ \
        _"Hallway?"_ — glance — #text(weight: "bold")["Clear."] _(check)_
      ]
    ]

    #v(8pt)

    *Why aloud?* Speaking activates different memory pathways than reading silently. After a few repetitions, you'll run through the critical items automatically — even at 3am, even under stress. This is how pilots build muscle memory for emergency checklists.
  ]

  #v(0.5cm)

  // === TIPS ===

  #block(
    width: 100%,
    inset: 14pt,
    fill: grey-light,
    radius: 6pt,
    stroke: 1pt + grey-border,
  )[
    #text(size: 11pt, weight: "bold", fill: blue-dark)[Tips]
    #v(6pt)
    #set text(size: 9.5pt)
    - *Do not skip items* because they seem obvious. The point of a checklist is to catch the thing you forgot.
    - *If an item fails* — fix it now, not later. A checklist with unchecked items is a warning sign.
    - *Prioritise government sources* for situational awareness: HFC app, IDF Spokesperson, oref.org.il. Social media rumours cost lives.
    - *Keep this booklet by the front door.* The high-vis tape on the cover makes it findable in the dark.
  ]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#how-to-use-content()
#printable-footer()
