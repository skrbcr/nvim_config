-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- 文字コード
vim.bo.fenc = 'utf-8'
-- バックアップファイルを作らない
vim.o.bk = false
-- スワップファイルを作らない
vim.bo.swf = false
-- 編集中のファイルが変更されたら自動で読み直す
vim.o.ar = true
-- 入力中のコマンドをステータスに表示
vim.o.sc = true
vim.cmd 'filetype plugin indent on'

-- 行番号を表示
vim.wo.nu = true
vim.wo.rnu = true
-- ステータスライン
vim.o.ls = 2
-- 色設定
vim.o.tgc = true
vim.o.background = 'dark'
-- モードの表示をしない
vim.o.smd = false
-- カーソルline
vim.wo.cul = true
-- -- シンタックス
vim.bo.syn = 'ON'
-- -- 括弧入力時に対応する括弧を表示
-- set showmatch
-- -- 検索ハイライト
vim.o.hls = true
-- -- インクリメントサーチ
vim.o.is = true
-- -- 自動インデント
vim.bo.si = true
vim.bo.ai = true
-- -- Tabは半角スペース
vim.bo.et = true
-- -- インデント幅
vim.bo.sw = 4
-- -- Tab挿入時の文字幅
vim.bo.sts = 4
-- -- Tabの表示幅
vim.bo.ts = 4
vim.o.cot = 'menuone,noinsert'
vim.api.nvim_set_keymap('i', '<CR>', '<C-y>', { noremap = true })
if vim.fn.has('unix') then
end
 
--[[ plugins ]]--
require('plugins')
vim.cmd "set statusline^=%{coc#status()}"
vim.cmd "autocmd User CocStatusChange redrawstatus"
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
end

-- カラースキーム
require("catppuccin").setup({
    flavour = "mocha",
    styles = {
        comments = {},
    },
    color_overrides = {
        all = {
            comment = "#808080",
        },
    },
    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.comment },
            LineNr = { fg = colors.comment }
        }
    end,
    integrations = {
        neotree = true,
    },
})
vim.cmd 'colorscheme catppuccin'
-- require('fern').setip{}
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    globalstatus = true,
  }
}

if vim.fn.has('unix') == 1 then
    -- Coc-explorer
    vim.api.nvim_set_keymap('n', '<space>e', '<Cmd>CocCommand explorer<CR>', {})
    vim.cmd [[
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
    ]]
end

if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    vim.g.python3_host_prog = 'C:/Users/akima/AppData/Local/Programs/Python/Python311/python.exe'
    vim.cmd "let g:deoplete#enable_at_startup = 1"
    vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.vimtex_view_general_viewer = "C:/Users/akima/AppData/Local/SumatraPDF/SumatraPDF.exe"
    vim.g.vimtex_view_general_options ='-reuse-instance -forward-search @tex @line @pdf'
    vim.cmd "let g:vimtex_compiler_latexmk_engines = { '_' : '-lualatex' }"
    vim.cmd [[
        call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
        \})
        " Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
   ]]
end
