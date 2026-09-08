local utils = require("utils")

-- Programs
local terminal = "kitty"
local menu = "wlr-which-key"

-- Keybinds
local mainMod = "SUPER"

local mod = function(...)
	return table.concat({ mainMod, ... }, " + ")
end

local function register_submap(name, keymaps)
	hl.define_submap(name, function()
		utils.apply_all_binds(keymaps)
		hl.bind("Escape", hl.dsp.submap("reset"))
	end)
end

local move_window_map = {
	{ "H", hl.dsp.window.move({ direction = "l" }) },
	{ "J", hl.dsp.window.move({ direction = "d" }) },
	{ "K", hl.dsp.window.move({ direction = "u" }) },
	{ "L", hl.dsp.window.move({ direction = "r" }) },
}

for i = 1, 10 do
	table.insert(move_window_map, { tostring(i % 10), hl.dsp.window.move({ workspace = i }) })
end

local move_group_map = {
	{ "L", hl.dsp.group.move_window({ forward = true }) },
	{ "H", hl.dsp.group.move_window() },
}

register_submap("move_window", move_window_map)
register_submap("move_group", move_group_map)

local binds = {
	{ mod("T"), hl.dsp.exec_cmd(terminal) },
	{ mod("Q"), hl.dsp.window.close() },
	{
		mod("grave"),
		hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
	},
	{ mod("V"), hl.dsp.window.float({ action = "toggle" }) },
	{ mod("P"), hl.dsp.window.pseudo() },
	{ mod("Escape"), hl.dsp.exec_cmd("hyprlock") },
	{ mod("Super_L"), hl.dsp.exec_cmd(menu), { release = true } },

	-- Move focus (vim-style)
	{ mod("H"), hl.dsp.focus({ direction = "l" }) },
	{ mod("J"), hl.dsp.focus({ direction = "d" }) },
	{ mod("K"), hl.dsp.focus({ direction = "u" }) },
	{ mod("L"), hl.dsp.focus({ direction = "r" }) },

	-- Move windows (keyboard)
	{ mod("M"), hl.dsp.submap("move_window") },

	-- Group Nav
	{ mod("SHIFT", "L"), hl.dsp.group.next() },
	{ mod("SHIFT", "H"), hl.dsp.group.prev() },
	{ mod("G"), hl.dsp.submap("move_group") },

	-- Scroll through workspaces with mouse
	{ mod("mouse_down"), hl.dsp.focus({ workspace = "e+1" }) },
	{ mod("mouse_up"), hl.dsp.focus({ workspace = "e-1" }) },

	-- Screenshot
	{ mod("SHIFT", "S"), hl.dsp.exec_cmd("hyprshot -m region") },

	-- Move/resize windows with mouse
	{ mod("mouse:272"), hl.dsp.window.drag(), { mouse = true } },
	{ mod("mouse:273"), hl.dsp.window.resize(), { mouse = true } },

	-- Multimedia/Hardware
	-- Volume
	{
		"XF86AudioRaiseVolume",
		hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
		{ locked = true, repeating = true },
	},
	{
		"XF86AudioLowerVolume",
		hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
		{ locked = true, repeating = true },
	},
	{ "XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true } },
	{ "XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true } },

	-- Brightness
	{
		"XF86MonBrightnessUp",
		hl.dsp.exec_cmd("brightnessctl s 10%+"),
		{ locked = true, repeating = true },
	},
	{
		"XF86MonBrightnessDown",
		hl.dsp.exec_cmd("brightnessctl s 10%-"),
		{ locked = true, repeating = true },
	},

	-- Media controls
	{ "XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true } },
	{ "XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true } },
	{ "XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true } },
	{ "XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true } },
}

-- Switch workspaces
for i = 1, 10 do
	local key = i % 10
	table.insert(binds, { mod(key), hl.dsp.focus({ workspace = i }) })
	table.insert(binds, { mod("SHIFT", key), hl.dsp.group.active({ index = i }) })
end

utils.apply_all_binds(binds)
