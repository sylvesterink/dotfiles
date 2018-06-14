" --------- PLUGINS ---------
" Requires vim-plug:
" https://github.com/junegunn/vim-plug
"
" Auto install:
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list
call plug#begin('~/.local/share/nvim/plugged')

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" ALTERNATE: Plug 'tomtom/tcomment_vim' (it's bigger)
Plug 'tpope/vim-commentary'

" OLD: Plug 'vim-scripts/a.vim'
Plug 'derekwyatt/vim-fswitch'

" OLD: Plug 'ctrlpvim/ctrlp.vim'
" NOTE: this is for neovim only
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'lilydjwg/colorizer'

" While netrw is useful, it doesn't have persistence
"Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'

Plug 'bkad/CamelCaseMotion'
Plug 'mbbill/undotree'
Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'majutsushi/tagbar'

" Alternate: Plug 'itchyny/lightline.vim' (New pretty, but distracting)
" TODO: Replace with own line?
Plug 'millermedeiros/vim-statline'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" Alternate: Plug 'mhinz/vim-signify' (works for more than just git, but I don't need that yet)
Plug 'airblade/vim-gitgutter'

Plug 'kshenoy/vim-signature'

" Alternate: Plug 'Valloric/YouCompleteMe' (old reliable)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Alternate: Plug 'autozimu/LanguageClient-neovim' (Might be preferred. TODO: Test this one instead)
Plug 'zchee/deoplete-clang'

" TODO: These are for future use
"Plug 'lervag/vimtex'
"Plug 'peterhoeg/vim-qml'

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'sickill/vim-monokai'

call plug#end()
" NOTE: 'filetype indent on' and 'syntax enable' are called once plugins complete



" --------- MY SETTINGS ---------
" TODO: Make it autocreate these folders?
set backupdir=~/.vimbackup
set directory=~/.vimtmp// " // makes it keep full directory path

set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set showmode 		" show when in insert mode
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch            " highlight searching
set ignorecase  " case insensitive search
set smartcase   " only case-sensitive search if upper-case letters included
set nowrap
set sw=4 sts=4 ts=4 et  " use spaces instead of tabs
set inccommand=split    " dynamic search preview


" display line numbers
set number
" set relative line numbers on by default
set relativenumber

" GUI STUFF
"" TODO: Remove until graphical neovim implemented?
"" hide toolbar
"set guioptions-=T
"
"" hide scrollbars
"set guioptions-=l
"set guioptions-=r
"set guioptions-=b
"set guioptions-=L
"set guioptions-=R
"
"" hide menu
"set guioptions-=m

" Set custom color
let g:jellybeans_overrides = {
            \    'Todo': { 'guifg': '303030', 'guibg': 'ff5f00',
            \              'ctermfg': 'Black', 'ctermbg': 'ff5f00',
            \              'attr': 'bold' },
            \    'Search': { 'guifg': '303030', 'guibg': 'ffaf00',
            \              'ctermfg': 'Black', 'ctermbg': 'ffaf00',
            \              'attr': 'bold' },
            \    'Class': { 'guifg': '799d6a', 'guibg': '',
            \              'ctermfg': '799d6a', 'ctermbg': '',
            \              'attr': '' },
            \}
colorscheme jellybeans

set encoding=utf8
try
    lang en_US
catch
endtry

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Use easy to read symbols for tabstops and EOLs (and others)
set listchars=tab:»\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:¬

" Allow unwritten buffers to be hidden while switching
set hidden

" Set default scroll offsets to look ahead when scrolling
if !&scrolloff
  set scrolloff=3
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" Enable doxygen highlighting
let g:load_doxygen_syntax=1


" --------- PLUGIN SETTINGS ---------
"   ------- Ack -------
" Use silversearcher by default
if executable('ag')
    let g:ackprg = "ag --vimgrep"
endif

"   ------- Colorizer -------
" Colorizer is slow, especially on large files.
" <leader>tc is the default mapping that toggles it on
let g:colorizer_startup = 0

"   ------- Commentary -------
" Use newstyle comments
autocmd FileType cpp,cs,java setlocal commentstring=//\ %s

"   ------- Tagbar -------
let g:tagbar_autofocus = 1

"   ------- Signature -------
let g:SignatureMarkTextHLDynamic = 1

"   ------- Deoplete -------
let g:deoplete#enable_at_startup = 1

" Close preview window when completion done
autocmd CompleteDone * silent! pclose!

"   ------- Deoplete-Clang -------
" TODO: MAKE THIS LESS PLATFORM SPECIFIC!
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang/'

"   ------- Vim-Statline -------
let g:statline_fugitive = 1

"   ------- Denite -------
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
            \'noremap')
call denite#custom#map('normal', '<Esc>', '<denite:quit>',
            \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
            \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
            \'noremap')



" --------- MY MAPPINGS ---------
" Don't use Ex mode, use Q for formatting
map Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"  NEOVIM terminal normal mode:
tnoremap <Esc> <C-\><C-n>
" Center screen on cursor
nmap <space> zz
nmap <s-space> zt
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Shortcut to rapidly toggle `set relativenumber`
nmap <leader>r :set relativenumber!<CR>
" Strip trailing whitespaces from file
nmap <leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
" Switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<CR>
" Open a buffer for scribble
map <leader>q :e ~/buffer<CR>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===================================================
" Open buffer list and prepare to select a buffer
nnoremap <leader>B :ls<CR>:b<space>
" Toggle highlight column 80
nnoremap <leader>C :call ToggleCC()<CR>
" Easier copy to clipboard
noremap <leader>y "+y
" Easier paste from clipboard
noremap <leader>p "+p

" " clang-format - Format code to coding style
" TODO check if clang file exists first
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format.py<cr>

" Build tagfile
map <leader>t :!ctags -R --c-kinds=+pl --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>


" --------- PLUGIN MAPPINGS ---------
"   ------- Denite -------
" Fuzzy search for files
nmap <leader>f :Denite file_rec<CR>
" Fuzzy search for buffers
nmap <leader>b :Denite buffer<CR>
" ctrlp - Open buffer grep
nmap <leader>g :Denite file_rec buffer<CR>

"   ------- CamelCaseMotion -------
"  Using custom mapping because the leader key is used for other tasks
map <silent> ,w <Plug>CamelCaseMotion_w
map <silent> ,b <Plug>CamelCaseMotion_b
map <silent> ,e <Plug>CamelCaseMotion_e
map <silent> ,ge <Plug>CamelCaseMotion_ge
omap <silent> i,w <Plug>CamelCaseMotion_iw
xmap <silent> i,w <Plug>CamelCaseMotion_iw
omap <silent> i,b <Plug>CamelCaseMotion_ib
xmap <silent> i,b <Plug>CamelCaseMotion_ib
omap <silent> i,e <Plug>CamelCaseMotion_ie
xmap <silent> i,e <Plug>CamelCaseMotion_ie

"   ------- UndoTree -------
nnoremap <leader>u :UndotreeToggle<CR>

"   ------- DoxygenToolkit -------
" Insert doxygen comment for functions, classes etc
nmap <leader>d :Dox<CR>
nmap <leader>s ?/\* //<CR>03x$xxN03x$xx

"   ------- Tagbar -------
nnoremap <silent> <F4> :TagbarToggle<CR>

"   ------- Ack -------
nnoremap <leader>a :Ack!<Space>

"   ------- FSwitch -------
nmap <silent> <leader><leader> :FSHere<cr>
nmap <silent> <leader>of :FSHere<cr>
nmap <silent> <leader>ol :FSRight<cr>
nmap <silent> <leader>oL :FSSplitRight<cr>
nmap <silent> <leader>oh :FSLeft<cr>
nmap <silent> <leader>oH :FSSplitLeft<cr>
nmap <silent> <leader>ok :FSAbove<cr>
nmap <silent> <leader>oK :FSSplitAbove<cr>
nmap <silent> <leader>oj :FSBelow<cr>
nmap <silent> <leader>oJ :FSSplitBelow<cr>
nmap <silent> <leader>ot :FSTab<cr>

" --------- MY FUNCTIONS ---------
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

"Run said command but presereve current settings
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Toggle whether column 80 is highlighted
function! ToggleCC()
  if &cc == ''
    set cc=80
  else
    set cc=
  endif
endfun
