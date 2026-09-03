#import "@preview/wordometer:0.1.4": word-count

#let impact = [

  #heading(level: 1, outlined: false)[Impact Statement]

  #word-count(total-words => [

    *Words: #total-words.words / 500*

    Your impact statement goes here.

  ])]

