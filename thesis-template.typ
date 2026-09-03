// UCL Thesis Layout and Style Definitions

#import "@preview/wordometer:0.1.4": total-words, word-count
#import "title-page.typ": title-page

#let in-appendix = state("in-appendix", false)

/*
========================================
======== DECLARATION SETTINGS ==========
========================================
*/

#let mini-outline(title: "Chapter Outline", target-level: 3) = context {
  let all-headings = query(heading)
  let here-page = here().page()

  // Find headings that appear after this point but before the next Chapter (Level 1)
  let next-chapter = query(selector(heading.where(level: 1)).after(here())).at(0, default: none)
  let sel = selector(heading).after(here())
  if next-chapter != none {
    sel = sel.before(next-chapter.location())
  }
  let current-chapter-headings = query(sel).filter(h => h.level > 1 and h.level <= target-level)

  block(
    fill: luma(245),
    inset: 2.5em,
    radius: 5pt,
    width: 100%,
    {
      text(weight: "bold", size: 1.1em, title)
      v(0.5em)
      for hd in current-chapter-headings {
        let depth-indent = (hd.level - 2) * 1.5em
        let counts = counter(heading).at(hd.location())
        let heading_num = if in-appendix.at(hd.location()) {
          numbering("A.1", ..counts)
        } else {
          numbering("1.1", ..counts)
        }
        pad(left: depth-indent, [
          #link(hd.location(), [#heading_num #h(0.2em) #hd.body])
          #box(width: 1fr, repeat([.], gap: 0.5em))
          #link(hd.location(), [#counter(page).at(hd.location()).first()])
        ])
        v(-0.5em)
      }
    },
  )
}

#let declaration(
  author: "",
) = {
  page([#par(justify: true)[
    I, #author, confirm that the work presented in this thesis is my
    own. Where information has been derived from other sources, I confirm that this has been indicated in the work.
  ]])
}


/*
========================================
====== OVERALL THESIS SETTINGS =========
========================================
*/

// Define ucl-thesis template
#let ucl-thesis(
  title: "",
  author: none,
  degree: none,
  department: none,
  date: none,
  abstract: "",
  impact: "",
  originality: "",
  listoffigures: "",
  listoftables: "",
  glossary: "",
  acknowledgements: "",
  introduction: "",
  background: "",
  chapters: (),
  conclusions: "",
  appendix: "",
  /*
  // set A4
  width: 210mm,
  height: 297mm,
  */
) = {
  /*
  ========================================
  ======= PAGE/PAR/TEXT DEFAULTS =========
  ========================================
  */

  set page(
    // Binding (inside) set to 4cm as per UCL guidance
    margin: (inside: 4cm, outside: 2.5cm),
    paper: "a4",
    columns: 1,
    numbering: "1",
    number-align: bottom + center,

    /*
    The following creates a customised page numbering system, where page numbers don't appear for chapter heading pages but do appear for content.
    */

    /*
    // FOOTER - PAGE NUMBER
    footer: context {
      // If title page, skip
      let first-page = counter(page).get().at(0) == 1

      if first-page {
        return
      }

      // If not chapter page, give page numbers
      let start-chapters = query(heading.where(level: 1)).find(h => h.location().page() == here().page()) != none

      if not start-chapters {
        align(center, counter(page).display("1"))
      }
    },
    */
  )

  set par(
    leading: 1.5em,
    first-line-indent: 1.5em,
    justify: true,
    spacing: 2em,
  )
  set text(
    font: "New Computer Modern",
    size: 12pt,
    hyphenate: false,
  )

  set list(
    tight: true,
    indent: 2em,
  )

  set enum(
    tight: true,
    indent: 2em,
  )

  // Make sure tables can break across multiple pages
  show figure.where(kind: table): set block(breakable: true)

  // Underline all hyperlinks
  show link: underline

  // This creates the custom settings for the quote block
  show quote: it => {
    pad(x: 2em, top: 1em, bottom: 2em, block({
      text(style: "italic", it.body)

      if it.attribution != none {
        linebreak()
        h(1fr)
        [--- #it.attribution]
      }
    }))
  }

  set math.equation(numbering: (..nums) => {
    let section = counter(heading).get().first()
    numbering("(1.1)", section, ..nums)
  })

  // Set figure caption default size
  show figure.caption: set text(size: 10pt)

  // Set figure spacing either size
  show figure: set block(above: 3em, below: 3em)
  show grid: set block(above: 3em, below: 3em)

  // Set figure and table numbering to include the chapter number
  set figure(numbering: (..nums) => {
    let chapter = counter(heading).get().first()
    numbering("1.1", chapter, ..nums)
  })

  // Describe our heading format
  let heading_text_format = (
    size: 26pt,
    top-edge: 5em,
  )

  /*
  ========================================
  ========= Reference Settings ===========
  ========================================
  */

  // Red border for chapter references only
  show ref: it => {
    // 1. Get the label of the target element
    let target_label = str(it.target)

    // 2. Check if it starts with "ch:"
    if target_label.starts-with("ch:") {
      // Insert a red box
      box(
        stroke: 0.5pt + red,
        inset: (x: 2pt),
        outset: (y: 3pt),
        it,
      )
    } else {
      // 3. For everything else, do nothing
      it
    }
  }

  show ref: set ref(supplement: it => {
    // Decide if we are referring to a chapter or a section
    if it.func() == heading {
      if it.level == 1 {
        "Chapter"
      } else {
        "Section"
      }
      // Define "Equation"
    } else if it.func() == math.equation {
      //"Equation"
      // Handle Figures and Tables differently
    } else if it.func() == figure {
      if it.kind == table {
        "Table"
      } else if it.kind == "listing" {
        "Listing"
      } else {
        "Figure"
      }
      // Leave everything else undefined so we know whether to implement a custom rule
    } else {
      "UNDEFINED"
    }
  })

  /*
  ========================================
  ============= TITLE PAGE ===============
  ========================================
  */

  // Start with our title page
  title-page(
    title: title,
    author: author,
    degree: degree,
    department: department,
    date: date,
  )

  // Declaration
  declaration(
    author: author,
  )

  /*
  ========================================
  ====== NON-CHAPTER HEADING RULES =======
  ========================================
  */

  // Generic title rules
  show heading.where(
    level: 1,
  ): it => {
    set par(leading: 0.65em)
    set text(..heading_text_format)

    it.body
    v(1em)
  }

  /*
  ========================================
  ===== ABSTRACT / ACKNOWLEDGEMENTS ======
  ========================================
  */

  // Abstract
  abstract
  pagebreak()

  // Impact Statement
  impact
  pagebreak()

  // Acknowledgements
  acknowledgements
  pagebreak()

  // Originality Statement
  originality
  pagebreak()

  /*
  ========================================
  ====== CONTENTS FORMATTING RULES =======
  ========================================
  */

  // Table of Contents

  // Set the "..." fill
  set outline.entry(
    fill: repeat([.], gap: 0.5em),
  )
  show outline.entry: it => {
    // Make the contents spacing for List of Figures -> Glossary smaller
    if it.level == 1 {
      if it.element.numbering == none {
        set block(above: 1.2em)
        show repeat: none
        it
      } else {
        set block(above: 2.5em)
        show repeat: none
        it
      }
    } else { it }
  }

  outline(
    indent: 1.5em,
    depth: 2,
  )
  pagebreak()

  listoffigures
  pagebreak()

  listoftables
  pagebreak()

  glossary
  pagebreak()

  /*
  ========================================
  ======== CHAPTER HEADING RULES =========
  ========================================
  */

  // Set all headings to be numbered
  set heading(numbering: "1.1")

  // Set specific chapter heading rules
  show heading: it => {
    if it.level == 1 {
      counter(math.equation).update(0)
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)

      // Put "Chapter 1" at the top-left
      place(
        dy: 4em,
        context {
          if in-appendix.at(here()) {
            [Appendix #counter(heading).display("A")]
          } else {
            [Chapter #counter(heading).display("1")]
          }
        },
      )
      set par(leading: -3.5em)
      set text(..heading_text_format)
      it.body
      v(1em)
    } // Set specific rules for sub-headings
    else if it.level == 2 {
      // Set the spacing above the block
      set block(above: 2em, below: 0.75em)

      // Size and spacing of text
      set text(
        size: 18pt,
        //top-edge: 1.5em,
        top-edge: "cap-height",
      )
      set par(
        first-line-indent: 0em,
        leading: 0.65em, // controls space between lines of a wrapped heading
      )
      it
      v(0.5em)
    } // Set rules for all sub-sub+ headings
    else {
      // Set the spacing above the block
      set block(above: 2em, below: 1.25em)

      set text(
        size: 14pt,
        // top-edge: 0.5em,
        top-edge: "cap-height",
      )
      set par(
        first-line-indent: 0em,
        leading: 0.65em,
      )
      it
    }
  }

  // The following custom rule puts the most recent sub-heading at the header of the page (excluding the initial chapter page)
  set page(
    header: context {
      let cur_page = here().page()
      // 1. Skip the title page
      if cur_page == 1 { return }

      // 2. Check if a new chapter starts on this page
      let is_chapter_start = query(heading.where(level: 1)).any(h => h.location().page() == cur_page)

      if not is_chapter_start {
        // 3. Find the most recent Level 1 and Level 2 headings
        let last_l1 = query(selector(heading.where(level: 1)).before(here())).at(-1, default: none)
        let last_l2 = query(selector(heading.where(level: 2)).before(here())).at(-1, default: none)

        // 4. Only show the header if the subheading belongs to the current chapter
        if last_l2 != none and last_l1 != none {
          if last_l2.location().page() >= last_l1.location().page() {
            // Get the counter array at the subheading's location (e.g., (3, 1, 0, 0))
            let counts = counter(heading).at(last_l2.location())

            // Take only the first two numbers (Chapter, Section)
            let heading_num = if in-appendix.at(last_l2.location()) {
              numbering("A.1", ..counts.slice(0, 2))
            } else {
              numbering("1.1", ..counts.slice(0, 2))
            }

            set align(center)
            set text(size: 12pt, font: "New Computer Modern", style: "italic", weight: "light")

            // Display the sliced number and the text body
            [#heading_num #last_l2.body]
          }
        }
      }
    },
  )

  /*
  ========================================
  ======== INTRO AND CHAPTERS =========
  ========================================
  */
  /*
  set page(
    numbering: "1"
  )
  */

  // Introduction
  introduction
  pagebreak()

  // Background
  background
  pagebreak()

  // Chapters
  for chapter in chapters [
    #chapter
    #pagebreak()
  ]

  // Conclusions
  conclusions
  pagebreak()

  // Bibliography
  {
    show heading.where(level: 1): it => {
      set text(..heading_text_format)
      it.body
      v(1em)
    }
    bibliography("references.bib", style: "harvard-cite-them-right.csl")
  }
  pagebreak()

  // Appendices
  in-appendix.update(true)
  set heading(numbering: "A.1")
  set figure(numbering: (..nums) => {
    let chapter = counter(heading).get().first()
    numbering("A.1", chapter, ..nums)
  })
  set math.equation(numbering: (..nums) => {
    let chapter = counter(heading).get().first()
    numbering("(A.1)", chapter, ..nums)
  })
  counter(heading).update(0)
  appendix

  //If you want to change from author to numerical, use "springer-vancouver"
}


