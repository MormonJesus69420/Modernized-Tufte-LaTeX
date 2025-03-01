################################################################################
###  This file contains make targets for compiling and managing sample docs  ###
#  Written originally by Chris K. Grant, modified by Daniel Aaron Salwerowicz  #
################################################################################

LMKFLAGS = -outdir=samples -auxdir=aux -bibtex
CLASSDIR =  $$(kpsewhich -var-value TEXMFHOME)/tex/latex/custom-tufte-latex
DOCDIR =  $$(kpsewhich -var-value TEXMFHOME)/doc/latex/custom-tufte-latex

all: compile-lua compile-xe compile-pdf

compile: all

# Every compile target uses find to avoid compiling custom-tufte-*.tex files
# -maxdepth 1: only search in the current directory
# -name '*.tex': search for files with the .tex extension
# -not -path '*/custom-tufte-*': exclude files with the custom-tufte- prefix
# the shell command is used to execute the find command
compile-lua:
	latexmk $(LMKFLAGS) -lualatex -jobname=%A-lualatex \
	$(shell find . -maxdepth 1 -name '*.tex' -not -path '*/custom-tufte-*')

compile-xe:
	latexmk $(LMKFLAGS) -xelatex -jobname=%A-xelatex  \
	$(shell find . -maxdepth 1 -name '*.tex' -not -path '*/custom-tufte-*')

compile-pdf:
	latexmk $(LMKFLAGS) -pdflatex -jobname=%A-pdflatex  \
	$(shell find . -maxdepth 1 -name '*.tex' -not -path '*/custom-tufte-*')

# Target that allows compiling a single file with LuaLaTeX
# Engine can be changed as desired with '-xelatex' or '-pdflatex'
# When invoking the target provide filename with extension like so:
# make compile-only FILE="<file>.tex"
compile-only:
	if [ -z "$(FILE)" ]; then \
		echo "You need to provide a FILE parameter when using this target"; \
		echo "make compile-only FILE=\"<file>.tex\""; \
	else \
		latexmk $(LMKFLAGS) -lualatex -jobname=%A-lualatex "$(FILE)"; \
	fi

# Remove folder with auxiliary files
clean:
	rm -rfv aux

# Remove folder with auxiliary files and output files
clean-all:
	rm -rfv aux out samples

# Install both Tufte classes along with fonts, sample documents, etc.
install: all
	mkdir -pv $(CLASSDIR)/fonts/recursive-mono
	mkdir -pv $(DOCDIR)

	cp -iv tufte-book.cls	tufte-common.def tufte-handout.cls $(CLASSDIR)

	cp -iv readme.md custom-tufte-common.tex sample-*.tex sample-*.bib $(DOCDIR)
	cp -iv samples/sample-handout-lualatex.pdf $(DOCDIR)/sample-handout.pdf
	cp -iv samples/sample-book-lualatex.pdf $(DOCDIR)/sample-book.pdf

	cp -riv fonts/recursive-mono/* $(CLASSDIR)/fonts/recursive-mono
	texhash

# Remove both Tufte classes along with their dependencies
uninstall:
	rm -rfv $(CLASSDIR)/*
	rm -rfv $(DOCDIR)/*

	texhash

# Update Tufte classes by overriding old versions in TEXMFHOME dir
update: uninstall install