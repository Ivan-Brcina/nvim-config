 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#131411',
    base01 = '#1f201d',
    base02 = '#2a2a27',
    base03 = '#8f9287',
    base04 = '#c6c8bb',
    base05 = '#e4e2dd',
    base06 = '#e4e2dd',
    base07 = '#e4e2dd',
    base08 = '#ffb4ab',
    base09 = '#a7cfbf',
    base0A = '#c3c9b4',
    base0B = '#bccca1',
    base0C = '#a7cfbf',
    base0D = '#bccca1',
    base0E = '#c3c9b4',
    base0F = '#dfe5cf',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e4e2dd',          bg = '#131411' })
  hi('TelescopeBorder',         { fg = '#8f9287',             bg = '#131411' })
  hi('TelescopePromptNormal',   { fg = '#e4e2dd',          bg = '#131411' })
  hi('TelescopePromptBorder',   { fg = '#8f9287',             bg = '#131411' })
  hi('TelescopePromptPrefix',   { fg = '#bccca1',             bg = '#131411' })
  hi('TelescopePromptCounter',  { fg = '#c6c8bb',  bg = '#131411' })
  hi('TelescopePromptTitle',    { fg = '#131411',             bg = '#bccca1' })
  hi('TelescopePreviewTitle',   { fg = '#131411',             bg = '#c3c9b4' })
  hi('TelescopeResultsTitle',   { fg = '#131411',             bg = '#a7cfbf' })
  hi('TelescopeSelection',      { fg = '#e4e2dd',          bg = '#2a2a27' })
  hi('TelescopeSelectionCaret', { fg = '#bccca1',             bg = '#2a2a27' })
  hi('TelescopeMatching',       { fg = '#bccca1',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e4e2dd',          bg = '#131411' })
  hi('MiniPickBorder',         { fg = '#8f9287',             bg = '#131411' })
  hi('MiniPickPrompt',   { fg = '#e4e2dd',          bg = '#131411' })
  hi('MiniPickPromptPrefix',   { fg = '#bccca1',             bg = '#131411' })
  hi('MiniPickBorderText',    { fg = '#131411',             bg = '#bccca1' })
  hi('MiniPickMatchCurrent',      { fg = '#e4e2dd',          bg = '#2a2a27' })
  hi('MiniPickPromptCaret', { fg = '#bccca1',             bg = '#2a2a27' })
  hi('MiniPickMatchRanges',       { fg = '#bccca1',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
