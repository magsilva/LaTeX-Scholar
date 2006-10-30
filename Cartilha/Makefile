ROOTS = root
BIBTEX_FILES = doc.bib
PDFLATEX_ARGS = -file-line-error -interaction nonstopmode -recorder --src-specials

all: $(ROOTS)

distclean: clean
#	rm -f *.pdf *.ps

clean:
	rm -f *.log *.lot *.aux *.toc *.dvi *.bbl *.blg *.*~* *.lof *.ilg *.gls *.glo *.backup *.bak.* *.out *.cb *.bak *.ind *.idx *.fls *.lol *.backup 

check:
	chktex -n 2 -n 8 -n 6 -n 38 -n 13 -n 36 -n 24 $(ROOTS
	bibclean $(BIBTEX_FILES) > /dev/null

$(ROOTS): 
	pdflatex $(PDFLATEX_ARGS) $@
	-bibtex $@
	pdflatex $(PDFLATEX_ARGS) $@
	pdflatex $(PDFLATEX_ARGS) $@
	pdflatex $(PDFLATEX_ARGS) $@
