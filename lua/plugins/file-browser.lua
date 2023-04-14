return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>sF",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      desc = "Browse FIles",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
