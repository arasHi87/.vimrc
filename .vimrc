set nocompatible
set smartindent
set shiftwidth=4
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set hls
set ic
set pastetoggle=<F12>
set enc=utf8
set mouse=a
set fileencodings=ucs-bom,utf-8,gbk,default,latin1
set showmatch
set expandtab
set foldlevel=100
set ai
set si
set smarttab
set wrap
set lbr
set tw=0
set foldmethod=syntax
set history=400
set autoread
set cursorline
set cursorcolumn
set ignorecase
set fenc=utf-8
set laststatus=2
set scrolloff=5
set tabstop=4
set cindent
set fileformat=unix
set splitbelow
set splitright
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " required
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'arcticicestudio/nord-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'flazz/vim-colorschemes'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

"----- GENERAL SETTINGS-------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
set background=dark
let g:solarized_termcolors=256
colorscheme nord

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
map <F2> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeShowHidden=1


"-------- SYNTASTIC SETTINGS---------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END


"-------- TAGS SETTINGS --------------------------------
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:tagbar_autoclose=2

nmap <silent> <leader>b :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1


"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2

"-----------SHIFTWIDTH SETTINGS--------
au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4

"-----------ACK.VIM SETTINGS-----------
let g:ackprg = 'ag --nogroup --nocolor --column'

"-----------ALE SETTINGS---------------
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" use quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)


"-----------INDENTLINE SEETINGS---------------
let g:indentLine_char='┆'
let g:indentLine_enabled = 1


"-----------NERDCOMMENTER SEETINGS---------------
let mapleader=','
map <F4> <leader>ci <CR>
