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
-- 更新時間
vim.o.updatetime = 300
-- signcolumn
-- vim.wo.signcolumn = yes

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
-- シンタックス
vim.bo.syn = 'ON'
-- 括弧入力時に対応する括弧を表示
-- set showmatch
-- 検索ハイライト
vim.o.hls = true
-- インクリメントサーチ
vim.o.is = true
-- 自動インデント
vim.bo.si = true
vim.bo.ai = true
-- Tabは半角スペース
vim.bo.et = true
-- インデント幅
vim.bo.sw = 4
-- Tab挿入時の文字幅
vim.bo.sts = 4
-- Tabの表示幅
vim.bo.ts = 4
vim.o.cot = 'menuone', 'noinsert'

-- gui
vim.o.gfn = 'PlemolJP Console NF Medium:h9'

-- clipboard
if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'win32yank_wsl',
        copy = {
            ['+'] = 'win32yank.exe -i',
            ['*'] = 'win32yank.exe -i',
        },
        paste = {
            ['+'] = 'win32yank.exe -o',
            ['*'] = 'win32yank.exe -o',
        },
        cache_enabled = true,
    }
end

-- terminal on Windows
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    vim.o.shell = "pwsh.exe"
    vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
	vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
end

-- python, ruby, perl
if vim.fn.has('unix') == 1 then
    vim.g.python3_host_prog = 'python3'
end
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    vim.g.python3_host_prog ="python.exe"
end
vim.cmd 'let g:loaded_ruby_provider = 0'
vim.cmd 'let g:loaded_perl_provider = 0'

-- Key Maps
vim.api.nvim_set_keymap('i', '<CR>', '<C-y>', { noremap = true })
vim.cmd 'inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\\<Enter>"'
vim.api.nvim_set_keymap('n', ']b', ':bnext<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '[b', ':bprev<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', 'M-v', '<C-v>', { noremap = true })
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':MarkdownPreview<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<M-s>', ':MarkdownPreviewStop<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':MarkdownPreviewToggle<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('v', '<leader>c', '"+y', { silent=true, noremap=true }) 
vim.api.nvim_set_keymap('n', '<leader>v', '"+p', { silent=true, noremap=true }) 
vim.api.nvim_set_keymap('v', '<leader>v', '"+p', { silent=true, noremap=true }) 
 
--
-- plugins
--
require('plugins')
vim.cmd "set statusline^=%{coc#status()}"
vim.cmd "autocmd User CocStatusChange redrawstatus"
require('bufferline').setup{}

-- カラースキーム
require('tokyonight').setup({
    style = 'moon',
})
vim.cmd 'colorscheme tokyonight'
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    globalstatus = true,
  }
}

-- vim-cmake
vim.cmd "autocmd FileType c,cpp nnoremap <silent> <F7> :CMakeBuild<CR>"
vim.cmd "autocmd FileType c,cpp nnoremap <silent> <leader>cq :CMakeClose<CR>"

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
    -- ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    ignore_install = {  },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

--
-- Coc
-- 
local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Make <CR> to accept selected completion item or notify coc.nvim to format
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- Coc-explorer
vim.api.nvim_set_keymap('n', '<space>e', '<Cmd>CocCommand explorer<CR>', {})

-- VimTeX
if vim.fn.has('unix') == 1 then
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_latexmk_engines = { _ = '-lualatex' }
end

