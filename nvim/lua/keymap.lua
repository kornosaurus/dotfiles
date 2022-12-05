local M = {}

local set_keymap = vim.api.nvim_set_keymap
local default_opts = { noremap=true, silent=true }

local function map(mode, m, cmd, desc, opts)
    local use_opts = opts or default_opts
    use_opts.desc = desc
    set_keymap(mode, m, cmd, use_opts)
end

function M.nmap(m, cmd, desc, opts)
    map('n', m, cmd, desc, opts)
end
function M.imap(m, cmd, desc, opts)
    map('i', m, cmd, desc, opts)
end
function M.vmap(m, cmd, desc, opts)
    map('v', m, cmd, desc, opts)
end
function M.smap(m, cmd, desc, opts)
    map('s', m, cmd, desc, opts)
end


return M
