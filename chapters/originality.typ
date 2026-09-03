#let originality = [

  #heading(level: 1, outlined: false)[Originality]
  #[
    #show heading.where(level: 2): set block(above: 2.5em, below: 1.5em)
    #heading(level: 2, outlined: false)[Part A: General Declaration]
    #set par(leading: 1.5em, first-line-indent: 0em, justify: true, spacing: 2em)
    #sym.checkmark This thesis is a presentation of original work.

    #sym.checkmark This work has not previously been presented for a degree or other qualification at this University or elsewhere.

    #sym.checkmark All input or assistance in the creation of the academic work other than from the supervisory team (including AI) has been acknowledged in Part B below.

    #sym.checkmark Any text or data in the thesis that has been presented for publication (including in review) elsewhere is declared in Part B below.

    #heading(level: 2, outlined: false)[Part B: Declaration of contribution from other sources]

    *Data sources, if not collected yourself:* Include any paid/unpaid sources of data.

    #block(width: 100%, inset: 1em, stroke: 1pt + black, breakable: true)[
      No data was used for this PhD template.
    ]

    *Software code, instrumentation development, etc.:* Describe support received to write code (from human or AI), build bespoke equipment, and any other shared work.

    #block(width: 100%, inset: 1em, stroke: 1pt + black, breakable: true)[
      Only Typst was used to create this PhD template.
    ]

    *AI:* Include any use of AI, including generative AI, not already included in the above categories where it has been used as a functional tool to assist in the process of creating the academic work.

    #block(width: 100%, inset: 1em, stroke: 1pt + black, breakable: true)[
      No AI was harmed in the making of this PhD template.
    ]

    *Other:* Include any other material contributions to your thesis not already included in the above categories. Declare any contributions to proofreading other than standard editorial support, such as professional editing or substantial changes made by AI.

    #block(width: 100%, inset: 1em, stroke: 1pt + black, breakable: true)[
      Credit to https://typst.app/universe/package/casson-uom-thesis/ which I believe was the original inspiration for this UCL template!
    ]

    *Publications:* Include full references for all published work and work that has been submitted for publication that includes material shared with the thesis on which the candidate is an author.

    - For each published work give a full citation including: all authors; title; journal/book (chapter); page numbers; volume; date of publication; publisher; DOI – if available.
    - If manuscripts have been uploaded to a preprint server, please give full citations including DOI.
    - Under each listed publication, please identify to which chapter of the thesis the publication relates.
    - For multi-authored works, state your contribution and explain where this work appears in the final thesis.

    #block(width: 100%, inset: 1em, stroke: 1pt + black, breakable: true)[
      Nothing has been published

      - *Thesis Chapter:* @ch:first-methods-chapter
        - *Published:* Not even remotely.
        - *Citation:* N/A
        - *Contribution:* Lead and only author.

      - *Thesis Chapter:* @ch:second-methods-chapter
        - *Published:* Not even remotely.
        - *Citation:* N/A
        - *Contribution:* Lead and only author.
    ]
  ]
]
