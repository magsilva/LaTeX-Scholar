ROOT = root
BIBTEX_FILES = requirements.bib eai.bib projects.bib
PDFLATEX_ARGS = -file-line-error -interaction nonstopmode -recorder --src-specials

all: clean pdf

distclean: clean
	rm -f *.pdf *.ps

clean:
	rm -f *.log *.lot *.aux *.toc *.dvi *.bbl *.blg *.*~* *.lof *.ilg *.gls *.glo *.backup *.bak.* *.out *.cb *.bak *.ind *.idx *.fls *.lol root.bib

check:
	chktex -n 2 -n 8 -n 6 -n 38 -n 13 -n 36 -n 24 $(ROOT)
	bibclean $(BIBTEX_FILES) > /dev/null

firstrun:
	-pdflatex $(PDFLATEX_ARGS) $(ROOT)

bibtex:
	cat $(BIBTEX_FILES) > $(ROOT).bib
	-bibtex $(ROOT)

glossary:
	-makeindex -c -s makeglo.ist -o $(ROOT).gls $(ROOT).glo

index:
	-makeindex -c -s makeidx.ist -o $(ROOT).ind  $(ROOT).idx

pdf: firstrun bibtex glossary index
	-pdflatex $(PDFLATEX_ARGS) $(ROOT)
	-pdflatex $(PDFLATEX_ARGS) $(ROOT)
	-pdflatex $(PDFLATEX_ARGS) $(ROOT)

txt:
	untex $(ROOT).tex
