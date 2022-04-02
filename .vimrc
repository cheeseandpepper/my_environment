set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'wdhg/dragon-energy'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Nopik/vim-nerdtree-direnter'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'dense-analysis/ale'
Plugin 'qpkorr/vim-bufkill'
Plugin 'thoughtbot/vim-rspec'
Plugin 'elixir-editors/vim-elixir'
Plugin 'ntpeters/vim-better-whitespace'
call vundle#end()            " required

filetype plugin indent on    " required
"END VUNDLE STUFF



"GENERAL STUFF



if executable('ag')
 let g:ackprg = 'ag --vimgrep'
endif

set history=5000
filetype plugin on
filetype indent on
set autoread
set ruler
set number
syntax enable
colorscheme monokai
set t_Co=256
set tabstop=2
set shiftwidth=2
set expandtab

"decorator as ruby
au BufReadPost *.decorator set syntax=ruby

"no ~ on non lines
highlight EndOfBuffer ctermfg=black ctermbg=black

"nerdtree open in new tab
set splitright

let g:NERDTreeWinSize=32
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeMapActivateNode='<enter>'
set statusline+=%f
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=100
let g:ctrlp_working_path_mode = ""
let g:ctrlp_match_window = 'min:4,max:10,results:100'
let g:ctrlp_show_hidden = 1

command! -nargs=1 Vr vertical-resize <args>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"NAVIGATION
map gl :bn<cr>
map gh :bp<cr>

nnoremap <S-C-j> :m .+1<CR>==
nnoremap <S-C-k> :m .-2<CR>==
inoremap <S-C-j> <Esc>:m .+1<CR>==gi
inoremap <S-C-k> <Esc>:m .-2<CR>==gi
vnoremap <S-C-j> :m '>+1<CR>gv=gv
vnoremap <S-C-k> :m '<-2<CR>gv=gv
