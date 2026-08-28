# BKTypst

A configurable Typst capstone/thesis starter for Ho Chi Minh City University of Technology (HCMUT), based on the supplied FCSE capstone report sample.

## Quick start

Install [Typst](https://typst.app/) and clone this repository:

```sh
git clone <repository-url>
cd BKTypst
```

Compile the example report:

```sh
typst compile main.typ output.pdf
```

Typst automatically creates the PDF. To keep generated files out of version control, use a filename such as `output.pdf` or place it in an ignored build directory.

The reusable formatting engine lives in [thesis.typ](thesis.typ). It contains no project-specific names, prose, or cover values.

The document-specific content is in [content/main.typ](content/main.typ). Change the title, faculty, logo, people, cover text, abstract, keywords, glossary, and bibliography path there.

Chapters are standalone files in `content/chapters/`. Add, remove, or reorder them by editing the `#include` lines in [main.typ](main.typ):

```typst
#include "content/chapters/01-introduction.typ"
#include "content/chapters/02-related-works.typ"
```

This keeps [main.typ](main.typ) as a short assembly file and lets you work on each chapter independently. Front-matter content such as the declaration, acknowledgement, and abstract is also stored in `content/main.typ`, so the core template does not need to be edited for normal report changes.

## Project layout

```text
main.typ                         # document entry point
thesis.typ                       # reusable HCMUT formatting engine
content/main.typ                 # metadata and front-matter content
content/chapters/*.typ           # independent chapter files
Logo_BK.png                      # cover logo
references.bib                   # BibLaTeX bibliography database
```

## Editing workflow

1. Edit `content/main.typ` for the cover and front matter.
2. Edit or add files in `content/chapters/` for report chapters.
3. Add, remove, or reorder chapter `#include` lines in `main.typ`.
4. Compile with `typst compile main.typ output.pdf`.

Keep `thesis.typ` unchanged unless you are intentionally changing the template’s formatting rules. File paths for the logo and bibliography are written relative to the project root.

Times New Roman must be installed locally for an exact font match. Check with:

```sh
typst fonts | rg "Times New Roman"
```

Formatting requirements can differ by faculty, programme, degree, and academic year. Confirm the final cover wording, logo, margins, declaration, and reference style with the current faculty or graduate-school guide before submission.
