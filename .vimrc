"構文ハイライト有効化
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
"キーマッピング
"左端へ
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
"右端へ
noremap <S-l>   $
"ノーマルモードでも改行できるようにする
nnoremap <CR> A<CR><ESC>
"Ctr+cでEsc
inoremap <C-c> <Esc>
"インサートモードでも移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

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

set wildchar=<C-Z>
"マッチするものをリスト表示しつつ、共通する最長の部分まで補完
set wildmode=list:longest
"ステータス行を常に表示
set laststatus=2
"ペースト時インデントしないようにする
set paste
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

