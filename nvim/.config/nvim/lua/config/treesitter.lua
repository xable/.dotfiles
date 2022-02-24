require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "graphql",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "latex",
    "lua",
    "python",
    "regex",
    "scss",
    "svelte",
    "toml",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  }
}
