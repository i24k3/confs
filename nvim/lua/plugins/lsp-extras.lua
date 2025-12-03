return {
  -- 🧠 Autopopup completion after dot (.)
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
        keyword_length = 1,           -- trigger earlier
        autocomplete = { ".", ":" }, -- auto trigger after dot or colon
      })
    end,
  },
}

