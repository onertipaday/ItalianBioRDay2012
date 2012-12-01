#! /usr/bin/Rscript --vanilla
require("knitr"); knit("Slides.Rmd")
system("pandoc -s -S -i -t slidy --mathjax Slides.md -o Slides.html")
browseURL("Slides.html")