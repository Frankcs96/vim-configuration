return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local function get_splash()
      local user = os.getenv("USER")
      local path = string.format("/Users/%s/.config/nvim/assets/splashes.txt", user)
      local file = io.open(path, "r")
      local size = 0
      local arr = {}
      math.randomseed(os.time())

      if file then
        for line in file:lines() do
          size = size + 1
          table.insert(arr, line)
        end
      end
      local random = math.random(1, size)

      io.close(file)
      return arr[random]
    end

    local splash = get_splash()

    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[                                                 ]],
      [[                                                 ]],
      [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
      [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
      [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
      [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      [[                                                  ]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    dashboard.section.footer.val = splash

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.header.opts.position = "center"

    dashboard.opts.opts.noautocmd = true
    require("alpha").setup(dashboard.opts)
  end,
}
