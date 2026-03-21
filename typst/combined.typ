// Combined Booklet — All checklists with page numbers, checklist name footers,
// and alternating colour bars for visual tab indexing.
// This is the print-shop file for the spiral-bound booklet.

#import "printables/preamble.typ": *
#import "printables/title-page.typ": title-page-content
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
    let name = section-name.get()
    let colour = section-colour.get()
    if pg > 1 and name != "" {
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
    let name = section-name.get()
    let colour = section-colour.get()
    if pg > 1 and name != "" {
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

// ═══════════════════════════════════════
// CHECKLISTS — each gets a coloured footer bar
// ═══════════════════════════════════════

// 1. Quick Readiness Check
#pagebreak()
#section-name.update("Quick Readiness Check")
#section-colour.update(rgb("#0e7c47"))
#quick-readiness-content()

// 2. Daytime At-Home Posture
#pagebreak()
#section-name.update("Daytime At-Home Posture")
#section-colour.update(rgb("#d35400"))
#daytime-posture-content()

// 3. Before Bed
#pagebreak()
#section-name.update("Before Bed Checklist")
#section-colour.update(blue-dark)
#before-bed-content()

// 4. After Shelter — Reset
#pagebreak()
#section-name.update("After Shelter — Reset")
#section-colour.update(rgb("#d35400"))
#after-shelter-content()

// 5. Before Showering
#pagebreak()
#section-name.update("Before Showering")
#section-colour.update(blue-accent)
#before-shower-content()

// 6. Before Leaving Home
#pagebreak()
#section-name.update("Before Leaving Home")
#section-colour.update(rgb("#d35400"))
#before-leaving-content()

// 7. Night Alarm
#pagebreak()
#section-name.update("Night Alarm — 30-Second Drill")
#section-colour.update(red-alert)
#night-alarm-content()

// 8. Emergency Numbers
#pagebreak()
#section-name.update("Emergency Numbers")
#section-colour.update(red-alert)
#emergency-numbers-content()

// 9. Shabbat / Hag
#pagebreak()
#section-name.update("Shabbat / Hag")
#section-colour.update(purple-shab)
#shabbat-content()

// 10a. Situational Awareness — Standard Wartime
#pagebreak()
#section-name.update("Situational Awareness — Standard")
#section-colour.update(blue-dark)
#news-standard-content()

// 10b. Situational Awareness — Extra Vigilant
#pagebreak()
#section-name.update("Situational Awareness — Extra Vigilant")
#section-colour.update(red-alert)
#news-vigilant-content()

// 11. Respiratory Protection
#pagebreak()
#section-name.update("Respiratory Protection")
#section-colour.update(orange-warm)
#respiratory-content()

// 12. Lull / Resupply
#pagebreak()
#section-name.update("Lull / Resupply")
#section-colour.update(green-calm)
#lull-resupply-content()

// 13. Terrorist Infiltration
#pagebreak()
#section-name.update("Terrorist Infiltration")
#section-colour.update(red-alert)
#terrorist-infiltration-content()

// 14. UAV / Drone Alert
#pagebreak()
#section-name.update("UAV / Drone Alert")
#section-colour.update(rgb("#d35400"))
#uav-drone-content()

// 15. Bathing a Baby
#pagebreak()
#section-name.update("Bathing a Baby")
#section-colour.update(green-calm)
#bathing-baby-content()
