#let p = json("../data/presentation.json")
#set page(paper: "a4", margin: (x: 15mm, y: 13mm), header: context [#text(size: 7.5pt, fill: rgb("666666"))[GAMMA ARQUITECTURA E INGENIERIA  /  SCBF DESIGN REPORT]], footer: context [#text(size: 7.5pt, fill: rgb("666666"))[SCBF09  |  Engineering calculation package  |  Page #counter(page).display()]])
#set text(font: "Liberation Sans", size: 8.5pt, fill: rgb("202020"))
#set par(leading: 0.65em)
#let navy = rgb("17324d")
#let gray = rgb("f2f4f6")
#let amber = rgb("fff3cd")
#let green = rgb("e9f5ec")
#let border = rgb("c9ced3")
#let label(s) = text(size: 7pt, weight: "bold", fill: rgb("666666"), upper(s))
#let metric(k, val) = block(width: 100%, inset: 7pt, radius: 2pt, stroke: border, fill: gray)[#label(k) #v(2pt) #text(size: 11pt, weight: "bold")[#val]]
#let pill(s) = box(inset: (x: 6pt, y: 3pt), radius: 10pt, fill: green, stroke: border)[#text(size: 7pt, weight: "bold")[#s]]

#block(width: 100%, inset: (x: 10pt, y: 9pt), fill: navy)[
#text(fill: white, size: 18pt, weight: "bold")[SCBF09 - SHARED GUSSET CONNECTION] \
#text(fill: white, size: 8.5pt)[Special Concentrically Braced Frame / Golden Visual Candidate]
]
#v(7pt)
#grid(columns: (1fr,1fr,1fr,1fr), gutter: 5pt,
 metric("Beam", p.beam), metric("Shared interface Lg", p.lg), metric("LRFD governing D/C", p.dc_lrfd), metric("ASD governing D/C", p.dc_asd))
#v(6pt)
#grid(columns: (1fr, 1fr), gutter: 5pt,
 block(inset: 7pt, stroke: border)[#label("Upper connection") \ *Gusset:* #p.upper_gusset  |  *Whitmore:* #p.upper_whitmore],
 block(inset: 7pt, stroke: border)[#label("Lower connection") \ *Gusset:* #p.lower_gusset  |  *Whitmore:* #p.lower_whitmore])
#v(7pt)
#grid(columns: (1fr, auto), align: horizon, [#text(size: 11pt, weight:"bold", fill: navy)[CONNECTION GEOMETRY]], [#pill("PASS - ENGINEERING")])
#line(length: 100%, stroke: (paint: navy, thickness: 1.2pt))
#v(4pt)
#figure(image("../drawings/scbf09_connection.svg", width: 100%), caption: [Semantic SCBF09 connection geometry. Source-supported dimensions only; schematic / NTS.])
#v(3pt)
#block(width: 100%, inset: 7pt, fill: amber, stroke: rgb("d6b656"))[
*DRAWING DATA WARNING* - Full fabrication-ready gusset contour coordinates are not source-defined. No unsourced dimensions are inferred.
]
#v(7pt)
#text(size: 11pt, weight:"bold", fill: navy)[GOVERNING DESIGN CHECKS]
#line(length: 100%, stroke: (paint: navy, thickness: 1.2pt))
#v(3pt)
#table(columns: (2.2fr,.75fr,.9fr,.75fr), inset: 5pt, stroke: border,
 table.header(fill: gray, [*Limit state*], [*Method*], [*Demand / Capacity*], [*Status*]),
 [Local beam Chevron shear], [LRFD], [#p.dc_lrfd], [#pill("PASS")],
 [Local beam Chevron shear], [ASD], [#p.dc_asd], [#pill("PASS")],
 [Beam web local yielding], [LRFD], [766 / 2310 kip], [#pill("PASS")],
 [Beam web local crippling], [LRFD], [766 / 2250 kip], [#pill("PASS")],
 [Lower HSS reinforced effective net area], [LRFD], [9.55 / 10.3 in²], [#pill("PASS")])
#v(7pt)
#grid(columns:(1fr,1fr), gutter:7pt,
 block(inset:7pt, stroke:line)[#label("Design basis") \ AISC 341-22; AISC 360-22; AISC Seismic Design Manual, 4th Ed. Example 5.3.8.],
 block(inset:7pt, stroke:line)[#label("Audit state") \ 32/32 engineering rules PASS. Geometry: PARTIALLY_DIMENSIONED. Production release: *NO*.])
#v(6pt)
#text(size: 7.5pt, fill: rgb("666666"))[Numerical authority: immutable EngineeringReportData. Typst performs presentation only; no structural capacities or engineering geometry are recalculated in this document.]
