-- ~/.config/nvim/lua/plugins/treesitter-updater.lua

return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  config = function()
    local ts_update_path = vim.fn.stdpath("data") .. "/tsupdate-timestamp"
    local update_interval_days = 7

    local function needs_tsupdate()
      local f = io.open(ts_update_path, "r")
      local last = f and tonumber(f:read("*a")) or 0
      if f then f:close() end

      local now = os.time()
      local days = (now - last) / (60 * 60 * 24)

      return days >= update_interval_days
    end

    if needs_tsupdate() then
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("TSUpdate")
          local f = io.open(ts_update_path, "w")
          if f then
            f:write(os.time())
            f:close()
          end
        end,
      })
    end
  end,
}
