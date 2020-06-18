OUTDIR = 'renderizados'
SOURCES = $(shell find . -name "*.Rmd")
TARGET = $(SOURCES:%.Rmd=%.pdf) $(SOURCES:%.Rmd=%.html) $(SOURCES:%.Rmd=%.nb.html) $(SOURCES:%.Rmd=%.docx)

all: home default

%.docx %.nb.html %.html %.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_format = 'all', output_dir = $(OUTDIR))"

home:
	Rscript -e "rmarkdown::render('README.md', output_file = 'index.html')"

default: $(TARGET)     ## compile Rmd

clean:				   ## clean output dir
	rm -rf $(TARGET)

