set nocompatible  " not compatible with vi

" Automatic installation of vim-plug if not installed
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

augroup filetypedetect
  au BufRead,BufNewFile *.v set filetype=coq
  au BufRead,BufNewFile *.v hi CheckedByCoq guibg=Black
augroup END

" load plugins from vim-plug
source ~/.config/nvim/plugins.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256  " Explicitly tell vim that the terminal supports 256 colors
let g:gruvbox_contrast_dark='hard'
if has('nvim')
  let g:gruvbox_italic=1
endif
let g:seoul256_light_background = 256
let g:seoul256_background = 233
colo seoul256-light
colo seoul256
" let g:airline_theme='seoul256'
colo gruvbox
if has('gui_running')
  set background=dark
else
  set background=dark
endif
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
if has('termguicolors') && has('nvim')
  set termguicolors
endif

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
set ignorecase
set smartcase  " ignore case if search pattern is all lowercase
set hlsearch  " highlight search terms
set incsearch  " show search matches as you type
nnoremap <silent><Esc> :nohlsearch<Bar>:echo<CR>
  " cancel search with escape

" code folding settings
" set foldmethod=syntax
" set foldnestmax=10
" set foldenable
set foldlevel=0 " number of fold opened by default

set scrolloff=3 " lines of text around cursor

set relativenumber  " show relative lines number
set number  " show lines number
set showmatch  " show matching parenthesis
set clipboard=unnamedplus  " allow copy/paste from vim to other app
set title  " change the terminal's title
" set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set hidden  " current buffer can be put into background

"autocmd BufWritePre * :%s/\s\+$//e  " auto remove trailing whitespaces

" write when forgot to launch nvim with sudo
cmap w!! w !sudo tee % >/dev/null

set undofile  " persistent undo
set undodir=~/.config/nvim/undodir,~/.tmp,~/tmp,/var/tmp,/tmp
set undolevels=5000  " How many undos

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

set textwidth=120
set colorcolumn=120
set wrap "turn on visual line wrapping
set linebreak " set wrapping
set showbreak=… " show ellipsis at breaking
set breakindent

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

if has('nvim')
  set inccommand=split " or nosplit
endif

set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader      = ' '
let maplocalleader = '\'
" nnoremap ; :

" <F6> | paste toggle
set pastetoggle=<F6>

nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>
vnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
" circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" switch between current and last buffer
nnoremap <leader>. <c-^>

nnoremap <leader>l :bnext<CR>
nnoremap        ]b :bnext<cr>
nnoremap <leader>h :bprevious<CR>
nnoremap        [b :bprev<cr>

nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" jk | Escaping!
inoremap jk <Esc>
"xnoremap jk <Esc>
"cnoremap jk <C-c>

" row by row
" nnoremap j gj
" nnoremap k gk
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
vnoremap <expr> j v:count ? 'j' : 'gj'
vnoremap <expr> k v:count ? 'k' : 'gk'

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>
" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" remove extra whitespace
"nmap <leader><space> :'<,'>s/\s\+$//e<cr>
"nmap <leader><space> :s/\s\+$//e<cr>

" write read-only files
cmap w!! w !sudo tee % >/dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE SPECIFICS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c setlocal tw=80 cc=80
autocmd FileType cpp setlocal tw=80 cc=80
autocmd BufReadPre README* setlocal tw=80 cc=80
"autocmd FileType cpp setlocal tw=80 cc=80
autocmd FileType ocaml setlocal ts=2 sts=2 sw=2 tw=80 cc=80
autocmd FileType org setlocal tw=80 cc=80 nocin
autocmd FileType calendar setlocal tw=0 cc=0
autocmd FileType latex setlocal tw=0 cc=80 spell
let g:tex_flavor = "latex"
autocmd FileType tex setlocal tw=0 cc=80 spell
autocmd FileType python setlocal cc=79 tw=79
autocmd FileType gitcommit setlocal tw=72 cc=72 spell
autocmd FileType vim setlocal tw=78 cc=78
autocmd Filetype vimwiki setlocal nowrap
autocmd FileType coq setlocal tw=80 cc=80

autocmd BufRead,BufNewFile /*/neomutt* set filetype=mail
augroup mail_filetype
  autocmd FileType mail
    \ autocmd VimEnter *
      \ :0,'}s/\s\+$//e
      \ | :execute 'normal gg}'
      \ | :put! =\"\n\n\"
      \ | :execute 'startinsert'
augroup END
autocmd FileType mail setlocal tw=78 cc=78 spell fo+=aw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neomake
autocmd! BufWritePost * Neomake  " call neomake at write like syntastic
" let g:neomake_open_list = 2

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
" let g:tmuxline_theme = 'airline'
let g:airline#extensions#tabline#enabled = 1
" let g:tmuxline_preset = {
"       \ 'a': '#S',
"       \ 'b': '#F',
"       \ 'c': '#W',
"       \ 'win': ['#I', '#W'],
"       \ 'cwin': ['#I', '#W'],
"       \ 'x': '#{battery_icon} #{battery_percentage}',
"       \ 'y': ['%a %Y-%m-%d', '%H:%M'],
"       \ 'z': '#H'}

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

" NERD Tree | <F10>
inoremap <F10> <esc>:NERDTreeToggle<cr>
nnoremap <F10> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeRespectWildIgnore=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" TagBar | <F9>
inoremap <F9> <esc>:TagbarToggle<cr>
nnoremap <F9> :TagbarToggle<cr>
"let g:tagbar_sort = 0

" Gundo tree | <F5>
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
let g:gitgutter_map_keys = 0 " remove shortcuts to avoid delay with <leader>h

" Antlr
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

" fzf
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'  " the_silver_searcher required
endif
let $FZF_DEFAULT_OPTS .= ' --inline-info'

" File preview using Highlight (http://www.andre-simon.de/doku/highlight/en/highlight.php)
let g:fzf_files_options =
      \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

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
function! s:blink(times, delay)
  let s:blink = { 'ticks': 2 * a:times, 'delay': a:delay }

  function! s:blink.tick(_)
    let self.ticks -= 1
    let active = self == s:blink && self.ticks > 0

    if !self.clear() && active && &hlsearch
      let [line, col] = [line('.'), col('.')]
      let w:blink_id = matchadd('IncSearch',
            \ printf('\%%%dl\%%>%dc\%%<%dc', line, max([0, col-2]), col+2))
    endif
    if active
      call timer_start(self.delay, self.tick)
    endif
  endfunction

  function! s:blink.clear()
    if exists('w:blink_id')
      call matchdelete(w:blink_id)
      unlet w:blink_id
      return 1
    endif
  endfunction

  call s:blink.clear()
  call s:blink.tick(0)
  return ''
endfunction

noremap <expr> <plug>(slash-after) <sid>flash()
" noremap <expr> <plug>(slash-after) <sid>blink(2, 50)

" peekaboo
let g:peekaboo_delay = 750

" after-object
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" cmd2
" nmap : :<F12>
" for : mode (experimental)
nmap / /<F12>
cmap <F12> <Plug>(Cmd2Suggest)

" textmanip
xmap <A-S-d> <Plug>(textmanip-duplicate-down)
nmap <A-S-d> <Plug>(textmanip-duplicate-down)
xmap <A-S-u> <Plug>(textmanip-duplicate-up)
nmap <A-S-u> <Plug>(textmanip-duplicate-up)
xmap <A-S-j> <Plug>(textmanip-move-down)
xmap <A-S-k> <Plug>(textmanip-move-up)
xmap <A-S-h> <Plug>(textmanip-move-left)
xmap <A-S-l> <Plug>(textmanip-move-right)
nmap <A-S-t> <Plug>(textmanip-toggle-mode)
xmap <A-S-t> <Plug>(textmanip-toggle-mode)

" pencil
augroup pencil
  autocmd!
  autocmd FileType latex call pencil#init()
                     \ | let g:airline_section_x = '%{PencilMode()}'
augroup END

" NeoComplete
if !has('nvim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1

  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

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
  inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
endif

" ack
" if executable('ag')
"   let &grepprg = 'ag --nogroup --nocolor --column'
" else
"   let &grepprg = 'grep -rn $* *'
" endif
" command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
let g:ack_autoclose=1
let g:ackhighlight = 1
" let g:ack_use_dispatch = 1
nnoremap <Leader>a :Ack!<Space>

" multichange
" let g:multichange_mapping        = '<C-S-n>'
" let g:multichange_motion_mapping = '<C-S-n>'

" asterix
let g:asterisk#keeppos = 1

" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml"

" anyfold
" let anyfold_activate=1
" autocmd Filetype startify let b:anyfold_activate=0
" autocmd Filetype calendar let b:anyfold_activate=0
let anyfold_fold_comments = 1

" lessspace
let g:lessspace_blacklist = ['mail']

" disapprove deep identation
" let g:LookOfDisapprovalTabTreshold=7
" let g:LookOfDisapprovalSpaceTreshold=(&tabstop*7)

" calendar.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" vimwiki
let g:vimwiki_list = [{'path': '~/personal_wiki'}]

" notational
let g:nv_directories = ['~/personal_wiki']

" sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
" augroup load_ycm
"   autocmd!
"   autocmd CursorHold, CursorHoldI * :packadd YouCompleteMe
"                                 \ | autocmd! load_ycm
" augroup END

" Chromatica
let g:chromatica#enable_at_startup=1
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "mists"
  let g:chromatica#libclang_path='/usr/lib64'
elseif hostname == "firnen"
  let g:chromatica#libclang_path='/usr/local/Cellar/llvm/4.0.0_1/lib'
endif

" qf_resize
nnoremap <silent> <c-w>= :wincmd =<cr>:QfResizeWindows<cr>

" cosco
autocmd FileType javascript,css,c,cpp nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css,c,cpp imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)

" vimux
nmap <Leader>vp :VimuxPromptCommand<CR>
nmap <Leader>vl :VimuxRunLastCommand<CR>
nmap <Leader>vi :VimuxInspectRunner<CR>
nmap <Leader>vz :VimuxZoomRunner<CR>

" autopairs
au Filetype markdown,vimwiki let b:autopairs_loaded=1

" localvimrc
let g:localvimrc_whitelist=['/Users/simonbihel/coinse/avm']
let g:localvimrc_sandbox = 0

" deleft
let g:deleft_remove_strategy = "spaces"

" python-mode
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_completion = 0

" stay
set viewoptions=cursor,folds,slash,unix

" FastFold
" let g:fastfold_savehook = 0
" xnoremap iz :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
" xnoremap az :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>

" autoformat
let g:formatters_python = ['yapf', 'autopep8']

" coquille
au FileType coq call coquille#FNMapping()
let g:coquille_auto_move  = 1

" vim-session
let g:session_autosave = 'no'

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

function IsReply()
  if line('$') > 1
    :g/^>\s\=--\s\=$/,$ delete
    execute 'normal! }vG$'
    execute 'normal :%!par w78q\<cr>'
    :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
    :%s/^>*\zs\s\+$//e
    " :1
    " :put! =\"\n\n\"
    " :1
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
