if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endifif empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"主题颜色
"colorscheme desert

"编码设置
"set enc=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
"set langmenu=zh_CN.UTF-8
"set helplang=cn
"检查拼写，和建议
"map <LEADER>sc :set spell!<CR>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
"快速插入锚点
inoremap fj <++>
"快速注释
map c/ <LEADER>c<space>
"inoremap <C-x> <ESC>ea<C-x>s
"启用tabnine
"set rtp+=~/tabnine-vim

"显示光标上下留4行
set scrolloff=4


"保存历史操作
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo,.
endif


set relativenumber
set number
set cursorline
set wrap
set showcmd
set wildmenu
set ignorecase
set smartcase

"(设置tab 为4个空格)
set ts=4
set expandtab
set autoindent  

"启用鼠标
set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
inoremap kj <esc>
inoremap <C-q> <esc>
let mapleader = " "
"noremap <LEADER>m :NERDTree<CR>
noremap <LEADER>m :NERDTreeToggle<CR>
set hlsearch
exec "nohlsearch"
set incsearch

syntax on
syntax enable


map T :vsplit<CR> <C-w>l :term<CR> i
"目前只支持运行python 
map E :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'python'
        set splitright
        :vs
        :term python %
        elseif &filetype == 'go'
        set splitright
        :vs
        :term go run %
        endif
endfunc


map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map r :nohlsearch<CR>
" 相当于 control+w+l  control+w+h
noremap <LEADER>l <C-w>l
noremap <LEADER>h <C-w>h
"noremap j k
"noremap k j

noremap J 5j
noremap K 5k


call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'jiangmiao/auto-pairs'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-github'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-match-highlight'
"Plug 'ncm2/ncm2-markdown-subscope'

"进入vim时可以选择历史编辑的文件
Plug 'mhinz/vim-startify'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"处理 function <SNR>19_filetype_changed 时发生错误: 第    4 行: E492: 不是编辑器的命令:             Semshi enable
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Bookmarks
Plug 'kshenoy/vim-signature'
" youdao
Plug 'ianva/vim-youdao-translater'


"commen
Plug 'scrooloose/nerdcommenter'
call plug#end()

vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>

"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"let g:ncm2_jedi#python_version = 3
"let g:ncm2#match_highlight = 'sans-serif'

"" plugin/foo.vim
if has('nvim')
    finish
endif

let s:foo = yarp#py3('foo_wrap')

func! Bar(v)
    return s:foo.call('bar',a:v)
endfunc



