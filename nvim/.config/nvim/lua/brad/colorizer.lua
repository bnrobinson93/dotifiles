return {
  'NvChad/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    filetypes = { '*', '!vim', '!prompt', '!popup' },
    user_default_options = {
      RRGGBBAA = true,
      AARRGGBB = true,
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      mode = 'background', --- Available modes for `mode`: foreground, background, virtualtext
      tailwind = true,
      sass = { enable = false, parsers = { 'css' } }, -- Enable sass colors
      virtualtext = '■',
      -- update color values even if buffer is not focused
      -- example use: cmp_menu, cmp_docs
      always_update = false,
    },
  },
}
