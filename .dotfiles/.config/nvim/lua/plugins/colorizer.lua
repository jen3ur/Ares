-- ~/.config/nvim/lua/plugins/colorizer.lua
return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "*", -- highlight all filetypes
    }, {
      RGB = true, -- #RGB
      RRGGBB = true, -- #RRGGBB
      names = true, -- color names like “Blue”
      css = true, -- enable all CSS highlights
      css_fn = true, -- enable rgb()/hsl() functions too
    })
  end,
}
