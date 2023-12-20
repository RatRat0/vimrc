" ################################################常用设置####################################################

" vim在电脑休眠后导致vim启动慢，改进措施
set t_u7=

" 去掉点vi的缺点
set nocompatible

" 设置行号以及相对行号
set number
set rnu

" 界面设置
syntax on
set background=dark
colorscheme gruvbox

" 高亮搜索
set hlsearch
set ignorecase " 搜索时忽略大小写

" 设置折叠模式
set foldmethod=indent
set foldlevel=20

" 设置自动上滚和下滚
set scrolloff=5

" 允许使用鼠标
set mouse=a

" TAB键的设置
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent " 继承前一行的缩进方式，适用于多行注释

" 更改光标形状
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" 解决复制黏贴问题
vnoremap <C-c> "+y

" " 解决Normal模式下的中英文输入法的问题
" let g:input_toggle = 0
" function! fcitx2en()
"    let s:input_status = system("fcitx-remote")
"    if s:input_status == 2
"       let g:input_toggle = 1
"       let l:a = system("fcitx-remote -c")
"    endif
" endfunction

" function! Fcitx2zh()
"    let s:input_status = system("fcitx-remote")
"    if s:input_status != 2 && g:input_toggle == 1
"       let l:a = system("fcitx-remote -o")
"       let g:input_toggle = 0
"    endif
" endfunction

" set timeoutlen=150
" autocmd InsertLeave * call Fcitx2en()
" autocmd InsertEnter * call Fcitx2zh()


" ###################一些方便的映射########################

" leader键
let mapleader=','

" unbind keys
map <C-a> <Nop>
map <C-x> <Nop>
map Q <Nop>

" 使用jj进入normal模式
inoremap jj <Esc>`^

" 用;适当地替换一点:
nnoremap ; :
" nnoremap ;w :w
" nnoremap ;q :q

" 切换窗口
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l 
nnoremap <Tab><Tab> <C-w>w

" 取消高亮
nnoremap ,n :noh<CR>

" 使用H和L来表示去往行首和行尾
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" shift+jkhl来进行代码块的移动
nnoremap J :m+<CR>
nnoremap K :m-2<cr>
vnoremap J :m'>+<cr>`<my`>mzgv`yo`z
vnoremap K :m'<-2<cr>`>my`<mzgv`yo`z

" ############################插件专区##########################

call plug#begin()

" " 启动页面(感觉不常用)
" Plug 'mhinz/vim-startify'

" vim界面
Plug 'scwood/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
" 文件管理和搜索
Plug 'scrooloose/nerdtree'
" Plug 'ctrlpvim/ctrlp.vim'	" 感觉不常用
" 快速定位插件
Plug 'easymotion/vim-easymotion'
" 编辑也成双成对
Plug 'tpope/vim-surround'
" Python-mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" 文件内模糊搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 批量替换
Plug 'brooth/far.vim'

" go语言插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" 浏览插件
Plug 'majutsushi/tagbar'
Plug 'lfv89/vim-interestingwords'

" 代码补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 代码格式化
Plug 'sbdchd/neoformat'
" " 代码静态检查
" Plug 'w0rp/ale'
" 添加注释
Plug 'tpope/vim-commentary'
" 与git相结合
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" 自动生成tags文件
Plug 'ludovicchabant/vim-gutentags'

" youcompleteme代码自动补全
Plug 'valloric/youcompleteme'

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

call plug#end()

" ##################nerdtree设置#####################
" 回到所在文件的文件树中
nnoremap <leader>v :NERDTreeFind<cr>
" 打开或关闭文件树
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
			\ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.swp$',
			\ ]

" ###############CtrlP设置###########################
let g:ctrlp_map = '<c-p>'

" ##############easymotion设置######################
nmap ss <Plug>(easymotion-s2)

" ##############python-mode设置#####################
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc=1
let g:pymode_doc_bind = 'K'
" 启动rope插件
" let g:pymode_rope = 1
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_lint_ignore = ['E303', 'E302', 'W391']
let g:pymode_options_max_line_length = 120

" ##########################Tagbar设置##################
nnoremap <leader>t :TagbarToggle<CR>

" " #########################deoplete######################
" let g:deoplete#enable_at_startup = 1
" set completeopt-=preview

" ######################coc.nvim设置######################
" 确定node的位置
let g:coc_node_path = "/usr/local/opt/node@12/bin/node"
" 添加coc的相关扩展，如Python、C、vim、json等
let g:coc_global_extensions = [
			\'coc-clangd',
			\ 'coc-vimlsp'
			\]
" 设置提示符的位置
set signcolumn=number

" " 按<Tab>键可以在提示符中向下选择，代替<C-n>
" inoremap <silent><expr> <TAB>
" 			\ pumvisible() ? "\<C-n>" :
" 			\ <SID>check_back_space()  ? "\<TAB>" :
" 			\ coc#refresh()

" " 按<s-TAB> 可以在提示符中向上选择，代替<C-p>
" inoremap <expr><s-TAB> pumvisible() ? "\<C-p" : "\<C-h>"
" function! s:check_back_space() abort
" 	let col = col('.')-1
" 	return !col || getline('.')[col - 1] =~# '\s'
" endfunction

" " 按<CR>确认提示符中的选择
" if exists('*complete_info')
" 	inoremap <silent><expr> <CR> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
" endif




