local augend = require('dial.augend')

local new_dial = function(elements, word)
  return augend.constant.new({ elements = elements, word = word, cyclic = true })
end

local ordinals = augend.constant.new({
  elements = {
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
  },
  word = false,
  cyclic = true,
})

local months = augend.constant.new({
  elements = {
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  },
  word = true,
  cyclic = true,
})

local capitalized_boolean = new_dial({ 'True', 'False' }, true)
local logical_operator = new_dial({ 'and', 'or' }, true)
local logical_alias = new_dial({ '&&', '||' }, false)
local position1 = new_dial({ 'top', 'middle', 'bottom' }, true)
local position2 = new_dial({ 'left', 'center', 'right' }, true)
local position3 = new_dial({ 'start', 'center', 'end' }, true)
local dim1 = new_dial({ 'rows', 'cols' }, true)

local groups = {
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.decimal_int,
    augend.integer.alias.hex,
    augend.date.alias['%Y/%m/%d'],
    augend.constant.alias.en_weekday_full,
    months,
    ordinals,
    augend.constant.alias.bool,
    capitalized_boolean,
    logical_operator,
    logical_alias,
    position1,
    position2,
    position3,
    dim1,
  },
  json = { augend.semver.alias.semver },
  css = {
    augend.hexcolor.new({ case = 'lower' }),
    augend.hexcolor.new({ case = 'upper' }),
  },
  markdown = {
    augend.misc.alias.markdown_header,
    new_dial({ '[ ]', '[x]' }, false),
  },
  r = {
    new_dial({ 'TRUE', 'FALSE' }, false),
    new_dial({ 'row', 'col' }, false),
    new_dial({ 'PHIP', 'PHF6' }, false),
  },
  sh = { new_dial({ '-x', '+x' }, false) },
}

for name, group in pairs(groups) do
  if name ~= 'default' then
    vim.list_extend(group, groups.default)
  end
end

require('dial.config').augends:register_group(groups)

vim.g.dials_by_ft = {
  css = 'css',
  sass = 'css',
  scss = 'css',
  json = 'json',
  markdown = 'markdown',
  quarto = 'markdown',
  r = 'r',
  sh = 'sh',
  zsh = 'sh',
}

---@param increment boolean
---@param g? boolean
local dial = function(increment, g)
  local mode = vim.fn.mode(true)
  local is_visual = mode == 'v' or mode == 'V' or mode == '\22'
  local func = (increment and 'inc' or 'dec') .. (g and '_g' or '_') .. (is_visual and 'visual' or 'normal')
  local group = vim.g.dials_by_ft[vim.bo.filetype] or 'default'
  return require('dial.map')[func](group)
end

-- stylua: ignore
vim.keymap.set({ 'n', 'v' }, '<C-a>', function() return dial(true) end, { expr = true })
vim.keymap.set({ 'n', 'v' }, '<C-x>', function() return dial(false) end, { expr = true })
vim.keymap.set('v', 'g<C-a>', function() return dial(true, true) end, { expr = true })
vim.keymap.set('v', 'g<C-x>', function() return dial(false, true) end, { expr = true })
