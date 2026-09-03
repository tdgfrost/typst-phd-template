/*
========================================
======== TITLE PAGE SETTINGS ===========
========================================
*/
#let title-page(
  title: "",
  author: none,
  degree: none,
  department: none,
  university: "University College London",
  date: none
) = {

  align(center)[
  // Spacing at the top:
  #v(80pt)
  
  // Thesis Title:
  #block(
    inset: (right: 0.2cm, left: 0.2cm),
    [
      #set par(leading: 0.5em)
      #set text(size: 20pt, weight: "bold", hyphenate: false)
      #title
    ])
    
  // Spacing between title and name:
  #v(40pt)
  
  // Author:
  #text(
    author, 
    style: "italic",
    size: 14pt
  )
  
  // Spacing between author and "A dissertation...":
  #v(140pt)
  
  //
  A dissertation submitted in partial fulfillment \
  of the requirements for the degree of \
  #text({degree}, weight: "bold") \
  of \
  #text({university}, weight: "bold")
  
  // Spacing between "A dissertation..." and department/UCL
  #v(30pt)
  #department \
  #university
  
  // Spacing between department/UCL and date
  #v(40pt)
  #date
]
}