#! /usr/bin/Rscript --vanilla
require("knitr"); knit("Slides.Rmd")
system("pandoc -t beamer Slides.md -V theme:Warsaw -o Slides.pdf")