-- noired.lua
-- Author: Francisco Cornejo-Garcia (franciscornejog)

local function load_highlight(statement)
	for name, setting in pairs(statement) do
		local fg = setting.fg and ' guifg=' .. setting.fg or ' guifg=NONE'
		local bg = setting.bg and ' guibg=' .. setting.bg or ' guibg=NONE'
		local gui = setting.gui and ' gui=' .. setting.gui or ' gui=NONE'
		vim.cmd('highlight ' .. name .. gui .. fg .. bg)
	end
end

local function link_highlight(statement)
    for name, setting in pairs(statement) do
        vim.cmd('highlight! link ' .. name .. ' ' .. setting)
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
	Keyword = { fg = color.white, bg = color.black },
	Constant = { fg = color.gray, bg = color.black },
	String = { fg = color.red, bg = color.black },
	Comment = { gui = 'italic', fg = color.darkgray, bg = color.black },
	Number = { fg = color.red, bg = color.black },
	Error = { fg = color.white, bg = color.red },
	ErrorMsg = { fg = color.white, bg = color.red },
	Search = { fg = color.statusgray, bg = color.lightgray },
	IncSearch = { gui = 'reverse', fg = color.white, bg = color.lightgray },
	DiffChange = { fg = color.red, bg = color.white },
	DiffText = { gui = 'bold', fg = color.gray, bg = color.red },
	SignColumn = { fg = color.red, bg = color.black },
	SpellBad = { gui = 'undercurl', fg = color.white, bg = color.red },
	SpellCap = { fg = color.white, bg = color.red },
	SpellRare = { fg = color.red, bg = color.black },
	WildMenu = { fg = color.darkgray, bg = color.white },
	Pmenu = { fg = color.white, bg = color.darkgray },
	PmenuThumb = { fg = color.black, bg = color.darkgray },
	SpecialKey = { fg = color.black, bg = color.white },
	MatchParen = { fg = color.black, bg = color.darkgray },
	ColorColumn = { bg = color.blackbg },
	CursorColumn = { bg = color.blackbg },
	CursorLine = { bg = color.blackbg },
	StatusLine = { gui = 'bold', fg = color.statusgray, bg = color.black },
	StatusLineNC = { fg = color.darkgray, bg = color.black },
	StatusLineTerm = { gui = 'bold', fg = color.statusgray, bg = color.black },
	StatusLineTermNC = { fg = color.darkgray, bg = color.black },
	Visual = { gui = 'reverse', fg = color.gray, bg = color.black },
	TermCursor = { gui = 'reverse'},
}

local link_statements = {
	Boolean = 'Normal',
	Delimiter = 'Normal',
	Identifier = 'Normal',
	Title = 'Normal',
	Debug = 'Normal',
	Exception = 'Normal',
	FoldColumn = 'Normal',
	Macro = 'Normal',
	ModeMsg = 'Normal',
	MoreMsg = 'Normal',
	Question = 'Normal',
	Conditional = 'Keyword',
	Statement = 'Keyword',
	Operator = 'Keyword',
	Structure = 'Keyword',
	Function = 'Keyword',
	Include = 'Keyword',
	Type = 'Keyword',
	Typedef = 'Keyword',
	Todo = 'Keyword',
	Label = 'Keyword',
	Define = 'Keyword',
	DiffAdd = 'Keyword',
	diffAdded = 'Keyword',
	diffCommon = 'Keyword',
	Directory = 'Keyword',
	PreCondit = 'Keyword',
	PreProc = 'Keyword',
	Repeat = 'Keyword',
	Special = 'Keyword',
	SpecialChar = 'Keyword',
	StorageClass = 'Keyword',
	SpecialComment = 'String',
	CursorLineNr = 'String',
	Character = 'Number',
	Float = 'Number',
	Tag = 'Number',
	Folded = 'Number',
	WarningMsg = 'Number',
	iCursor = 'SpecialKey',
	SpellLocal = 'SpellCap',
	LineNr = 'Comment',
	NonText = 'Comment',
	DiffDelete = 'Comment',
	diffRemoved = 'Comment',
	PmenuSbar = 'Visual',
	PmenuSel = 'Visual',
	VisualNOS = 'Visual',
	VertSplit = 'Visual',
	VertSplit = 'StatusLineNC',
	Cursor = 'StatusLine',
	Underlined = 'SpellRare',
	rstEmphasis = 'SpellRare',
	diffChanged = 'DiffChange',
}

local noired = {}

noired.setup = function()
    vim.cmd 'highlight clear'
    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = 'noired'
    if vim.fn.exists("syntax_on") then
        vim.cmd('syntax reset')
    end
    load_highlight(statements)
    link_highlight(link_statements)
end 

return noired
