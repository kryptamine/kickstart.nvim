return {
  {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>rf", function() require("spectre").open() end, desc = "[R]eplace in [F]iles" },
    },
  },
}
