local g = vim.g
local fn = vim.fn
plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

g.dashboard_default_executive = 'telescope'
g.dashboard_diable_statusline = 1

g.dashboard_custom_header = {
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}  

-- g.dashboard_custom_section = {
-- 	a = { description = { '  Find File                        ' }, command = 'Telescope find_files' },
-- 	b = { description = { '  Recents                          ' }, command = 'Telescope oldfiles' },
-- 	c = { description = { '  Find Word                        ' }, command = 'Telescope live_grep' },
-- 	d = { description = { 'ﱐ  New File                         ' }, command = 'DashboardNewFile' },
-- 	e = { description = { '  Bookmarks                        ' }, command = 'Telescope marks' },
-- 	f = { description = { '  Open Help Doc                    ' }, command = 'view ~/.config/nvim/doc/helpdoc.md' },
-- }

g.dashboard_custom_section = {
   a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
   b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
   c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
   d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
   e = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
   f = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
}

g.dashboard_custom_footer = {
   '   ',
   'Loaded ' .. plugins_count .. ' plugins!  '
}
