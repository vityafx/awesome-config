-----------------------------------------------------------------------------------------------------------------------
--                                              Autostart app list                                                   --
-----------------------------------------------------------------------------------------------------------------------

-- Grab environment
local awful = require("awful")

-- Initialize tables and vars for module
-----------------------------------------------------------------------------------------------------------------------
local autostart = {}

-- Application list function
--------------------------------------------------------------------------------
function autostart.run()
	-- utils
	awful.spawn.with_shell("parcellite")
	awful.spawn.with_shell("xscreensaver")
	awful.spawn.with_shell("pulseaudio")
	awful.spawn.with_shell("nm-applet")

	-- gnome environment
	awful.spawn.with_shell("/usr/lib/gnome-settings-daemon/gsd-xsettings")
	awful.spawn.with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	-- apps
	awful.spawn.with_shell("firefox")
	awful.spawn.with_shell("emacs --daemon")
	awful.spawn.with_shell("term")
	awful.spawn.with_shell("term")
	awful.spawn.with_shell("term")
	awful.spawn.with_shell("term")
	awful.spawn.with_shell("/usr/bin/telegram")
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return autostart
