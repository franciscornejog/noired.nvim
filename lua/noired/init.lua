-- init.lua
-- Author: Francisco Cornejo-Garcia (franciscornejog)
-- Return a function to set up the theme

local settings = require('noired.settings')

local M = {}

M.setup = function()
    vim.cmd('highlight clear')
    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = 'noired'
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end
    local namespace = vim.api.nvim_create_namespace('noired')
    local highlight = vim.api.nvim_set_hl
	for name, setting in pairs(settings) do
        highlight(namespace, name, setting)
	end
    local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
    set_namespace(namespace)
end

return M
