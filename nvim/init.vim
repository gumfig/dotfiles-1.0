set nocompatible              " be iMproved, required
filetype off                  " required
set list
set autoindent
set statusline+=%#warningmsg#
set statusline+=%*
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'preservim/tagbar'
Plugin 'prettier/vim-prettier'
Plugin 'dylanaraps/wal.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'itmammoth/doorboy.vim'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-commentary'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'xolox/vim-misc'
Plugin 'qpkorr/vim-renamer'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'b4skyx/serenade'

call vundle#end()            " required
filetype plugin indent on    " required]
set tabstop=4
set expandtab
map <C-t> :NERDTreeToggle<CR>
imap <C-a> <Esc>ggvG$
nmap <C-e> <C-y>,
imap <C-e> <C-y>,
nmap <C-a> ggvG$
imap jj <Esc>
imap <C-z> <Esc>:undo<Return>a
nmap <C-z> :undo<Return>
imap <C-l> <Esc>zza
imap <C-x> <Esc>:Format<Return>a
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
let g:javascript_plugin_jsdoc = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.svelte'
let NERDTreeShowHidden=1
let g:go_fmt_command = "goimports"
let g:prettier#autoformat = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufReadPost, *.wiki set spell spelllang=ms,en

map <C-n> :NERDTreeToggle<CR>
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
nmap <F8> :TagbarToggle<CR>
cnoreabbrev cll g/^\s*$/d

" LSP settings
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" LSP settings

let g:lightline = {
      \ 'colorscheme': 'wal',
      \ }
colorscheme wal
