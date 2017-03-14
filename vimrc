set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set guifont=Powerline\ Consolas:h12
"set guifont=Consolas:h12,PowerlineSymbols:h12
"set guifontwide=JhengHei:h12

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Code folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
"set foldlevel=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight cursor line
set cursorline!
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
" set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
"set noerrorbells
"set novisualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
"set noeb vb t_vb=
set tm=500

"Set filetype on
filetype on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
"colorscheme Monokai-Refined
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
	set langmenu=en_US
	let $LANG = 'en_US'
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
endif

"Set current line hightlighting from underline to bold
hi CursorLine term=bold cterm=bold guibg=Grey40

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" Use spaces instead of tabs
"""set expandtab
set noexpandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
"set si "Smart indent
set nowrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
" map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Use Numpad
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OR *
imap <Esc>OQ /
imap <Esc>Ol +
imap <Esc>OS -

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Remove null character produced by 64-bit windows
noremap <leader>6 :%s/[\x0]//g<cr>''

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


" display line numbers
set nu


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Show tab number
if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
			 let mark = ''
			 if getbufvar(buflist[winnr - 1], "&modified")
				 let mark = '+'
			 endif
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . ')' . mark
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
			 
			 
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif

hi TabLine      term=underline cterm=underline ctermbg=0 gui=underline guibg=DarkGrey                                                                                                                      
hi TabLineSel   term=bold cterm=bold ctermfg=7 gui=bold
hi TabLineFill  term=reverse cterm=reverse gui=reverse

" Show tab number in gvim
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}
" Following key mappings are not supported by Xshell yet
" Move between tabs in similar ways of web browser
" nnoremap <C-PageDown> gt
" nnoremap <C-PageUp> gT
" nnoremap <F10> gt
" nnoremap <S-F10> gT
map     <F11>    :tabnext<CR>
map!    <F11>    <C-O>:tabnext<CR>
map     <F10>    :tabprev<CR>
map!    <F10>    <C-O>:tabprev<CR>
" Switch to last tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"netrw settings
"Default vertical splitting
let g:netrw_preview   = 1
"Tree view
let g:netrw_liststyle=3
"Use the previous window to open file
let g:netrw_borwse_split=4
nnoremap <silent> <F5> :25Ve<CR>
"Hide hidden files
let g:netrw_list_hide = '.*\.un\~'

"Toggle line number display style
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Netrw Sidebar
noremap	<leader><Tab>	:call VexToggle("")<CR>

" NerdCommenter settings
let g:NERDCustomDelimiters = { 'dosbatch': { 'left': '::', 'leftAlt': 'REM ' } }
let g:NERDAltDelims_python = 1
let g:NERDAltDelims_c = 1
let g:NERDCompactSexyComs = 1

fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose()
  else
    call VexOpen(a:dir)
  endif
endf

fun! VexOpen(dir)
  let g:netrw_browse_split=4    " open files in previous window
  let g:netrw_banner=0          " no banner
  let vex_width = 55

  exe "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H

  call VexSize(vex_width)
endf

fun! VexClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  close
  unlet t:vex_buf_nr

  exe (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endf

fun! VexSize(vex_width)
  exe "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endf

fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Powerline
py3 from powerline.vim import setup as powerline_setup
py3 powerline_setup()
py3 del powerline_setup
let g:Powerline_symbols = 'fancy'

"YouCompleteMe related settings
let g:ycm_python_binary_path = 'python'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_auto_trigger = 1

"Python-mode related settingslet
let g:pymode_options_max_line_length = 160

call plug#begin('~/vimfiles/plugged')
	Plug	'jlanzarotta/bufexplorer'
	Plug	'scrooloose/nerdcommenter'
	Plug	'eiginn/netrw'
	Plug	'vim-scripts/VisIncr'
	Plug	'vim-scripts/Visual-Mark'
	Plug	'wesQ3/vim-windowswap'
	Plug	'rdnetto/YCM-Generator', { 'branch': 'stable'}
	Plug	'Valloric/YouCompleteMe', { 'do': 'python install.py --msvc 14'}
	Plug	'tpope/vim-fugitive'
	Plug	'klen/python-mode'
call plug#end()

