call pathogen#infect()
call pathogen#helptags()

syntax on

" Rspec
" map <Leader>e :call RunLastSpec()<CR>
" map <Leader>r :call RunNearestSpec()<CR>
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>y :call RunAllSpecs()<CR>

" Line length marker
set textwidth=99
set colorcolumn=+1

" The Silver Searcher
let g:ag_working_path_mode="r"

set nu
set nocp
set backspace=2
set mouse=a
set autochdir
set cursorline
set autoread
filetype plugin indent on

" Indentation
set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=0
set smarttab
set expandtab
set autoindent


" Braces
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap        (  ()<Left>
"inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

"au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

" Building
"noremap <F6> :!./%:r<CR><CR>
"noremap <F7> :!grader ./%:r<CR>
if filereadable("Makefile") || filereadable("makefile")
	noremap <F5> :wa<CR>:make<CR>:copen<CR><CR>
	noremap <F6> :wa<CR>:make run<CR><CR>
	noremap <F12> :make clean<CR><CR><CR>
else
	" Cpp
	autocmd FileType cpp noremap <F5> :make %:r<CR>:copen<CR><CR>
	" Python
	autocmd FileType python nnoremap <F6> :w<CR>:!python %<CR>
  " Javascript
  autocmd FileType javascript noremap <F6> :w<CR>:!node %<CR>
	" Sh
	autocmd FileType sh nnoremap <F5> :w<CR>:!./%<CR>
	" Java
	autocmd FileType java nnoremap <F5> :w<CR>:!javac %<CR>
	autocmd FileType java nnoremap <F6> :!java %:r<CR>
endif

" Commenting
map  \c<space>

"nnoremap <F12> :GundoToggle<CR>

" Folding
"set foldmethod=syntax
"set foldnestmax=1
"set foldlevelstart=99
"set foldlevel=1

" Browser
"let g:netrw_browse_split = 4
"let g:netrw_liststyle = 3
"let g:netrw_winsize = 25

nnoremap <left> <ESC>:NERDTreeToggle<CR>
set scrolloff=5
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.class

"set ignorecase
"set smartcase
"set incsearch
"set hlsearch


" Create dir if does not exist
function! CheckDirectory(var1)
	let name=$HOME . "/.vim/" . a:var1
	if !isdirectory(name)
		call mkdir(name, "p")"TODO: mkdir fails opening from home at vu
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

" Configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/sdl
" Build tags of your own project with Ctrl-F12
" Map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Colors
call CheckDirectory("colors")
set bg=dark
set t_Co=256
colo molokai

set clipboard=unnamed

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Save last search and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business
    %s/\s\+$//e
    " Restore previous search history and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


map <up> <nop>
map <down> <nop>
map <right> <nop>

" ciw, viw:
" c/v i w/{/"
" folding
" verbs-nouns-and-modifiers
