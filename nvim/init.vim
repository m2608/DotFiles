"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

call plug#begin('~/.nvim-plugged')

" цветовые схемы
Plug 'widatama/vim-phoenix'

" плагин для удобного изменения тегов, кавычек
Plug 'tpope/vim-surround'
"
" навигация по коду
Plug 'preservim/tagbar'
let g:tagbar_ctags_bin = '/usr/local/bin/uctags'
" вызов окна для навигации по коду (плагин tagbar)
nmap <F8> :TagbarToggle<CR>

" работа с Clojure REPL
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" радужные скобки
Plug 'kien/rainbow_parentheses.vim'

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
let g:pymode_options_max_line_length = 120

call plug#end()

" размер табуляции - 4 пробела
set tabstop=4

" заменять табуляции пробелами для всех файлов, кроме Makefile
set expandtab
autocmd FileType make setlocal noexpandtab

" количество пробелов для автовыравнивания кода
set shiftwidth=4

" добавить русскую раскладку (переключение по ctrl+^)
set keymap=russian-jcukenwin2

" использовать ее по умолчанию при запуске vim
set iminsert=0
set imsearch=0

" цветовая схема
colorscheme phoenix

" бирюзовый курсор при включенной русской раскладке
highlight lCursor guifg=NONE guibg=Cyan cterm=none ctermfg=none ctermbg=214

" забой убирает подсветку найденных фраз
nmap <silent> <BS>  :nohlsearch<CR>

" переход между окнами
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" сочетания клавиш для режима вставки
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" сочетания клавиш для режима команд
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" команды для кодирования и декодирования base64 и URL
command! -range URLencode :<line1>,<line2>!python3 -c "import sys; from urllib.parse import quote; print(quote(sys.stdin.read().strip()));"
command! -range URLdecode :<line1>,<line2>!python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read().strip()));"
command! -range B64encode :<line1>,<line2>!python3 -c "import sys; from base64 import b64encode; print(b64encode(sys.stdin.read().strip().encode('utf-8')).decode('utf-8'));"
command! -range B64decode :<line1>,<line2>!python3 -c "import sys; from base64 import b64decode; print(b64decode(sys.stdin.read().strip().encode('utf-8')).decode('utf-8'));"
command! -range B64URLencode :<line1>,<line2>!python3 -c "import sys; from urllib.parse import quote; from base64 import b64encode; print(quote(b64encode(sys.stdin.read().strip().encode('utf-8')).decode('utf-8')));"
command! -range URLB64decode :<line1>,<line2>!python3 -c "import sys; from urllib.parse import unquote; from base64 import b64decode; print(b64decode(unquote(sys.stdin.read().strip()).encode('utf-8')).decode('utf-8'));"

" команда :find будет искать файлы также и в подкаталогах
set path+=**
