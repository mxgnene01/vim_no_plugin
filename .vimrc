"==========================================
" General 基础设置
"==========================================
"格式化xml和json
map <silent><C-y> :1,$!xmllint --encode UTF-8 --format -<cr>
map <C-p> :%!python -m json.tool<CR>
" =============== 展示颜色 ================
syntax enable
set background=dark
if has('gui_running')
    set background=light
else
    set background=dark
endif

set t_Co=256              " enable 256-color mode.
colorscheme Tomorrow-Night
hi Normal ctermfg=252 ctermbg=none "Transparent background

" =============== 展示颜色 ================
" tab相关变更
set tabstop=4             " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4          " 每一次缩进对应的空格数
set softtabstop=4         " 按退格键时可以一次删掉 4 个空格
set smarttab              " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab             " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround            " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
set shiftround            " always indent/outdent to the nearest tabstop
set modeline              " enable modeline
set nu

" history存储长度。
set history=2000
"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

"非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
set autoread          " 文件修改之后自动载入。

" 突出显示当前行等 不喜欢这种定位可注解
set cursorline              " 突出显示当前行

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=
set tm=500

"==========================================
" Show 展示/排班等界面格式设置
"==========================================

set nowrap                    " 取消换行。
set showmatch                 " 括号配对情况
set mat=2                     " How many tenths of a second to blink when matching brackets

"设置文内智能搜索提示
set hlsearch                  " 高亮search命中的文本。
set ignorecase                " 搜索时忽略大小写
set incsearch                 " 随着键入即时搜索
set smartcase                 " 有一个或以上大写字母时仍大小写敏感
set ruler                     " 显示当前的行号列号：
set showcmd                   " 在状态栏显示正在输入的命令
set showmode                  " Show current mode

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间
set scrolloff=10

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2

"==========================================
" file encode, 文件编码,格式
"==========================================
" 自动判断编码时，依次尝试以下编码：
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
" language message zh_CN.UTF-8
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

"==========================================
" others 其它配置
"==========================================
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。

"删除多余空格
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Remember info about open buffers on close"
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
"hot key  自定义快捷键
"==========================================
let mapleader = ','
let g:mapleader = ','

"强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
map j gj
map k gk

" better command line editing :! 执行命令的快捷键
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

""Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Go to home and end using capitalized directions
noremap H 0
noremap L $

" Remap VIM 0 to first non-blank character
map 0 ^

""为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set number! number?<CR>
nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
              set paste
set pastetoggle=<F5>            " when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
"map <c-space> ?"

map Y y$
" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %
noremap <silent><leader>/ :nohls<CR>

nnoremap ; :

"nnoremap <leader>v V`}

"Use sane regexes"
nnoremap / /\v
vnoremap / /\v

"Keep search pattern at the center of the screen. 搜索的时候保证在屏幕的中心"
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"Use arrow key to change buffer"
noremap <Tab> :tabnext<CR>
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

""Jump to start and end of line using the home row keys
nmap t o<ESC>k
nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>

noremap U <C-r>

" select all
map <Leader>sa ggVG"

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
