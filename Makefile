# compiler
LATEX=xelatex # pdflatex
# bibliography utility biber/bibtex
BIBLIO=bibtex
# glossaries
GLOSSY=makeglossaries
# output
TARGET=thesis
# temporary flat
TARGET_FLAT=$(TARGET)_flat
# previous flat (to compare)
TARGET_FLAT_OLD=$(TARGET_FLAT)_old
# difference file
TARGET_DIFF=$(TARGET)_diff
# print file (sometimes printer struggles)
TARGET_PRINT=$(TARGET)_print

# scan for files
TEX_FILES=$(wildcard content/*.tex thesis.tex)  # source
FIG_FILES=$(wildcard figures/*.*)  # figures
REF_FILES=$(wildcard *.bib)  # references

all: thesis.pdf clean

thesis.pdf: $(TEX_FILES) $(FIG_FILES) $(REF_FILES)
	$(LATEX) $(TARGET).tex
	$(BIBLIO) $(TARGET)
	# $(GLOSSY) $(TARGET)
	$(LATEX) $(TARGET).tex
	$(LATEX) $(TARGET).tex

clean:
	rm -f *.ist *.acn *.alg *.aux *.bbl *.blg *.glg *.glo *.lof *.acr *.gls *.out *.log *.tdo *.fls *.fdb_latexmk *.bcf *.lot *.toc *.run.xml *-blx.bib

# to produce a difference pdf
diff: thesis_diff.pdf clean

thesis_flat.tex: $(TEX_FILES) $(FIG_FILES) $(REF_FILES)
	latexpand --show-graphics ${TARGET}.tex > ${TARGET_FLAT}.tex

thesis_diff.tex: thesis_flat.tex $(TARGET_FLAT_OLD).tex
	latexdiff ${TARGET_FLAT_OLD}.tex ${TARGET_FLAT}.tex > ${TARGET_DIFF}.tex

thesis_diff.pdf: thesis_diff.tex
	$(LATEX) $(TARGET_DIFF).tex
	makeglossaries $(TARGET_DIFF)
	$(BIBLIO) $(TARGET_DIFF)
	$(LATEX) $(TARGET_DIFF).tex
	$(LATEX) $(TARGET_DIFF).tex

thesis_print.pdf: thesis.pdf
	gs -sDEVICE=pdfwrite -sOutputFile=$(TARGET_PRINT).pdf -dBATCH -dNOPAUSE $(TARGET).pdf

# this will overwrite the previous old file
keep: thesis_flat.tex
	cp -i $(TARGET_FLAT).tex $(TARGET_FLAT_OLD).tex
