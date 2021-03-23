function Statusline()
    local branch = vim.fn.FugitiveHead()
    if branch and #branch > 0 then
        branch = "󰘬  " .. branch
    end

    return " %f%m " .. branch .. "%=%l/%L "
end

vim.cmd [[ set statusline=%!luaeval('Statusline()') ]]
