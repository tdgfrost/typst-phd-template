// UCL Thesis Template in Typst - Main Document
// Author: Converted from LaTeX by ChatGPT
// Usage: typst compile main.typ

#import "thesis-template.typ": *
#import "chapters/abstract.typ": abstract
#import "chapters/impact.typ": impact
#import "chapters/originality.typ": originality
#import "chapters/listoffigures.typ": listoffigures
#import "chapters/listoftables.typ": listoftables
#import "chapters/glossary.typ": glossary
#import "chapters/acknowledgements.typ": acknowledgements
#import "chapters/introduction.typ": introduction
#import "chapters/background.typ": background
#import "chapters/chapter1.typ": chapter1
#import "chapters/chapter2.typ": chapter2
#import "chapters/conclusions.typ": conclusions
#import "chapters/appendices.typ": appendix


#ucl-thesis(
  title: "A Qualitative Investigation into Creating a Typst Template for PhDs",
  author: "Paige Turner",
  degree: "Doctor of Philosophy",
  department: "Institute of PhD Writing",
  date: "February 29th, 2048",
  abstract: abstract,
  impact: impact,
  originality: originality,
  listoffigures: listoffigures,
  listoftables: listoftables,
  glossary: glossary,
  introduction: introduction,
  background: background,
  acknowledgements: acknowledgements,
  chapters: (chapter1, chapter2),
  conclusions: conclusions,
  appendix: appendix,
)

