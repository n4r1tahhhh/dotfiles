""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" 文字コードをUTF-8に設定
set fenc=utf-8
" スワップファイルを作らない
set noswapfile
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" コマンドラインの補完
set wildmode=list:longest
" クラッシュ防止
set synmaxcol=200

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" 構文毎に文字色を変化させる
syntax on

" Tab系
" タブ入力を複数の空白入力に置き換える
set expandtab
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin()
" LSP
Plug 'neoclide/coc.nvim'
Plug 'itchyny/lightline.vim'
" ctrl + u/d/f/b がヌルヌル動く
Plug 'yuttie/comfortable-motion.vim'
" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'
" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'
" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
call plug#end()
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""""""
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" NERDTreeの設定
""""""""""""""""""""""""""""""
noremap <C-N> :NERDTree<CR>
""""""""""""""""""""""""""""""

" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" 自動的に閉じ括弧を入力
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" filetypeの自動検出
filetype on
