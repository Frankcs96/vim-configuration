## Vim Configuration ⚙️

![Conventional commits](https://github.com/Frankcs96/vim-configuration/actions/workflows/conventional-commits.yaml/badge.svg)
![Stylua formatter](https://github.com/Frankcs96/vim-configuration/actions/workflows/stylua.yaml/badge.svg)

This repo contains my neovim configuration. Feel free to use it or to add a PR for improvements.

Everything is written in LUA 🌘

![my neovim conf](neovim_screenshot.png)


## TODOS 📝

- Replace nvim-lsp-installer with [Mason.nvim](https://github.com/williamboman/mason.nvim) since lsp-installer will be deprecated.

- Use [SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) so you don't have to add json schemas manually.
 
- Refactor alpha.lua line 7, right now I'm using a hardcoded username so in the future if I use another one it will create errors (I always forget about this when using a new machine).

