" don't bother with vi compatibility
set nocompatible
cd ~/vagrant
" 修改leader键
let mapleader = ','
let g:mapleader = ','

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

inoremap jj <ESC>


call plug#begin('~/.vim/bundle')

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

 "Add plugins to &runtimepath
call plug#end()

"au BufWritePre * :set binary | set noeol
"au BufWritePost * :set nobinary | set eol

set guioptions-=r
set guioptions-=L
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set smartcase                                                " case-sensitive search if any caps
set laststatus=2                                             " always show statusline
set number                                                   " show line numbers
set ruler                                                    " show where you are
set hidden                                                   " hide the inactive buffers
set showcmd
set scrolloff=3                                              " show context above/below cursorline


set expandtab                                                " expand tabs to spaces
set shiftwidth=4                                             " normal mode indentation commands use 2 spaces
set softtabstop=4                                           " insert mode tab and backspace use 2 spaces
set tabstop=4                                             " actual tabs occupy 8 characters
set shiftround                                          " Round indent to multiple of shiftwidth
set autoindent


if has("gui_macvim")

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif



set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" }}}

"" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}


" Fast window moves {{{

"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" }}}

" nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader><leader>v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

"autocmd BufRead,BufNewFile *.blade.php set filetype=html


set t_Co=256
set termencoding=utf-8

" gui settings
if (&t_Co == 256 || has('gui_running'))
  if ($TERM_PROGRAM == 'iTerm.app')
    "let g:molokai_original = 1
    "colorscheme molokai
    colorscheme dracula
  else
    "let g:molokai_original = 1
    "colorscheme molokai

    colorscheme dracula
    hi Search ctermfg=231 ctermbg=212 cterm=NONE guifg=#f8f8f0 guibg=#ff79c6 gui=NONE
    hi Visual ctermfg=NONE ctermbg=236 cterm=NONE guifg=#f8f8f0 guibg=#bd93f9 gui=NONE
    "hi phpRegion ctermfg=NONE ctermbg=236 cterm=NONE guifg=#f8f8f0 guibg=#bd93f9 gui=NONE
    hi vertsplit guifg=fg guibg=bg
    "colorscheme candystripe

  endif
endif
set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types:h15


" Airline {{{

set noshowmode

let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#whitespace#enabled = 0


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'


 "let g:airline#extensions#tabline#enabled = 2
 "let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

set nowrap
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines

" 英文单词在换行时不被截断
set linebreak

"高亮整行
set cursorline

"html注释
map <leader>c <ESC>^i<!--<ESC>$a--><ESC>
"html反注释
map <leader>u <ESC>^4x$hh4x<ESC>

"使PHP识别EOT字符串
hi link phpheredoc string
"高亮选择
set hlsearch

"自动保存
set autowrite

"在Normal Mode和Visual/Select Mode下，利用Tab键和Shift-Tab键来缩进文本：

" nnoremap <esc> :nohl<cr>
" nnoremap j jzz
" nnoremap k kzz


vnoremap < <gv
vnoremap > >gv


"set autochdir

"覆盖文件时不备份
set nobackup
"无写入备份
set nowritebackup
" 缓冲区不使用交换文件
set noswapfile

set completeopt-=preview

"载入配置文件快捷键
map <silent> <leader>v :e ~/.vimrc<cr>


au BufRead,BufNewFile *.tpl set filetype=html
au BufRead,BufNewFile *.volt set filetype=html


" 插入括号时，短暂的跳转到匹配的对应括号，显示匹配的时间由matchtime决定
set showmatch

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"Automatically remove trailing spaces when saving a file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif


"设置php帮助文档
"autocmd BufNewFile,Bufread *.php set keywordprg="help"
"set runtimepath+=~/.vim/bundle/php-dict/plugin/

" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>

let g:php_manual_online_search_shortcut = '<F2>'

:map <F1> K
:imap <F1> <Esc>K


"去除空白符
function! RemoveTrailingWhitespace()
  if &ft != "diff"
    let b:curcol = col(".")
    let b:curline = line(".")
    silent! %s/\s\+$//
    silent! %s/\(\s*\n\)\+\%$//
    call cursor(b:curline, b:curcol)
  endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()



"记录上次关闭的文件及状态
" set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"相对行号
nnoremap <leader>r :call  Relativenum()<cr>
function! Relativenum()
    if &rnu == 1
        set nornu
    else
        set rnu
    endif
endfunction



"##########插件设置##########
nnoremap <leader>l :NERDTreeTabsFind<CR>
nmap <F6> :NERDTreeTabsToggle<CR>
nmap <F7> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_phpctags_bin='~/.vim/phpctags'
let g:NERDTreeMapActivateNode='<tab>'

"autocmd vimenter * NERDTree

" ==== Automatic ====
" Automatically change cwd to the directory of the file in the current buffer
autocmd BufEnter * lcd %:p:h

" ==== rooter settings ====
let g:rooter_silent_chdir=1
" ==== End rooter settings ====

"##########AirLine

"let g:airline#extensions#tabline#enabled = 1


" ==== hardtime settings ====
" Turn on hardtime
let g:hardtime_default_on = 1
" Allow different movement key
let g:hardtime_allow_different_key = 1
" Max 3 of the same movement allowed at a time
let g:hardtime_maxcount = 3
" ==== End hardtime settings ====



" ==== gutentags settings ====
" Exclude css, html, js files from generating tag files
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
" Where to store tag files
let g:gutentags_cache_dir = '~/.vim/gutentags'
" ==== End gutentags settings ====


"#####neocomplete 配置
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#use_vimproc = 1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'css' : '~/.vim/bundle/vim-dict/dict/css.dic',
            \ 'javascript' : '~/.vim/bundle/vim-dict/dict/javascript.dic',
            \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'


" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Enter>  pumvisible() ? "\<C-y>" : "\<Enter>"


" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,tpl setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd  FileType  php setlocal omnifunc=phpcomplete#CompletePHP

"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'


" phpcomplete-extended setting
"let g:phpcomplete_index_composer_command = 'composer'



" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory= '~/.vim/bundle/vim-snippets/snippets'


"Emmet 配置
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<c-e>'



"####Unit 插件

let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 0
let g:unite_prompt = '>>>'
let g:unite_data_directory = $HOME.'/.vim/tmp/unite'

call unite#filters#matcher_default#use(['matcher_context'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:default_context = {
    \ 'winheight' : 15,
    \ 'update_time' : 200,
    \ 'prompt' : '>>> ',
    \ 'start_insert' : 1,
    \ 'ignorecase' : 1,
    \ 'smartcase' : 1,
\ }

call unite#custom#profile('default', 'context', default_context)

"call unite#custom#source('line',
    "\ 'matchers', 'matcher_fuzzy')
call unite#custom#source('file_mru,file_rec,file_rec/async',
            \ 'ignore_pattern', join(['\.git/','\.DS_Store', 'tmp/', 'bundle/'], '\|'))

let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']




function! <SID>UniteSetup()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <Esc> <plug>(unite_exit)
    imap <buffer> <Esc> <plug>(unite_exit)
    imap <buffer> <down>   <Plug>(unite_select_next_line)
    imap <buffer> <Up>   <Plug>(unite_select_previous_line)
endfunction
autocmd FileType unite call <SID>UniteSetup()

nmap <space> [unite]
nnoremap [unite] <nop>

nnoremap <silent> [unite]f :<C-U>Unite -auto-resize -toggle -buffer-name=files file_rec/async<CR>
nnoremap <silent> [unite]m :<C-U>Unite -auto-resize -toggle -buffer-name=files file_mru<CR>
nnoremap <silent> [unite]b :<C-U>Unite -quick-match -auto-resize -buffer-name=buffers buffer<CR>
nnoremap <silent> [unite]y :<C-u>Unite -auto-resize -buffer-name=yanks -quick-match history/yank<CR>
nnoremap <silent> [unite]p :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]l :<C-u>Unite -silent -no-split -start-insert -auto-preview
            \ line<CR>

let g:unite_source_menu_menus = {}
" menu prefix key (for all Unite menus) {{{
nnoremap [menu] <Nop>
nmap <Leader> [menu]
" }}}

" files and dirs menu {{{
let g:unite_source_menu_menus.files = {
    \ 'description' : '          files & dirs
        \                                          ⌘ [space]o',
    \}
let g:unite_source_menu_menus.files.command_candidates = [
    \['▷ open file                                                  ⌘ ,o',
        \'Unite -start-insert file'],
    \['▷ open more recently used files                              ⌘ ,m',
        \'Unite file_mru'],
    \['▷ open file with recursive search                            ⌘ ,O',
        \'Unite -start-insert file_rec/async'],
    \['▷ edit new file',
        \'Unite file/new'],
    \['▷ search directory',
        \'Unite directory'],
    \['▷ search recently used directories',
        \'Unite directory_mru'],
    \['▷ search directory with recursive search',
        \'Unite directory_rec/async'],
    \['▷ make new directory',
        \'Unite directory/new'],
    \['▷ change working directory',
        \'Unite -default-action=lcd directory'],
    \]
nnoremap <silent>[menu]mf :Unite -silent -quick-match -auto-resize
            \ menu:files<CR>
" }}}

" yanks, registers & history menu {{{
let g:unite_source_menu_menus.registers = {
    \ 'description' : '      yanks, registers & history
        \                            ⌘ [space]i',
    \}
let g:unite_source_menu_menus.registers.command_candidates = [
    \['▷ yanks                                                      ⌘ [unite]y',
        \'Unite history/yank'],
    \['▷ commands       (history)                                   ⌘ q:',
        \'Unite history/command'],
    \['▷ searches       (history)                                   ⌘ q/',
        \'Unite history/search'],
    \['▷ registers',
        \'Unite register'],
    \['▷ messages',
        \'Unite output:messages'],
    \['▷ undotree      (UndotreeToggle)                                     ⌘ ,u',
        \'UndotreeToggle'],
    \]
nnoremap <silent>[menu]ml :Unite -silent -auto-resize -quick-match menu:registers<CR>
" }}}

let g:unite_source_menu_menus.git = {
            \ 'description' : '            gestionar repositorios git
            \                            ⌘ [espacio]g',
            \}
let g:unite_source_menu_menus.git.command_candidates = [
            \['▷ Magit                                                        ⌘ ,gt',
            \'exe "silent Magit"'],
            \['▷ git status       (Fugitive)                                ⌘ ,gs',
            \'Gstatus'],
            \['▷ git diff         (Fugitive)                                ⌘ ,gd',
            \'Gdiff'],
            \['▷ git commit       (Fugitive)                                ⌘ ,gc',
            \'Gcommit'],
            \['▷ git log          (Fugitive)                                ⌘ ,gl',
            \'exe "silent Glog | Unite quickfix"'],
            \['▷ git blame        (Fugitive)                                ⌘ ,gb',
            \'Gblame'],
            \['▷ git stage        (Fugitive)                                ⌘ ,gw',
            \'Gwrite'],
            \['▷ git checkout     (Fugitive)                                ⌘ ,go',
            \'Gread'],
            \['▷ git rm           (Fugitive)                                ⌘ ,gr',
            \'Gremove'],
            \['▷ git mv           (Fugitive)                                ⌘ ,gm',
            \'exe "Gmove " input("destino: ")'],
            \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
            \'Git! push'],
            \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
            \'Git! pull'],
            \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
            \'exe "Git! " input("comando git: ")'],
            \['▷ git cd           (Fugitive)',
            \'Gcd'],
            \]
nnoremap <silent> [menu]mg :Unite -silent -quick-match menu:git<CR>

" buffers, tabs & windows menu {{{
let g:unite_source_menu_menus.navigation = {
    \ 'description' : '     navigate by buffers, tabs & windows
        \                   ⌘ [space]b',
    \}
let g:unite_source_menu_menus.navigation.command_candidates = [
    \['▷ tabs                                                       ⌘ ,B',
        \'Unite tab'],
    \['▷ new vertical window                                        ⌘ ,v',
        \'vsplit'],
    \['▷ new horizontal window                                      ⌘ ,h',
        \'split'],
    \['▷ delete buffer                                              ⌘ ,K',
        \'bd'],
    \]
nnoremap <silent>[menu]mn :<C-u>Unite -silent -auto-resize -quick-match menu:navigation<CR>
" }}}


" neomru {{{

let g:neomru#file_mru_path = $HOME.'/.vim/tmp/neomru/file'
let g:neomru#directory_mru_path = $HOME.'/.vim/tmp/neomru/directory'

" }}}

"CtrlSF 插件配置


let g:ctrlsf_auto_close = 1
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_indent = 2
let g:ctrlsf_winsize = '50%'

nmap     <Leader>s <Plug>CtrlSFPrompt
vmap     <Leader>s <Plug>CtrlSFVwordPath
vmap     <Leader>S <Plug>CtrlSFVwordExec
nmap     <Leader>w <Plug>CtrlSFCwordPath
nnoremap <Leader>o :CtrlSFToggle<CR>


" syntastic 配置
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']
let g:syntastic_javascript_checkers=['jshint']

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_enable_highlighting = 0


"vim-expand-region

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


"indentLine
"let g:indentLine_char = '┆'
"let g:indentLine_color_gui = '#75715E'



"vim-devicons
" NERDTress File highlighting

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdeviconsunicodeglyphdoublewidth = 2

autocmd VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', '#DC361D', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#6364A7', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#282A36')
autocmd VimEnter * call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#282A36')

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif





function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))



"Smarty3
"let g:smarty_left_delimiter = '<{'
"let g:smarty_right_delimiter = '}>'

"yankRing
"let g:yankring_replace_n_pkey = '<M-j>'
"let g:yankring_replace_n_nkey = '<M-k>'
"nmap ∆ <M-j>
"nmap ˚ <M-k>
"nnoremap <silent> <F9> :YRShow<CR>


"vim-multiple-cursors

let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'



nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>
nnoremap <Left> :echomsg "use h"<cr>
nnoremap <Right> :echomsg "use l"<cr>


" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0
"autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()



"Ctrl+] - go to definition
"Ctrl+T - Jump back from the definition.
"Ctrl+W Ctrl+] - Open the definition in a horizontal split
"Ctrl+\ - Open the definition in a new tab
"Alt+] - Open the definition in a vertical split

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

nmap <C-b>n  :bnext<CR>;
nmap <C-b>p  :bprev<CR>;
