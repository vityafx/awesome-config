-----------------------------------------------------------------------------------------------------------------------
--                                               Desktop widgets config                                              --
-----------------------------------------------------------------------------------------------------------------------

-- Grab environment
local beautiful = require("beautiful")
local awful = require("awful")
local redflat = require("redflat")

-- Initialize tables and vars for module
-----------------------------------------------------------------------------------------------------------------------
local desktop = {}

-- desktop aliases
local wgeometry = redflat.util.desktop.wgeometry
local workarea = screen[mouse.screen].workarea
local system = redflat.system

-- Desktop widgets
-----------------------------------------------------------------------------------------------------------------------
function desktop:init(args)
	if not beautiful.desktop then return end

	local args = args or {}
	local env = args.env

	-- placement
	local grid = beautiful.desktop.grid
	local places = beautiful.desktop.places

	-- Network speed
	--------------------------------------------------------------------------------
	local netspeed = { geometry = wgeometry(grid, places.netspeed, workarea) }

	netspeed.args = {
		interface    = "eno2",
		maxspeed     = { up = 5*1024^2, down = 5*1024^2 },
		crit         = { up = 5*1024^2, down = 5*1024^2 },
		timeout      = 2,
		autoscale    = false
	}

	netspeed.style  = {}

	-- SSD speed
	--------------------------------------------------------------------------------
	local ssdspeed = { geometry = wgeometry(grid, places.ssdspeed, workarea) }

	ssdspeed.args = {
		interface = "nvme0n1p1",
		meter_function = system.disk_speed,
		timeout   = 2,
		label     = "970 PRO"
	}

	ssdspeed.style = {
		unit   = { { "B", -1 }, { "KB", 2 }, { "MB", 2048 } },
	}

	-- NVME speed
	--------------------------------------------------------------------------------
	local nvmespeed = { geometry = wgeometry(grid, places.nvmespeed, workarea) }

	nvmespeed.args = {
		interface = "nvme1n1p1",
		meter_function = system.disk_speed,
		timeout   = 2,
		label     = "970 EVO Plus"
	}

	nvmespeed.style = awful.util.table.clone(ssdspeed.style)


	-- HDD speed
	--------------------------------------------------------------------------------
	local hddspeed = { geometry = wgeometry(grid, places.hddspeed, workarea) }

	hddspeed.args = {
		interface = "sda",
		meter_function = system.disk_speed,
		timeout = 2,
		label = "VERTEX"
	}

	hddspeed.style = awful.util.table.clone(ssdspeed.style)

	-- CPU and memory usage
	--------------------------------------------------------------------------------
	local cpu_storage = { cpu_total = {}, cpu_active = {} }
	local cpumem = { geometry = wgeometry(grid, places.cpumem, workarea) }

	cpumem.args = {
		corners = { num = 8, maxm = 100, crit = 90 },
		lines   = { { maxm = 100, crit = 80 }, { maxm = 100, crit = 80 } },
		meter   = { args = cpu_storage },
		timeout = 2
	}

	cpumem.style = {}

	-- Disks
	--------------------------------------------------------------------------------
	local disks = { geometry = wgeometry(grid, places.disks, workarea) }

	disks.args = {
		sensors  = {
			{ meter_function = system.fs_info, maxm = 100, crit = 80, args = "/" },
			{ meter_function = system.fs_info, maxm = 100, crit = 80, args = "/home/fx" },
			{ meter_function = system.fs_info, maxm = 100, crit = 80, args = "/s" },
		},
		names   = {"root", "home", "data"},
		timeout = 300
	}

	disks.style = {
		unit      = { { "KB", 1 }, { "MB", 1024^1 }, { "GB", 1024^2 } },
		show_text = false
	}

	-- Temperature indicator
	--------------------------------------------------------------------------------
	local thermal = { geometry = wgeometry(grid, places.thermal, workarea) }

	thermal.args = {
		sensors = {
			{ meter_function = system.thermal.sensors, args = "'Package id 0'", maxm = 100, crit = 75 },
			{ meter_function = system.thermal.liquid, args = "Liquid temperature", maxm = 51, crit = 42 },
			{ meter_function = system.thermal.sensors_nvme, args = "'nvme-pci-7000'", maxm = 70, crit = 60 }
		},
		names   = { "cpu", "h2o", "evo" },
		timeout = 5
	}

	thermal.style = {
		unit      = { { "°C", -1 } },
	}

	-- Second Temperature and information indicator
	--------------------------------------------------------------------------------
	local thermal2 = { geometry = wgeometry(grid, places.thermal2, workarea) }

	thermal2.args = {
		sensors = {
			{ meter_function = system.thermal.nvidiasmi, args = "'GPU Current Temp'", maxm = 100, crit = 90 },
			{ meter_function = system.thermal.sensors_nvme, args = "'nvme-pci-0200'", maxm = 70, crit = 60 },
		},
		names   = { "gpu", "pro" },
		timeout = 5
	}

	thermal2.style = {
		unit      = { { "°C", -1 } },
	}

	-- Initialize all desktop widgets
	--------------------------------------------------------------------------------
    --netspeed.widget = redflat.desktop.speedgraph(netspeed.args, netspeed.geometry, netspeed.style)
	--ssdspeed.widget = redflat.desktop.speedgraph(ssdspeed.args, ssdspeed.geometry, ssdspeed.style)
	--nvmespeed.widget = redflat.desktop.speedgraph(nvmespeed.args, nvmespeed.geometry, nvmespeed.style)
	--hddspeed.widget = redflat.desktop.speedgraph(hddspeed.args, hddspeed.geometry, hddspeed.style)
	--cpumem.widget = redflat.desktop.multim(cpumem.args, cpumem.geometry, cpumem.style)
    disks.widget = nil
	-- disks.widget = redflat.desktop.dashpack(disks.args, disks.geometry, disks.style)
	thermal.widget = redflat.desktop.simpleline(thermal.args, thermal.geometry, thermal.style)
	thermal2.widget = redflat.desktop.simpleline(thermal2.args, thermal2.geometry, thermal2.style)
end

-- End
-----------------------------------------------------------------------------------------------------------------------
return desktop
