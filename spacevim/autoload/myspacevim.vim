function! myspacevim#before() abort
    set timeoutlen=200
    let g:mapleader = ','
    "rainbow
    let g:rainbow_active = 1
    " vimspector
    let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
    nmap <S-F5> :call vimspector#Reset()<CR>
    "vim-go
    " disable vim-go :GoDef short cut (gd)
    " this is handled by LanguageClient [LC]
    " let g:go_code_completion_enabled = 0
    " let g:go_def_mapping_enabled = 0
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    let g:go_referrers_mode = 'gopls'
    " let g:go_metalinter_autosave = 1
    " let g:go_metalinter_autosave_enabled = ['vet', 'golint']
    " let g:go_metalinter_deadline = "5s"
    " let g:go_jump_to_error = 0
    let g:go_auto_type_info = 1
    " let g:go_doc_max_height = 50
    " let g:go_doc_popup_window = 1
    " let g:go_term_enabled = 1
    " let g:go_term_close_on_exit = 1
    "rainbow
    let g:rainbow_active = 1
    " vim-go ui
    let g:go_auto_sameids = 1
    let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
    let g:go_highlight_types = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_function_parameters = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_format_strings = 1
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_interfaces = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
endfunction

function! myspacevim#after() abort
    "搜索时忽略大小写
    set ignorecase
    "左右分屏时,新建分屏在右方
    set splitright
    "上下分屏时,新建分屏在下方
    set splitbelow
endfunction

