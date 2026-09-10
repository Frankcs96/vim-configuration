-- nvim-treesitter, `main` branch.
--
-- `main` is a full rewrite and shares no API with `master`: there is no
-- `nvim-treesitter.configs` module, no `ensure_installed`/`highlight`/`indent`
-- options table, and it does not support lazy-loading. The plugin now only
-- installs parsers and queries -- highlighting, indentation and folding are
-- Neovim's own features, enabled per buffer.
--
-- Building parsers needs the tree-sitter CLI (>= 0.26.1, `tree-sitter-cli` on
-- Arch -- not the npm package) and a C compiler.
local ensure_installed = {
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "query",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
}

-- Carried over from master's `additional_vim_regex_highlighting` and
-- `indent.disable`: Ruby's indent rules need vim's regex engine.
local vim_regex_highlighting = { ruby = true }
local no_treesitter_indent = { ruby = true }

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- `main` does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup()

    local installed = {} ---@type table<string, boolean>
    for _, lang in ipairs(ts.get_installed("parsers")) do
      installed[lang] = true
    end

    local missing = vim.tbl_filter(function(lang)
      return not installed[lang]
    end, ensure_installed)
    if #missing > 0 then
      ts.install(missing)
    end

    -- Enable the features per buffer. Replaces master's highlight/indent
    -- tables.
    local function start(buf, ft, lang)
      if not vim.api.nvim_buf_is_valid(buf) then
        return
      end
      pcall(vim.treesitter.start, buf, lang)
      if not no_treesitter_indent[lang] then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
      if vim_regex_highlighting[lang] then
        vim.bo[buf].syntax = ft
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("fcscode_treesitter", { clear = true }),
      callback = function(ev)
        local ft = ev.match
        local lang = vim.treesitter.language.get_lang(ft) or ft

        if installed[lang] then
          start(ev.buf, ft, lang)
        elseif vim.tbl_contains(ts.get_available(), lang) then
          -- master's `auto_install`: build it in the background, then turn
          -- highlighting on once it lands.
          ts.install(lang):await(function()
            installed[lang] = true
            vim.schedule(function()
              start(ev.buf, ft, lang)
            end)
          end)
        end
      end,
    })
  end,
}
