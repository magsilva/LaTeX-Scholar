ROOT = root
BIBTEX = $(ROOT)
PDFLATEX_ARGS = -file-line-error -interaction nonstopmode -recorder --src-specials

all: clean pdf

clean:
	rm -f *.log *.aux *.toc *.dvi *.bbl *.blg *.fls *.cb *.*~* *.backup *.bak *.tmp *.glo *.lot *.lof *.idx

check:
	chktex -n 2 -n 8 -n 6 -n 38 -n 13 -n 36 -n 24 $(ROOT)
	bibclean $(BIBTEX) > /dev/null

pdf: clean
	pdflatex $(PDFLATEX_ARGS) $(ROOT)
	-bibtex $(ROOT)
	pdflatex $(PDFLATEX_ARGS) $(ROOT)
	pdflatex $(PDFLATEX_ARGS) $(ROOT)
	pdflatex $(PDFLATEX_ARGS) $(ROOT)

