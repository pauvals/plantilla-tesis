# Plantilla para tesis doctoral

This is a template for a PhD thesis with a separate title page.
This template aims at setting up all the necessary packages and create the base outline of a thesis.
Estoy revisando la plantilla y decidiendo entre explicaciones en castellano y/o en inglés, porque mi lengua materna vs. la lingua franca etc.
Eventualmente dejaré lo que usé yo y considero que quede en ese estilo, y lo que considero útil por si alguien más usara esta plantilla. 
(vscode quién te juna)


## How to compile
To use the template, a LaTeX distribution must be installed on your system.
When using TexLive, a version more recent that TexLive2019 is required. 

### From command line
A `makefile` is provided to use this template.
First, the title page must be compiled using the command
```shell
$ make portada
```
Then, the document is compiled using the 
```shell
$ make main
```
The resulting documents is stored in [pdfs/tesis.pdf](pdfs/tesis.pdf).
Both the titlepage and the thesis can be compiled in one go using the command
```shell
$ make portada main
```


### From VSCode
To use the template with VSCode, the extension [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) must be installed.
Once the installation is finished, open the root of the repository as a directory/folder in VSCode.
Then open the file [tesis.tex](tesis.tex) by double-clicking on it.
To compile the template, click on the green "play" button.
The PDF file can also be open by right-clicking on it in the tree on the left and clicking on "Open to the side".

The settings for the compilation are stored in the file [.vscode/settings.json](.vscode/settings.json).

### From TeXstudio (in english)
It is possible to create a button in TeXstudio to compile the document.
Here are the different steps:
- In the top menus go to "Options" --> "Configure TeXstudio ..."
- Go to the "Build" tab
- Enter the following command in "User compilations".
    - Command name (first box): `CompilePhD:CompilePhD` (you can put whatever you want)
    - Command (second box): `make portada main | txs:///view-pdf-internal --embedded pdfs/tesis.pdf`
This command first compiles the title page, then the content, and finally it displays the pdf with the TeXstudio PDF reader.

At this point, the compilation is accessible from the interface by going to "Tools" --> "User" --> "1: CompilePhD" or by using the shortcut "Alt+Shift+F1".
To make it more simple, it is also possible to add a button in the interface:
- In the top menus, go to "Options" --> "Configure TeXStudio ..."
- You have to check "Show advanced options" at the bottom left
- Go to the "Toolbar" tab
- On the left, you have to choose in which toolbar you want to put the shortcut with the drop-down menu. The best is to choose "Tools".
- On the right, you need to find the compilation command: in the drop-down menu, choose "All menus". Then choose "Tools" --> "User" -> "1: CompilePhD".
- After selecting the command, you should transfer it to the left with the arrows.
- (Optional) By right-clicking there is an option to change the icon that will be displayed.
- After validating with the "OK" button, there will be a button to the right of the buttons for compiling, displaying the pdf, etc. When you click on it, it is supposed to execute the command.
It is also possible to change the shortcut in the "Keyboard shortcuts" tab of the "Configure TeXstudio" window.

### Cleaning
If for any reasons, the temporary and cache files become you can delete the entire `build` directory.

## Features
The different features of this documents listed below.

- Flavors
- Organisation of the file;
- Styling of the document;
- Styling of the bibliography;
- Notation file;
- Tikz externalization

# Flavors

You can customize the template by enabling or disabling various options in `cfthesis.cls`.
All customizations are marked with the keyword `FLAVOR`, making them easy to find by searching for this term within the file.

The available customizations include:

- Accent color: Modify the color used for accents throughout the document. Actualmente: colores de FCQ UNC.
- Chapter title number font: Change the font style used for the numbers in chapter titles.
- Centering of numberless chapter titles: Control whether chapter titles without numbers are centered or aligned differently.
- Minitoc rules: Enable or disable rules (horizontal lines) around mini tables of contents.

If you have suggestions for additional customizations or improvements, they might be added as a new flavor or even become part of the default style.

## Organisation of the files
The file structure of the template is the following.
```
├── .latexmkrc
├── .vscode/
│   └── settings.json
├── biblio.bib
├── build
│   ├── tesis.aux
│   └── ...
├── capitulos
│   ├── 0_preliminar.tex
│   ├── 1_introduction.tex
│   ├── N_conclusiones.tex
│   └── portada
│       ├── imagen-institucional-fcq-redisenio.pdf
│       ├── Isologo-FCQ-color-y-ByN-1.pdf
│       ├── isologo-fcq.png
│       ├── paleta-colores-fcq-unc.png
│       ├── portada.tex
│       ├── UNC_08_AZUL.svg
│       ├── unc1_b.jpg
│       ├── unc1_e.jpg
│       └── unc_azul.png
├── cftesis.cls
├── custom-apa.bbx
├── figures
│   └── figure.pdf
│   └── ...
├── makefile
├── notations.tex
├── pdfs
│   ├── tesis.pdf
│   └── portada.pdf
├── tesis.tex
└── README.md
```
The different files are listed below.
- `tesis.tex` is the main file. It contains the user preamble and inputs the title page, the chapters ...
- `cftesis.cls` is the class file for the `cftesis` custom class. It contains most of the default package and styling in the document.
- `.latexmkrc` is a configuration file for `latexmk` (which is used to compile the document).
- `biblio.bib` contains the bibliography in the `biblatex` format.
- `build` directory contains all files generated during the compilation of the document.
- `capitulos` is the directory containing the chapters files and the title page directory.
- `portada` is the directory containing the title page.
- `custom-apa.bbx` is a custom bibliography style based on the APA style.
- `figures` is the directory to store the figures.
- `makefile` is the file containing the compilation rules.
- `notations.tex` is the notations file.
- `pdfs` contains the compiled title page and thesis.
- `README.md` is this file !

## Title page
The title page files are located in the folder [capitulos/portada](capitulos/portada). It is compiled by running `make portada` 
from the root of the template (see the section "How to run" for other methods).
[Logo FCQ](https://www.fcq.unc.edu.ar/identidad-institucional/) (consultado el 31/3/26).
[Logo UNC](https://www.unc.edu.ar/comunicaci%C3%B3n/versiones-descargables-del-escudo-de-la-unc) (consultado el 31/3/26).
El estilo final de la carátula está inspirado en el original del proyecto forkeado, con unas pequeñas intervenciones que pueden ser
modificadas nuevamente :)


## Options of the cftesis class
The `cftesis` document class has different options:
- `cast`: Load babel package with the spanish options.
- `emptypage`: Make the pages with no content empty (remove headers, footers, page numbers).
- `tikz`: Load Tikz and PGFPlots. It also enables externalization. It is highly recommended naming each `tikzpicture` using the command `\tikzsetnextfilename` (avoid recompiling all tikzpictures when adding new tikzpicture before existing ones). Note that this option is activated in the default `PhD_Thesis.tex` file and should be disabled if you don't want to use Tikz or PGFPlots.
- All others options are passed to the book document class.

To use those options, you must specify them in the document class command `\documentclass[12pt,a4paper,openright,...]{cftesis}` at the beginning of `PhD_Thesis.tex`.

## Styling of the document

### Font
Elegí la fuente de la [Reforma UNC](https://www.unc.edu.ar/comunicaci%C3%B3n/reforma-la-tipograf%C3%ADa-dise%C3%B1ada-para-la-unc-y-de-acceso-libre).
Para esto, dado que es una tipografía OpenType, hay que compilar usando LuaLaTex.

Adjunto una carpeta con la tipografía y su correspondiente licencia **Creative Commons BY-ND 4.0**i, bajo la cual hago uso de la tipografía. 
Fue diseñada por la fundidora digital cordobesa PampaType **(Alejandro Lo Celso y Guido Ferreyra)**, 
en un trabajo articulado desde el Área de Diseño de la Prosecretaría de Comunicación Institucional de la UNC.
Además, tienen [un artículo](https://www.pampatype.com/es/blog/reforma) interesante para leer respecto al trabajo de diseño.

### Headers and footers
The header are footer are set with the package `fancyhdr`.
The left page headers contain the chapter name and the right page headers contain the section name.
The page numbers are set in the footer in the exterior side of the page.

### Captions
For the caption, we use the package `caption`.
The caption label is formatted in **bold** and the separator is a `\quad`.
To have the same separator as D. Néron, you can replace
```TeX
\captionsetup{labelsep=quad}
```
by
```TeX
% \DeclareCaptionLabelSeparator{bullet}{~$\bullet$~}
% \captionsetup{labelsep=bullet}
```
Another interesting option is the `hang` option that can be activated like that
```TeX
\RequirePackage[hang,labelfont=bf]{caption}
```

## Bibliography
The bibliography is managed with the package `biblatex`, with the possibility of using a custom `.bbx` file based on the APA style.
The bibliography must be stored in a file named `biblio.bib` at the root of the template.
To avoid any issues, it is recommended to export the bibliography from Zotero with
- `biblatex` format;
- disabled "Export notes" and "Export files";
- `Unicode (utf-8)` encoding.

Cambié el uso de la bibliografía para citar con estilo de la ACS, y para imprimir la bibliografía por capítulo.

## Notations
The notations file (`notations.tex`) is split into two parts:
- the definition of new commands for notations,
- the definition of the command `\listofnotations`, which is composed of different long tables containing the notations and separated into different subsections. Other informations (*e.g.*, units, abbreviations, etc.) can easily be introduced by adding new columns to the tables.
The command `\listofnotations` is called is the frontmatter file (`capitulos/preliminar.tex`).
I recommend to fill the notation table while defining the command.


## Tikz externalization
It should be working out-of-the-box.
By default, the figure are cached in files with a name based on tikzpicture number.
By adding a new tikz figure at the beginning, it will shift the figure number and all figures will need to be compiled again.
To avoid this, you can set the name of each figure manually using the following command (I recommend using the label of the figure)
```TeX
\tikzsetnextfilename{name_of_the_figure}
```
Other tips can be found here: [https://tex.stackexchange.com/a/57738](https://tex.stackexchange.com/a/57738).

## Uso en español/castellano
Agregué la opción de babel para uso en castellano, y cambié títulos de capítulos, índices
y algunas otras cosas para que se muestren en castellano.
Para hacer estos cambios modificar:

- "Índice" en `cftesis.cls` (definición de nuevo `\contentsname`).
- "Parte" en `cftesis.cls` (definición de nuevo `\partname`).
- "Lista de símbolos" en `notations.tex` (definición del comando `\listnotationsname`),
- "Agradecimientos" en `preliminar.tex`,
- (opcional, actualmente desactivado) "Resumen de capítulo" in `tesis.tex`.

Hecho con :mate: y :metal: as usual :)

