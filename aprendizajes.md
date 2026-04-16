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

También con `pacman`:
`pacman -S texlive-[paquete]`

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

### Uso de `\titleformat`
```tex
\titleformat{<command>}[<shape>]
    {<format>}                        % Applied to title and label
    {<label>}                         % Specify label and format
    {<sep>}                           % Separation between label and title
    {<before-code>}[<after-code>]     % Code before/after title body
```

### Incorporación de una nueva tipografía
```TeX
\usepackage{fontspec}
\setmainfont{Reforma1918}
```

