local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "Selenized Black (Gogh)"
-- config.color_scheme = "Dark Ocean (terminal.sexy)"
config.color_scheme = "Material (base16)"

--config.font = wezterm.font({ family = "JetBrains Mono" })
config.font = wezterm.font({ family = "Rec Mono Duotone" })
config.font_size = 15

config.window_background_opacity = 0.98
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"
config.window_frame = {
	font = wezterm.font({ family = "Rec Mono Duotone", weight = "Bold" }),
	font_size = 12,
}

config.keys = {
	{ key = "[", mods = "CMD", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "CMD", action = wezterm.action.ActivateTabRelative(1) },
	{ mods = "ALT", key = "Enter", action = wezterm.action.DisableDefaultAssignment },
	{ mods = "CMD", key = "Enter", action = wezterm.action.ToggleFullScreen },
	{ mods = "CTRL|SHIFT", key = "v", action = wezterm.action.DisableDefaultAssignment },
}

local act = wezterm.action

config.keys = {
  -- copy to the clipboard
  { key = 'C', mods = 'CTRL|SHIFT', action = act.CopyTo 'ClipboardAndPrimarySelection' },

  -- paste from the clipboard
  { key = 'V', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },

  -- paste from the primary selection
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
}

wezterm.on("update-right-status", function(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	-- I like my date/time in this style: "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M")
	table.insert(cells, date)

	-- An entry for each battery (typically 0 or 1 battery)
	for _, b in ipairs(wezterm.battery_info()) do
		table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
	end

	-- The powerline < symbol
	local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Color palette for the backgrounds of each cell
	local colors = {
		"#111",
		"#333",
		"#222",
		"#444",
		"#555",
	}

	-- Foreground color for the text across the fade
	local text_fg = "#c0c0c0"

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	-- Translate a cell into elements
	local function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			table.insert(elements, { Text = SOLID_LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	table.insert(elements, { Foreground = { Color = colors[1] } })
	table.insert(elements, { Text = SOLID_LEFT_ARROW })

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)

return config
