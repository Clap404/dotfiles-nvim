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
  --{ "nvim-neotest/neotest-jest" },
  { "dlvandenberg/neotest-jest", branch = "feat-call-expressions-in-testcase" },
  { "thenbe/neotest-playwright" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestConfigFile = findClosestJestConfig,
          cwd = function(file)
            return vim.fs.dirname(findClosestJestConfig(file))
          end,
        },
        ["neotest-playwright"] = {
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
          experimental = {
            telescope = {
              enabled = true,
            },
          },
        },
      },
    },
  },
}
