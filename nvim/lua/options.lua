-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'  -- 使用系统剪贴板（与外部程序共享复制/粘贴）
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }  -- 补全菜单行为：始终显示菜单，不自动选择第一项
vim.opt.mouse = 'a'  -- 允许鼠标操作（滚动、选择等）

-- Tab
vim.opt.tabstop = 2        -- 每个 TAB 显示为 4 个空格宽度
vim.opt.softtabstop = 2    -- 编辑时按 TAB 插入 4 个空格
vim.opt.shiftwidth = 2     -- 自动缩进时插入 4 个空格
vim.opt.expandtab = true -- 将 TAB 转换为空格（兼容 Python 等语言）

-- UI config
vim.opt.number = true          -- 显示行号
vim.opt.relativenumber = true  -- 显示相对行号（其他行与当前行的距离）
vim.opt.cursorline = true      -- 高亮当前行
vim.opt.splitbelow = true      -- 新垂直分屏时窗口出现在下方
vim.opt.splitright = true      -- 新水平分屏时窗口出现在右侧
vim.opt.showmode = false       -- 隐藏模式提示（如 "-- INSERT --"）
-- vim.opt.termguicolors = true  -- 启用真彩色支持（需终端支持 24-bit 颜色）

-- Searching
vim.opt.incsearch = true   -- 输入时实时高亮匹配内容
vim.opt.hlsearch = false   -- 关闭搜索后的高亮显示
vim.opt.ignorecase = true  -- 搜索默认忽略大小写
vim.opt.smartcase = true   -- 如果搜索包含大写字母，则切换为大小写敏感