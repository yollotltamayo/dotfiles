function MoveCursorNext()
    --local errors = vim.diagnostic.get(0, { severity = {min = vim.diagnostic.severity.ERROR } } )
    local errors = vim.diagnostic.get(0, {severity  = vim.diagnostic.severity.ERROR } )

    if next(errors) ~= nil then
        vim.diagnostic.goto_next({severity  = vim.diagnostic.severity.ERROR } )
    else
        local warns = vim.diagnostic.get(0, {severity  = vim.diagnostic.severity.WARN } )
        if next(warns) ~= nil then
            vim.diagnostic.goto_next({severity  = vim.diagnostic.severity.WARN } )
        else
            vim.diagnostic.goto_next()
        end
    end

    --print(vim.inspect(errors))
end 
function MoveCursorPrev()
    --local errors = vim.diagnostic.get(0, { severity = {min = vim.diagnostic.severity.ERROR } } )
    local errors = vim.diagnostic.get(0, {severity  = vim.diagnostic.severity.ERROR } )

    if next(errors) ~= nil then
        vim.diagnostic.goto_prev({severity  = vim.diagnostic.severity.ERROR } )
    else
        local warns = vim.diagnostic.get(0, {severity  = vim.diagnostic.severity.WARN } )
        if next(warns) ~= nil then
            vim.diagnostic.goto_prev({severity  = vim.diagnostic.severity.WARN } )
        else
            vim.diagnostic.goto_prev()
        end
    end

    --print(vim.inspect(errors))
end 
