require"fzf-lua".setup({ 
    fzf_bin = "/opt/homebrew/bin/fzf",
    winopts = { 
        preview = {
            default="bat"
        }
    }
})

--require'fzf-lua'.files({ cmd ="rg --files" })
