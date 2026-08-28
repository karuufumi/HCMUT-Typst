# BKTypst

This is my Typst template for an HCMUT capstone project or thesis. It follows the standard HCMUT LaTeX template.

## Run it

Install [Typst](https://typst.app/), then run:

```sh
./run.sh
```

The PDF is created at:

```text
output/report.pdf
```

I can also compile it with:

```sh
make
```

For automatic rebuilding while editing:

```sh
make watch
```

## Edit it

I keep the project content separate from the formatting:

- `thesis.typ` contains the reusable layout and styling.
- `content/front-matter.typ` contains the title, cover details, people, abstract, glossary, and keywords.
- `content/chapters/` contains one file per chapter.
- `report.typ` assembles the chapters and applies the template.
- `references.bib` contains the bibliography.

To add or reorder chapters, edit the `#include` lines in `report.typ`.

```typst
#include "content/chapters/01-introduction.typ"
#include "content/chapters/02-related-works.typ"
```

## References

Typst reads the BibTeX-compatible `references.bib` file directly. I do not need to run `bibtex` or `biber` separately.

Add a citation in a chapter like this:

```typst
Previous work explored this problem. @citation-key
```

Times New Roman needs to be installed locally for the intended appearance:

```sh
typst fonts | rg "Times New Roman"
```
