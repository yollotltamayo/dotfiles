require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules" },
        filesize_hook = function(filepath, bufnr, opts)
            local max_bytes = 10000
            local cmd = { "head", "-c", max_bytes, filepath }
            require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
        end
    }
}
