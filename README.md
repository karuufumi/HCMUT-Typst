# BKTypst

A configurable Typst capstone/thesis starter for Ho Chi Minh City University of Technology (HCMUT), based on the supplied FCSE capstone report sample.

## Usage

Edit the metadata and chapters in [main.typ](main.typ), then compile:

```sh
typst compile main.typ main.pdf
```

The reusable template lives in [thesis.typ](thesis.typ). It includes the supplied HCMUT-style double-bordered cover, BK logo, group-student fields, council/reviewer fields, signature page, declaration, acknowledgement, abstract, glossary, contents, lists of figures/tables, `Chapter N` headings, Roman-numbered front matter, Arabic-numbered chapters, and bibliography support.

Formatting requirements can differ by faculty, programme, degree, and academic year. Confirm the final cover wording, logo, margins, declaration, and reference style with the current faculty or graduate-school guide before submission.
