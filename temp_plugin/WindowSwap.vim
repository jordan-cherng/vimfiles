if !exists('g:windowswap_map_keys')
   let g:windowswap_map_keys = 1
endif

if g:windowswap_map_keys
   nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
   nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
endif

