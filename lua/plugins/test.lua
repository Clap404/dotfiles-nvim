local JEST_CONF_FILES = {
  "jest.config.js",
  "jest.config.ts",
  "jest.config.mjs",
  "jest.config.cjs",
  "jest.config.json",
}

local function findClosestJestConfig(file)
  local jestConfig = vim.fs.find(
    JEST_CONF_FILES,
    { limit = 1, stop = vim.fn.getcwd(), type = "file", path = vim.fs.dirname(file), upward = true }
  )
  if #jestConfig > 0 then
    return jestConfig[1]
  else
    return nil
  end
end

return {
  { "nvim-neotest/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jest_test_discovery = false,
          discovery = {
            enabled = false,
          },
          jestCommand = "npx jest",
          jestConfigFile = findClosestJestConfig,
          cwd = function(file)
            return vim.fs.dirname(findClosestJestConfig(file))
          end,
        },
      },
    },
  },
}
