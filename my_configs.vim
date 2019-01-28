" mine
set mouse=a
set guicursor=
set wrap
set autoindent
set ignorecase
set incsearch
set encoding=utf-8
set smartcase
set display+=lastline
set linebreak
set wrap
set laststatus=2
set ruler
set wildmenu
set number
set noerrorbells
set visualbell
set title
set nospell
"These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
xnoremap p pgvy
" https://github.com/neovim/neovim/issues/583
set clipboard+=unnamedplus
let mapleader=","

function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" https://marcgg.com/blog/2016/03/01/vimrc-example/
map <leader>s :source ~/.vimrc<CR>
set hidden
set history=1000
autocmd BufWritePre * :%s/\s\+$//e
set hlsearch

" http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
set exrc
set secure

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

let &path.="src/include,/usr/include/AL,"

" https://github.com/VundleVim/Vundle.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'shougo/unite.vim'
Plugin 'nathanaelkane/vim-indent-guides'
call vundle#end()

" Vim-plug
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
call plug#end()

" Pathogen
execute pathogen#infect()

" neovim
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

filetype plugin indent on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" https://gist.github.com/lefticus/9310227/e0a7a531979e9b77620c7e6678bcca7926c8cc08
set backspace=indent,eol,start
set showcmd
hi CursorLine   cterm=underline ctermbg=none ctermfg=none guifg=none
set cursorline
"set lcs=trail:·,tab:»·
set list

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_cpp_clang_check_args="-std=c++14"
let g:syntastic_cpp_clang_tidy_args="-std=c++14"
let g:syntastic_cpp_gcc_args="-std=c++14"
let g:syntastic_cpp_compiler_options=" -std=c++14"
let g:syntastic_aggregate_errors=1
let g:syntastic_cpp_checkers=['cppcheck']
let g:syntastic_cpp_clang_tidy_exec="clang-tidy-6.0"
let g:syntastic_c_checkers=['cppcheck']

"mine
let g:ymc_server_python_interpreter = '/usr/bin/python3'
colorscheme gruvbox
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
