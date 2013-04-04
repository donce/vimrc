call pathogen#infect()
call pathogen#helptags()


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
filetype plugin on

"indentation
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smartindent

"braces
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"compiling

au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

if filereadable("Makefile") || filereadable("makefile")
	noremap <F5> :wa<CR>:make<CR>:copen<CR><CR>
	noremap <F6> :wa<CR>:make run<CR><CR>
	noremap <F12> :make clean<CR><CR><CR>
else
	autocmd FileType cpp noremap <F5> :w<CR>:make %:r<CR>:copen<CR><CR>
	autocmd FileType python nnoremap <F5> :w<CR>:!python %<CR>
	autocmd FileType sh nnoremap <F5> :w<CR>:!./%<CR>
	autocmd FileType markdown nnoremap <F5> :!markdown % > %:r.html<CR><CR>

	noremap <F6> :!./%:r<CR><CR>
endif

noremap <F7> :!grader ./%:r<CR>

map  \c 

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
	if !isdirectory(path . name)
		call mkdir(name, path)"TODO: mkdir fails opening from home at vu
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

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/sdl
" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
