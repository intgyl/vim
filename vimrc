" .vimrc - Vim configuration file.
"
" Copyright (c) 2013 gyl. All Rights Reserved.
"
" Maintainer: gyl
"    Created: 2013-07-02


set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"from http://vim-scripts.org/vim/scripts.html
"you can just write Bundle 'name'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/Tagbar'
"Bundle 'vim-scripts/lookupfile'
Bundle 'https://github.com/Yggdroot/indentLine'
Bundle 'vim-scripts/genutils'
Bundle 'jslint.vim'
Bundle 'Auto-Pairs'
Bundle 'AuthorInfo'
"Bundle 'https://github.com/vimscript/c-support'
Bundle 'scrooloose/syntastic'
Bundle 'autoload_cscope.vim'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/Shougo/neocomplcache.vim.git'
Bundle 'https://github.com/Shougo/neosnippet.vim.git'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/vim-scripts/vcscommand.vim.git'
Bundle 'https://github.com/wesleyche/SrcExpl.git'
Bundle 'https://github.com/name5566/vim-bookmark.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'https://github.com/vim-scripts/xptemplate'
"Bundle 'tpope/vim-fugitive'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
"Bundle ''
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

"********************************************************************************

" Enable file type detection.
filetype plugin indent on
" Syntax highlighting.
syntax on
" Setting colorscheme
" Config for vim72
"********************************************************************************
if v:version >= 702
	set   autoindent
	set   autoread
	set   autowrite
	set   background=dark
	set   backspace=indent,eol,start
	set   nobackup
	set   cindent
	set   cinoptions=:0
	set   completeopt=longest,menuone
	set   encoding=utf-8
	set   noexpandtab
	set   fileencodings=utf-8,gb2312,gbk,gb18030,chinese
	set   fileformat=unix
	set   foldenable
	"set  foldmethod=syntax "折叠
	set   foldcolumn=0
	"set  expandtab "tab键展开为空格
	set   cursorline
	hi    CursorLine   cterm=NONE ctermbg=blue guibg=black guifg=NONE
	set   helpheight=10
	set   helplang=cn
	set   hidden
	set   history=100
	set   hlsearch
	set   ignorecase
	set   incsearch
	set   laststatus=2
	"You can copy context if use v
	"set   mouse=n
	set   selection=exclusive
	set   selectmode=mouse,key

	set   number
	set   pumheight=10
	set   ruler
	set   scrolloff=5
	set   shiftwidth=8
	set   showcmd
	set   smartindent
	set   smartcase
	set   tabstop=8
	set   termencoding=utf-8
	set   textwidth=280
	set   whichwrap=h,l
	set   wildignore=*.bak,*.o,*.e,*~
	set   wildmenu
	set   wildmode=list:longest,full
	set   nowrap
	set   iskeyword+=-
	set   so=4
	set   sidescroll=10
	set   cmdheight=1
	"set  invlist "show all char
	"set  nolist

	" 显示tab和空格
	 set list
	" 设置tab和空格样式
	 set lcs=tab:\┊\ ,nbsp:%,trail:-
	" 设定行首tab为灰色
	 highlight LeaderTab guifg=#666666
	 " 匹配行首tab
	 match LeaderTab /^\t/"
endif

"********************************************************************************
" Config for vim73
set tag=tags;
if v:version >= 703
	set colorcolumn=+1
endif

"********************************************************************************
" Config for win32 gvim.
if has("win32")
	set   guioptions-=T
	set   guioptions-=m
	set   guioptions-=r
	set   guioptions-=l
	set   lines=26
	set   columns=90
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	language messages zh_CN.utf-8
endif
"********************************************************************************

 "AUTO COMMANDS:
 "auto expand tab to blanks
 "autocmd FileType c,cpp

 "Restore the last quit position when open file.
 "自动定位到上一次退出时的位置
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\     exe "normal g'\"" |
			\ endif

"********************************************************************************
"
" SHORTCUT SETTINGS:
" Set mapleader
let mapleader=","

" Space to command mode.
"nnoremap <space> :
"vnoremap <space> :
" Switching between buffers.
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"nnoremap <C-h> <C-W>h
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
"nnoremap <C-l> <C-W>l
"inoremap <C-h> <Esc><C-W>h
"inoremap <C-j> <Esc><C-W>j
"inoremap <C-k> <Esc><C-W>k
"inoremap <C-l> <Esc><C-W>l
" "cd" to change to open directory.
"********************************************************************************
nmap wq :wq!<ENTER>
nmap Wq :wq!<ENTER>
nmap q :q<ENTER>
nmap Q :q<ENTER>
nmap wQ :wq!<ENTER>
nmap WQ :wq!<ENTER>
nnoremap <C-w> <C-w>w
nnoremap <space> $
nnoremap s %
nnoremap ; *
nnoremap f 0
nnoremap e #
noremap <leader>n :set mouse=n<ENTER>
noremap <leader>= :set mouse=<ENTER>
"nnoremap b B
"nnoremap e E
let OpenDir=system("pwd")
nmap <silent> <leader>cdr :exe 'cd ' . OpenDir<cr>:pwd<cr>
nmap <silent> <leader>cdf :cd %:h<cr>:pwd<cr>

"let g:C_FormatDate='%F'
"let g:C_FormatTime='%X'
"let g:C_FormatYear='%y'

let g:vimrc_author='gyl'
let g:vimrc_email='gyl33333@gmail.com'
let g:vimrc_homepage=''

"********************************************************************************
let g:indentLine_char = '┊'
"let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'

"********************************************************************************
"Config for Auto-Pairs

let g:AutoPairsShortcutToggle = '<leader>a'
"let g:AutoPairsShortcutFastWrap
"let g:AutoPairsShortcutJump
"let g:AutoPairsShortcutBackInsert

"********************************************************************************
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc


"********************************************************************************
"代码格式优化化

map <F10> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=linux -p --indent=force-tab --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp' || &filetype == 'cc'
        exec "r !astyle --style=linux -p --indent=force-tab --suffix=none %"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc



"********************************************************************************


"********************************************************************************

let g:tagbar_width=35
let g:tagbar_left = 1
"autocmd VimEnter * nested :TagbarOpen
autocmd VimEnter * nested :call tagbar#autoopen(1)

" PLUGIN SETTINGS:
" taglist.vim
"let g:Tlist_Auto_Update=1
"let g:Tlist_Process_File_Always=1
"let g:Tlist_Exit_OnlyWindow=1
"let g:Tlist_Show_One_File=1
"let g:Tlist_WinWidth=35
"let g:Tlist_Enable_Fold_Column=0
"let g:Tlist_Auto_Highlight_Tag=1
"let g:Tlist_Auto_Open=1

" NERDTree.vim
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1

"********************************************************************************
set t_Co=256

 let g:Powerline_colorscheme = 'solarized16'
 let g:Powerline_stl_path_style = 'full'
 "let g:Powerline_symbols = 'unicode'
 let g:Powerline_mode_n = 'NORMAL'
 "highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue

"********************************************************************************
" cscope.vim
if has("cscope")
	set csto=1
	set cst
	set nocsverb
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif
" OmniCppComplete.vim
let g:OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteScope=1
let g:OmniCpp_SelectFirstItem=2

"********************************************************************************
" VimGDB.vim
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif
" LookupFile setting
"let g:LookupFile_TagExpr='"tags.fn"'
"let g:LookupFile_MinPatLength=2
"let g:LookupFile_PreserveLastPattern=0
"let g:LookupFile_PreservePatternHistory=1
"let g:LookupFile_AlwaysAcceptFirst=1
"let g:LookupFile_AllowNewFiles=0

"********************************************************************************
"neosnippet setting{{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#enable_preview=1
"}}}

"********************************************************************************
" 使用pyflakes,速度比pylint快
"Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol = '✗'  "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons

"********************************************************************************
"godlygeek/tabular 代码对齐{{{
" \bb                 按=号对齐代码 [Tabular插件]
nmap <leader>bb :Tab /=<CR>
" \bn                 自定义对齐    [Tabular插件]
nmap <leader>bn :Tab /
"}}}

"********************************************************************************
let g:vbookmark_bookmarkSaveFile = $HOME . '/.data_vimbookmark'
"********************************************************************************
"16进制 2进制转换
nmap t16 :%!xxd<CR>
nmap t2 :%!xxd -r<CR>
"删除所以空行
nmap delline :g/^$/d

"********************************************************************************
"vcscommand 各种版本控制 svn cvs git hg{{{
"
"modify vcsccommand.vim line[415] replace line[416] for resovling mapping conflict with c.vim
"415:	"let lhs = VCSCommandGetOption('VCSCommandMapPrefix', '<Leader>c') . a:shortcut
"416:    let lhs = VCSCommandGetOption('VCSCommandMapPrefix', ']c') . a:shortcut
"noremap <Leader>ga    :VCSAdd<CR>
"noremap <Leader>gn    :VCSAnnotate<CR>
"noremap <Leader>gN    :VCSAnnotate!<CR>
"noremap <Leader>gc    :VCSCommit<CR>
"noremap <Leader>gD    :VCSDelete<CR>
"noremap <Leader>gd    :VCSDiff<CR>
"noremap <Leader>gg    :VCSGotoOriginal<CR>
"noremap <Leader>gG    :VCSGotoOriginal!<CR>
"noremap <Leader>gi    :VCSInfo<CR>
noremap <Leader>gl    :VCSLog<CR>
"noremap <Leader>gL    :VCSLock<CR>
"noremap <Leader>gr    :VCSReview<CR>
"noremap <Leader>gs    :VCSStatus<CR>
"noremap <Leader>gu    :VCSUpdate<CR>
"noremap <Leader>gU    :VCSUnlock<CR>
" ---------------> Good
noremap <Leader>git    :VCSVimDiff<CR><C-H>
noremap <Leader>gd    :VCSVimDiff
noremap <Leader>gb    :VCSBlame<CR><C-H>
noremap <Leader>gr    :VCSRevert<CR>
let VCSCommandEnableBufferSetup=0            "slow if set 1
"}}}
"diff 模式{{{
	nnoremap <silent> <leader>db [c
	nnoremap <silent> <leader>dn ]c
"}}}
"git mergetool{{{
"map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
"map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
"map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
"}}}

"********************************************************************************

" Man.vim
source $VIMRUNTIME/ftplugin/man.vim
" plugin shortcuts
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction
nmap  <F2> :TagbarToggle<cr>
nmap  <F3> :NERDTreeToggle<cr>
"nmap  <F4> :MRU<cr>
"nmap  <F5> <Plug>LookupFile<cr>
"nmap  <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>
"nmap  <F9> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
"nmap <F10> :call HLUDSync()<cr>
"nmap <F11> :call RunShell("Generate filename tags", "~/.vim/shell/genfiletags.sh")<cr>
"nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>
nmap <leader>sa :cs add cscope.out<cr>
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>zz <C-w>o
nmap <leader>gs :GetScripts<cr>



let g:winManagerWindowLayout='FileExplorer|BufExplorer' 
let g:persistentBehaviour=0         
let g:winManagerWidth=20
let g:defaultExplorer=1
nmap <silent> <leader>fir :FirstExplorerWindow<cr>
nmap <silent> <leader>bot :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
"use Ctrl+c to copy context
"vmap <C-c> "+y

"modify ctags' shortcuts 
noremap ]  <C-]>

"This tip provides the same autoloading functionality for Cscope
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter /* call LoadCscope()

