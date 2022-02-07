syntax on
set background=dark
set shiftwidth=2
set tabstop=2

if has("autocmd")
  filetype plugin indent on
endif

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned


syntax on
set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set nocompatible              " vim, not vi
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=zsh
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,
set laststatus=2

"------ Meta ------"

" clear all autocommands! (this comment must be on its own line)
autocmd!

set nocompatible                " break away from old vi compatibility
set fileformats=unix,dos,mac    " support all three newline formats
set viminfo=                    " don't use or save viminfo files

"------ Console UI & Text display ------"

set cmdheight=1                 " explicitly set the height of the command line
set showcmd                     " Show (partial) command in status line.
set number                      " yay line numbers
set ruler                       " show current position at bottom
set noerrorbells                " don't whine
set visualbell t_vb=            " and don't make faces
set lazyredraw                  " don't redraw while in macros
set scrolloff=5                 " keep at least 5 lines around the cursor
set wrap                        " soft wrap long lines
set list                        " show invisible characters
set listchars=tab:>·,trail:·    " but only show tabs and trailing whitespace
set report=0                    " report back on all changes
set shortmess=atI               " shorten messages and don't show intro
set wildmenu                    " turn on wild menu :e <Tab>
"set wildmode=list:longest       " set wildmenu to list choice
set wildmode=longest:full

if has('syntax')
    syntax on
endif

"------ Text editing and searching behavior ------"

set nohlsearch                  " turn off highlighting for searched expressions
set incsearch                   " highlight as we search however
set matchtime=5                 " blink matching chars for .x seconds
set mouse=a                     " try to use a mouse in the console (wimp!)
set ignorecase                  " set case insensitivity
set smartcase                   " unless there's a capital letter
set completeopt=menu,longest,preview " more autocomplete <Ctrl>-P options
set nostartofline               " leave my cursor position alone!
set backspace=2                 " equiv to :set backspace=indent,eol,start
set textwidth=80                " we like 80 columns
set showmatch                   " show matching brackets
set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines

"------ Indents and tabs ------"

set autoindent                  " set the cursor at same indent as line above
set cindent                     " try to be smart about indenting (C-style)
set smarttab                    " tab and backspace are smart
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                " spaces for each step of (auto)indent
set softtabstop=4               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
filetype plugin indent on       " load filetype plugins and indent settings

"" Text Wrapping
set textwidth=79
set colorcolumn=80
set nowrap

""" NetRW
let g:netrw_liststyle = 1 " Detail Viewde = 1 "
let g:netrw_sizestyle = "H" " Human-readable file size
let g:netrw_list_hide = '\(^\|\s\s\)\zs\. \S\+' " hide dotfiles
let g:netrw_hide = 1 " hide dot files by default
let g:netrw_banner = 0 " Turn off banner
nnoremap <Leader>e :Explore! <enter>

" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif

"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
" call plug#begin('~/.vim/plugged')
" call plug#begin('~/.vim/autoload/plug.vim')
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do': ':TSUpdate' }
" Plug 'nvim-treesitter/nvim-treesitter-textobjects', { 'branch': '0.5-compat' }
Plug 'tikhomirov/vim-glsl'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'wfxr/minimap.vim'
Plug 'tpope/vim-commentary'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-grepper'
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'


" colorthemes
Plug 'arcticicestudio/nord-vim'
Plug 'srcery-colors/srcery-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Load all Plugins now
packloadall
packadd dracula
silent! helptags AL

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
autocmd BufNewFile,BufRead *.vert,*.frag set ft=glsl
autocmd BufNewFile,BufRead *.vert,*.frag set syntax=glsl


" keyboard shortcuts
inoremap jj <ESC>

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null

" use ack instead of grep
set grepprg=ack\ -k

" opens search results in a window w/ links and highlight the matches
" command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{json,pyc}  . -e <args>' | copen | execute 'silent /<args>'
command! -nargs=+ Grep execute 'silent grep! -r <args>' | copen | execute 'silent /<args>'
" " shift-control-* Greps for the word under the cursor
:nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>

nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" let my_colorschemes = ['dracula', 'pinkmare' , 'srcery', 'nord'  ]
" execute 'colorscheme' my_colorschemes[rand() % (len(my_colorschemes) - 1 ) ]
" colorscheme miramare
" colorscheme srcery
colorscheme dracula

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 0


lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

