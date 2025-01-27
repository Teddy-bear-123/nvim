-- user/lsp/settings/texlab.lua

return {
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-f", "%f" },
        forwardSearchAfter = true,
        onSave = true
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" }
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = true
      }
    }
  }
}

