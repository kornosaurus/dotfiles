function Statusline()
    local branch = vim.fn.FugitiveHead()
    if branch and #branch > 0 then
        branch = " 󰘬  " .. branch
    end

    return branch .. " %t%m%=%l/%L "
end

vim.cmd [[ set statusline=%!luaeval('Statusline()') ]]
