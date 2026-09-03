#import "@preview/wordometer:0.1.4": word-count
#import "../thesis-template.typ": mini-outline
#import "../tables/tables.typ": *

#let background = [#word-count(total-words => [

  = Background and Related Work <ch:background>

  // Mini-table of contents
  #mini-outline()

  *Words: #{ total-words.words }*

  This is the start of your background chapter (if you want one).

  == Sub-headings and References <sec:some-subheading>

  This is the first sub-heading of the background chapter, which you can refer to as @sec:some-subheading. If you want, you can also refer to the chapter as @ch:background.

  == Citations

  You can cite the references easily @whiskers2024gravity. You can also manually cite in prose, as per #cite(<caffeine2025rubberduck>, form: "prose").

  == Figures

  You can insert figures easily, as shown below in @fig:figure-reference.

  #figure(
    image("../figures/background/pikachu.jpg", width: 25%),
    caption: [This is a caption.],
    // placement: top,
  ) <fig:figure-reference>

  The source images can be anywhere, even in another folder. You might find it easier to store them in dedicated folders by chapter though.

  #figure(
    image("../figures/chapter1/charlie-meme.webp", width: 50%),
    caption: [Trying to coordinate all your figures from one folder.],
  )

  == Tables

  Tables are also easy to create, but long tables can get annoying to write around. You may prefer to store them as a dedicated variable under tables/tables.typ, and call the variable name here. This is shown below in @tab:table-reference.

  #example_table

  == Formulae

  You can do various mathematical formulae easily enough, both inline such as with $E = "mc"^2$ but also as a dedicated line:

  $
    frac(sin(x), n) = "six"
  $

])]

