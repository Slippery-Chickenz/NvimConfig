
-- 		transparency = true,
-- 		cursorline = true,
-- 		colors = {
-- 			dark = {
-- 				bg = "#222222",
-- 				fg = "#BBBBBB",
-- 			}
-- 		}
-- 	},
--
local highlight = function(group, bg, fg, attr)
    fg = fg and 'guifg=' .. fg or ''
    bg = bg and 'guibg=' .. bg or ''
    attr = attr and 'gui=' .. attr or ''

    vim.api.nvim_command('highlight ' .. group .. ' '.. fg .. ' ' .. bg .. ' '.. attr)
end

local link = function(target, group)
    vim.api.nvim_command('highlight! link ' .. target .. ' '.. group)
end

local Color1 = '#50505a'
local purple = '#A95EFF'
local Color9 = '#FF478D'
local Color10 = '#FF7135'
local Color13 = '#c5c5cb'
local Color2 = '#D62C2C'
local Color5 = '#5a5a5f'
local Color0 = '#b7d175'
local Color14 = '#162a20'
local Color15 = '#291417'
local Color12 = '#5f5f65'
local Color3 = '#28A9FF'
local Color4 = '#FFB638'
local bgColor = '#181818'
local Color7 = '#42DD76'
local Color6 = '#14E5D4'
local Color18 = '#0f0f11'
local Color16 = '#414143'
local Color17 = '#373741'

highlight('Statement', nil, Color6, nil)
highlight('@variable', nil, Color9, nil)
highlight('@lsp.typemod.parameter.declaration', nil, purple, nil)
highlight('@lsp.type.property', nil, Color10, nil)
highlight('@variable.member', nil, Color10, nil)
highlight('@keyword.operator', nil, Color10, nil)
highlight('@keyword.conditional', nil, Color10, nil)
highlight('@operator', nil, Color10, nil)
highlight('@punctuation.bracket', nil, Color4, nil)
highlight('@constant', nil, Color9, nil)
highlight('@constant.builtin', nil, Color2, nil)
highlight('NvimTreeRootFolder', nil, purple, nil)
highlight('NvimTreeFolderName', nil, Color3, nil)
highlight('Type', nil, Color0, nil)
highlight('Comment', nil, Color1, 'italic')
highlight('Constant', nil, Color2, nil)
highlight('Function', nil, Color3, nil)
highlight('Conditional', nil, Color4, nil)
highlight('Conditional', nil, Color4, nil)
highlight('Repeat', nil, Color4, nil)
highlight('Operator', nil, Color5, nil)
highlight('Type', nil, Color6, nil)
highlight('String', nil, Color7, nil)
highlight('Type', nil, purple, nil)
highlight('Identifier', nil, Color9, nil)
highlight('Number', nil, Color10, nil)
highlight('StatusLine', Color12, bgColor, nil)
highlight('WildMenu', bgColor, Color13, nil)
highlight('Pmenu', bgColor, Color13, nil)
highlight('PmenuSel', Color13, bgColor, nil)
highlight('PmenuThumb', bgColor, Color13, nil)
highlight('DiffAdd', Color14, nil, nil)
highlight('DiffDelete', Color15, nil, nil)
highlight('Normal', bgColor, Color13, nil)
highlight('Visual', Color16, nil, nil)
highlight('CursorLine', Color16, nil, nil)
highlight('ColorColumn', Color16, nil, nil)
highlight('SignColumn', bgColor, nil, nil)
highlight('LineNr', nil, Color17, nil)
highlight('LineNrBelow', nil, Color17, nil)
highlight('LineNrAbove', nil, Color17, nil)
highlight('TabLine', Color18, Color1, nil)
highlight('TabLineSel', Color13, bgColor, nil)
highlight('TabLineFill', Color18, Color1, nil)
highlight('TSPunctDelimiter', nil, Color13, nil)

link('@function.builtin', 'Function')
link('TSPunctBracket', 'MyTag')
link('TSRepeat', 'Repeat')
link('Whitespace', 'Comment')
link('Folded', 'Comment')
link('TSFuncMacro', 'Macro')
link('TSTag', 'MyTag')
link('TSProperty', 'TSField')
link('TSParameterReference', 'TSParameter')
link('Repeat', 'Conditional')
link('TSPunctSpecial', 'TSPunctDelimiter')
link('TSTagDelimiter', 'Type')
link('TSParameter', 'Constant')
link('TSKeyword', 'Keyword')
link('TSConditional', 'Conditional')
link('TSLabel', 'Type')
link('TSString', 'String')
link('TSComment', 'Comment')
link('TSOperator', 'Operator')
link('TelescopeNormal', 'Normal')
link('TSFunction', 'Function')
link('TSField', 'Constant')
link('TSType', 'Type')
link('TSConstBuiltin', 'TSVariableBuiltin')
link('TSFloat', 'Number')
link('Operator', 'Keyword')
link('TSConstant', 'Constant')
link('CursorLineNr', 'Identifier')
link('TSNumber', 'Number')
link('NonText', 'Comment')
link('Macro', 'Function')
link('Conditional', 'Operator')
link('TSNamespace', 'TSType')
