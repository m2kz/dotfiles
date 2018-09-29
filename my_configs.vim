" mine
set mouse=a
set guicursor=
set wrap
set autoindent
set ignorecase
set incsearch
set smartcase
set display+=lastline
set encoding=utf-8
set linebreak
set wrap
set laststatus=2
set ruler
set wildmenu
set number
set noerrorbells
set visualbell
set title
set spell

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
call vundle#end()

" Vim-plug
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

" Pathogen
execute pathogen#infect()

" neovim
let g:python_host_prog = '/usr/bin/python'
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
set lcs=trail:·,tab:»·
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

" http://spf13.com/post/perfect-vimrc-vim-config-file/
silent! call pathogen\#helptags()
silent! call pathogen\#runtime_append_all_bundles()
nmap <silent> <leader>/ :nohlsearch<CR>


