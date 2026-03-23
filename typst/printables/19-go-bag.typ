// Printable: Go Bag Preparation Checklist
#import "preamble.typ": *

#let go-bag-content() = [
  #printable-header("Go Bag Preparation Checklist", colour: rgb("#0e7c47"), icon-content: icon-bag)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[Check monthly: meds, power bank, food, water. Replace batteries every 6 months. Update documents annually.]
  #v(0.15cm)
  #cr-instructions()
  #v(0.2cm)

  #text(size: 10pt, weight: "bold", fill: red-alert)[Bag Ready]
  #v(0.1cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 8pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-bag, [*Bag* #critical],
    [#cr-line("Available?", [*YES*])
     #linebreak() #cr-line("Assigned?", [*ONE PER PERSON*])
     #linebreak() #cr-line("Ready for use?", [*BY DOOR — ZIPPED*])],
  )

  #v(0.3cm)
  #text(size: 10pt, weight: "bold", fill: red-alert)[Essential Items]
  #v(0.1cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 8pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-phone, [*Charger + Cable* #critical],
    [#cr-line("Packed?", [*YES*], d: "One per device type")],
    icon-bolt, [*Power Bank* #critical],
    [#cr-line("Packed & charged?", [*10,000+ mAh*], d: "Check charge weekly")],
    icon-medkit, [*Medications* #critical],
    [#cr-line("7-day supply?", [*PACKED*], d: "Rotate monthly")],
    icon-bolt, [*Torch*],
    [#cr-line("Packed?", [*YES + SPARE BATTERIES*], d: "Or hand-crank torch")],
    icon-mask, [*N95 Masks*],
    [#cr-line("Packed?", [*ONE PER PERSON*], d: "Sealed in bag")],
    icon-water, [*Water Bottle*],
    [#cr-line("Packed?", [*1L MIN PER PERSON*])],
    icon-alert, [*Whistle*],
    [#cr-line("Packed?", [*YES*], d: "Audible from under debris")],
    icon-medkit, [*First Aid Kit*],
    [#cr-line("Packed?", [*YES*], d: "Bandages, antiseptic, pain relief, scissors")],
  )

  #v(0.3cm)
  #text(size: 10pt, weight: "bold", fill: blue-dark)[Recommended Additions]
  #v(0.1cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 8pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-radio, [*AM/FM Radio*],
    [#cr-line("Packed?", [*YES*], d: "Battery or crank; write frequencies on it")],
    icon-laptop, [*Travel Router*],
    [#cr-line("Packed?", [*+ ETHERNET*], d: "For shelter with wired internet")],
    icon-bolt, [*Plug Adapters*],
    [#cr-line("Packed?", [*YES + SPLITTERS*], d: "Shelter outlets are shared")],
    icon-key, [*Cash (NIS)*],
    [#cr-line("On hand?", [*SMALL BILLS*], d: "ATMs may be down")],
    icon-key, [*IDs & Passports*],
    [#cr-line("Packed?", [*WATERPROOF POUCH*])],
    icon-phone, [*Contact List*],
    [#cr-line("Printed?", [*YES*], d: "Phones die")],
  )

  #v(0.3cm)
  #text(size: 10pt, weight: "bold", fill: blue-mid)[Longer Stay Items (4+ Hours)]
  #v(0.1cm)

  #table(
    columns: (auto, 1fr, 2.5fr),
    inset: 8pt,
    stroke: 0.5pt + grey-border,
    fill: checklist-table-fill,
    align: (center, left, left),
    ..checklist-table-headers(),
    icon-food, [*Snacks*],
    [#cr-line("Packed?", [*YES*], d: "Energy bars, nuts, dried fruit, crackers")],
    icon-water, [*Extra Water*],
    [#cr-line("Packed?", [*3L / PERSON / DAY*])],
    icon-shirt, [*Change of Clothes*],
    [#cr-line("Packed?", [*YES*], d: "Including socks and underwear")],
    icon-moon, [*Sleep Kit*],
    [#cr-line("Packed?", [*EYE MASK + EARPLUGS*], d: "For sleeping in shared shelter")],
    icon-shield, [*Blanket*],
    [#cr-line("Packed?", [*EMERGENCY BIVVY*], d: "Aluminium blankets are compact")],
  )
]
