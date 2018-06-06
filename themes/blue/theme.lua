-----------------------------------------------------------------------------------------------------------------------
--                                                   Blue theme                                                      --
-----------------------------------------------------------------------------------------------------------------------
local awful = require("awful")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

local theme = {}
local wa = mouse.screen.workarea

-- Color scheme
-----------------------------------------------------------------------------------------------------------------------
theme.color = {
	main      = "#064E71",
	gray      = "#575757",
	bg        = "#161616",
	bg_second = "#181818",
	wibox     = "#202020",
	icon      = "#a0a0a0",
	text      = "#aaaaaa",
	urgent    = "#B32601",
	highlight = "#ffffff",

	border    = "#404040",
	shadow1   = "#141414",
	shadow2   = "#313131",
	shadow3   = "#1c1c1c",
	shadow4   = "#767676"
}

-- Common
-----------------------------------------------------------------------------------------------------------------------
theme.path = awful.util.get_configuration_dir() .. "themes/blue"
theme.homedir = os.getenv("HOME")

-- Main config
------------------------------------------------------------

theme.panel_height        = dpi(36) -- panel height
theme.border_width        = dpi(4)  -- window border width
theme.useless_gap         = dpi(4)  -- useless gap

theme.cellnum = { x = dpi(96), y = dpi(58) } -- grid layout property

theme.wallpaper = theme.path .. "/wallpaper/custom.png" -- wallpaper file

-- Fonts
------------------------------------------------------------
theme.fonts = {
	main     = "Roboto 13",      -- main font
	menu     = "Roboto 13",      -- main menu font
	tooltip  = "Roboto 13",      -- tooltip font
	notify   = "Play bold 14",   -- redflat notify popup font
	clock    = "Play bold 12",   -- textclock widget font
	qlaunch  = "Play bold 14",   -- quick launch key label font
	keychain = "Play bold 16",   -- key sequence tip font
	title    = "Roboto bold 13", -- widget titles font
	titlebar = "Roboto bold 13", -- client titlebar font
	hotkeys  = {
		main  = "Roboto 14",             -- hotkeys helper main font
		key   = "Iosevka Term Light 14", -- hotkeys helper key font (use monospace for align)
		title = "Roboto bold 16",        -- hotkeys helper group title font
	},
	player   = {
		main = "Play bold 13", -- player widget main font
		time = "Play bold 15", -- player widget current time font
	},
}

theme.cairo_fonts = {
	tag         = { font = "Play", size = dpi(16), face = 1 }, -- tag widget font
	appswitcher = { font = "Play", size = dpi(20), face = 1 }, -- appswitcher widget font
	navigator   = {
		title = { font = "Play", size = dpi(28), face = 1, slant = 0 }, -- window navigation title font
		main  = { font = "Play", size = dpi(22), face = 1, slant = 0 }  -- window navigation  main font
	},
}

-- Shared icons
--------------------------------------------------------------------------------
theme.icon = {
	check    = theme.path .. "/common/check.svg",
	blank    = theme.path .. "/common/blank.svg",
	warning  = theme.path .. "/common/warning.svg",
	awesome  = theme.path .. "/common/awesome.svg",
}

-- Widget icons
--------------------------------------------------------------------------------
theme.icon.widget = {
	battery  = theme.path .. "/widget/battery.svg",
	wireless = theme.path .. "/widget/wireless.svg",
	monitor  = theme.path .. "/widget/monitor.svg",
}


-- Desktop config
-----------------------------------------------------------------------------------------------------------------------
theme.desktop = { common = {} }

-- Common
--------------------------------------------------------------------------------
theme.desktop.line_height = dpi(18)

theme.desktop.color = {
	main  = theme.color.main,
	gray  = theme.color.gray_desktop or "#404040",
	wibox = theme.color.bg .. "00"
}

-- Textbox
------------------------------------------------------------
theme.desktop.common.textbox = {
	font = { font = "prototype", size = dpi(24), face = 0 }
}

-- Dashbar
------------------------------------------------------------
theme.desktop.common.dashbar = {
	bar = { width = dpi(6), gap = dpi(6) }
}

-- Barpack
------------------------------------------------------------
theme.desktop.common.barpack = {
	label_style = { width = dpi(80), draw = "by_width" },
	text_style  = { width = dpi(92), draw = "by_edges" },
	line_height = theme.desktop.line_height,
	text_gap    = dpi(22),
	label_gap   = dpi(16),
	color       = theme.desktop.color
}

-- Widgets
--------------------------------------------------------------------------------

-- Network speed
------------------------------------------------------------
theme.desktop.speedmeter = {
	label            = { height = theme.desktop.line_height },
	dashbar          = { bar = { width = dpi(16), gap = dpi(6) }, height = dpi(6) },
	chart            = { bar = { width = dpi(6), gap = dpi(3) }, height = dpi(40), zero_height = dpi(4) },
	barvalue_height  = dpi(32),
	fullchart_height = dpi(80),
	images           = { theme.path .. "/desktop/up.svg", theme.path .. "/desktop/down.svg" },
	image_gap        = dpi(16),
	color            = theme.desktop.color
}

-- CPU and memory
------------------------------------------------------------
theme.desktop.multim = {
	corner       = { width = dpi(34), corner = { height = dpi(17), num = dpi(10), line = dpi(4) } },
	state_height = dpi(58),
	prog_height  = dpi(80),
	image_gap    = dpi(16),
	image        = theme.path .. "/desktop/bstar.svg",
	color        = theme.desktop.color
}

-- Disks
------------------------------------------------------------
theme.desktop.dashpack = {
	color = theme.desktop.color
}

-- Thermal
------------------------------------------------------------
theme.desktop.sline = {
	digit_num = dpi(2),
	lbox      = { draw = "by_width", width = dpi(50) },
	rbox      = { draw = "by_edges", width = dpi(60) },
	icon      = theme.path .. "/desktop/star.svg",
	iwidth    = dpi(142),
	color     = theme.desktop.color
}

-- Widgets placement
--------------------------------------------------------------------------------
theme.desktop.grid = {
	width  = { dpi(520), dpi(520), dpi(520) },
	height = { dpi(180), dpi(160), dpi(160), dpi(138), dpi(18) },
	edge   = { width = { dpi(60), dpi(60) }, height = { dpi(40), dpi(40) } }
}

theme.desktop.places = {
	netspeed = { 1, 1 },
	ssdspeed = { 2, 1 },
	hddspeed = { 3, 1 },
	cpumem   = { 1, 2 },
	transm   = { 1, 3 },
	disks    = { 1, 4 },
	thermal  = { 1, 5 }
}


-- Service utils config
-----------------------------------------------------------------------------------------------------------------------
theme.service = {}

-- Window control mode appearance
--------------------------------------------------------------------------------
theme.service.navigator = {
	border_width = dpi(0),
	gradstep     = dpi(60),
	marksize     = { width = dpi(160), height = dpi(80), r = dpi(20) },
	linegap      = dpi(32),
	titlefont    = theme.cairo_fonts.navigator.title,
	font         = theme.cairo_fonts.navigator.main,
	color        = { border = theme.color.main, mark = theme.color.gray, text = theme.color.wibox,
	                 fbg1 = theme.color.main .. "40",   fbg2 = theme.color.main .. "20",
	                 hbg1 = theme.color.urgent .. "40", hbg2 = theme.color.urgent .. "20",
	                 bg1  = theme.color.gray .. "40",   bg2  = theme.color.gray .. "20" }
}

theme.service.navigator.keytip = {}
theme.service.navigator.keytip["fairv"] = { geometry = { width = dpi(600), height = dpi(440) }, exit = true }
theme.service.navigator.keytip["fairh"] = theme.service.navigator.keytip["fairv"]

theme.service.navigator.keytip["tile"] = { geometry = { width = dpi(600), height = dpi(660) }, exit = true }
theme.service.navigator.keytip["tileleft"]   = theme.service.navigator.keytip["tile"]
theme.service.navigator.keytip["tiletop"]    = theme.service.navigator.keytip["tile"]
theme.service.navigator.keytip["tilebottom"] = theme.service.navigator.keytip["tile"]

theme.service.navigator.keytip["grid"] = { geometry = { width = dpi(1400), height = dpi(520) }, column = dpi(2), exit = true }
theme.service.navigator.keytip["usermap"] = { geometry = { width = dpi(1400), height = dpi(580) }, column = dpi(2), exit = true }

-- Desktop file parser
--------------------------------------------------------------------------------
theme.service.dfparser = {
	desktop_file_dirs = {
		'/usr/share/applications/',
		'/usr/local/share/applications/',
		'~/.local/share/applications',
	},
	icons = {
		df_icon       = theme.homedir .. "/.icons/ACYLS/scalable/mimetypes/application-x-executable.svg",
		theme         = theme.homedir .. "/.icons/ACYLS",
		custom_only   = true,
		scalable_only = true
	}
}


-- Menu config
-----------------------------------------------------------------------------------------------------------------------
theme.menu = {
	border_width = dpi(4),
	screen_gap   = theme.useless_gap + theme.border_width,
	height       = dpi(32),
	width        = dpi(250),
	icon_margin  = { dpi(4), dpi(7), dpi(7), dpi(8) },
	ricon_margin = { dpi(9), dpi(9), dpi(9), dpi(9) },
	font         = theme.fonts.menu,
	keytip       = { geometry = { width = dpi(400), height = dpi(380) } },
	hide_timeout = 1,
	submenu_icon = theme.path .. "/common/submenu.svg"
}

theme.menu.color = {
	border       = theme.color.wibox,
	text         = theme.color.text,
	highlight    = theme.color.highlight,
	main         = theme.color.main,
	wibox        = theme.color.wibox,
	submenu_icon = theme.color.icon
}


-- Gauge style
-----------------------------------------------------------------------------------------------------------------------
theme.gauge = { tag = {}, task = {}, icon = {}, audio = {}, monitor = {}, graph = {} }

-- Separator
------------------------------------------------------------
theme.gauge.separator = {
	marginv = { dpi(2), dpi(2), dpi(4), dpi(4) },
	marginh = { dpi(6), dpi(6), dpi(3), dpi(3) },
	color  = theme.color
}

-- Icon indicator
------------------------------------------------------------
theme.gauge.icon.single = {
	color  = theme.color
}

-- Monitor
--------------------------------------------------------------
theme.gauge.monitor.double = {
	width    = dpi(90),
	line     = { v_gap = dpi(6) },
	dmargin  = { dpi(10), dpi(0), dpi(0), dpi(0) },
	color    = theme.color
}

-- Tag
------------------------------------------------------------
theme.gauge.tag.blue = {
	width    = dpi(103),
	font     = theme.cairo_fonts.tag,
	point    = { width = dpi(80), height = dpi(3), gap = dpi(27), dx = dpi(5) },
	text_gap = dpi(20),
	color    = theme.color
}

-- Task
------------------------------------------------------------
theme.gauge.task.blue = {
	width    = dpi(80),
	show_min = true,
	font     = theme.cairo_fonts.tag,
	point    = { width = dpi(70), height = dpi(3), gap = dpi(27), dx = dpi(5) },
	text_gap = dpi(20),
	color    = theme.color
}

-- Dotcount
------------------------------------------------------------
theme.gauge.graph.dots = {
	column_num   = { 3, 5 }, -- { min, max }
	row_num      = 3,
	dot_size     = dpi(5),
	dot_gap_h    = dpi(4),
	color        = theme.color
}

-- Volume indicator
------------------------------------------------------------
theme.gauge.audio.blue = {
	width   = dpi(75),
	dash    = { bar = { num = dpi(5), width = dpi(4) }, color = theme.color },
	dmargin = { dpi(10), dpi(0), dpi(2), dpi(2) },
	icon    = theme.path .. "/widget/headphones.svg",
	color = { icon = theme.color.icon, mute = theme.color.urgent },
}


-- Panel widgets
-----------------------------------------------------------------------------------------------------------------------
theme.widget = {}

-- individual margins for palnel widgets
------------------------------------------------------------
theme.widget.wrapper = {
	layoutbox   = { dpi(12), dpi(10), dpi(6), dpi(6) },
	textclock   = { dpi(10), dpi(10), dpi(0), dpi(0) },
	volume      = { dpi(10), dpi(10), dpi(5), dpi(5) },
	network     = { dpi(10), dpi(10), dpi(5), dpi(5) },
	cpuram      = { dpi(10), dpi(10), dpi(5), dpi(5) },
	keyboard    = { dpi(10), dpi(10), dpi(4), dpi(4) },
	mail        = { dpi(10), dpi(10), dpi(4), dpi(4) },
	battery     = { dpi(8), dpi(10), dpi(7), dpi(7) },
	tray        = { dpi(8), dpi(8), dpi(7), dpi(7) },
	tasklist    = { dpi(4), dpi(0), dpi(0), dpi(0) }, -- centering tasklist widget
}

-- Pulseaudio volume control
------------------------------------------------------------
theme.widget.pulse = {
	notify      = { icon = theme.path .. "/widget/audio.svg" }
}

-- Brightness control
------------------------------------------------------------
theme.widget.brightness = {
	notify      = { icon = theme.path .. "/widget/brightness.svg" }
}

-- Textclock
------------------------------------------------------------
theme.widget.textclock = {
	font  = theme.fonts.clock,
	color = { text = theme.color.icon }
}

-- Keyboard layout indicator
------------------------------------------------------------
theme.widget.keyboard = {
	icon         = theme.path .. "/widget/keyboard.svg",
	micon        = theme.icon,
	layout_color = { theme.color.icon, theme.color.main }
}

theme.widget.keyboard.menu = {
	width        = dpi(180),
	color        = { right_icon = theme.color.icon },
	nohide       = true
}

-- Upgrades
------------------------------------------------------------
theme.widget.upgrades = {
	notify      = { icon = theme.path .. "/widget/upgrades.svg" },
	color       = theme.color
}

-- Mail
------------------------------------------------------------
theme.widget.mail = {
	icon        = theme.path .. "/widget/mail.svg",
	notify      = { icon = theme.path .. "/widget/mail.svg" },
	color       = theme.color,
}

-- Minitray
------------------------------------------------------------
theme.widget.minitray = {
	border_width = dpi(0),
	geometry     = { height = dpi(40) },
	screen_gap   = dpi(2) * theme.useless_gap,
	color        = { wibox = theme.color.wibox, border = theme.color.wibox },
	set_position = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width,
		         y = mouse.screen.workarea.y + mouse.screen.workarea.height }
	end,
}

-- Layoutbox
------------------------------------------------------------
theme.widget.layoutbox = {
	micon = theme.icon,
	color = theme.color
}

theme.widget.layoutbox.icon = {
	floating          = theme.path .. "/layouts/floating.svg",
	max               = theme.path .. "/layouts/max.svg",
	fullscreen        = theme.path .. "/layouts/fullscreen.svg",
	tilebottom        = theme.path .. "/layouts/tilebottom.svg",
	tileleft          = theme.path .. "/layouts/tileleft.svg",
	tile              = theme.path .. "/layouts/tile.svg",
	tiletop           = theme.path .. "/layouts/tiletop.svg",
	fairv             = theme.path .. "/layouts/fair.svg",
	fairh             = theme.path .. "/layouts/fair.svg",
	grid              = theme.path .. "/layouts/grid.svg",
	usermap           = theme.path .. "/layouts/map.svg",
	magnifier         = theme.path .. "/layouts/magnifier.svg",
	cornerne          = theme.path .. "/layouts/cornerne.svg",
	cornernw          = theme.path .. "/layouts/cornernw.svg",
	cornerse          = theme.path .. "/layouts/cornerse.svg",
	cornersw          = theme.path .. "/layouts/cornersw.svg",
	unknown           = theme.path .. "/common/unknown.svg",
}

theme.widget.layoutbox.menu = {
	icon_margin  = { dpi(8), dpi(12), dpi(9), dpi(9) },
	width        = dpi(220),
	auto_hotkey  = true,
	nohide       = false,
	color        = { right_icon = theme.color.icon, left_icon = theme.color.icon }
}

theme.widget.layoutbox.name_alias = {
	floating          = "Floating",
	fullscreen        = "Fullscreen",
	max               = "Maximized",
	grid              = "Grid",
	usermap           = "User Map",
	tile              = "Right Tile",
	fairv             = "Fair Tile",
	tileleft          = "Left Tile",
	tiletop           = "Top Tile",
	tilebottom        = "Bottom Tile",
	magnifier         = "Magnifier",
	cornerne          = "Corner NE",
	cornernw          = "Corner NW",
	cornerse          = "Corner SE",
	cornersw          = "Corner SW",
}

-- Tasklist
------------------------------------------------------------
theme.widget.tasklist = {
	width       = dpi(70),
	char_digit  = dpi(5),
	task        = theme.gauge.task.blue
}

-- main
theme.widget.tasklist.winmenu = {
	micon          = theme.icon,
	titleline      = { font = theme.fonts.title, height = dpi(25) },
	menu           = { width = dpi(220), color = { right_icon = theme.color.icon }, ricon_margin = { dpi(9), dpi(9), dpi(9), dpi(9) } },
	state_iconsize = { width = dpi(18), height = dpi(18) },
	layout_icon    = theme.widget.layoutbox.icon,
	color          = theme.color
}

-- tasktip
theme.widget.tasklist.tasktip = {
	margin = { dpi(8), dpi(8), dpi(4), dpi(4) },
	color  = theme.color
}

-- tags submenu
theme.widget.tasklist.winmenu.tagmenu = {
	width       = dpi(180),
	icon_margin = { dpi(9), dpi(9), dpi(9), dpi(9) },
	color       = { right_icon = theme.color.icon, left_icon = theme.color.icon },
}

-- menu
theme.widget.tasklist.winmenu.icon = {
	floating             = theme.path .. "/common/window_control/floating.svg",
	sticky               = theme.path .. "/common/window_control/pin.svg",
	ontop                = theme.path .. "/common/window_control/ontop.svg",
	below                = theme.path .. "/common/window_control/below.svg",
	close                = theme.path .. "/common/window_control/close.svg",
	minimize             = theme.path .. "/common/window_control/minimize.svg",
	maximized            = theme.path .. "/common/window_control/maximized.svg",
}


-- Floating widgets
-----------------------------------------------------------------------------------------------------------------------
theme.float = { decoration = {} }

-- Audio player
------------------------------------------------------------
theme.float.player = {
	geometry     = { width = dpi(490), height = dpi(130) },
	screen_gap   = dpi(2) * theme.useless_gap,
	border_gap   = { dpi(15), dpi(15), dpi(15), dpi(15) },
	elements_gap = { dpi(15), dpi(0), dpi(0), dpi(0) },
	control_gap  = { dpi(0), dpi(0), dpi(14), dpi(6) },
	line_height  = dpi(26),
	bar_width    = dpi(6),
	titlefont    = theme.fonts.player.main,
	artistfont   = theme.fonts.player.main,
	timefont     = theme.fonts.player.time,
	dashcontrol  = { color = theme.color, bar = { num = dpi(7) } },
	progressbar  = { color = theme.color },
	border_width = dpi(0),
	timeout      = dpi(1),
	color        = theme.color
}

theme.float.player.icon = {
	cover   = theme.path .. "/common/player/cover.svg",
	next_tr = theme.path .. "/common/player/next.svg",
	prev_tr = theme.path .. "/common/player/previous.svg",
	play    = theme.path .. "/common/player/play.svg",
	pause   = theme.path .. "/common/player/pause.svg"
}

-- Application runner
------------------------------------------------------------
theme.float.apprunner = {
	itemnum       = dpi(6),
	geometry      = { width = dpi(620), height = dpi(480) },
	border_margin = { dpi(24), dpi(24), dpi(24), dpi(24) },
	icon_margin   = { dpi(8), dpi(16), dpi(0), dpi(0) },
	title_height  = dpi(48),
	prompt_height = dpi(35),
	title_icon    = theme.path .. "/widget/search.svg",
	keytip        = { geometry = { width = dpi(400), height = dpi(250) } },
	border_width  = dpi(0),
	name_font     = theme.fonts.title,
	comment_font  = theme.fonts.main,
	color         = theme.color
}

-- Application switcher
------------------------------------------------------------
theme.float.appswitcher = {
	wibox_height   = dpi(240),
	label_height   = dpi(28),
	title_height   = dpi(40),
	icon_size      = dpi(96),
	border_margin  = { dpi(10), dpi(10), dpi(0), dpi(10) },
	preview_margin = { dpi(15), dpi(15), dpi(15), dpi(15) },
	preview_format = dpi(16) / dpi(10),
	title_font     = theme.fonts.title,
	border_width   = dpi(0),
	update_timeout = dpi(1) / dpi(12),
	keytip         = { geometry = { width = dpi(400), height = dpi(360) }, exit = true },
	font           = theme.cairo_fonts.appswitcher,
	color          = theme.color
}

-- additional color
theme.float.appswitcher.color.preview_bg = theme.color.main .. "12"

-- hotkeys
theme.float.appswitcher.hotkeys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
                                    "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12" }

-- Quick launcher
------------------------------------------------------------
theme.float.qlaunch = {
	geometry      = { width = dpi(1400), height = dpi(170) },
	border_margin = { dpi(5), dpi(5), dpi(12), dpi(15) },
	border_width  = dpi(0),
	appline       = { iwidth = dpi(140), im = { dpi(5), dpi(5), dpi(0), dpi(0) }, igap = { dpi(0), dpi(0), dpi(5), dpi(15) }, lheight = dpi(26) },
	state         = { gap = dpi(5), radius = dpi(5), size = dpi(10),  height = dpi(14) },
	df_icon       = theme.homedir .. "/.icons/ACYLS/scalable/mimetypes/application-x-executable.svg",
	no_icon       = theme.homedir .. "/.icons/ACYLS/scalable/apps/question.svg",
	recoloring    = true,
	keytip        = { geometry = { width = dpi(600), height = dpi(320) } },
	label_font    = theme.fonts.qlaunch,
	color         = theme.color,
}

-- Hotkeys helper
------------------------------------------------------------
theme.float.hotkeys = {
	geometry      = { width = dpi(1800), height = dpi(975) },
	border_margin = { dpi(20), dpi(20), dpi(8), dpi(10) },
	border_width  = dpi(0),
	is_align      = true,
	separator     = { marginh = { dpi(0), dpi(0), dpi(3), dpi(6) } },
	font          = theme.fonts.hotkeys.main,
	keyfont       = theme.fonts.hotkeys.key,
	titlefont     = theme.fonts.hotkeys.title,
	color         = theme.color
}

-- Tooltip
------------------------------------------------------------
theme.float.tooltip = {
	margin       = { dpi(6), dpi(6), dpi(3), dpi(3) },
	timeout      = dpi(0),
	font         = theme.fonts.tooltip,
	border_width = dpi(2),
	color        = theme.color
}

-- Floating prompt
------------------------------------------------------------
theme.float.prompt = {
	border_width = dpi(0),
	color        = theme.color
}

-- Top processes
------------------------------------------------------------
theme.float.top = {
	geometry      = { width = dpi(460), height = dpi(400) },
	screen_gap    = dpi(2) * theme.useless_gap,
	border_margin = { dpi(20), dpi(20), dpi(10), dpi(0) },
	button_margin = { dpi(140), dpi(140), dpi(18), dpi(18) },
	title_height  = dpi(40),
	border_width  = dpi(0),
	bottom_height = dpi(70),
	title_font    = theme.fonts.title,
	color         = theme.color,
	set_position  = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width,
		         y = mouse.screen.workarea.y + mouse.screen.workarea.height }
	end,
}

-- Key sequence tip
------------------------------------------------------------
theme.float.keychain = {
	geometry        = { width = dpi(250), height = dpi(56) },
	font            = theme.fonts.keychain,
	border_width    = dpi(0),
	keytip          = { geometry = { width = dpi(1200), height = dpi(580) }, column = dpi(2) },
	color           = theme.color,
}

-- Notify
------------------------------------------------------------
theme.float.notify = {
	geometry     = { width = dpi(484), height = dpi(106) },
	screen_gap   = dpi(2) * theme.useless_gap,
	font         = theme.fonts.notify,
	border_width = dpi(0),
	icon         = theme.icon.warning,
	color        = theme.color,
	progressbar  = { color = theme.color },
	set_position = function()
		return { x = mouse.screen.workarea.x + mouse.screen.workarea.width, y = mouse.screen.workarea.y }
	end,
}

-- Decoration elements
------------------------------------------------------------
theme.float.decoration.button = {
	color = {
		shadow3 = theme.color.shadow3,
		shadow4 = theme.color.shadow4,
		gray    = theme.color.gray,
		text    = "#cccccc"
	},
}

theme.float.decoration.field = {
	color = theme.color
}


-- Titlebar
-----------------------------------------------------------------------------------------------------------------------
theme.titlebar = {
	size          = dpi(8),
	position      = "top",
	font          = theme.fonts.titlebar,
	icon          = { size = dpi(30), gap = dpi(10) },
	border_margin = { dpi(0), dpi(0), dpi(0), dpi(4) },
	color         = theme.color,
}

-- Naughty config
-----------------------------------------------------------------------------------------------------------------------
theme.naughty = {}

theme.naughty.base = {
	timeout      = dpi(10),
	margin       = dpi(12),
	icon_size    = dpi(80),
	font         = theme.fonts.main,
	bg           = theme.color.wibox,
	fg           = theme.color.text,
	height       = theme.float.notify.geometry.height + dpi(500),
	width        = theme.float.notify.geometry.width + dpi(1000),
	border_width = dpi(4),
	border_color = theme.color.wibox
}

theme.naughty.normal = {}
theme.naughty.critical = { timeout = 0, border_color = theme.color.main }
theme.naughty.low = { timeout = 5 }

-- Default awesome theme vars
-----------------------------------------------------------------------------------------------------------------------

-- colors
theme.bg_normal     = theme.color.wibox
theme.bg_focus      = theme.color.main
theme.bg_urgent     = theme.color.urgent
theme.bg_minimize   = theme.color.gray

theme.fg_normal     = theme.color.text
theme.fg_focus      = theme.color.highlight
theme.fg_urgent     = theme.color.highlight
theme.fg_minimize   = theme.color.highlight

theme.border_normal = theme.color.wibox
theme.border_focus  = theme.color.wibox
theme.border_marked = theme.color.main

-- font
theme.font = theme.fonts.main

-- End
-----------------------------------------------------------------------------------------------------------------------
return theme
