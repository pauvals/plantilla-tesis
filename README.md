# PhD Thesis template

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
$ make titlepage
```
Then, the document is compiled using the 
```shell
$ make main
```
The resulting documents is stored in [pdfs/PhD_thesis.pdf](pdfs/PhD_thesis.pdf).
Both the titlepage and the thesis can be compiled in one go using the command
```shell
$ make titlepage main
```


### From VSCode
To use the template with VSCode, the extension [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) must be installed.
Once the installation is finished, open the root of the repository as a directory/folder in VSCode.
Then open the file [PhD_Thesis.tex](PhD_Thesis.tex) by double-clicking on it.
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
    - Command (second box): `make titlepage main | txs:///view-pdf-internal --embedded pdfs/PhD_Thesis.pdf`
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

You can customize the template by enabling or disabling various options in `lmpsthesis.cls`.
All customizations are marked with the keyword `FLAVOR`, making them easy to find by searching for this term within the file.

The available customizations include:

- Accent color: Modify the color used for accents throughout the document.
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
│   ├── PhD_Thesis.aux
│   └── ...
├── chapters
│   ├── 0_frontmatter.tex
│   ├── 1_introduction.tex
│   ├── N_conclusion.tex
│   └── titlepage
│       ├── Charte_graphique_ups.png
│       ├── Frame-ups.pdf
│       ├── logo2.PNG
│       ├── Logo_ups.png
│       ├── logo_ups_SMEMAG.png
│       ├── Official_Template_PhD_Universit__Paris_Saclay.pdf
│       └── titlepage.tex
├── custom-apa.bbx
├── figures
│   └── figure.pdf
│   └── ...
├── makefile
├── notations.tex
├── pdfs
│   ├── PhD_Thesis.pdf
│   └── titlepage.pdf
├── PhD_Thesis.tex
└── README.md
```
The different files are listed below.
- `PhD_Thesis.tex` is the main file. It contains the user preamble and inputs the title page, the chapters ...
- `lmpsthesis.cls` is the class file for the `lmpsthesis` custom class. It contains most of the default package and styling in the document.
- `.latexmkrc` is a configuration file for `latexmk` (which is used to compile the document).
- `biblio.bib` contains the bibliography in the `biblatex` format.
- `build` directory contains all files generated during the compilation of the document.
- `chapter` is the directory containing the chapters files and the title page directory.
- `titlepage` is the directory containing the title page.
- `custom-apa.bbx` is a custom bibliography style based on the APA style.
- `figures` is the directory to store the figures.
- `makefile` is the file containing the compilation rules.
- `notations.tex` is the notations file.
- `pdfs` contains the compiled title page and thesis.
- `README.md` is this file !

## Title page
The title page files are located in the folder [chapters/titlepage](chapter/titlepage). It is compiled by running `make titlepage` 
from the root of the template (see the section "How to run" for other methods).
[Logo FCQ](https://www.fcq.unc.edu.ar/identidad-institucional/) (consultado el 31/3/26).
[Logo UNC](https://www.unc.edu.ar/comunicaci%C3%B3n/versiones-descargables-del-escudo-de-la-unc) (consultado el 31/3/26).
El estilo final de la carátula está inspirado en el original del proyecto forkeado, con unas pequeñas intervenciones que pueden ser
modificadas nuevamente :)


## Options of the lmpsthesis class
The `lmpsthesis` document class has different options:
- `french`: Load babel package with the french options.
- `emptypage`: Make the pages with no content empty (remove headers, footers, page numbers).
- `tikz`: Load Tikz and PGFPlots. It also enables externalization. It is highly recommended naming each `tikzpicture` using the command `\tikzsetnextfilename` (avoid recompiling all tikzpictures when adding new tikzpicture before existing ones). Note that this option is activated in the default `PhD_Thesis.tex` file and should be disabled if you don't want to use Tikz or PGFPlots.
- All others options are passed to the book document class.

To use those options, you must specify them in the document class command `\documentclass[12pt,a4paper,openright,...]{lmpsthesis}` at the beginning of `PhD_Thesis.tex`.

## Styling of the document

### Font
Quise agregar algunos detalles de la fuente de la Reforma en carátula de la tesis. Para esto, dado que es una tipografía
OpenType, hay que compilar usando XeLaTex, que es el compilador de XeTex ("an extension of TeX with built-in support for Unicode and OpenType").
```TeX
\usepackage{fontspec}
\setmainfont{Reforma1918}
```
`otfinfo -f `kpsewhich Reforma1918-NegraItalica.otf` `
The font is the `utopia` font.


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
The bibliography is managed with the package `biblatex` using a custom `.bbx` file based on the APA style.
The bibliography must be stored in a file named `biblio.bib` at the root of the template.
To avoid any issues, it is recommended to export the bibliography from Zotero with
- `biblatex` format;
- disabled "Export notes" and "Export files";
- `Unicode (utf-8)` encoding.

## Notations
The notations file (`notations.tex`) is split into two parts:
- the definition of new commands for notations,
- the definition of the command `\listofnotations`, which is composed of different long tables containing the notations and separated into different subsections. Other informations (*e.g.*, units, abbreviations, etc.) can easily be introduced by adding new columns to the tables.
The command `\listofnotations` is called is the frontmatter file (`chapters/frontmatter.tex`).
I recommand to fill the notation table while defining the command.


## Tikz externalization
It should be working out-of-the-box.
By default, the figure are cached in files with a name based on tikzpicture number.
By adding a new tikz figure at the beginning, it will shift the figure number and all figures will need to be compiled again.
To avoid this, you can set the name of each figure manually using the following command (I recommend using the label of the figure)
```TeX
\tikzsetnextfilename{name_of_the_figure}
```
Other tips can be found here: [https://tex.stackexchange.com/a/57738](https://tex.stackexchange.com/a/57738).

## Use in french
In the case you want to use the template in french, you can activate the babel options `french`.

To change the different sections/chapters names that are defined in the template:

- "List of Symbols" in `notations.tex` (definition of the command `\listnotationsname`),
- "Acknowledgements" in `frontmatter.tex`,
- (optional) "Chapter summary" in `PhD_Thesis.tex`.

### Known issues in french
- When using `babel` with the `french` option, the label names *must not* contains colon ":".



# Tips
## Para instalar un paquete de latex en Manjaro Linux
Tomado de [aquí](https://drankez.blogspot.com/2013/07/linux-instalar-un-paquete-latex.html), consultado el 30/3/2026.
1. Descargar el paquete de CTAN.
1. Si hay un archivo `.sty`, copiar la carpeta a `/usr/share/texmf-dist/tex/latex/`.
1. Sino, compilar como
```shell
latex archivo.ins
```
Eso genera, entre otros archivos, uno del tipo `archivo.sty`.
1. Copiar la carpeta a `/usr/share/texmf-dist/tex/latex/`.
1. Actualizar la base de datos de latex con
```shell
mktexlsr (debí usar sudo).
```

## Agregar una fuente nueva
Copiar archivos a `/usr/share/fonts`. O donde corresponda.

# Errores y aprendizajes
## Instalar LuaLaTex :P

Tenía el siguiente error al compilar con lualatex:
```shell
 Running 'lualatex  --shell-escape -recorder -output-directory="/.../build"  "titlepage.tex"'

------------

This is LuaHBTeX, Version 1.24.0 (TeX Live 2026/Arch Linux) 

 system commands enabled.

(./titlepage.tex

LaTeX2e <2025-11-01>

L3 programming layer <2026-01-19>

[\directlua]:1: module 'luaotfload-main' not found:

    no field package.preload['luaotfload-main']

    [kpse lua searcher] file not found: 'luaotfload-main'

    [kpse C searcher] file not found: 'luaotfload-main'

Error in luaotfload: reverting to OT1
```

y lo solucioné instalando `texlive-luatex` 
`sudo pacman -S texlive-luatex`

seguido de `sudo mktexlsr` para actualizar paquetes latex ("used to generate the ls-R databases used by the kpathsea library. 
It will create them for the specified directories, or for a default list if no directories are specified").

## Hyphens
[Ver acá.](https://github.com/hyphenation/tex-hyphen)
No debería ser un error grave, según el mismo manual de babel.
```
Package babel Warning: No hyphenation patterns were preloaded for
(babel)                the language 'Spanish' into the format.
(babel)                Please, configure your TeX system to add them and
(babel)                rebuild the format. Now I will use the patterns
(babel)                preloaded for \language=0 instead on input line 51.
```
## Comandos útiles
- `tlmgr` permite instalar paquetes de latex.
- `fc-list` tira un listado de fuentes instaladas en el sistema, y sus ubicaciones.
- `otfinfo -f `kpsewhich Reforma1918-NegraItalica.otf` ` tira info de "_font features_" o características de una fuente OpenType determinada.
- `kpsewhich nombre` ubica el archivo, y si no lo encuentra no devuelve nada. 


Hecho con :mate: y :metal: as usual :)

