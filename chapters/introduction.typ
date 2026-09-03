#import "../thesis-template.typ": mini-outline
#import "@preview/wordometer:0.1.4": word-count

#let introduction = [#word-count(total-words => [
  = Introduction

  // Mini-table of contents
  #mini-outline()

  *Words: #total-words.words*

  Some introduction.

  == Aims and Objectives

  Some aims and objectives, perhaps referencing the methods chapters.

  #show list: set par(first-line-indent: 0pt)

  #list(
    [*How should I make the first methods chapter? (@ch:first-methods-chapter):*

      I will attempt to create my first methods chapter.],

    [*Can I reproduce this as a second methods chapter? (@ch:second-methods-chapter):*

      I will build on @ch:first-methods-chapter by creating a second, identical methods chapter.],
  )

  == Thesis Summary

  Summary of the thesis.

  === Non-Technical Summary

  Non-technical summary of the thesis.

])]

