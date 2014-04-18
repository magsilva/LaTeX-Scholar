ROOT = root
BIBTEX = $(ROOT)
# PDFLATEX = /opt/texlive/2011/bin/x86_64-linux/pdflatex
PDFLATEX = pdflatex
PDFLATEX_ARGS = -file-line-error -interaction nonstopmode -recorder --src-specials
LATEXRTF = latex2rtf
LATEXRTF_ARGS = -i brazil

all: clean pdf

distclean: clean
	rm -f  *.pdf

check:
	chktex -n 2 -n 8 -n 6 -n 38 -n 13 -n 36 -n 24 $(ROOT)
	bibclean $(BIBTEX) > /dev/null

clean:
	rm -f *~ *.log *.aux *.toc *.dvi *.bbl *.blg *.*~* *.lof *.lot *.cb *.backup *.out *.glo *.idx *.fls *.lol *.ilg *.gls *.plog

optimize:
	for i in `find . -name "*.png"`; do pngrewrite $i $i.new; mv $i.new $i; optipng -o2 -i0 $i; advpng -z -4 $i; done
#	for i in `find . -name "*.png"`; do optipng -o2 -i0 $i; done
# for i in `find . -name "*.png"`; do pngcrush -reduce -rem cHRM -rem iCCP -rem sRGB -rem text $i $i.new; mv $i.new $i; done

pdf:
	-$(PDFLATEX) -draftmode $(PDFLATEX_ARGS) $(ROOT)
	-bibtex -min-crossrefs=60 $(ROOT)
	iconv --from-code=ISO-8859-1 --to-code=UTF-8 $(ROOT).bbl > $(ROOT).bbl.new
	mv $(ROOT).bbl.new $(ROOT).bbl
	-makeindex -c -s makeglo.ist -o $(ROOT).gls $(ROOT).glo
	-makeindex -c -s makeidx.ist -o $(ROOT).ind  $(ROOT).idx
	$(PDFLATEX) -draftmode $(PDFLATEX_ARGS) $(ROOT)
	$(PDFLATEX) -draftmode $(PDFLATEX_ARGS) $(ROOT)
	$(PDFLATEX) $(PDFLATEX_ARGS) $(ROOT)
	$(PDFLATEX) $(PDFLATEX_ARGS) $(ROOT)
	$(PDFLATEX) $(PDFLATEX_ARGS) $(ROOT)

rtf:
	$(LATEXRTF) $(LATEXRTF_ARGS) $(ROOT)



