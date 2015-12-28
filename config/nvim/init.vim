" load plugins from vundle
source ~/.config/nvim/plugins.vim

" execute pathogen#infect()
set tabstop=4
set shiftwidth=4
set expandtab
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

" set backspace=indent, start  " allow backspacing over everything in insert mode
set autoindent
set copyindent  " copy the previous indentation on autoindenting
set number  " show lines' number
set showmatch  " show matching parenthesis
set smartcase  " ignore case if search pattern is all lowercase
set hlsearch  " highlight search terms
set incsearch  " show search matches as you type
autocmd BufWritePre *.py :%s/\s\+$//e  " auto remove trailing whitespaces
set clipboard=unnamed  " allow copy/paste from vim to other app
set title  " change the terminal's title

" autocmd filetype python set expandtab

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline
set laststatus=2
set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly
"if has('gui_running')
let g:airline_powerline_fonts = 1
"endif
"let g:airline#extensions#tmuxline#enabled = 0
"let g:tmuxline_theme = 'airline'

let g:syntastic_python_flake8_args='--ignore=E501,E225'

" ocp-indent for indenting ocaml files
autocmd FileType ocaml setlocal ts=2 sts=2 sw=2
" autocmd FileType ocaml source /Users/simonbihel/.vim/bundle/ocp-indent-vim/indent/


" merlin for syntastic ocaml checker
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']

set rtp^="/Users/simonbihel/.opam/system/share/ocp-indent/vim"
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

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>""

set completeopt-=preview  " remove scratch preview window for completion
