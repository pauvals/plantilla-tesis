.PHONY: main titlepage

main:
	mkdir -p build/build
	latexmk --shell-escape -logfilewarnings -lualatex --output-directory=build tesis.tex
	cp build/tesis.pdf pdfs/

titlepage:
	cd chapters/titlepage && latexmk --shell-escape -lualatex --output-directory=../../build titlepage.tex
	cp build/titlepage.pdf pdfs/titlepage.pdf

