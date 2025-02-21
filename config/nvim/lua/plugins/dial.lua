return {
  'monaqa/dial.nvim',
  keys = function()
    local dial = function(increment, g)
      local mode = vim.fn.mode(true)
      -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
      local is_visual = mode == 'v' or mode == 'V' or mode == '\22'
      local func = (increment and 'inc' or 'dec') .. (g and '_g' or '_') .. (is_visual and 'visual' or 'normal')
      local group = vim.g.dials_by_ft[vim.bo.filetype] or 'default'
      return require('dial.map')[func](group)
    end
    -- stylua: ignore
    return {
      { '<C-a>', function() return dial(true) end, expr = true, desc = 'Increment', mode = { 'n', 'v' }, },
      { '<C-x>', function() return dial(false) end, expr = true, desc = 'Decrement', mode = { 'n', 'v' }, },
      { 'g<C-a>', function() return dial(true, true) end, expr = true, desc = 'Increment', mode = { 'n', 'v' }, },
      { 'g<C-x>', function() return dial(false, true) end, expr = true, desc = 'Decrement', mode = { 'n', 'v' }, },
    }
  end,
  opts = function()
    local augend = require('dial.augend')
    local new_dial = function(elements, isword)
      return augend.constant.new({
        elements = elements,
        word = isword,
        cyclic = true,
      })
    end

    local logical_alias = new_dial({ '&&', '||' }, false)
    local logical_operator = new_dial({ 'and', 'or' }, true)
    local position1 = new_dial({ 'start', 'end' }, false)
    local position2 = new_dial({ 'top', 'bottom' }, true)
    local position3 = new_dial({ 'left', 'right' }, true)
    local capitalized_boolean = new_dial({ 'True', 'False' }, true)
    local dim1 = new_dial({ 'height', 'width' }, true)

    local ordinal_numbers = augend.constant.new({
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

    local weekdays = augend.constant.new({
      elements = {
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      },
      word = true,
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

    return {
      dials_by_ft = {
        css = 'css',
        sass = 'css',
        scss = 'css',
        json = 'json',
        markdown = 'markdown',
        r = 'r',
      },
      groups = {
        default = {
          augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.decimal_int, -- nonnegative and negative decimal number
          augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias['%Y/%m/%d'], -- date (2022/02/19, etc.)
          weekdays,
          months,
          ordinal_numbers,
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
        },
      },
    }
  end,
  config = function(_, opts)
    -- copy defaults to each group
    for name, group in pairs(opts.groups) do
      if name ~= 'default' then
        vim.list_extend(group, opts.groups.default)
      end
    end
    require('dial.config').augends:register_group(opts.groups)
    vim.g.dials_by_ft = opts.dials_by_ft
  end,
}
