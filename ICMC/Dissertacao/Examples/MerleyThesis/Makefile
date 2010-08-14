ROOT = root

all: clean pdf

distclean: clean
	rm -f *.pdf *.ps

check:
	chktex -n 2 -n 8 -n 6 -n 38 -n 13 -n 36 -n 24 $(ROOT)

clean:
	rm -f *.log *.aux *.toc *.dvi *.bbl *.blg *.*~* *.lof *.ilg *.gls *.glo *.backup *.bak.* *.nav *.out *.snm *.gif *.backup *.dat *.vrb

ps:
	latex $(ROOT)
	latex $(ROOT)
	dvips -P pdf -ta4 $(ROOT) -o $(ROOT).tmp.ps
	psnup -1 -W128mm -H96mm -pa4 $(ROOT).ps

pdf:
	pdflatex $(ROOT)
	pdflatex $(ROOT)
	-bibtex $(ROOT)
	pdflatex $(ROOT)
	pdflatex $(ROOT)
	pdflatex $(ROOT)
