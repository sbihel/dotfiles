set nocompatible  " not compatible with vi

" load plugins from vundle
source ~/.config/nvim/plugins.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
if has('gui_running')
    set background=dark
else
    set background=dark
endif
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

" TAB control, indentation
set expandtab  " insert spaces instead of tabs for <Tab>
set smarttab   " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4
set shiftwidth=4
set autoindent
set copyindent  " copy the previous indentation on autoindenting
set smartindent

" search
set smartcase  " ignore case if search pattern is all lowercase
set hlsearch  " highlight search terms
set incsearch  " show search matches as you type

" show tabs
set list
set listchars=tab:!·

set relativenumber  " show relative lines number
set number  " show lines number
set showmatch  " show matching parenthesis
set clipboard=unnamed  " allow copy/paste from vim to other app
set title  " change the terminal's title
set encoding=utf8
" set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set hidden  " current buffer can be put into background

autocmd BufWritePre * :%s/\s\+$//e  " auto remove trailing whitespaces
autocmd! BufWritePost * Neomake  " call neomake at write like syntastic

" cmap w!! w !sudo tee % >/dev/null  " write when forgot to launch nvim with sudo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE SPECIFICS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType c setlocal tw=80 cc=80


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction
" C-g undo, tab completion, close popup by space
inoremap <expr><C-g>   deoplete#mappings#undo_completion()
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Space> deoplete#mappings#undo_completion()."\<Space>"


" airline
set laststatus=2
set guifont=Source\ Code\ Pro\ for\ Powerline " make sure to escape the spaces in the name properly
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tmuxline#enabled = 0
"let g:tmuxline_theme = 'airline'
let g:airline#extensions#tabline#enabled = 1

" ocp-indent for indenting ocaml files
autocmd FileType ocaml setlocal ts=2 sts=2 sw=2
" autocmd FileType ocaml source /Users/simonbihel/.vim/bundle/ocp-indent-vim/indent/
" set rtp^="/Users/simonbihel/.opam/system/share/ocp-indent/vim"
" set rtp+=</Users/simonbihel/.vim/bundle/ocp-indent-vim>


" tagbar go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
        \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
