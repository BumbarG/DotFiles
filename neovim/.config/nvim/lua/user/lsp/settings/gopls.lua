local util = require 'lspconfig.util'
local retval = {
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    gopls =  {
      experimentalPostfixCompletions = true,
      codelenses = {
          generate = true,
          gc_details = true,
          test = true,
          tidy = true
      },
      diagnosticsDelay = "500ms",
      buildFlags =  {"-tags=mock e2e"},
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      matcher = "fuzzy",
      symbolMatcher = "fuzzy",
      gofumpt = false,
      analyses = {
          nilness = true,
          shadow = true,
          unusedparams = true,
          unusedwrite = true,
      }
    }
  },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.mod"),
  -- root_dir = function(fname)
  --   return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
  -- end,
  docs = {
    description = [[
https://github.com/golang/tools/tree/master/gopls
Google's lsp server for golang.
]],
    default_config = {
      root_dir = [[root_pattern("go.mod", ".git")]],
    },
  },
}

retval.settings.gopls["local"] = "getinge/g3c"

return retval
