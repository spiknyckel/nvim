require('local-highlight').setup({
    hlgroup = 'LocalHighlight',
    cw_hlgroup = nil,
    -- Whether to display highlights in INSERT mode or not
    insert_mode = false,
    min_match_len = 1,
    max_match_len = math.huge,
    highlight_single_match = true,
    animate = {
      enabled = false,
    },
    debounce_timeout = 200,
})
