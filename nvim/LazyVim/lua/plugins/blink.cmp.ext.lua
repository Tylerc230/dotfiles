return {
  "saghen/blink.cmp",
  opts = {
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = false,
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { window = { border = "single" } },
      menu = {
        auto_show = false,
        border = "single",
      },
      ghost_text = {
        enabled = false,
      },
    },

    -- experimental signature help support
    -- signature = { enabled = true },

    keymap = {
      ["<Right>"] = {
        function(cmp)
          cmp.show()
        end,
      },
      preset = "enter",
    },
  },
}
