set nocompatible  " not compatible with vi

" load plugins from vundle
source ~/.config/nvim/plugins.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256  " Explicitly tell vim that the terminal supports 256 colors
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
if has('gui_running')
    set background=dark
else
    set background=dark
endif
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

set autoread " detect when a file is changed

" faster redrawing
"set ttyfast

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
nnoremap <silent><Esc> :nohlsearch<Bar>:echo<CR>
  " cancel search with escape

" code folding settings
"set foldmethod=syntax " fold based on indent
"set foldnestmax=10 " deepest fold is 10 levels
""set nofoldenable " don't fold by default
"set foldlevel=1

set scrolloff=3 " lines of text around cursor

set relativenumber  " show relative lines number
set number  " show lines number
set showmatch  " show matching parenthesis
set clipboard=unnamed  " allow copy/paste from vim to other app
set title  " change the terminal's title
" set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set hidden  " current buffer can be put into background

"autocmd BufWritePre * :%s/\s\+$//e  " auto remove trailing whitespaces

" cmap w!! w !sudo tee % >/dev/null  " write when forgot to launch nvim with sudo

set undofile  " persistent undo
set undodir=~/.config/nvim/undodir,~/.tmp,~/tmp,/var/tmp,/tmp

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

set textwidth=120
set colorcolumn=120
set wrap "turn on line wrapping
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking

" show tabs
"set list
"set listchars=tab:!·
" toggle invisible characters
set invlist
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮,eol:¬
"highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set paste toggle
set pastetoggle=<F6>

nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" remove extra whitespace
nmap <leader><space> :'<,'>s/\s\+$//e<cr>
nmap <leader><space> :s/\s\+$//e<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE SPECIFICS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType c setlocal tw=80 cc=80
"autocmd FileType cpp setlocal tw=80 cc=80
autocmd FileType ocaml setlocal ts=2 sts=2 sw=2 tw=80 cc=80
autocmd FileType org setlocal tw=80 cc=80 nocin
autocmd FileType calendar setlocal tw=0 cc=0
autocmd FileType latex setlocal tw=80 cc=80
autocmd FileType tex setlocal tw=80 cc=80


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" neomake
autocmd! BufWritePost * Neomake  " call neomake at write like syntastic

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
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'airline'
let g:airline#extensions#tabline#enabled = 1

" ocp-indent for indenting ocaml files
" autocmd FileType ocaml source /Users/simonbihel/.vim/bundle/ocp-indent-vim/indent/
" set rtp^="/Users/simonbihel/.opam/system/share/ocp-indent/vim"
" set rtp+=</Users/simonbihel/.vim/bundle/ocp-indent-vim>
" set rtp+=</home/simon/dotfiles/config/nvim/plugged/ocp-indent-vim>


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

" Gundo tree
nnoremap <F5> :GundoToggle<CR>

" Startify
autocmd User Startified setlocal buftype=

" Bclose
nnoremap <silent> <Leader>bd :Bclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

function! StripWS()  " remove trailing whitespaces
  execute '%s/\s\+$//e'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
