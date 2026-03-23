// Printable: Protected Space Decision Tree (Shelter Flowchart)
#import "preamble.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#let shelter-flowchart-content() = [
  #printable-header("Protected Space Decision Tree", colour: red-alert, icon-content: icon-shield)
  #v(0.15cm)
  #text(size: 9pt, style: "italic")[When a Red Alert sounds, choose the highest-priority option you can reach.]
  #v(0.1cm)

  #block(width: 100%, inset: 8pt, fill: red-light, radius: 4pt, stroke: 1pt + red-alert)[
    #text(size: 9pt, weight: "bold", fill: red-alert)[WHEN TO LEAVE:] #text(size: 9pt)[ Stay for *10 minutes OR until all-clear* — whichever comes later.]
  ]

  #v(0.3cm)

  #align(center)[
    #diagram(
      spacing: (15pt, 18pt),
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

  #v(0.3cm)

  #block(width: 100%, inset: 8pt, fill: red-light, radius: 4pt, stroke: 1pt + red-alert)[
    *⛔ NOT valid:* Kitchen · Bathroom · Toilet · Building entrance lobby · Caravans / prefab · Areas with ceramics, porcelain, or glass
  ]

  #v(0.1cm)
  #text(size: 9pt)[*Stairwell positioning:* 3+ floors: at least 2 floors above you. 3-storey building: middle floor only.]
]

#set page(..standalone-page)
#set text(font: "Atkinson Hyperlegible", size: 10pt, fill: grey-text)
#set par(leading: 0.7em)
#shelter-flowchart-content()
#printable-footer()
