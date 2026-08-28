// HCMUT capstone/thesis template for Typst.
// Import with: #import "thesis.typ": hcmut-thesis
// Then apply with: #show: hcmut-thesis.with(...)

#let hcmut-thesis(
  title: "<TITLE>",
  faculty: "FACULTY OF COMPUTER SCIENCE AND ENGINEERING",
  major: "COMPUTER SCIENCE",
  degree: "REPORT",
  report-type: "CAPSTONE PROJECT",
  semester: "SEMESTER ...",
  academic-year: "ACADEMIC YEAR 20..-20..",
  council: "<NAME>",
  supervisors: ("<NAME>",),
  reviewer: "",
  students: (("<NAME>", "<ID>"),),
  city: "HO CHI MINH CITY",
  date: "December 2024",
  logo: "Logo_BK.png",
  declaration: [
    We declare that we solely conducted this specialized project under the supervision
    of the supervisor(s) listed on the cover at the Faculty of Computer Science and
    Engineering, Vietnam National University - Ho Chi Minh City University of Technology.
    #parbreak()
    We have properly acknowledged all external sources and references used in this project.
    #parbreak()
    If there is any instance of plagiarism, we are ready to accept the consequences.
  ],
  acknowledgement: [
    We would like to express our appreciation to our supervisor(s) for their invaluable
    guidance, criticism, and constant support throughout this project. We are also grateful
    to everyone who contributed advice and encouragement.
  ],
  abstract: [Write a concise abstract here. State the problem, method, main results, and conclusion.],
  glossary: (),
  keywords: (),
  references-file: "references.bib",
  body,
) = {
  set document(title: title, author: students.map(s => s.at(0)).join(", "))
  let supervisor-label = if supervisors.len() > 1 { "SUPERVISORS:" } else { "SUPERVISOR:" }
  set page(
    paper: "a4",
    margin: (top: 2cm, bottom: 2cm, left: 3cm, right: 2cm),
    number-align: center,
  )
  set text(font: "Times New Roman", size: 13pt, lang: "en")
  set par(justify: true, leading: 1em, first-line-indent: 0pt)
  let front-heading(title) = {
    v(2cm)
    text(size: 24pt, weight: "bold")[#title]
    v(1.2em)
  }
  let chapter-like-heading(title) = {
    v(4cm)
    text(size: 32pt, weight: "bold")[#title]
    v(1.5em)
  }
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    if it.numbering == none {
      chapter-like-heading(it.body)
    } else {
      pagebreak(weak: true)
      v(4cm)
      block(breakable: false)[
        #align(left)[
          #text(size: 32pt, weight: "bold")[Chapter #counter(heading).display("1")]
          #v(24pt)
          #text(size: 32pt, weight: "bold")[#it.body]
        ]
      ]
      v(2.5em)
    }
  }
  show heading.where(level: 2): it => {
    block(above: 1.6em, below: 0.8em)[
      #align(left)[#text(size: 20pt, weight: "bold")[#it]]
    ]
  }
  show heading.where(level: 3): it => {
    block(above: 1.2em, below: 0.6em)[
      #align(left)[#text(size: 16pt, weight: "bold")[#it]]
    ]
  }
  show figure.caption: set text(size: 10pt)
  show figure.caption: it => align(center, it)
  // Keep the outline readable at the same scale as the LaTeX report.
  // The entry itself still supplies the dotted leader and page number; the
  // surrounding blocks only control type size and vertical rhythm.
  show outline.entry: it => {
    block[
      #set text(size: 14pt)
      #it
    ]
    v(0.18em)
  }
  show outline.entry.where(level: 1): it => {
    block[
      #set text(size: 14pt, weight: "bold")
      #it
    ]
    v(0.72em)
  }

  // Cover: follows the supplied HCMUT/FCSE capstone sample.
  page(numbering: none, margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm))[
    #box(width: 100%, height: 100%, stroke: 3pt, inset: 0.1cm)[
      #box(width: 100%, height: 100%, stroke: 1pt)[
      #align(center)[
        #set par(leading: 0.75em, first-line-indent: 0pt)
        #v(0.2cm)
        #text(size: 15pt, weight: "bold")[VIETNAM NATIONAL UNIVERSITY HO CHI MINH CITY]
        #v(0.2em)
        #text(size: 15pt, weight: "bold")[HO CHI MINH CITY UNIVERSITY OF TECHNOLOGY]
        #v(0.2em)
        #text(size: 15pt, weight: "bold")[#faculty]
        #v(0cm)
        #align(center)[
          #move(dy: 0.4cm, image(logo, width: 5.5cm))
        ]
        #v(1cm)
        #text(size: 15pt, weight: "bold")[#degree]
        #v(-0.1cm)
        #text(size: 15pt, weight: "bold")[#report-type]
        #v(-0.1cm)
        #text(size: 15pt, weight: "bold")[#semester #academic-year]
        #v(-0.2cm)
        #line(length: 80%, stroke: 0.5pt)
        #v(0.15cm)
        #text(size: 20pt, weight: "bold", fill: rgb("0645d6"))[#upper(title)]
        #v(0.15cm)
        #line(length: 80%, stroke: 0.5pt)
        #v(0.2cm)
        #align(center)[
          #text(weight: "bold")[MAJOR:] #major
          #v(0.35cm)
          #table(
            columns: (3.2cm, 5.3cm),
            inset: (x: 0pt, y: 0.08cm),
            stroke: none,
            column-gutter: 0.2cm,
            row-gutter: 0.3cm,
            align: (right, left),
            [*COUNCIL:*], [#council],
            [*#supervisor-label*], [#supervisors.join(", ")],
            [*REVIEWER:*], [#reviewer],
          )
          #v(0.55cm)
          #align(center)[——o0o——]
          #v(0.5cm)
          #table(
            columns: (3.2cm, 5.3cm),
            inset: (x: 0pt, y: 0.08cm),
            stroke: none,
            column-gutter: 0.2cm,
            row-gutter: 0.18cm,
            align: (right, left),
            ..students.enumerate().fold((), (cells, item) => (
              ..cells,
              [*STUDENT #(item.at(0) + 1):*],
              [#item.at(1).at(0) - #item.at(1).at(1)],
            )),
          )
        ]
        #v(2.2cm)
        #text(size: 15pt)[#city, #date]
      ]
      ]
    ]
  ]

  // Front matter uses lower-case Roman numerals, as in the sample.
  set page(numbering: "i")
  counter(page).update(1)

  pagebreak()
  chapter-like-heading("Instructor's Signature")
  align(left)[
    #v(1cm)
    #grid(
      columns: (1fr, auto, 0.2fr),
      gutter: 0.4em,
      line(length: 100%, stroke: 0.5pt),
      [Date:],
      line(length: 100%, stroke: 0.5pt),
    )
    #v(1.5cm)
    #supervisors.join(", ")
  ]

  pagebreak()
  chapter-like-heading("Declaration of Authenticity")
  declaration
  v(2cm)
  align(right)[#city, #date #linebreak() *Authors,* #linebreak() #students.map(s => s.at(0)).join(", ")]

  pagebreak()
  chapter-like-heading("Acknowledgement")
  acknowledgement

  pagebreak()
  chapter-like-heading("Abstract")
  abstract
  v(1em)
  [*Keywords:* #keywords.join("; ")]

  if glossary.len() > 0 {
    pagebreak()
    chapter-like-heading("Table of Glossary")
    table(
      columns: (3.5cm, 1fr),
      stroke: 0.5pt,
      inset: 0.5em,
      [*Term*], [*Definition*],
      ..glossary.flatten(),
    )
  }

  pagebreak()
  chapter-like-heading("Contents")
  v(0.5cm)
  outline(title: none, depth: 3)
  pagebreak()
  chapter-like-heading("List of Tables")
  outline(title: none, target: figure.where(kind: table))
  pagebreak()
  chapter-like-heading("List of Figures")
  outline(title: none, target: figure.where(kind: image))

  // Start the main report at page 1 with Arabic numerals.
  pagebreak()
  set page(numbering: "1")
  counter(page).update(1)
  body

  // References always begin on their own final page, like the official LaTeX template.
  pagebreak()
  heading(numbering: none, outlined: true)[References]
  bibliography(references-file, title: none, full: true, style: "ieee")
}
