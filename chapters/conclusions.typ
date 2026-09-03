#import "@preview/wordometer:0.1.4": word-count
#import "../thesis-template.typ": mini-outline

#let conclusions = [#word-count(total-words => [
  = Conclusions <ch:conclusions>

  // Mini-table of contents
  #mini-outline()

  *Words: #total-words.words*

  == First Sub-heading

  Some sub-heading.

])]
