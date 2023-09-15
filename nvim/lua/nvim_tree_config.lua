
-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "s", action = "vsplit" },
                { key = "i", action = "split" },
            },
        },
    },
    renderer = {
        group_empty = true,
        icons = {
            glyphs = {
                git = {
                    untracked ="U"
                },
            },
        },
    },
    filters = {
        dotfiles = false,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = false,
                picker = "default",
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "🟨",
            error = "🟥",
        }
    },
})
