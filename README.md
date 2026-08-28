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
typst compile report.typ output.pdf
```

Or use the included wrappers:

```sh
./run.sh
# or
make
```

The generated PDF is written to `output/pdf/bk-thesis.pdf`. For live rebuilding while editing, run:

```sh
make watch
```

Typst automatically creates the PDF. To keep generated files out of version control, use a filename such as `output.pdf` or place it in an ignored build directory.

The reusable formatting engine lives in [thesis.typ](thesis.typ). It contains no project-specific names, prose, or cover values.

The document-specific content is in [content/front-matter.typ](content/front-matter.typ). Change the title, faculty, logo, people, cover text, abstract, keywords, glossary, and bibliography path there.

Chapters are standalone files in `content/chapters/`. Add, remove, or reorder them by editing the `#include` lines in [report.typ](report.typ):

```typst
#include "content/chapters/01-introduction.typ"
#include "content/chapters/02-related-works.typ"
```

This keeps [report.typ](report.typ) as a short assembly file and lets you work on each chapter independently. Front-matter content such as the declaration, acknowledgement, and abstract is also stored in `content/front-matter.typ`, so the core template does not need to be edited for normal report changes.

## Project layout

```text
report.typ                       # document entry point
thesis.typ                       # reusable HCMUT formatting engine
content/front-matter.typ         # metadata and front-matter content
content/chapters/*.typ           # independent chapter files
Logo_BK.png                      # cover logo
references.bib                   # BibLaTeX bibliography database
```

## Editing workflow

1. Edit `content/front-matter.typ` for the cover and front matter.
2. Edit or add files in `content/chapters/` for report chapters.
3. Add, remove, or reorder chapter `#include` lines in `report.typ`.
4. Compile with `./run.sh`, `make`, or `typst compile report.typ output.pdf`.

Keep `thesis.typ` unchanged unless you are intentionally changing the template’s formatting rules. File paths for the logo and bibliography are written relative to the project root.

Times New Roman must be installed locally for an exact font match. Check with:

```sh
typst fonts | rg "Times New Roman"
```

## Bibliography

The template reads the standard BibTeX-compatible database in [references.bib](references.bib) directly. Add entries there and cite them in a chapter with `@citation-key`:

```typst
Recent work supports this approach. @example2024
```

No separate `bibtex` or `biber` command is needed. Typst generates the bibliography during compilation. The bibliography style is configured in `thesis.typ`.

Formatting requirements can differ by faculty, programme, degree, and academic year. Confirm the final cover wording, logo, margins, declaration, and reference style with the current faculty or graduate-school guide before submission.
