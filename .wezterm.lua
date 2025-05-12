local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

wezterm.log_info("✅ config geladen")

config.default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~" }
config.default_cwd = "/home/djeymiquel/"
config.default_workspace = "dev"
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Symbols Nerd Font Mono",
	"Noto Color Emoji",
})
config.font_size = 11.5
config.color_scheme = "Builtin Solarized Dark"
config.enable_tab_bar = false
config.warn_about_missing_glyphs = false

config.keys = {
	{
		key = "X",
		mods = "CTRL",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{ key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "-", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
}

return config
