-- noired.lua
-- Author: Francisco Cornejo-Garcia (franciscornejog)

local highlight = vim.api.nvim_set_hl
local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local namespace = vim.api.nvim_create_namespace('noired')

local function load_highlight(statement)
	for name, setting in pairs(statement) do
        highlight(namespace, name, setting)
	end
end

local color = {
	black = '#000000',
	blackbg = '#323232',
	darkgray = '#585858',
	gray = '#BCBCBC',
	lightgray = '#303030',
    darkred = '#B2260E',
	red = '#E04128',
    orange = '#DA7719',
    green = '#18A873',
    yellow = '#FFCE19',
    blue = '#28C7E0',
    magenta = '#FF0DF1',
    cyan = '#1BFFFC',
	white = '#EEEEEE',
}

local statements = {
	Normal = { fg = color.gray },

	Constant = { fg = color.orange },
    Boolean = { fg = color.orange },
    String = { fg = color.orange },
    Character = { fg = color.orange },
    Number = { fg = color.orange },
    Float = { fg = color.orange },

	Identifier = { fg = color.white },
	Function = { fg = color.red },

	Statement = { fg = color.darkgray },
	Conditional = { fg = color.darkgray },
	Repeat = { fg = color.darkgray },
	Label = { fg = color.darkgray },
	Operator = { fg = color.darkgray },
	Keyword = { fg = color.darkgray },
	Exception = { fg = color.darkgray },
	PreProc = { fg = color.darkgray },
	Include = { fg = color.darkgray },
	Define = { fg = color.darkgray },
	Macro = { fg = color.darkgray },
	PreCondit = { fg = color.darkgray },
	Type = { fg = color.darkgray },
	StorageClass = { fg = color.darkgray },
	Structure = { fg = color.darkgray },
	Typedef = { fg = color.darkgray },
	Special = { fg = color.darkgray },

	SpecialChar = { fg = color.red },
	Tag = { fg = color.red },
	Delimiter = { fg = color.gray },
	Comment = { fg = color.darkgray },
	SpecialComment = { fg = color.white },
	Debug = { fg = color.white },
	MatchParen = { fg = color.red },

	Underlined = { fg = color.red },
	Error = { fg = color.red },
	ErrorMsg = { fg = color.red },
	Todo = { fg = color.red },
	NonText = { fg = color.darkgray },

	Cursor = { fg = color.gray },
	LineNr = { fg = color.darkgray },
	CursorLineNr = { fg = color.red },
	CursorLine = { bg = color.blackbg },
	CursorColumn = { bg = color.blackbg },
	ColorColumn = { bg = color.blackbg },

	Folded = { fg = color.red },
    FoldColumn = { bg = color.blackbg },

	Visual = { bg = color.blackbg },
    VisualNOS = { bg = color.blackbg },
    VertSplit = { bg = color.black },

	Directory = { fg = color.white },

	Search = { fg = color.gray, bg = color.lightgray },
	IncSearch = { fg = color.white, bg = color.red },

	ModeMsg = { fg = color.gray },
	MoreMsg = { fg = color.gray },
	WarningMsg = { fg = color.red },
	Pmenu = { fg = color.gray },
	PmenuSel = { fg = color.red },
	WildMenu = { fg = color.red },
	Question = { fg = color.red },

	StatusLine = { fg = color.white },
	StatusLineNC = { fg = color.darkgray },

	SpecialKey = { fg = color.blue },
	SpellBad = { fg = color.blue },
	SpellCap = { fg = color.blue },
	SpellLocal = { fg = color.blue },
	SpellRare = { fg = color.blue },

    helpHyperTextEntry = { fg = color.red },

    SignColumn = { bg = color.black },
    DiffText = { bg = color.blackbg },
 	DiffAdd = { fg = color.green },
 	DiffChange = { fg = color.orange },
 	DiffDelete = { fg = color.red },

    -- fugitive
    diffLine = { fg = color.darkgray },
    diffAdded = { fg = color.green },
    diffRemoved = { fg = color.red },
}

local M = {}

M.setup = function()
    vim.cmd 'highlight clear'
    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = 'noired'
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end
    load_highlight(statements)
    set_namespace(namespace)
end 

return M
