#let glossary = [
  = Glossary

  // The following two rules force the term description to be aligned.
  #set terms(
    separator: [ #h(0pt) ],
    indent: 0mm,
  )

  #show terms.item: it => {
    stack(
      dir: ltr,
      box(width: 29mm, [*#it.term*]),
      it.description,
    )
  }

  / BIOS: Boots in one second
  / LASER: Light amplification by stimulated emission of radiation
]
