let g:coc_config_home = '~/.SpaceVim.d/plugin/'
" coc-config's json commont
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType jsonc setlocal commentstring=//\ %s

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"coc-extensions
let g:coc_global_extensions = ["coc-yank","coc-yaml","coc-word","coc-translator","coc-python","coc-pyright","coc-tasks","coc-tag","coc-syntax","coc-snippets","coc-sh","coc-project","coc-markdownlint","coc-json","coc-lists","coc-highlight","coc-go","coc-gitignore","coc-git","coc-emoji","coc-docker","coc-dictionary","coc-calc","coc-marketplace","coc-rainbow-fart","coc-rust-analyzer"]

"插入模式jj映射Esc
:imap jj <Esc>
