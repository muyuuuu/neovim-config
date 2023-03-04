local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- autocompleted
    use {'neoclide/coc.nvim', branch = 'release'}
    -- color scheme
    use("ful1e5/onedark.nvim")
    -- dir tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- tab
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- ariline
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- search file
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- dash board
    use("glepnir/dashboard-nvim")
    -- open recent project
    use("ahmedkhalf/project.nvim")
    -- theme
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- for comment
    use ({ 'numToStr/Comment.nvim'})
    -- for tyerminal
    use({ "akinsho/toggleterm.nvim" })
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
  },
})

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
