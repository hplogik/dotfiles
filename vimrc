"Not compatible with vi
set nocompatible

" Filetype Stuff
filetype on
filetype plugin on
filetype indent on

"Turn on syntax highlighting
syntax on

"set hidden
set hidden

"Don't update display when executing macros
set lazyredraw

"Let yourself know what mode your'e in
set showmode

"set search scan to wrap around file
set wrapscan

"make command line two lines high
set ch=2

"keep stuff in history
set history=100

"set tabs to only be 2 spaces
set tabstop=2 shiftwidth=2 expandtab

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%100v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

"color wombat256mod
color tango2

"wrap text at 80 chars in Markdown files
augroup Formatting
  autocmd!
  autocmd BufNew,BufRead *.txt,*.mkd,*.md setlocal textwidth=80
augroup END

map <C-n> <ESC>:tabnew<RETURN>
map <C-h> <ESC>:tabp<CR>
map <C-l> <ESC>:tabn<CR>
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
map <C-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
set guioptions-=T
set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
imap jj <Esc>

au BufNewFile,BufRead *.ejs set filetype=html

"command to remove all trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
