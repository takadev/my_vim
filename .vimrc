syntax enable
"カラースキーマ
colorscheme molokai
"行番号
set nu
"ルーラー
set ruler
"他で書き換えられたら自動で読み直す
set autoread
"ウインドウタイトル設定
set title
"文字コードをutf8へ
set fenc=utf-8
"スクロール時の余白10
set scrolloff=10

"左端へ
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
"右端へ
noremap <S-l>   $
"ノーマルモードでも改行できるようにする
nnoremap <CR> A<CR><ESC>
"上下移動が論理行単位ではなく表示行単位で行われるようにする
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"n, N キーで「次の（前の）検索候補」を画面の中心に表示する
nnoremap n nzz
nnoremap N Nzz
"新しいタブをstで追加
nnoremap st :<C-u>tabnew<CR>

"コマンドラインモードで %% を入力すると現在編集中のファイルのフォルダのパスが展開されるようにする
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>
"Ctr+cでEsc
inoremap <C-c> <Esc>
"インサートモードでも移動
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-y> <C-o>^
inoremap <C-b> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-v> <DEL>

"検索
"大文字と小文字を区別しない
set ignorecase
set smartcase
"検索がファイル末尾まで進んだら、ファイル先頭から再び検索しない
set nowrapscan
"インクリメンタルサーチを有効
set incsearch
"検索結果をハイライト表示 
set hlsearch

"行番号ハイライト
set cursorline
"列ハイライト
set cursorcolumn
"行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
"スマートインデント
set smartindent
"対応する括弧を強調表示
set showmatch

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" set wildchar=<C-Z>
"マッチするものをリスト表示しつつ、共通する最長の部分まで補完
set wildmode=list:longest
"ステータス行を常に表示
set laststatus=2
"OSのクリップボードを使用する
set clipboard+=unnamed
"ビープ音を消す
set vb t_vb=
set visualbell
"タブを4スペースへ変換
set expandtab
set tabstop=4
"バックスペースでインデントや改行を消せるようにする
set backspace=indent,eol,start
"テキスト整形オプション，マルチバイト系を追加
set formatoptions=lmoq
"行を跨いで移動出来る様にする
set whichwrap=b,s,h,l,<,>,[,]
"コマンドをステータス行に表示
set showcmd
"現在のモードを表示
set showmode
"スワップファイル作らない
set noswapfile
"編集中でも他のファイルを開けるようにする
set hidden


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/TK/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/TK/.config/nvim/bundle')
  call dein#begin('/Users/TK/.config/nvim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/TK/.config/nvim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Clang plugin
  call dein#add('justmao945/vim-clang')

  let g:rc_dir = expand("~/.config/nvim/rc")
  let s:toml = g:rc_dir . '/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  let g:python3_host_prog = '/Users/TK/.pyenv/versions/neovim3/bin/python'

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

