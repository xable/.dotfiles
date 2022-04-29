local g = vim.g

g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ':~'
g.nvim_tree_add_trailing = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_icon_padding = ' '
g.nvim_tree_symlink_arrow = ' >> '
g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}

require('nvim-tree').setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,

	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},

	system_open = {
		cmd = nil,
		args = {},
	},

        filters = {
                dotfiles = false,
                custom = {}
        },

	view = {
		width = 30,
		side = 'left',
		mappings = {
			custom_only = false,
			list = {},
		},
	},

        renderer = {
                indent_markers = {
                enable = true,
      },
   },
}
