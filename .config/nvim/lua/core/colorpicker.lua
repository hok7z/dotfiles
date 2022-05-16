local actions = require"telescope.actions"
local action_state = require"telescope.actions.state"
local pickers = require"telescope.pickers"
local finders = require"telescope.finders"
local sorters = require"telescope.sorters"

local function enter(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    local cmd = 'colorscheme ' .. selected[1]
    vim.cmd(cmd)
    actions.close(prompt_bufnr)
 end

local window = {
    layout_strategies = "vertical",
    layout_config = {
        height = 10,
        width = 0.3,
        prompt_position = "top"
    },

    attach_mappings = function(prompt_bufnr,map)
         map("i","<CR>",enter)
         return true
    end,

    sorting_strategy = "ascending"
}

local options = {
    finder = finders.new_table({"tokyonight","onedark"}),
    sorter = sorters.get_generic_fuzzy_sorter({})
}

pickers.new(window,options):find()
