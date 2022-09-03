return {
  theme = { bg = "#161616", fg = "#ebdbb2" },
  components = {
    inactive = {
      {
        {
          provider = function()
            if vim.o.filetype == "toggleterm" then
              local display = " Term " .. vim.b.toggle_number .. " "
              return display
            else
              return " " .. vim.o.filetype .. " "
            end
          end,
          hl = { bg = "#161616" },
        },
      },
    },
  },
}
