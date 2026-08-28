local utils = require("utils")

local monitor_rules = { { output = "", mode = "preferred", position = "auto", scale = "auto" } }
local workspace_rules = {
	{ workspace = "1", monitor = "HDMI-A-1", default = true },
	{ workspace = "2", monitor = "DP-3", default = true },
	{ workspace = "3", monitor = "DP-3" },
	{ workspace = "4", monitor = "DP-3" },
	{ workspace = "5", monitor = "DP-3" },
	{ workspace = "9", monitor = "HDMI-A-1" },
	{ workspace = "10", monitor = "HDMI-A-1" },
}
local window_rules = {
	{
		name = "brave-browser",
		match = { class = "^(brave-browser)$" },
		no_initial_focus = true,
		group = "set always",
		workspace = "1",
	},
	{
		name = "picture-in-picture",
		match = { title = "^[Pp]icture\\s*-?\\s*[Ii]n\\s*-?\\s*[Pp]icture$" },
		float = true,
		pin = true,
		move = "((monitor_w-window_w)-10) ((monitor_h-window_h)-10)",
		workspace = "2",
	},
	{
		name = "kitty",
		match = { class = "^(kitty)$" },
		workspace = "2",
	},
	{ name = "godot-editor", match = { class = "Godot" }, workspace = "3" },
}
local device_rules = {
	{
		name = "hid-256c:006d",
		output = "DP-3",
	},
}

utils.apply_all_rules({
	{ hl.monitor, monitor_rules },
	{ hl.workspace_rule, workspace_rules },
	{ hl.window_rule, window_rules },
	{ hl.device, device_rules },
})
