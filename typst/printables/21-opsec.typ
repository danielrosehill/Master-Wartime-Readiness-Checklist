// Printable: INFOSEC & Information Discipline
#import "preamble.typ": *

#let infosec-content() = [
  #printable-header("INFOSEC & Information Discipline", colour: blue-dark, icon-content: icon-laptop)
  #v(0.2cm)
  #text(size: 9pt, style: "italic")[During wartime, what you share online can endanger lives — including your own.]
  #v(0.2cm)

  #block(
    width: 100%,
    inset: 10pt,
    fill: red-light,
    radius: 4pt,
    stroke: 1pt + red-alert,
  )[
    #text(size: 10pt, weight: "bold", fill: red-alert)[#fa-icon("triangle-exclamation") Even well-intentioned sharing can be lethal. When in doubt, don't post.]
  ]

  #v(0.3cm)
  #text(size: 11pt, weight: "bold", fill: green-calm)[#fa-icon("circle-check") #h(4pt) DO]
  #v(0.1cm)
  #block(inset: (left: 4pt))[
    #set text(size: 10pt)
    #text(fill: green-calm)[✓] #h(4pt) Use official sources: HFC app, IDF Spokesperson, Israel Police, established media \
    #text(fill: green-calm)[✓] #h(4pt) Check before sharing — verify with a second official source \
    #text(fill: green-calm)[✓] #h(4pt) Ask others to delete sensitive location info if you see it posted \
    #text(fill: green-calm)[✓] #h(4pt) Report suspicious or dangerous posts to platform moderators
  ]

  #v(0.4cm)
  #text(size: 11pt, weight: "bold", fill: red-alert)[#fa-icon("circle-xmark") #h(4pt) Do NOT Share]
  #v(0.1cm)
  #block(inset: (left: 4pt))[
    #set text(size: 10pt)
    #text(fill: red-alert)[✗] #h(4pt) Exact locations of impacts \
    #text(fill: red-alert)[✗] #h(4pt) Military or emergency service activity \
    #text(fill: red-alert)[✗] #h(4pt) Photos or videos revealing locations \
    #text(fill: red-alert)[✗] #h(4pt) Casualty information before families are notified
  ]

  #v(0.4cm)
  #text(size: 11pt, weight: "bold", fill: red-alert)[#fa-icon("circle-xmark") #h(4pt) Do NOT Believe]
  #v(0.1cm)
  #block(inset: (left: 4pt))[
    #set text(size: 10pt)
    #text(fill: red-alert)[✗] #h(4pt) Unverified reports on X, Telegram, WhatsApp \
    #text(fill: red-alert)[✗] #h(4pt) "Breaking" news from unknown accounts \
    #text(fill: red-alert)[✗] #h(4pt) Dramatic unconfirmed claims \
    #text(fill: red-alert)[✗] #h(4pt) Screenshots from unverified sources
  ]
]
