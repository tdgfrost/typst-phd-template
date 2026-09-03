#let listoffigures = {
  heading(level: 1, outlined: true)[List of Figures]
  outline(
    title: none,
    target: figure.where(kind: image),
  )
}

