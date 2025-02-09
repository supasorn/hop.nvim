-- This module contains everything for highlighting Hop.
local M = {}

-- Insert the highlights that Hop uses.
function M.insert_highlights()
  -- Highlight used for the mono-sequence keys (i.e. sequence of 1).
  vim.api.nvim_command('highlight default HopNextKey  guifg=#ff0000 gui=bold cterm=bold')

  -- Highlight used for the first key in a sequence.
  vim.api.nvim_command('highlight default HopNextKey1 guifg=#ffb400 gui=bold cterm=bold')

  -- Highlight used for the second and remaining keys in a sequence.
  vim.api.nvim_command('highlight default HopNextKey2 guifg=#b98300')

  -- Highlight used for the unmatched part of the buffer.
  -- ctermbg=bg is omitted because it errors if Normal does not have ctermbg set
  -- Luckily guibg=bg does not seem to error even if Normal does not have guibg set so it can be used
  vim.api.nvim_command('highlight default HopUnmatched guifg=#666666 guibg=bg guisp=#666666 ctermfg=242')

  -- Highlight used for the fake cursor visible when hopping.
  vim.api.nvim_command('highlight default link HopCursor Cursor')

  -- Highlight used for preview pattern
  vim.api.nvim_command('highlight default HopPreview  guifg=#b8bb26 gui=bold ctermfg=142 cterm=bold')
end

function M.create_autocmd()
  vim.api.nvim_command('augroup HopInitHighlight')
  vim.api.nvim_command('autocmd!')
  vim.api.nvim_command("autocmd ColorScheme * lua require'hop.highlight'.insert_highlights()")
  vim.api.nvim_command('augroup end')
end

return M
