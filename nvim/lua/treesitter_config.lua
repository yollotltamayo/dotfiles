return require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "typescript", "javascript", "c", "lua", "rust", "python" },
    sync_install = false,
    auto_install = true,
    playground = { enable = true },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
