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
vim.o.cot = 'menuone', 'noinsert'

if vim.fn.has('unix') == 1 then
    vim.g.python3_host_prog = '/usr/local/bin/python3'
end
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    vim.g.python3_host_prog ="python.exe"
    vim.o.shell = "pwsh.exe"
    vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
end

-- [[ Key Maps ]] --
vim.api.nvim_set_keymap('i', '<CR>', '<C-y>', { noremap = true })
vim.cmd 'inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\\<Enter>"'
vim.api.nvim_set_keymap('n', ']b', ':bnext<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '[b', ':bprev<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'M-v', '<C-v>', { noremap = true })
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':MarkdownPreview<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<M-s>', ':MarkdownPreviewStop<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':MarkdownPreviewToggle<CR>', { silent = true, noremap = true })
 
--[[ plugins ]]--
require('plugins')
vim.cmd "set statusline^=%{coc#status()}"
vim.cmd "autocmd User CocStatusChange redrawstatus"

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
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    globalstatus = true,
  }
}

if vim.fn.has('unix') == 1 then
    vim.g.coc_config_home = "~/.config/nvim/coc/unix"
end

-- Coc-explorer
vim.api.nvim_set_keymap('n', '<space>e', '<Cmd>CocCommand explorer<CR>', {})

-- Coc-snippets
vim.cmd [[
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
    ]]
vim.cmd [[
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
]]

-- VimTeX
if vim.fn.has('unix') == 1 then
    vim.g.vimtex_view_method = 'zathura'
end
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    -- vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.vimtex_view_general_viewer = "C:/Users/akima/AppData/Local/SumatraPDF/SumatraPDF.exe"
    vim.g.vimtex_view_general_options ='-reuse-instance -forward-search @tex @line @pdf'
end
vim.g.vimtex_compiler_latexmk_engines = { _ = '-lualatex' }

