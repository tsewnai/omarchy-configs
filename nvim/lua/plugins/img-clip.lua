return {
  "HakonHarnes/img-clip.nvim",
  event = "BufEnter",
  opts = {
    default = {
      embed_image_as_base64 = false,
      prompt_for_file_name = true,
      drag_and_drop = {
        enabled = true,
      },
    },
  },
  keys = {
    { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
  },
}
