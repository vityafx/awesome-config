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
	--awful.spawn.with_shell("compton")
    awful.spawn.with_shell("pulseaudio --start")
	awful.spawn.with_shell("nm-applet")
	awful.spawn.with_shell("clipit")
	awful.spawn.with_shell("sleep 0.5 && bash ~/Documents/scripts/ff-sync.sh")

	-- gnome environment
	awful.spawn.with_shell("/usr/lib/gnome-settings-daemon/gsd-xsettings")
	awful.spawn.with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	-- keyboard layouts
	awful.spawn.with_shell("kbdd")
	awful.spawn.with_shell("sleep 1 && bash ~/Documents/scripts/kbdd-setup.sh")

	-- apps
	awful.spawn.with_shell("clipflap")
	awful.spawn.with_shell("sleep 0.5 && transmission-gtk -m")
    -- gsync enable
    awful.spawn.with_shell("ddcutil -l XG270 setvcp ed 0x01")
    --awful.spawn.with_shell("firefox")
    --awful.spawn.with_shell("emacs --daemon")
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return autostart
