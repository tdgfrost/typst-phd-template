// Useful little automatic counter
#let rn = {
  counter("row-num").step()
  context counter("row-num").display()
}

#let example_table = [
  #figure(
    table(
      columns: (auto, auto),
      align: horizon,
      table.header([*Column 1*], [*Column 2*]),

      // Nemati et al. 2016
      [*#rn*], [First row],
      [*#rn*], [Second row],
    ),

    caption: [This is also a caption],
  ) <tab:table-reference>
]
