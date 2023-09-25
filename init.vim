set number
set autoindent
set smarttab
set softtabstop=2
set mouse=a
set cursorline
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set encoding=UTF-8

" f9 python execution
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" NERDtree autostart - minimal
autocmd VimEnter * NERDTree
let NERDTreeMinimalUI=1

call plug#begin()
        Plug 'lukas-reineke/indent-blankline.nvim'
        Plug 'https://github.com/preservim/nerdtree' " NerdTree
        Plug 'https://github.com/vim-airline/vim-airline' " Status bar
        Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
        Plug 'https://github.com/pboettch/vim-highlight-cursor-words' " Retro Scheme
        Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'davidhalter/jedi-vim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
        Plug 'vim-syntastic/syntastic'
        Plug 'nvie/vim-flake8'
        Plug 'nokobear/vim-colorscheme-edit'
                Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'atelierbram/Base4Tone-nvim'
        Plug 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }
        Plug 'junegunn/fzf'
call plug#end()

let python_highlight_all=1
syntax on
lua << EOF
        --indentguide setting
        vim.opt.list = true
        vim.opt.listchars:append "space:⋅"
        vim.opt.listchars:append "eol:↴"
        require("indent_blankline").setup {
            show_end_of_line = true,
            space_char_blankline = " ",
        }
EOF

colorscheme wombat256modback
let g:HiCursorWords_style='term=reverse cterm=reverse gui=reverse'
let g:HiCursorWords_delay = 200
let g:HiCursorWords_hiGroupRegexp = ''
let g:HiCursorWords_debugEchoHiName = 0
let g:HiCursorWords_linkStyle='Underlined'
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
