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
	blackbg = '#121212',
	darkgray = '#585858',
	gray = '#BCBCBC',
	white = '#EEEEEE',
	red = '#E04128',
	darkred = '#af0000',
	lightgray = '#303030',
	statusgray = '#8a8a8a',
}

local statements = {
	Normal = { fg = color.gray, bg = color.black },

	Constant = { fg = color.red },
	String = { fg = color.red },
	Character = { fg = color.red },
	Number = { fg = color.red },
	Boolean = { fg = color.red },
	Float = { fg = color.red },

	Identifier = { fg = color.white },
	Function = { fg = color.darkgray },

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

	Underlined = { fg = color.red },
	Error = { fg = color.red },
	ErrorMsg = { fg = color.red },
	Todo = { fg = color.red },
	NonText = { fg = color.darkgray },

	Cursor = { fg = color.darkgray },
	LineNr = { fg = color.darkgray },
	CursorLineNr = { fg = color.red },
	CursorLine = { bg = color.blackbg },
	CursorColumn = { bg = color.blackbg },
	ColorColumn = { bg = color.blackbg },

	Visual = { bg = color.blackbg },
    VisualNOS = { bg = color.blackbg },

	DiffAdd = { fg = color.white },
	DiffChange = { fg = color.red, bg = color.white },
	DiffDelete = { fg = color.darkgray },
	DiffText = { fg = color.gray, bg = color.red },
	diffAdded = { fg = color.white, bg = color.black },
	diffChanged = { fg = color.red, bg = color.white },
	diffCommon = { fg = color.white, bg = color.black },
	diffRemoved = { fg = color.darkgray, bg = color.black},

	Directory = { fg = color.white },

	FoldColumn = { fg = color.gray, bg = color.black },
	Folded = { fg = color.red, bg = color.black },

	Search = { fg = color.statusgray, bg = color.lightgray },
	IncSearch = { fg = color.white, bg = color.red },

	MatchParen = { fg = color.red },

	ModeMsg = { fg = color.gray },
	MoreMsg = { fg = color.gray },
	WarningMsg = { fg = color.red, bg = color.black },

	Pmenu = { fg = color.gray },
	PmenuSel = { fg = color.red },
	WildMenu = { fg = color.red },

	Question = { fg = color.gray },

	SignColumn = { fg = color.red },

	SpecialKey = { fg = color.black, bg = color.white },

	SpellBad = { fg = color.white, bg = color.red },
	SpellCap = { fg = color.white, bg = color.red },
	SpellLocal = { fg = color. white, bg = color.red },
	SpellRare = { fg = color.red, bg = color.black },

	StatusLine = { fg = color.statusgray, bg = color.black },
	StatusLineNC = { fg = color.darkgray, bg = color.black },
	StatusLineTerm = { fg = color.statusgray, bg = color.black },
	StatusLineTermNC = { fg = color.darkgray, bg = color.black },

	Title = { fg = color.gray, bg = color.black },

	VertSplit = { fg = color.gray },
}

local noired = {}

noired.setup = function()
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

return noired
