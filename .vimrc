"set nocompatible

call plug#begin('~/.vim/plugged')
 	"Plug 'frazrepo/vim-rainbow'
    "Plug 'leafgarland/typescript-vim'
    "Plug 'maxmellon/vim-jsx-pretty'
	"Plug 'morhetz/gruvbox'
    Plug 'edkolev/tmuxline.vim'
    "Plug 'pangloss/vim-javascript'
    "Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

    "Plug 'gisraptor/vim-lilypond-integrator'
    "Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
        "let g:coq_settings = { 'auto_start': 'shut-up' }
    "Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'metakirby5/codi.vim'

    Plug 'christianchiarulli/nvcode-color-schemes.vim'

    Plug 'akinsho/bufferline.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/popup.nvim'

    Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
    Plug 'vim-airline/vim-airline'
        let g:airline_powerline_fonts = 1
        let g:airline_section_warning = 0

    Plug 'vim-airline/vim-airline-themes'
        let g:rainbow_active = 1

    Plug 'ryanoasis/vim-devicons'
        let g:webdevicons_enable_airline_tabline = 1
        let g:webdevicons_enable_airline_statusline = 1
        let g:webdevicons_conceal_nerdtree_brackets= 1
        Plug 'iamcco/markdown-preview.nvim', { 'for':['markdown'],'do': 'cd app && yarn install'  }
        let g:mkdp_browser = 'firefox'
        let g:mkdp_page_title = '「${name}」'
        let g:mkdp_preview_options = {
            \ 'sync_scroll_type':0
            \}
    "Plug 'octol/vim-cpp-enhanced-highlight'
        "let g:cpp_member_variable_highlight = 1
        "let g:cpp_class_decl_highlight = 1
        "let g:cpp_class_scope_highlight = 1
        "let g:cpp_posix_standard = 1
	Plug 'preservim/nerdtree'
		let g:NERDTreeDirArrowExpandable = '▸'
		let g:NERDTreeDirArrowCollapsible = '▾'
	Plug 'preservim/nerdcommenter'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'

    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'dbeniamine/cheat.sh-vim',{'for':['julia']}
	Plug 'rstacruz/vim-closer'
    "Plug 'tpope/vim-fugitive'

    "Plug 'rakr/vim-one'
    Plug 'mattn/emmet-vim',{'for':['html']}
        let g:user_emmet_leader_key='<C-t>'
    Plug 'junegunn/rainbow_parentheses.vim'
		let g:rainbow#max_level = 16
		let g:rainbow#pairs = [['(', ')'], ['[',']'], ['{','}']]
    Plug 'lervag/vimtex' ,{'for' :['tex' , 'latex']}
		"len a:ten_concejal='abana'
		let g:vimtex_compiler_latexmk = { 
				\ 'executable' : 'latexmk',
				\ 'options' : [
				\   '-lualatex',
				\   '-file-line-error',
				\   '-synctex=1',
				\   '-interaction=nonstopmode',
				\ ],
				\}
		let g:vimtex_format_enabled=1
		let g:vimtex_fold_manual=1
		let g:vimtex_quickfix_mode=0
        let g:vimtex_view_method='zathura'
    Plug 'SirVer/ultisnips',{'for':['cpp','java','lilypond','tex','latex']}
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger = '<c-z>'
	"Plug 'vim-scripts/SyntaxAttr.vim'
	"Plug 'tpope/vim-sensible'
    "Plug 'itchyny/lightline.vim'
    "Plug 'mengelbrecht/lightline-bufferline'
	Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " far Himplad
call plug#end()


"let g:one_allow_italics = 1 " I love italic for comments
"set bg=dark
"let g:gruvbox_guisp_fallback = "bg"
"colorscheme gruvbox
"set termguicolors
"let g:airline_theme='gruvbox'

set fenc=utf-8
set smarttab
set conceallevel=2
set smartindent
set mouse=a


nnoremap <Space><Space> :w<CR>
nnoremap <CR> :noh<CR>
nnoremap <Space>q :q<CR>
set nu rnu
set showbreak=..
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
vnoremap <C-y> "+y
set signcolumn=yes
set tabstop=4
set shiftwidth=4
set expandtab
"set tags=tags
"hi SpellBad cterm=underline
"hi normal ctermbg=NONE guibg=NONE
"para aplicar transparencia ^
"  para encontrar el grup sintacitco |
" 			             v
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"ñame") . ">"<CR>
autocmd BufNewFile,BufRead *.tsx set filetype=typescript
"au BufNewFile,BufRead *.ly set ft=lilypond
"au BufNewFile,BufRead *.ly set ft=lilypond
au BufNewFile,BufRead *.cpp nnoremap <C-a> :!g++ -std=c++1z % <CR>
au BufNewFile,BufRead *.cpp nnoremap <C-i> :!./a.out < b.in <CR>
au BufNewFile,BufRead *.c nnoremap <C-a> :!gcc % <CR>
au BufNewFile,BufRead *.c nnoremap <C-i> :!./a.out < b.in <CR>
au BufNewFile,BufRead *.py nnoremap <C-a> :!python3 % <CR>
au BufNewFile,BufRead *.py nnoremap <C-i> :!python3 % < b.in <CR>
au BufNewFile,BufRead *.rs nnoremap <C-a> :!rustc % <CR>
au BufNewFile,BufRead *.rs nnoremap <C-i> :!./% < b.in <CR>
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
au BufNewFile,BufRead *.ejs set filetype=html
"au BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
au FileType cpp,css,html,javascript,rust,typescript,python RainbowParentheses

"autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <C-n> :NERDTreeToggle<CR>

nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle 

set nospell
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

augroup Binary
  au!
  au BufReadPre  *.jpeg,*.jpg,*.png let &bin=1
  au BufReadPost *.jpeg,*.jpg,*.png if &bin | %!xxd
  au BufReadPost *.jpeg,*.jpg,*.png set ft=xxd | endif
  au BufWritePre *.jpeg,*.jpg,*.png if &bin | %!xxd -r
  au BufWritePre *.jpeg,*.jpg,*.png endif
  au BufWritePost *.jpeg,*.jpg,*.png if &bin | %!xxd
  au BufWritePost *.jpeg,*.jpg,*.png set nomod | endif
augroup END
"source '$HOME/.config/nvim/lua/lsp.lua'
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list=['exact','substring','fuzzy']
let g:nvcode_termcolors=256
syntax on
colorscheme onedark " Or whatever colorscheme you make


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
:lua << EOF
require'lspconfig'.pyright.setup { }
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local on_attach =  require'completion'.on_attach
require'lspconfig'.cssls.setup { 
      capabilities = capabilities,
}
require'lspconfig'.tsserver.setup{
    on_attach = on_attach,
}

require'lspconfig'.clangd.setup{
    on_attach = on_attach,
}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.svelte.setup{}

require'telescope'.setup{ 
  defaults = { 
   layout_config = {
      horizontal = { preview_width = 0.60 }
    },
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    path_display = { 'shorten' },
    winblend = 15,
    set_env = { ['COLORTERM'] = 'truecolor' },
  },
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
}
require("bufferline").setup{
options={
        diagnostics = "nvim_lsp"
    }
}
EOF
