set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
" Plugin 'tpope/vim-pathogen'

Plugin 'jceb/vim-orgmode'
Plugin 'vim-scripts/utl.vim'

" plugins from pathogen
Plugin 'vim-scripts/TeX-9'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'def-lkb/ocp-indent-vim' " indentation tool for OCaml
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'edkolev/tmuxline.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'derekwyatt/vim-scala'
Plugin 'dag/vim2hs'

call vundle#end()
filetype plugin indent on
