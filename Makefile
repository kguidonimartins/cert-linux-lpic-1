OUTDIR = 'renderizados'
SOURCES = $(shell find . -name "*.Rmd")
TARGET = $(SOURCES:%.Rmd=%.pdf) $(SOURCES:%.Rmd=%.html) $(SOURCES:%.Rmd=%.nb.html) $(SOURCES:%.Rmd=%.docx)

%.docx %.nb.html %.html %.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_format = 'all', output_dir = $(OUTDIR))"

default: $(TARGET)     ## compile Rmd

clean:				   ## clean output dir
	rm -rf $(TARGET)

