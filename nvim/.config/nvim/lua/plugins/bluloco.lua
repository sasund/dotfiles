return {
  -- add bluloco colorscheme
  {
    "uloco/bluloco.nvim",
    lazy = true,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
  },

  -- Configure LazyVim to load bluloco-dark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bluloco-dark",
    },
  },
}

