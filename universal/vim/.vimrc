" Line numbers
set nu
set rnu
nnoremap Q :q!<CR>

" Localleader
let maplocalleader=","

" Colorscheme
set runtimepath^=~/.config/vim
set runtimepath+=~/.config/vim/after
set termguicolors
colorscheme dsekt

" Folding
set fdm=manual
set foldcolumn=3

" Disable system clipboard as default
set clipboard=
nnoremap <CR> :w<CR>==

" QoL keybinds
nnoremap <localleader>C gg"+yG
nnoremap <localleader>c "+y
nnoremap <localleader>p "+p
nnoremap <localleader>P "+P

nnoremap § za
nnoremap ± z%


nnoremap <localleader>d yyp
nnoremap <localleader>o o<Esc>
nnoremap <localleader>O O<Esc>

nnoremap <localleader>w :%s/\s\+$//e<CR>
nnoremap <localleader>x :!chmod +x %<CR>
" --- Persistent undo (per-file edit history) ---
set undofile
set undodir=~/.vim/undo


" --- Neovim shada (if using nvim) ---
if has("nvim")
    set shada='1000,<50,s10,h
else
  " --- Persistent marks, jumps, registers, history ---
  set viminfo='1000,f1,<50,s10,h
  set viminfofile=~/.vim/viminfo

  " --- Restore cursor position ---
  augroup restore_cursor
    autocmd!
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   execute "normal! g`\"" |
          \ endif
  augroup END
endif
