return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        visible = true,
        show_hidden_count = true,
      },
    },
  },
  config = function(_,opts)
      require("neo-tree").setup(opts)
    vim.keymap.set('n','<C-n>',':Neotree filesystem reveal left<CR>', {})
  end
}
