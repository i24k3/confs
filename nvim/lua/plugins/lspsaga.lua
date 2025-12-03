-- Packer
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        winblend = 11,
      },
    })
  end,
}

