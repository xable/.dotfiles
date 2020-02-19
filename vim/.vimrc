set nocompatible            " be iMproved
set laststatus=2            " show status
filetype off                " required
syntax on                   " enable syntax colors
colorscheme term            " colorscheme

" Automatic installation
if empty(glob("~/.vim/bundle/Vundle.vim"))
  silent! execute '!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
  autocmd VimEnter * silent! PluginInstall
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-commentary'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'

" add plugins before this
call vundle#end()           " required
filetype plugin indent on   " required

" Settings
set mouse=a                 " enable mouse
set completeopt-=preview    " disable scratch buffer
set ruler                   " always show info along bottom
set cursorline              " enable cursor highlight
set showcmd                 " show command information
set foldmethod=marker       " allow marking folds
set showmatch               " show matching brackets when text indicator is over them
set incsearch               " incremental search
set hlsearch                " highlight search results
set scrolloff=1             " 1 line offset from top-bottom
set sidescrolloff=5         " 5 character offset from left-right
set nowrap                  " don't wrap lines
set virtualedit=all         " enable virtualedit (visual block)
set expandtab               " spaces not tabs
set softtabstop=4           " indents
set tabstop=4               " tab spacing
set shiftwidth=4            " more indents
set shiftround              " always indent/outdent to the nearest tabstop
set number                  " show line numbers
set smarttab                " be smart when using tabs
set noswapfile              " no swap files
set updatecount=0           " we don't use swap files
set ignorecase              " ignore case in search
set smartcase               " if uppercase letter, don't ignore
set undolevels=1000         " undo levels
set lazyredraw              " don't redraw while executing macros
set noerrorbells            " disable bell
set showtabline=1           " show/hide tabs
set cmdheight=1             " cmd height
set modeline                " use modelines
set ttimeout                " key combination timeout
set ttimeoutlen=50          " lower statusline timeout
set autoindent              " indent to last identation
set wildmenu                " visual autocomplete for command menu
set encoding=utf-8          " use UTF-8 for file/term encoding
set ttyfast                 " we have a fast terminal

" fuzzy find
set path+=**
" lazy file name tab completion
set wildmode=longest,list,full
set wildmenu
set wildignorecase
" ignore files vim doesnt use
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" case insensitive search
set ignorecase              " make searches case-insensitive
set smartcase               " when searching try to be smart about cases
set infercase               " makes search act like search in modern browsers

" Bindings
nnoremap <F2> :w<CR>
nnoremap <F3> :wq<CR>

" NERDTree settings
map <F4> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Emmet settings
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_install_global = 0

" indents for different filetypes
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html,css EmmetInstall
