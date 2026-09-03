#let listoftables = {
  heading(level: 1, outlined: true)[List of Tables]
  outline(
    title: none,
    target: figure.where(kind: table),
  )
}
