// Combined Booklet — All checklists with page numbers, checklist name footers,
// and alternating colour bars for visual tab indexing.
// This is the print-shop file for the spiral-bound booklet.

#import "printables/preamble.typ": *
#import "printables/title-page.typ": title-page-content
#import "printables/how-to-use.typ": how-to-use-content
#import "printables/index-page.typ": index-page-content
#import "printables/01-paws-bed.typ": quick-readiness-content
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
// STATE: tracks current checklist name + colour for footer
// ═══════════════════════════════════════

#let section-name = state("section-name", "")
#let section-colour = state("section-colour", blue-dark)

// ═══════════════════════════════════════
// PAGE SETUP — SOP name in header, page number in both header & footer
// Bright coloured bars, large text for quick visual identification
// ═══════════════════════════════════════

#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 1.5cm, right: 1.5cm),
  header: context {
    let pg = counter(page).get().first()
    // Find markers on this page, fall back to most recent before this page
    let all-markers = query(<section-marker>)
    let current-page = here().page()
    let on-page = all-markers.filter(m => m.location().page() == current-page)
    let before = all-markers.filter(m => m.location().page() < current-page)
    let latest = if on-page.len() > 0 { on-page.first() } else if before.len() > 0 { before.last() } else { none }
    if pg > 1 and latest != none {
      let name = section-name.at(latest.location())
      let colour = section-colour.at(latest.location())
      block(
        width: 100%,
        inset: (x: 12pt, y: 8pt),
        fill: colour,
        radius: 3pt,
      )[
        #text(size: 10pt, fill: white, weight: "bold")[#name]
        #h(1fr)
        #text(size: 14pt, fill: white, weight: "bold")[#pg]
      ]
    }
  },
  footer: context {
    let pg = counter(page).get().first()
    let all-markers = query(<section-marker>)
    let current-page = here().page()
    let on-page = all-markers.filter(m => m.location().page() == current-page)
    let before = all-markers.filter(m => m.location().page() < current-page)
    let latest = if on-page.len() > 0 { on-page.first() } else if before.len() > 0 { before.last() } else { none }
    if pg > 1 and latest != none {
      let name = section-name.at(latest.location())
      let colour = section-colour.at(latest.location())
      block(
        width: 100%,
        inset: (x: 12pt, y: 8pt),
        fill: colour,
        radius: 3pt,
      )[
        #text(size: 14pt, fill: white, weight: "bold")[#pg]
        #h(1fr)
        #text(size: 10pt, fill: white, weight: "bold")[#name]
      ]
    }
  },
)

#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)

// ═══════════════════════════════════════
// TITLE PAGE (no header/footer)
// ═══════════════════════════════════════

#title-page-content()

// Helper: start a new section (pagebreak, update state, place marker, render content)
#let section(name, colour, content) = {
  pagebreak()
  section-name.update(name)
  section-colour.update(colour)
  [#metadata(name) <section-marker>]
  content
}

// ═══════════════════════════════════════
// HOW TO USE + INDEX
// ═══════════════════════════════════════

#section("How to Use", blue-dark, how-to-use-content())
#section("Index", blue-dark, index-page-content())

// ═══════════════════════════════════════
// GENERAL READINESS
// ═══════════════════════════════════════

#section("Quick Readiness Check", rgb("#0e7c47"), quick-readiness-content())
#section("Daytime At-Home Posture", rgb("#d35400"), daytime-posture-content())
#section("Before Bed Checklist", blue-dark, before-bed-content())
#section("Night Alarm — 30-Second Drill", red-alert, night-alarm-content())

// ═══════════════════════════════════════
// SITUATIONAL — ROCKETS & MISSILES
// ═══════════════════════════════════════

#section("Before Showering", blue-accent, before-shower-content())
#section("Before Leaving Home", rgb("#d35400"), before-leaving-content())
#section("After Shelter — Reset", rgb("#d35400"), after-shelter-content())
#section("Bathing a Baby", green-calm, bathing-baby-content())

// ═══════════════════════════════════════
// SHABBAT & SPECIAL
// ═══════════════════════════════════════

#section("Shabbat / Hag", purple-shab, shabbat-content())

// ═══════════════════════════════════════
// REFERENCE & MAINTENANCE
// ═══════════════════════════════════════

#section("Emergency Numbers", red-alert, emergency-numbers-content())
#section("Situational Awareness — Standard", blue-dark, news-standard-content())
#section("Situational Awareness — Extra Vigilant", red-alert, news-vigilant-content())
#section("Respiratory Protection", orange-warm, respiratory-content())
#section("Lull / Resupply", green-calm, lull-resupply-content())

// ═══════════════════════════════════════
// SPECIFIC THREAT PROTOCOLS
// ═══════════════════════════════════════

#section("Terrorist Infiltration", red-alert, terrorist-infiltration-content())
#section("UAV / Drone Alert", rgb("#d35400"), uav-drone-content())
