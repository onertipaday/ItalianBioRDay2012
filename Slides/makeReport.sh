RMDFILE=Slides
Rscript -e "require(knitr); knit('$RMDFILE.Rmd', '$RMDFILE.md');"
pandoc -s -S -i -t slidy --mathjax $RMDFILE.md -o $RMDFILE.html