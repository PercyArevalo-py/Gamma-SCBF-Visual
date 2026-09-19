#set page(paper: "a4", margin: 18mm)
#set text(font: "Libertinus Serif", size: 10pt)
#set heading(numbering: "1.")

#let p = json("../data/presentation.json")

= GAMMA SCBF Visual
== SCBF09 — Golden Visual Candidate

#table(
  columns: (1fr, 1fr),
  [*Beam*], [#p.beam],
  [*Shared gusset length, Lg*], [#p.lg],
  [*Upper gusset*], [#p.upper_gusset],
  [*Lower gusset*], [#p.lower_gusset],
  [*Upper Whitmore width*], [#p.upper_whitmore],
  [*Lower Whitmore width*], [#p.lower_whitmore],
  [*LRFD governing D/C*], [#p.dc_lrfd],
  [*ASD governing D/C*], [#p.dc_asd],
)

#v(8mm)
#figure(
  image("../drawings/scbf09_connection.svg", width: 100%),
  caption: [SCBF09 semantic connection geometry — schematic / NTS],
)

#v(6mm)
#block(stroke: 0.7pt, inset: 8pt)[
*Geometry status:* PARTIALLY_DIMENSIONED

DRAWING_DATA_MISSING — full fabrication-ready gusset contour coordinates are not source-defined. No unsourced dimensions are inferred.
]
