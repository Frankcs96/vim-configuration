local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    always_show_bufferline = true,
    separator_style = "thick",
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
      },
    },
  },
})
