---@type vim.lsp.Config
---
return {
    cmd = { 'harper-ls', '--stdio' },
    filetypes = {
        'asciidoc',
        'c',
        'cpp',
        'cs',
        'gitcommit',
        'go',
        'html',
        'java',
        'javascript',
        'javascriptreact',
        'lua',
        'markdown',
        'nix',
        'python',
        'ruby',
        'rust',
        'swift',
        'tex',
        'toml',
        'typescript',
        'typescriptreact',
        'haskell',
        'cmake',
        'typst',
        'php',
        'dart',
        'clojure',
        'sh',
        'text', -- plain text / .txt
        'mail', -- emails
        'org',  -- org-mode
    },
    root_markers = { '.harper-dictionary.txt', '.git' },
    settings = {
        ['harper-ls'] = {
            userDictPath = '~/.config/harper-ls/dictionary.txt',
            diagnosticSeverity = 'hint',
            dialect = 'British',
            isolateEnglish = false,
            linters = {
                SpellCheck = true,
                AnA = true,
                SentenceCapitalization = true,
                UnclosedQuotes = true,
                RepeatedWords = true,
                LongSentences = true,
                CorrectNumberSuffix = true,
                SpelledNumbers = true,
                WrongApostrophe = true,
            },
        }
    },
}
