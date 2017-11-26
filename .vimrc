" this stuff has to be first
set nocompatible

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" set things
set copyindent
set nocursorline   " highlighting current line is slow
set nocursorcolumn " highlighting current column is slow
set cryptmethod=blowfish2
set diffopt=filler,vertical
set encoding=utf-8
set exrc " for vroom
set foldenable
set foldlevelstart=9
set foldmethod=manual
set fillchars=fold:\ ,vert:\ ,stl:\ ,stlnc:\
set guioptions=m
set helpheight=200
set hidden
set hlsearch
set ignorecase
set incsearch
set iskeyword-=:
set iskeyword+=_
set laststatus=2
set nolazyredraw           " turn off lazy redraw
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set noswapfile
set nowrap
set number
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolloff=10
set shiftround
set shiftwidth=4
set shortmess=aoOtI " short messages so vi doesn't ask me to hit enter all the time
set showcmd
set smartcase
set smarttab
set softtabstop=0
set tags=/usr/local/ddg/tags
set tabstop=4
set textwidth=0
set undolevels=1000
set winminheight=0
set wildignore=tags
set wildmode=longest,list,full

" command line editing
cnoremap <C-A> <Home>

" mapleader
let mapleader=";"

" colors
syntax on " sometimes this is not on by default
colorscheme iijo
au BufNewFile,BufRead *.tt setf tt2html
au BufNewFile,BufRead *.md setf mkd
if has("gui_running")
    colorscheme zmrock
end

" use tab to find matching parens
nnoremap <tab> %
vnoremap <tab> %

" previous buffer
map <space> :e#<cr>

" edit dotfiles
map <leader>ea :e ~/.bash/aliases.sh<cr>
map <leader>ee :e ~/.bash/env.sh<cr>
map <leader>ec :e ~/.vim/colors/iijo.vim<cr>
map <leader>eg :e ~/.gitconfig<cr>
map <leader>ev :e ~/.vimrc<cr>
map <leader>et :e ~/Dropbox/.todo/todo.txt<cr>
map <leader>em :e ~/.tmux.conf<cr>

" edit local dotfiles
map <leader>ela :e $HOME/.aliases<cr>
map <leader>elv :e $HOME/.vimrc.local<cr>

" open a file using selected text
map <leader>ef y:e <c-r>0<cr>

" easier to escape
inoremap jj <ESC>

" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>

" Window and buffers
map <leader>d :bd<cr>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>j :winc j<cr>
map <leader>k :winc k<cr>
map <leader>l :winc l<cr>
map <leader>h :winc h<cr>
map -         :winc _<cr>
map <leader>= :winc =<cr>

" OS clipboard yank and paste
nmap <leader>Y "*y
nmap <leader>P "*p

" Fugitive keybindings
map <leader>gco :Git! checkout <c-r><c-g><cr><cr><cr>l
map <leader>gc. :Gwrite<cr>:Gcommit <c-r><c-g><cr>
map <leader>gcc :Gcommit<cr>
map <leader>gca :Gwrite<cr>:Gcommit<cr>
map <leader>gpp :Git! pp<cr>
map <leader>gd  :Gdiff<cr>
map <leader>ge  :Gedit HEAD<cr>
map <leader>gl  :Glog<cr>
map <leader>gs  :Gstatus<cr>
map <leader>gb  :Gblame<cr>

" Complete filenames/lines/omni with a quicker shortcut key in insert mode
imap <C-f> <C-x><C-f>
imap <C-l> <C-x><C-l>
imap <C-o> <C-x><C-o>

" insert quickly
map <leader>i :insert<cr>

" NERD Tree
map <leader>ls :NERDTreeToggle<cr>
map <leader>ls. :NERDTreeFind<cr>
let NERDTreeChDirMode=2
let NERDTreeWinPos='Right'
let NERDTreeStatusline=-1
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=60

" Buffergator
let g:buffergator_split_size=10
let g:buffergator_viewport_split_policy='B'
let g:buffergator_suppress_keymaps=1
map <leader>b :BuffergatorOpen<cr>
map <leader>B :BuffergatorClose<cr>

" Tagbar
map <leader>m :TagbarOpenAutoClose<cr>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_indent = 1

" perltidy
" define a :Tidy command to run perltidy on visual selection || entire buffer"
command -range=% -nargs=* Tidy <line1>,<line2>!perltidy -q

" run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
    let l:winview = winsaveview()
    :Tidy
    call winrestview(l:winview)
endfun

" call :DoTidy every time you save a (perl) file
"autocmd BufWrite *.t,*.pl,*.plx,*.pm call DoTidy()
noremap <C-F6> :Tidy<CR>

" xml tidy
" autocmd BufRead,BufNewFile *.xml command! -range=% -nargs=* Tidy <line1>,<line2>!xmllint --pretty 1 %
" autocmd BufRead,BufNewFile *.xml noremap <leader>xt :Tidy<CR>

" perlprove
" au BufRead,BufNewFile *.t set filetype=perl | compiler perlprove

" Perldoc
map <leader>pd :PerlHelp <c-r><c-w><cr>

" Turn off warnings for perl compiler (see ':h :comp')
let g:perl_compiler_force_warnings = 0

" refactor perl subs
map <leader>rf <esc>:'<,'>!extract_perl_sub<cr>

" quickfix
map fn :cn<cr>
map fp :cp<cr>
map fw :cope<cr>

" Man pages
runtime ftplugin/man.vim
let $PAGER=''
nmap K :Man <cword><cr>
vmap K y:Man <c-r>"<cr>

" Visual search fu
vmap * y/<c-r>"<cr>
vmap # y?<c-r>"<cr>

" gundo
map <leader>u :GundoToggle<cr>

" apply a single line of my .vimrc
map <leader>vv yy:<c-r>"<bs><cr>

" faster exit
map Q :qall<cr>

" airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space             = "\ua0"
let g:airline_left_sep                  = '▶'
let g:airline_right_sep                 = '◀'
let g:airline_symbols.linenr            = 'LN'
let g:airline_symbols.branch            = ''
let g:airline_symbols.paste             = 'Þ'
let g:airline_symbols.whitespace        = 'Ξ'
let g:airline_theme                     = "iijo"
let g:airline_section_warning           = ''
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'x', 'y', 'z', 'warning' ]
  \ ]
let g:airline#extensions#hunks#enabled = 0
function! AirlineInit()
  let g:airline_section_b = airline#section#create(['branch', ' branch'])
endfunction
autocmd VimEnter * call AirlineInit()

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
  \'a'       : '#S',
  \'win'     : '#I #W',
  \'cwin'    : '#I #W',
  \'options' : {'status-justify' : 'left'},
  \'x'       : '#(whoami)@#H',
\ }
" \'z'       : '#($HOME/bin/tmux-git-fab.sh)',

" git gutter
let g:gitgutter_enabled         = 1
let g:gitgutter_signs           = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_realtime        = 0
let g:gitgutter_eager           = 0
"let g:gitgutter_diff_args       = '-w'
let g:gitgutter_sign_added            = '+'
let g:gitgutter_sign_modified         = '~'
let g:gitgutter_sign_removed          = '_'
let g:gitgutter_sign_modified_removed = '~'
hi GitGutterAdd          cterm=none ctermfg=45  ctermbg=233
hi GitGutterChange       cterm=none ctermfg=165 ctermbg=233
hi GitGutterDelete       cterm=bold ctermfg=162 ctermbg=233
hi GitGutterChangeDelete cterm=none ctermfg=160 ctermbg=233

" fzf
set rtp+=~/.fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --colors path:none --colors line:none --colors match:style:bold --colors match:fg:green '.<q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=* Files
  \ call fzf#run({
  \   'source': 'rg --files --hidden --no-heading --sort-files --color=always -g "!.git" -g "!.local" -g "!repo.git" -g "!.chef" -g "!.debug"',
  \   'options': '--reverse --color=dark --multi --bind "alt-a:toggle-all"',
  \   'down': '50%',
  \   'sink': 'e',
  \ })
map <leader>gf :GFiles<cr>
map <leader>f :Files<cr>
nmap <leader>* yw:Rg <c-r>"
vmap <leader>* y:Rg <c-r>"
nmap <leader>/ :Rg
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" EasyAlign
" to use     EasyAlign: <leader>a     in visual mode
" to use LiveEasyAlign: <leader>a C-P in visual mode
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

try
    source $HOME/.vimrc.local
catch
endtry

" something keeps turning this off so put this at the end
set tabstop=4
set shiftwidth=4
set expandtab
