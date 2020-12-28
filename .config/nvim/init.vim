" ~~~~~~~~~~~~~
" ~~ GENERAL ~~
" ~~~~~~~~~~~~~

" Establecemos una tecla líder:
let mapleader = ","

" Establecemos la codificación de caracteres unicode:
set encoding=utf-8

" Desactivamos los archivos swap y backup (innecesarios porque guardo siempre):
set nobackup
set noswapfile

" Usamos el portapapeles del sistema (necesita xclip):
set clipboard=unnamedplus

" Abrir un nuevo archivo para editar:
nnoremap <leader>op :e<Space>

" Abrir una nueva ventana horizontal en el archivo actual:
nnoremap <leader>sh :split<CR>

" Abrir una nueva ventana vertical en el archivo actual:
nnoremap <leader>sv :vsplit<CR>

" Navegar entre ventanas abiertas:
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Abrir una nueva pestaña:
nnoremap <leader>t :tabnew<CR>

" Navegar entre pestañas abiertas:
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>

" Instalar vim-plug si no está instalado:
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif


" ~~~~~~~~~~~~~
" ~~ PLUGINS ~~
" ~~~~~~~~~~~~~

call plug#begin()

Plug 'morhetz/gruvbox'

call plug#end()

" Plugin gruvbox:
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_underline = 1
let g:gruvbox_invert_selection = 1
colorscheme gruvbox


" ~~~~~~~~~~~~~~
" ~~ INTERFAZ ~~
" ~~~~~~~~~~~~~~

" Activamos los plugins y los colores de sintaxis:
filetype plugin on
syntax enable

" Mejores colores (true colors):
set termguicolors
 
" Resaltamos la línea en que nos encontramos:
set cursorline

" Mostramos el número de cada línea (de forma relativa):
set number relativenumber

" Activamos el mouse:
set mouse=a

" Mostramos el comando que ingresamos en la parte inferior derecha:
set showcmd

" Autocomplete para el menú de comandos:
set wildmenu           
set wildmode=longest:full,full

" No redibujar la pantalla todo el tiempo (produce macros más rápidos):
set lazyredraw

" Cuando nos paramos sobre un paréntesis, llave o corchete, el próximo que
" coincida será resaltado:
set showmatch


" ~~~~~~~~~~~~~~~~
" ~~ STATUSLINE ~~
" ~~~~~~~~~~~~~~~~

" Lado izquierdo:
set noshowmode
set laststatus=2    " Statusline siempre activa.
set statusline=
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=[
set statusline+=%F  " Nombre del archivo (largo).
set statusline+=]
set statusline+=\ 
set statusline+=%m  " Indicador de modificación.
set statusline+=\ 
set statusline+=%r  " Indicador de sólo-lectura.

"Lado derecho:
set statusline+=%=
set statusline+=\ 
set statusline+=%l  " Número de línea actual.
set statusline+=/
set statusline+=%L  " Cantidad total de líneas.
set statusline+=\ 
set statusline+=%c  " Número de columna actual.
set statusline+=\ 
set statusline+=%P  " Porcentaje del archivo.
set statusline+=\ 
set statusline+=%y  " Tipo de archivo.

" Función que muestra el modo en el que estamos:
function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction


" ~~~~~~~~~~~~~~~
" ~~ BÚSQUEDAS ~~
" ~~~~~~~~~~~~~~~

" Buscar a medida que vamos ingresando caracteres:
set incsearch         

" Buscar mayúsculas y minúsculas por igual:
set ignorecase

" Si mi patrón de búsqueda tiene una mayúscula, busca mayúsculas; si no, busca las dos por igual:
set smartcase

" Desactivamos el resaltado de las búsquedas:
nnoremap <leader>h :nohlsearch<CR>

" Buscamos con expresiones regulares mejoradas:
set magic

" Atajo para reemplazar. La búsqueda es case sensitive y con confirmación:
nnoremap <leader>r :%s//gcI<left><left><left><left>


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~ ESPACIOS / TABULACIONES ~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Cantidad de columnas que inserta una tabulación:
set tabstop=2 

" Cantidad de columnas que inserta una tabulación.
" Si esta opción es menor que tabstop y la opción expandtab no está presente, 
" vim usa una combinación de espacios y tabulaciones para ocupar el espacio deseado.
" Si esta opción es igual a tabstop y la opción expandtab no está presente, vim
" siempre usará tabulaciones.
" Cuando la opción expandtab está presente, vim siempre usará espacios.
set softtabstop=2

" Convertimos las tabulaciones en espacios:
set expandtab

" Cantidad de columnas que tiene una indentación (se mide en espacios, así que
" si utilizamos tabulaciones para indentar, esta opción debe coincidir con tabstop):
set shiftwidth=2

" Respeta el estilo de indentación del código que estemos editando (si esta
" opción está activa, también debe estar activada la opción autoindent):
set smartindent

" Aplicamos la indentación de la línea actual en la siguiente cuando apretamos 
" o en normal mode o enter en insert mode:
set autoindent

" Si una línea es muy larga y no entra en la pantalla, cortamos y seguimos en 
" la línea siguiente:
set linebreak

" Cuando una línea llega al final de la pantalla, continúa abajo, mostrando 
" +++ para indicar este comportamiento:
set showbreak=+++

" Establecemos el ancho máximo del texto que ingresamos:
set textwidth=2000


" ~~~~~~~~~~~~~~~
" ~~ ESCRITURA ~~
" ~~~~~~~~~~~~~~~

" Activamos spell check:
set spelllang=es,en_us
nnoremap <leader>sc :setlocal spell!<CR>

" Atajos para autocompletar paréntesis, comillas, etcétera:
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap ¿ ¿?<left>
inoremap < <><left>

" Ir al final de la línea en insert mode:
inoremap <C-e> <C-o>$

" Ir al principio de la línea en insert mode:
inoremap <C-a> <C-o>0
