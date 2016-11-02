" Set colorscheme
set t_Co=256
set background=dark
colorscheme solarized
syntax on


" Set wrap options
set nojoinspaces
if exists('+colorcolumn')
  set colorcolumn=80
endif
  

" Set identation
set expandtab
set tabstop=2
set autoindent


" Allow mouse navigation
set mouse=a
set go=-m


" Enable spelling correction *for all files*... wonder how well that works.
set spell 


" Show command while typing
set showcmd

" Show line numbers
set number

" Enable multiple files in buffer
set hidden

" Always show statusbar
set laststatus=2

" Search highlighting
set hlsearch
set incsearch
set ignorecase
set smartcase

