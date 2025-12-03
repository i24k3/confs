-- import lazy vim
require("config.lazy")

vim.opt.relativenumber = true  -- Show relative line numbers on other lines
vim.opt.number = true  

-- Indentation
vim.opt.tabstop = 4            -- Number of spaces tabs count for
vim.opt.shiftwidth = 4         -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.smartindent = true     -- Smart autoindenting

-- Search
vim.opt.ignorecase = true      -- Case-insensitive search...
vim.opt.smartcase = true       -- ...unless uppercase is used

-- UI
vim.o.colorcolumn = "80"
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.signcolumn = "yes"     -- Always show the sign column
vim.opt.wrap = false -- Don't wrap long lines

-- Splits
vim.opt.splitbelow = true      -- Horizontal splits below
vim.opt.splitright = true      -- Vertical splits to the right

-- Clipboard
-- vim.opt.clipboard = "unnamedplus"  -- Use system clipboard

-- left gutter length
vim.opt.numberwidth = 2  -- Default is 4, you can try 2 or 3
vim.opt.signcolumn = "yes:1"  -- Only reserve space for 1 sign
vim.opt.foldcolumn = "0"


-- keymaps
vim.keymap.set("n", ";", ":", { noremap = true })    -- ; to enter command mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>y", '"+yy', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- Helper to map keys
local opts = { noremap = true, silent = true }

-- Ctrl + t -> :tabnew
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', opts)

-- Ctrl + Tab -> :tabnext
vim.api.nvim_set_keymap('n', '<C-n>', ':tabnext<CR>', opts)
-- next, prev buffer
vim.api.nvim_set_keymap('n', '<leader>n', ':bn<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>b', ':bp<CR>', opts)




-- Markdown TODO superpowers – works only in .md files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- gd on #homepage  → jumps to the section with {#homepage}
    vim.keymap.set("n", "gd", function()
      local cword = vim.fn.expand("<cword>")        -- word under cursor
      local id = cword:gsub("^#", "")                -- strip leading # if exists
      if id ~= "" then
        vim.cmd("silent! /{#" .. vim.pesc(id) .. "}")
        vim.cmd("noh")
        vim.cmd("normal! zz")                        -- center the screen
      end
    end, { buffer = true, desc = "Jump to markdown {#id}" })

    -- gf works on the whole [#homepage] link too
    vim.keymap.set("n", "gf", function()
      local cWORD = vim.fn.expand("<cWORD>")        -- includes [#...]
      local id = cWORD:match("#([%w%-]+)")
      if id then
        vim.cmd("silent! /{#" .. vim.pesc(id) .. "}")
        vim.cmd("noh")
        vim.cmd("normal! zz")
      end
    end, { buffer = true, desc = "Jump from [#id] link" })

    -- Optional: just press Enter on any #id to jump (pure bliss)
    vim.keymap.set("n", "<CR>", "gd", { buffer = true })
  end,
})
