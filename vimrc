
" === BASE CONFIG

" Use Vim settings, rather then Vi settings. This setting must be as early
" as possible, as it has side effects.
set nocompatible
" Don't wrap lines
set linebreak
" Make delete key work like normal apps
set backspace=indent,eol,start
" Display extra whitespace
set list listchars=tab:»·,trail:·
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
" Turn off the auto-newline
set fo-=t
" GitGutter Config
set updatetime=750
" Make it so clipboard copy/paste works with Mac OSX
set clipboard=unnamed
" start searching before hitting enter
set incsearch
" Make sure cursor stays centered on the screen
set scrolloff=20
" Put filename in statusline
set statusline+=%{fugitive#statusline()}
set laststatus=2  " always show status line
" Paste Toggle
set pastetoggle=<F2>
set showmode
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Automatically strip whitespace on save.
"autocmd BufWritePre * StripWhitespace



" === PLUGINS

call plug#begin()

" Sensible defaults
Plug 'tpope/vim-sensible'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

" IDE functionality
Plug 'tpope/vim-rails'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/syntastic'
Plug 'artur-shaik/vim-javacomplete2'
"Plug 'jmcantrell/vim-virtualenv'
Plug 'hsanson/vim-android'
Plug 'valloric/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Aesthetics
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'

" Other
Plug 'chrisbra/csv.vim'

call plug#end()



" === SYNTAX HIGHLIGHTING

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif
" Color overrides
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
syntax enable
colorscheme gruvbox
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
" twig highlighting
au BufRead,BufNewFile *.twig set filetype=htmljinja



" === CODE_INDENTATION

" Softtabs, 4 spaces by defaults
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab expandtab
" Switch to a 2 space tab on these files
autocmd FileType sass,scss,ruby,erb,yml,yaml,json setlocal shiftwidth=2 tabstop=2
set shiftround
set expandtab
set autoindent
set smartindent



" === CODE_FOLDING

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

set foldmethod=syntax

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview





" === TODO: Audit the nonsense that follows.


filetype on
filetype plugin on
set cc=79
set nu
set ls=2


map j gj
map k gk
set backspace=2
set splitbelow

highlight clear SignColumn

set clipboard=unnamedplus

set directory=/tmp
autocmd FileType make setlocal noexpandtab

let g:syntastic_objc_compiler = "clang"
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_python_flake8_args = "--max-complexity=10"
let g:syntastic_javascript_checkers = ["eslint"]
let g:airline_powerline_fonts = 1

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
let g:ycm_autoclose_preview_window_after_completion = 1

au BufNewFile,BufRead *.html setlocal filetype=htmldjango
au BufNewFile,BufRead *.j2 setlocal filetype=django
au BufNewFile,BufRead *.ssi setlocal filetype=html
au BufNewFile,BufRead *.md setlocal filetype=markdown
au BufNewFile,BufRead *.deface setlocal filetype=html.eruby
au BufNewFile,BufRead *.jbuilder setlocal filetype=ruby
au BufNewFile,BufRead *.md set wrap
au BufNewFile,BufRead *.md set linebreak
au BufNewFile,BufRead *.md set nolist
au BufNewFile,BufRead *.md set spell
au BufNewFile,BufRead *.markdown set spell
au BufNewFile,BufRead *.markdown set wrap
au BufNewFile,BufRead *.markdown set linebreak
au BufNewFile,BufRead *.markdown set nolist
au BufNewFile,BufRead *.php set autoindent
au FileType java setlocal omnifunc=javacomplete#Complete
au FileType java call airline#parts#define_function('vim-gradle-status', 'gradle#statusLine')
au FileType java let g:airline_section_x= airline#section#create_right(['tagbar', 'filetype', 'vim-gradle-status'])

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
