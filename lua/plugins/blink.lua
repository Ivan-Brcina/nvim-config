return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = 'rafamadriz/friendly-snippets',
  version = '1.*',
  opts = {
    keymap = {
      preset = 'default',
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
  },
}
