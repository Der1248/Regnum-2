technic = technic or {}
technic.worldgen = {}
local modpath = minetest.get_modpath("technic_worldgen")
local intllib = nil
if intllib then
	technic.worldgen.gettext = intllib.Getter()
else
	technic.worldgen.gettext = function(s) return s end
end

dofile(modpath.."/config.lua")
dofile(modpath.."/nodes.lua")
dofile(modpath.."/crafts.lua")

-- Rubber trees, moretrees also supplies these
if not minetest.get_modpath("moretrees") then
	dofile(modpath.."/rubber.lua")
else
	-- older versions of technic provided rubber trees regardless
	minetest.register_alias("technic:rubber_sapling", "moretrees:rubber_tree_sapling")
	minetest.register_alias("technic:rubber_tree_empty", "moretrees:rubber_tree_trunk_empty")
end
