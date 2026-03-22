// Shared preamble for standalone printable compilation
#import "@preview/fontawesome:0.5.0": *

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
#let purple-shab = rgb("#8e44ad")

// Icon helpers
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
#let icon-food = icon("utensils")
#let icon-car = icon("car")
#let icon-clock = icon("clock")
#let icon-mask = icon("head-side-mask", colour: orange-warm)
#let icon-news = icon("newspaper", colour: blue-dark)

// Checkbox
#let checkbox = box(
  width: 11pt, height: 11pt,
  stroke: 1.5pt + blue-mid,
  radius: 2pt,
  inset: 0pt,
)

// Critical marker — right-aligned in ITEM column
#let critical = h(1fr) + text(fill: red-alert, weight: "bold", size: 12pt)[⚠]

// Call-respond line: checkbox left, BOLD call name, response RIGHT-ALIGNED
// Description on new line, left-aligned, italics, capitalised
// Usage: cr-line("Charge Status?", [*CHARGING* or *CHARGED*])
#let cr-line(name, response, d: none) = {
  checkbox
  h(3pt)
  text(size: 9pt, fill: blue-dark, weight: "bold")[#name]
  h(1fr)
  response
  if d != none {
    linebreak()
    h(15pt)
    text(style: "italic", size: 8.5pt, fill: grey-text)[#d]
  }
}

// Legacy checklist item (bold response) — kept for non-call-respond contexts
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

// Call-respond instructions block
#let cr-instructions() = {
  block(
    width: 100%,
    inset: 8pt,
    fill: grey-light,
    radius: 4pt,
  )[
    #text(size: 8.5pt, style: "italic")[
      *Two-person drill:* one person reads the CALL column aloud, the other responds. Alternate roles each time. \
      *Solo:* read each call aloud, then answer it yourself.
    ]
  ]
}

// Printable header bar
#let printable-header(title, colour: blue-dark, icon-content: none) = {
  block(
    width: 100%,
    inset: (x: 14pt, y: 10pt),
    fill: colour,
    radius: 6pt,
  )[
    #align(center)[
      #text(size: 14pt, weight: "bold", fill: white)[
        #if icon-content != none { icon-content; h(6pt) }
        #title
      ]
    ]
  ]
}

// Printable footer (standalone only — combined PDF uses its own)
#let printable-footer() = {
  v(1fr)
  line(length: 100%, stroke: 0.5pt + grey-border)
  v(3pt)
  text(size: 7pt, fill: grey-text)[
    Israel Wartime Readiness Field Guide · V4 · danielrosehill.com
    #h(1fr)
    Print and post visibly. Replace when updated.
  ]
}

// Standard page setup for standalone printables
#let standalone-page = (
  paper: "a4",
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
)

// Table column headers: icon | ITEM | CHECK (col 3 hidden)
#let checklist-table-headers() = (
  [],
  text(fill: white, weight: "bold", size: 9pt)[ITEM],
  text(fill: white, weight: "bold", size: 9pt)[CHECK],
)

// Standard checklist table setup
#let checklist-table-fill = (_, y) => if y == 0 { blue-dark } else if calc.odd(y) { grey-light } else { white }
