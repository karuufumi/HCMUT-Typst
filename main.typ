#import "thesis.typ": hcmut-thesis
#import "content/main.typ": *

#show: hcmut-thesis.with(
  title: title,
  faculty: faculty,
  major: major,
  degree: degree,
  report-type: report-type,
  semester: semester,
  academic-year: academic-year,
  council: council,
  supervisors: supervisors,
  reviewer: reviewer,
  students: students,
  city: city,
  date: date,
  logo: logo,
  declaration: declaration,
  acknowledgement: acknowledgement,
  abstract: abstract,
  glossary: glossary,
  keywords: keywords,
  references-file: references-file,
)

// Add, remove, or reorder chapters here.
#include "content/chapters/01-introduction.typ"
#include "content/chapters/02-related-works.typ"
#include "content/chapters/03-theoretical-background.typ"
#include "content/chapters/04-proposed-solution.typ"
#include "content/chapters/05-conclusion.typ"
