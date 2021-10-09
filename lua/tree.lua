local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- default mappings
local list = {
  { key = {"l"},    cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  { key = "e",                        cb = tree_cb("vsplit") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "h",                         cb = tree_cb("close_node") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "?",                           cb = tree_cb("toggle_help") },
}

require'nvim-tree'.setup {
    auto_close = true,
    indent_markers = true,
    hijack_cursor = true,
    view = {
        mappings = {
            custom_only = true,
            list = list
        }
    }
}
