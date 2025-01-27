local status_ok, vimtex = pcall(require, "vimtex")
if not status_ok then
  return
end

vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_compiler_latexmk = {
  build_dir = '',
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  options = {
    '-pdf',
    '-shell-escape',
    '-output-directory={output-directory} {sourcefile.tex}',
  }
}


vim.g.vimtex_quickfix_mode = 0

-- Autocommand for auto-compilation
vim.cmd([[
  augroup vimtex_auto_compile
    autocmd!
    autocmd FileType tex VimtexCompile
    autocmd BufWritePost *.tex VimtexCompile
  augroup END
]])


vim.g.vimtex_callback = function(status)
  if status.status == 0 then
    require('notify')('Compilation successful', 'info', { title = 'Vimtex' })
  else
    require('notify')('Compilation failed', 'error', { title = 'Vimtex' })
  end
end

