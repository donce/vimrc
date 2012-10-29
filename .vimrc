syntax on

"colors
set bg=dark
set t_Co=256
colo lucius

set nu
set nocp
set bs=2
set mouse=a
set autochdir
set cursorline
set autoread

"indentation
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smartindent

"compiling
noremap <F5> :make<CR>:copen<CR><CR>
noremap <F6> :!%:r<CR><CR>
noremap <F9> :make %:r<CR>:copen<CR><CR>

"folding
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=99
set foldlevel=1

"browser
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

nnoremap <left> <ESC>:Vexplore<CR>
set scrolloff=5
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.class

set ignorecase
set smartcase
set incsearch
set hlsearch


"create dir if does not exist
function! CheckDirectory(var1)
	let name=a:var1
	let path=$HOME . "/.vim/"
	if isdirectory(path . name) == 0
		call mkdir(name, path)
	endif
endfunction

if has('persistent_undo')
	set undofile
	call CheckDirectory("undo")
	set undodir=~/.vim/undo/
endif

set swapfile
call CheckDirectory("swap")
set directory=~/.vim/swap/
