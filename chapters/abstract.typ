#import "@preview/wordometer:0.1.4": word-count

#let abstract = [

  #heading(level: 1, outlined: false)[Abstract]

  #word-count(total-words => [

    *Words: #{ total-words.words }*

    Your thesis abstract goes here.

  ])]

