return {
  'monaqa/dial.nvim',
  event = { 'LazyFile' },
  init = function()
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
  end,
  config = function()
    local augend = require('dial.augend')
    local new_dial = function(elements, word)
      return augend.constant.new({ elements = elements, word = word, cyclic = true })
    end

    -- local species = new_dial({{'human', 'mouse'}, true})

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
    local position3 = new_dial({ 'start', 'end' }, true)
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
        -- species,
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
  end,
}
