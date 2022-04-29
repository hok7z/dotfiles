require("mini.comment").setup{
     mappings = {
        -- Normal and Visual modes
        comment = 'gc',
        -- Toggle comment on current line
        comment_line = 'gcc',
        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = 'gc',
    },
    hooks = {
        -- Before successful commenting. Does nothing by default.
        pre = function() end,
        -- After successful commenting. Does nothing by default.
        post = function() end,
    },
}

require("mini.pairs").setup{
    modes = { insert = true, command = false, terminal = false },
    mappings = {
        ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

        [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
    },
}

require("mini.indentscope").setup{
    draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 100,
        -- Animation rule for scope's first drawing.
        --animation = --<function: implements constant 20ms between steps>,
    },

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        -- Textobjects
        object_scope = 'ii',
        object_scope_with_border = 'ai',

        -- Motions (jump to respective border line; if not present - body line)
        goto_top = '[i',
        goto_bottom = ']i',
    },

    options = {
        -- Type of scope's border: which line(s) with smaller indent to
        -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
        border = 'both',

        -- Whether to use cursor column when computing reference indent. Useful to
        -- see incremental scopes with horizontal cursor movements.
        indent_at_cursor = true,

        -- Whether to first check input line to be a border of adjacent scope.
        -- Use it if you want to place cursor on function header to get scope of
        -- its body.
        try_as_border = false,
    },

    -- Which character to use for drawing scope indicator
    symbol = '╎',
}

require("mini.cursorword").setup{
    delay = 100,
}

require("mini.surround").setup{
    -- Number of lines within which surrounding is searched
    n_lines = 20,

    -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
    highlight_duration = 500,

    -- Pattern to match function name in 'function call' surrounding
    -- By default it is a string of letters, '_' or '.'
    funname_pattern = '[%w_%.]+',

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
        add = 'sa', -- Add surrounding
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`
    },
}
