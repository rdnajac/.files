return {
  'monaqa/dial.nvim',
  opts = function()
    local augend = require('dial.augend')

    --- @param elements string[]: the list of elements
    --- @param isword boolean: whether to respect word boundaries
    local new_dial = function(elements, isword)
      return augend.constant.new({
        elements = elements,
        word = isword,
        cyclic = true,
      })
    end

    -- Define global dials here
    local logical_alias = new_dial({ '&&', '||' }, false)
    local logical_operator = new_dial({ 'and', 'or' }, true)
    local position1 = new_dial({ 'start', 'end' }, false)
    local position2 = new_dial({ 'top', 'bottom' }, true)
    local position3 = new_dial({ 'left', 'right' }, true)
    local capitalized_boolean = new_dial({ 'True', 'False' }, true)
    local dim1 = new_dial({ 'height', 'width' }, true)

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

    return {
      dials_by_ft = {
        css = 'css',
        sass = 'css',
        scss = 'css',
        json = 'json',
        markdown = 'markdown',
        r = 'r',
        sh = 'sh',
        zsh = 'sh',
      },
      groups = {
        default = {
          augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.decimal_int, -- nonnegative and negative decimal number
          augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias['%Y/%m/%d'], -- date (2022/02/19, etc.)
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
          -- XXX: remove once project is complete
          new_dial({ 'PHIP', 'PHF6' }, false),
        },
        sh = { new_dial({ '-x', '+x' }, false) },
      },
    }
  end,
}
