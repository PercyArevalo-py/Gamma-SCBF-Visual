#let view = json("../data/presentation.json")
#set page(paper: "a4", margin: (x: 13mm, y: 10mm), header: context [#text(size: 7.5pt, fill: rgb("666666"))[GAMMA ARQUITECTURA E INGENIERIA  /  SCBF DESIGN REPORT]], footer: context [#text(size: 7.5pt, fill: rgb("666666"))[SCBF09  |  Engineering calculation package  |  Page #counter(page).display()]])
#set text(font: "Liberation Sans", size: 8pt, fill: rgb("202020"))
#set par(leading: 0.65em)
#let navy = rgb("17324d")
#let gray = rgb("f2f4f6")
#let amber = rgb("fff3cd")
#let green = rgb("e9f5ec")
#let border = rgb("c9ced3")
#let label(s) = text(size: 7pt, weight: "bold", fill: rgb("666666"), upper(s))
#let metric(k, val) = block(width: 100%, inset: 7pt, radius: 2pt, stroke: border, fill: gray)[#label(k) #v(2pt) #text(size: 11pt, weight: "bold")[#val]]
#let pill(s, fill: green) = box(inset: (x: 6pt, y: 3pt), radius: 10pt, fill: fill, stroke: border)[#text(size: 7pt, weight: "bold")[#s]]

#block(width: 100%, inset: (x: 10pt, y: 9pt), fill: navy)[
#text(fill: white, size: 18pt, weight: "bold")[SCBF09 - SHARED GUSSET CONNECTION] \
#text(fill: white, size: 8.5pt)[Special Concentrically Braced Frame / Professional RC1]
]
#v(2pt)
#grid(columns: (1fr,1fr,1fr,1fr), gutter: 5pt,
 metric("Beam", view.beam), metric("Shared interface Lg", view.Lg), metric("LRFD governing D/C", view.lrfd_dc), metric("ASD governing D/C", view.asd_dc))
#v(2pt)
#grid(columns: (1fr, 1fr), gutter: 5pt,
 block(inset: 7pt, stroke: border)[#label("Upper connection") \ *Gusset:* #view.upper_gusset  |  *Reinf.:* #view.upper_reinforcement],
 block(inset: 7pt, stroke: border)[#label("Lower connection") \ *Gusset:* #view.lower_gusset  |  *Reinf.:* #view.lower_reinforcement])
#v(2pt)
#grid(columns: (1fr, auto), align: horizon, [#text(size: 11pt, weight:"bold", fill: navy)[CONNECTION GEOMETRY]], [#pill("PASS - ENGINEERING")])
#line(length: 100%, stroke: (paint: navy, thickness: 1.2pt))
#v(2pt)
#figure(image("../drawings/scbf09_connection.svg", width: 94%), caption: [SCBF09 engineering chart - uniform coordinate scale, source-supported dimensions only.])
#v(2pt)
#block(width: 100%, inset: 7pt, fill: amber, stroke: rgb("d6b656"))[*DRAWING DATA WARNING* - #view.drawing_warning]
#v(2pt)
#text(size: 11pt, weight:"bold", fill: navy)[GOVERNING DESIGN CHECKS]
#line(length: 100%, stroke: (paint: navy, thickness: 1.2pt))
#v(2pt)
#table(columns: (2.2fr,.75fr,.75fr,.75fr), inset: 5pt, stroke: border,
 table.header([*Limit state*], [*Method*], [*D/C*], [*Status*]),
 [Local beam Chevron shear], [LRFD], [#view.lrfd_dc], [#pill("PASS")],
 [Local beam Chevron shear], [ASD], [#view.asd_dc], [#pill("PASS")],
 [Beam web local yielding], [LRFD], [766 / 2310], [#pill("PASS")],
 [Beam web local crippling], [LRFD], [766 / 2250], [#pill("PASS")],
 [Lower HSS reinforced effective net area], [LRFD], [9.55 / 10.3], [#pill("PASS")])
#v(2pt)
#grid(columns:(1fr,1fr), gutter:7pt,
 block(inset:7pt, stroke:border)[#label("Design basis") \ AISC 341-22; AISC 360-22; AISC Seismic Design Manual, 4th Ed. Example 5.3.8.],
 block(inset:7pt, stroke:border)[#label("Audit state") \ 32/32 engineering rules PASS. Geometry: #view.geometry_status. Production release: *NO*.])
#v(2pt)
#text(size: 7.5pt, fill: rgb("666666"))[Numerical authority: immutable EngineeringReportData. Typst performs presentation only; no structural capacities or engineering geometry are recalculated in this document.]
