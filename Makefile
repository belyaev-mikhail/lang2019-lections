
%.pdf: %.md preamble.yml preamble.tex
	pandoc -t beamer+smart \
		--pdf-engine=xelatex \
		-f markdown \
		--include-in-header=preamble.tex \
		--metadata-file=preamble.yml \
		-s $*.md -o $*.pdf

%.tex: %.md preamble.yml preamble.tex
	pandoc -t beamer+smart \
		--pdf-engine=xelatex \
		-f markdown \
		--include-in-header=preamble.tex \
		--metadata-file=preamble.yml \
		-s $*.md -o $*.tex

%.eps: %.svg
	inkscape $*.svg -E $*.eps

all: lection0.pdf lection1.pdf lection2.pdf lection3.pdf lection4.pdf lection5.pdf lection6.pdf lection7.pdf lection8.pdf lection9.pdf lambda-calculus.pdf

.PHONY: all

clean:
	rm *.pdf *.vrb *.toc *.nav *.log *.aux *.fdb_latexmk *.snm *.out
