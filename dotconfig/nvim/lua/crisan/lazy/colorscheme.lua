return {
  "rose-pine/neovim", 
  name = "rose-pine",
  opts = {
    variant = "moon",  -- choose between "auto", "main", "moon", or "dawn"
    dark_variant = "main", -- choose between "main", "moon", or "dawn"
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
      migrations = true, -- Handle deprecated options automatically
    },

    styles = {
      bold = true,
      italic = true,
      transparency = false,
    },

    groups = {
      border = "muted",
      link = "iris",
      panel = "surface",

      error = "love",
      hint = "iris",
      info = "foam",
      note = "pine",
      todo = "rose",
      warn = "gold",

      git_add = "foam",
      git_change = "rose",
      git_delete = "love",
      git_dirty = "rose",
      git_ignore = "muted",
      git_merge = "iris",
      git_rename = "pine",
      git_stage = "iris",
      git_text = "rose",
      git_untracked = "subtle",

      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "pine",
      h6 = "foam",
    },

    palette = {
      -- Optionally, you can override the built-in palette per variant
      -- Example for "moon" variant:
      -- moon = {
        --   base = '#18191a',
        --   overlay = '#363738',
        -- },
      },

      highlight_groups = {
        -- You can customize highlight groups here:
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Custom logic before setting highlights
        -- Disable all undercurls, for example
        -- if highlight.undercurl then
        --   highlight.undercurl = false
        -- end
        --
        -- You can also modify the palette colors if necessary:
        -- if highlight.fg == palette.pine then
        --   highlight.fg = palette.foam
        -- end
      end,
    },
    config = function()
      -- Manually set the colorscheme after the plugin is loaded
      vim.cmd("colorscheme rose-pine-moon")  -- Or "rose-pine-main" or "rose-pine-dawn"
    end
  }

