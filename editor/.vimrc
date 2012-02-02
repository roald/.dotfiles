" Set colorscheme
set t_Co=16
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


"Enable spelling correction *for all files*... wonder how well that works.
set spell 

