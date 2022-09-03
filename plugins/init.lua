return {
  ["goolord/alpha-nvim"] = { disable = false },
  ["sainnhe/gruvbox-material"] = {},
  ["savq/melange"] = {},
  ["rebelot/kanagawa.nvim"] = {},
  ["mattn/emmet-vim"] = {},
  ["ggandor/lightspeed.nvim"] = {},
  ["danilamihailov/beacon.nvim"] = {},
  ["folke/zen-mode.nvim"] = {},
  ["max397574/better-escape.nvim"] = { disable = false },
  ["EdenEast/nightfox.nvim"] = {
    config = require "user.plugins.nightfox",
  },
  ["ur4ltz/surround.nvim"] = {
    event = "BufRead",
    config = function()
      require("surround").setup { mappings_style = "surround", map_insert_mode = false }
    end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup {}
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    module = "dap",
    config = require "user.plugins.nvim-dap",
  },
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    config = require "user.plugins.nvim-dapui",
  },
  ["sindrets/winshift.nvim"] = {
    cmd = "WinShift",
    config = require "user.plugins.WinShift",
  },
  ["nvim-telescope/telescope-dap.nvim"] = {
    module = "telescope._extensions.dap",
  },
  ["nvim-telescope/telescope-packer.nvim"] = {
    module = "telescope._extensions.packer",
  },
  ["nvim-treesitter/playground"] = {
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },
  ["jvgrootveld/telescope-zoxide"] = {
    module = "telescope._extensions.zoxide",
  },
}
