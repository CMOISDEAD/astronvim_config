local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme
  colorscheme = "solarized",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      cursorcolumn = true,
      relativenumber = true, -- sets vim.opt.relativenumber
      spelllang = "es",
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      user_emmet_leader_key = "<C-z>", -- sets ctrl-z emmet handler
      gruvbox_material_background = "hard",
      gruvbox_material_enable_bold = 1,
      gruvbox_material_enable_italic = 1,
      -- vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } },
      -- vimwiki_folding = 'list',
    },
  },

  -- Set dashboard header
  header =  {
    [[         ___ . .  _                                                                                              ]],
    [["T$$$P"   |  |_| |_                                                                                              ]],
    [[ :$$$     |  | | |_                                                                                              ]],
    [[ :$$$                                                      "T$$$$$$$b.                                           ]],
    [[ :$$$     .g$$$$$p.   T$$$$b.    T$$$$$bp.                   BUG    "Tb      T$b      T$P   .g$P^^T$$  ,gP^^T$$  ]],
    [[  $$$    d^"     "^b   $$  "Tb    $$    "Tb    .s^s. :sssp   $$$     :$; T$$P $^b.     $   dP"     `T :$P    `T  ]],
    [[  :$$   dP         Tb  $$   :$;   $$      Tb  d'   `b $      $$$     :$;  $$  $ `Tp    $  d$           Tbp.      ]],
    [[  :$$  :$;         :$; $$   :$;   $$      :$; T.   .P $^^    $$$    .dP   $$  $   ^b.  $ :$;            "T$$p.   ]],
    [[  $$$  :$;         :$; $$...dP    $$      :$;  `^s^' .$.     $$$...dP"    $$  $    `Tp $ :$;     "T$$      "T$b  ]],
    [[  $$$   Tb.       ,dP  $$"""Tb    $$      dP ""$""$" "$"$^^  $$$""T$b     $$  $      ^b$  T$       T$ ;      $$; ]],
    [[  $$$    Tp._   _,gP   $$   `Tb.  $$    ,dP    $  $...$ $..  $$$   T$b    :$  $       `$   Tb.     :$ T.    ,dP  ]],
    [[  $$$;    "^$$$$$^"   d$$     `T.d$$$$$P^"     $  $"""$ $"", $$$    T$b  d$$bd$b      d$b   "^TbsssP" 'T$bgd$P   ]],
    [[  $$$b.____.dP                                 $ .$. .$.$ss,d$$$b.   T$b.                                        ]],
    [[.d$$$$$$$$$$P                                                         `T$b. ]],
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = true,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = true,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = true,
      ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- 
      -- colorschemes
      -- { "ellisonleao/gruvbox.nvim" },
      { "sainnhe/gruvbox-material" },
      { "kyazdani42/blue-moon" },
      { "savq/melange" },
      { "sainnhe/everforest" },
      { "ishan9299/nvim-solarized-lua" },
      { "rebelot/kanagawa.nvim" },
      -- { "yamatsum/nvim-nonicons" },
      { "mattn/emmet-vim" },
      { "tpope/vim-surround" },
      { "ThePrimeagen/harpoon" },
      { "ggandor/lightspeed.nvim" },
      { "danilamihailov/beacon.nvim" },
      { "folke/zen-mode.nvim" },
      { "shaunsingh/oxocarbon.nvim", run = "./install.sh" },
      { "michaelb/sniprun", run = "bash ./install.sh",
        config = function ()
          require("sniprun").setup({
            display = {
              "NvimNotify",
            },
          })
        end,
      },
      { "mfussenegger/nvim-dap" },
      -- { "vimwiki/vimwiki" },
      { "nvim-neorg/neorg",
        config = function ()
          require("neorg").setup({
            load = {
              ["core.defaults"] = {},
              ["core.gtd.base"] = {
                config = {
                  workspace = "task",
                }
              },
              ["core.norg.dirman"] = {
                config = {
                  workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                    task = "~/notes/task",
                  }
                }
              },
              ["core.norg.completion"] = {
                config = {
                  engine = "nvim-cmp",
                }
              },
              ["core.norg.concealer"] = {},
              ["core.presenter"] = {
                config = {
                  zen_mode = "zen-mode",
                }
              },
            }
          })
        end,
    },
    { "NTBBloodbath/rest.nvim",
      config = function ()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Keep the http file buffer above|left when split horizontal|vertical
          result_split_in_place = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = false,
          -- Highlight request on run
          highlight = {
            enabled = true,
            timeout = 150,
          },
          result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            show_http_info = true,
            show_headers = true,
          },
          -- Jump to request line on run
          jump_to_request = false,
          env_file = '.env',
          custom_dynamic_variables = {},
          yank_dry_run = true,
        })
      end
    },
    {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end
    },
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.autopep8,
        -- formatter for java
        -- null_ls.builtins.formatting.google_java_format,
        -- Set a linter
        -- null_ls.builtins.diagnostics.eslint,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = { "lua" },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
    dashboard = {
      custom_footer = { "A wizard is never late, Camilo. Nor is he early; he arrives precisely when he means to." },
      preview_command = "cat | lolcat -F 0.3",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {
      "./lua/user/snippets",
    },
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
          -- Harpoon config
          ["H"] = {
            ["a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon file"},
            ["f"] = { "<cmd>Telescope harpoon marks<cr>", "Show Harpoons"},
            ["n"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Harpoon"},
            ["b"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Prev Harpoon"},
            name = "Harpoon",
          },
          ["r"] = {
            ["r"] = {"<Plug>RestNvim", "Request" },
            ["p"] = {"<Plug>RestNvimPreview", "Preview Request" },
            ["l"] = {"<Plug>RestNvimLast", "Re-run last request" },
            name = "Rest-http",
          },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      volar = {
        on_attach = function(client)
          client.resolved_capabilities.document_formatting = false
          client.resolved_capabilities.document_range_formatting = false
        end,
      },
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- This function is run last
  -- good place to configuring augroups/autocommands and custom filetypes
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
