local utils = require("utils")

local monitor_rules = { { output = "eDP-1", mode = "preferred", position = "auto", scale = 1.25 } }
local workspace_rules = { { workspace = "1", monitor = "eDP-1", default = true } }
local window_rules = {
	{
		name = "kitty",
		match = { class = "^(kitty)$" },
		workspace = "1",
	},
	{
		name = "picture-in-picture",
		match = { title = "^[Pp]icture\\s*-?\\s*[Ii]n\\s*-?\\s*[Pp]icture$" },
		float = true,
		pin = true,
		move = "((monitor_w-window_w)-10) ((monitor_h-window_h)-10)",
		workspace = "1",
	},
	{
		name = "brave-browser",
		match = { class = "^(brave-browser)$" },
		no_initial_focus = true,
		group = "set always",
		workspace = "2",
	},
	{ name = "godot-editor", match = { class = "Godot" }, workspace = "3" },
}
local device_rules = {
	{
		name = "wacom-hid-521c-finger",
		enabled = false,
	},
}

utils.apply_all_rules({
	{ hl.monitor, monitor_rules },
	{ hl.workspace_rule, workspace_rules },
	{ hl.window_rule, window_rules },
	{ hl.device, device_rules },
})
