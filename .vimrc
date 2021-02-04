set nocompatible  " be iMproved, required
filetype off  " required
set exrc

set encoding=UTF-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

source $HOME/.vim/vpm/sources.vim

call vundle#end()
filetype plugin indent on

set omnifunc=syntaxComplete#Complete

" ==== Colors and other basic settings
colorscheme gruvbox
set guifont=Inconsolata\ 14
set fillchars+=vert:\|
syntax enable
set background=dark
set ruler
set hidden
set number
set relativenumber
set laststatus=2
set smartindent
set st=2 sw=2 et
set shiftwidth=2
set tabstop=2
set colorcolumn=80
set encoding=UTF-8
set hlsearch
let g:vim_json_syntax_conceal = 0
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" For mac --> Delete key doesnt work properly
" set backspace=indent,eol,start

" To Remove a plugin
"set runtimepath-=~/.vim/bundle/<plugin-folder>

" g: -> Global setting
" b: -> Buffer setting

" Keymaps
map ii <Esc>
map <F7> "+y
map <F8> "+p
noremap S :%s//g<Left><Left>
" display the buffer list and invoke the ':buffer' command. You can enter the desired buffer number and hit <Enter> to edit the buffer. 
nnoremap ,b :ls<CR>:b<Space>
" Resize window
nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" ==== custom commands
command JsonPretty execute ":%!python -m json.tool"

" Command to wipe the register history
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

autocmd VimEnter * WipeReg

" ==== FZF Config
source $HOME/.vim/pluginConfig/fzf.vim

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" === ALE
" let g:ale_linters = {
"  \ 'javascript': ['eslint']
"  \ }

" === typescript
let g:tsuquyomi_disable_default_mappings = 1
autocmd FileType typescript noremap <silent> <C-]> :TsuDefinition<CR>
autocmd FileType typescriptreact noremap <silent> <C-]> :TsuDefinition<CR>

" === flake8
let g:flake8_show_in_file=1

" ==== snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_semantic_triggers =  { 'c' : ['->', '.', '::', 're!gl'], 'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s'] }
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ==== moving around
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== disable mouse
set mouse=c

" ==== disable swap file warning
set shortmess+=A

" === generate ctags
" echo "generating tags..."
" call system('ctags -R . ')

let g:pymode_indent = 0

set secure

