################################################################################
###  This file contains make targets for compiling and managing sample docs  ###
#  Written originally by Chris K. Grant, modified by Daniel Aaron Salwerowicz  #
################################################################################

# Compile to 'out' dir, store auxiliary files in 'aux' dir, use 'bibtex'
LMKFLAGS = -outdir=samples -auxdir=aux -bibtex
# Path to install class files for modern-tufte-latex files in 'TEXMFHOME' dir
CLASSDIR =  $$(kpsewhich -var-value TEXMFHOME)/tex/latex/modern-tufte-latex
# Path to install doc files for modern-tufte-latex files in 'TEXMFHOME' dir
DOCDIR =  $$(kpsewhich -var-value TEXMFHOME)/doc/latex/modern-tufte-latex

# Default target, compiles all files with LuaLaTeX, XeLaTeX, and pdfLaTeX
all: compile-lua compile-xe compile-pdf

# Same as 'all' target, so both 'make compile', 'make all', and 'make' work
compile: all

# Every compile target uses 'find' to avoid compiling custom-tufte-*.tex files
# -maxdepth 1: only search in the current directory
# -name '*.tex': search for files with the .tex extension
# -not -path '*/custom-tufte-*': exclude files with the 'custom-tufte-' prefix
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

# Target that allows for compiling a single file with LuaLaTeX
# Engine can be changed as desired with '-xelatex' or '-pdflatex'
# When invoking the target provide filename with extension like this:
# make compile-only FILE="<file>.tex"
compile-only:
	if [ -z "$(FILE)" ]; then \
		echo "You need to provide a FILE parameter when using this target"; \
		echo "make compile-only FILE=\"<file>.tex\""; \
	else \
		latexmk $(LMKFLAGS) -lualatex -jobname=%A-lualatex "$(FILE)"; \
		xdg-open samples/$(basename $(FILE))-lualatex.pdf; \
	fi

# Remove folder with auxiliary files
clean:
	rm -rfv aux

# Remove folder with auxiliary files and output files
clean-all:
	rm -rfv aux samples

# Install both Tufte classes, documentation, etc.
install: all
	mkdir -pv $(CLASSDIR)
	mkdir -pv $(DOCDIR)

	cp -iv tufte-book.cls	tufte-common.def tufte-handout.cls $(CLASSDIR)

	cp -iv readme.md custom-tufte-common.tex sample-*.tex sample-*.bib $(DOCDIR)
	cp -iv samples/sample-handout-lualatex.pdf $(DOCDIR)/sample-handout.pdf
	cp -iv samples/sample-book-lualatex.pdf $(DOCDIR)/sample-book.pdf

	texhash

# Remove both Tufte classes along with other files installed by 'make install'
uninstall:
	rm -rfv $(CLASSDIR)/*
	rm -rfv $(DOCDIR)/*

	texhash

# Update Tufte classes by overriding old versions in 'TEXMFHOME' dir
update: uninstall install