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
let g:gruvbox_contrast_dark='hard'
colo gruvbox
let g:seoul256_light_background = 256
let g:seoul256_background = 233
colo seoul256-light
colo seoul256
let g:airline_theme='seoul256'
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
set lazyredraw

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
set undolevels=5000  " How many undos

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

" write read-only files
cmap w!! w !sudo tee % >/dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE SPECIFICS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType c setlocal tw=80 cc=80
autocmd BufReadPre README* setlocal tw=80 cc=80
"autocmd FileType cpp setlocal tw=80 cc=80
autocmd FileType ocaml setlocal ts=2 sts=2 sw=2 tw=80 cc=80
autocmd FileType org setlocal tw=80 cc=80 nocin
autocmd FileType calendar setlocal tw=0 cc=0
autocmd FileType latex setlocal tw=80 cc=80
let g:tex_flavor = "latex"
autocmd FileType tex setlocal tw=80 cc=80 spell
autocmd FileType python setlocal cc=79


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" neomake
autocmd! BufWritePost * Neomake  " call neomake at write like syntastic

" deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function() abort
"  return deoplete#mappings#close_popup() . "\<CR>"
"endfunction
"" C-g undo, tab completion, close popup by space
"inoremap <expr><C-g>   deoplete#mappings#undo_completion()
"inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><Space> deoplete#mappings#undo_completion()."\<Space>"


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

" completeopt
"set completeopt=menu,preview,noinsert
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Obsession and airline
let airline_section_y = '%{ObsessionStatus()}'

" GitGutter
let g:gitgutter_map_keys = 0 " remove shortcuts to avoid delay with \h

" Antlr
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

" fzf
let $FZF_DEFAULT_OPTS .= ' --inline-info'

" File preview using Highlight (http://www.andre-simon.de/doku/highlight/en/highlight.php)
let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

"inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--delimiter / --nth -1',
  \ 'down':    '~40%',
  \ 'sink':    'Explore'})

" [Buffers] Jump to the existing window if possible
"let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
"let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" 고요 & Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" slash
function! s:flash()
  set cursorline!
  redraw
  sleep 20m
  set cursorline!
  return ''
endfunction

noremap <expr> <plug>(slash-after) <sid>flash()

" peekaboo
let g:peekaboo_delay = 250

" after-object
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

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

function! StripWS()  " remove all trailing whitespaces
  execute '%s/\s\+$//e'
endfunction

" remove undo files which have not been modified for n days
function Tmpwatch(path, days)
  let l:path = expand(a:path)
  if isdirectory(l:path)
    for file in split(globpath(l:path, "*"), "\n")
      if localtime() > getftime(file) + 86400 * a:days && delete(file) != 0
        echo "Tmpwatch(): Error deleting '" . file . "'"
      endif
    endfor
  else
    echo "Tmpwatch(): Directory '" . l:path . "' not found"
  endif
endfunction

" color scheme selector
function! s:colors(...)
  return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
        \                  'v:val !~ "^/usr/"'),
        \           'fnamemodify(v:val, ":t:r")'),
        \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
