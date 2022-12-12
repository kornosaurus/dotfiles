local nmap = require("keymap").nmap
require("nnn").setup()

nmap('<leader>e', ':NnnPicker %:p:h<CR>')
