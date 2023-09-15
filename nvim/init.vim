:lua vim.g.loaded_netrw = 1
:lua vim.g.loaded_netrwPlugin = 1
call plug#begin('~/.vim/plugged')
    " If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()
set rtp+=/opt/homebrew/opt/fzf
set termguicolors
set fenc=utf-8
set smarttab
set conceallevel=2
set smartindent
set mouse=a
set signcolumn=yes
set expandtab
" set rnu
set showbreak=..

nnoremap <Space><Space> :w<CR>
nnoremap <CR> :noh<CR>
nnoremap <Space>q :q<CR>
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
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
au BufNewFile,BufRead *.ejs set filetype=html
"au BufNewFile,BufRead *.jsx set filetype=javascript
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
"- au FileType cpp,css,html,javascript,rust,typescript,python RainbowParentheses

"autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <C-n> :NvimTreeToggle<CR>

set nospell
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent>ff <cmd>lua vim.lsp.buf.format{ async=true }<CR>

nnoremap <Space>f :lua require'fzf-lua'.files({ cmd ="rg --files" }) <CR>
nnoremap <Space>s :lua require'fzf-lua'.live_grep({ cmd ="rg" }) <CR>
nnoremap <Space>e :lua require'fzf-lua'.lsp_worskapce_diagnostics() <CR>

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

" TSHighlightCapturesUnderCursor <- grupo subrayado

" checks if your terminal has 24-bit color support

:lua << EOF
require('move_cursor')
require('plugins')
require('lualine').setup() 
require('lsp_config') 
require('treesitter_config')
require('tokyonight_config')
--require('catppuccin_config')
--require('gruvbox_config')
require('dashboard_config')
--require('neoscroll_config')
require('telescope_config')
require('fzf_config')
require('mason').setup()
require('luasnip')

--local lsp = require('lsp-zero')
--
--lsp.preset('recommended')
--lsp.setup()
--lsp.on_attach(function(client, bufnr)
--    lsp.default_keymaps({buffer = bufnr})
--end)
require('nvim_tree_config')
require('null_ls_config')
require('gitsigns_config')
require('surround')
require('nvim_cmp_config')

vim.filetype.add({
	extension = {
		mdx = "markdown.mdx",
	},
	filename = {},
	pattern = {},
})
vim.keymap.set('n', ']d', MoveCursorNext)
vim.keymap.set('n', '[d', MoveCursorPrev)
vim.opt.listchars = {
  space = ".",
  --eol = "↲",
  --eol = "_",
  nbsp = "␣",
  trail = "·",
  precedes = "←",
  extends = "→",
  tab = "¬ ",
  conceal = "※",
}
vim.opt.list = true

EOF
function OpenMarkdownPreview (url)
    execute "silent ! open -a Firefox -n --args --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

au TextYankPost * silent! lua vim.highlight.on_yank()

