local ok,packer = pcall(require,"packer")
if not ok then
    return
end

packer.startup{
    function(use)

        use {
            "wbthomason/packer.nvim"
        }

        use {
	        "folke/tokyonight.nvim"
	    }

        use {
            "nathom/filetype.nvim"
        }

        use {
            "echasnovski/mini.nvim", branch = 'stable'
        }

        use {
            "dstein64/vim-startuptime"
        }

        use {
            "max397574/better-escape.nvim",
            config = function() require("better_escape").setup() end
        }

        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup() end
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup {
                    show_end_of_line = true,
                    space_char_blankline = " ",
                }
            end
        }

        use {
            "numToStr/Comment.nvim",
            config = function() require("Comment").setup() end
        }

        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup{
                    keymaps = {}
                }
            end
        }

        use {
            "rcarriga/nvim-notify",
            config = function()
                require("notify").setup{
                    stages = "fade_in_slide_out",

                    on_open = nil,
                    on_close = nil,

                    render = "default",

                    timeout = 5000,

                    max_width = nil,
                    max_height = nil,

                    background_colour = "Normal",

                    minimum_width = 50,

                    icons = {
                        ERROR = "",
                        WARN = "",
                        INFO = "",
                        DEBUG = "",
                        TRACE = "✎",
                    }
                }
            end
        }

        use {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                local actions = require('telescope.actions')
                require('telescope').setup{
                    defaults = {
                        mappings = {
                            n = {
                                ["q"] = actions.close
                            },
                        },
                    }
                }
            end
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            requires = {
                "nvim-treesitter/playground",
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            run = function() vim.cmd("TSUpdate") end,
            config = function() require("plugins.treesitter") end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function() require("plugins.nvim-tree") end
        }

        use {
           "nvim-lualine/lualine.nvim",
            requires = { 'kyazdani42/nvim-web-devicons',opt = true},
            config = function() require("plugins.lualine") end
        }


        use {
            "akinsho/bufferline.nvim",
            requires = {"kyazdani42/nvim-web-devicons"},
            config = function() require("plugins.bufferline") end,
        }

        use {
           "neovim/nvim-lspconfig",
           config = function() require("plugins.lspconfig") end
        }

        use {
            "williamboman/nvim-lsp-installer"
        }

        use {
            "hrsh7th/nvim-cmp",
            requires = {
               "onsails/lspkind-nvim",
               "hrsh7th/cmp-nvim-lsp",
               "saadparwaiz1/cmp_luasnip",
            },
            config = function()
                require("lspkind").init{
                    mode = 'symbol_text',
                    preset = 'codicons',
                }

                require("plugins.cmp")
            end
        }


        use {
            "jose-elias-alvarez/null-ls.nvim",
            config = function() require("plugins.null-ls") end
        }

        use {
            "L3MON4D3/LuaSnip",
            requires = {
                "rafamadriz/friendly-snippets",
            },

            config = function()
                require("luasnip/loaders/from_vscode").lazy_load()
            end
        }

    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end

        }
    }
}

local function bootstrap()
    local fn = vim.fn
    local packer_install_path =
    fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
    local not_installed = fn.empty(fn.glob(packer_install_path)) == 1

    if not_installed then
        print("`packer.nvim` is not installed, installing...")
        local repo = "https://github.com/wbthomason/packer.nvim"
        vim.cmd(("!git clone %s %s"):format(repo, packer_install_path))
    end

    vim.cmd("packadd packer.nvim")
    require("packer").startup {
        load,
        config = {
            git = {clone_timeout = 240},
        },
    }
    vim.cmd[[
        autocmd BufWritePost */plugins/init.lua source <afile> | PackerCompile
    ]]

    if not_installed then
        vim.cmd("PackerSync")
    end
end

return bootstrap
