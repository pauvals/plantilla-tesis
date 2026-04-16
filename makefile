.PHONY: main portada

main:
	mkdir -p build/build
	latexmk --shell-escape -logfilewarnings -lualatex --output-directory=build tesis.tex
	cp build/tesis.pdf pdfs/

portada:
	cd capitulos/portada && latexmk --shell-escape -lualatex --output-directory=../../build portada.tex
	cp build/portada.pdf pdfs/portada.pdf

