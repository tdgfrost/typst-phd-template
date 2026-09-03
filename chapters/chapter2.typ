#import "@preview/wordometer:0.1.4": word-count
#import "../thesis-template.typ": mini-outline

#let chapter2 = [#word-count(total-words => [
  = Second Methods Chapter <ch:second-methods-chapter>

  // Mini-table of contents
  #mini-outline()

  *Words: #total-words.words*

  == Abstract
  Your abstract here.

  == Motivation
  Motivation.

  == Contribution Statement
  Contribution statement.

  == Background and Related Work

  Background and related work.

  == Methods

  Some methods.

  == Results

  Some results.

  == Discussion

  Some discussion.

  == Summary

  Chapter summary.

])]
