local use_moreores = minetest.get_modpath("moreores")
dofile(minetest.get_modpath("shields").."/tutorial.lua")
minetest.register_tool("shields:shield_admin", {
	description = "Admin Shield Mode 1 (no speed and no jump)",
	inventory_image = "shields_inv_shield_admin.png^technic_tool_mode1.png",
    wield_image = "shields_inv_shield_admin.png",
	groups = {armor_shield=5000, armor_heal=2500, armor_use=0, armor_fire=2000},
	wear = 0,
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("shields:shield_admin2")
        end
        return itemstack
    end,
})

minetest.register_tool("shields:shield_admin2", {
	description = "Admin Shield Mode 2 (speed and no jump)",
	inventory_image = "shields_inv_shield_admin.png^technic_tool_mode2.png",
    wield_image = "shields_inv_shield_admin.png",
	groups = {armor_shield=5000, armor_heal=2500, armor_use=0, armor_fire=2000, physics_speed=0.25},
	wear = 0,
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("shields:shield_admin3")
        end
        return itemstack
    end,
})

minetest.register_tool("shields:shield_admin3", {
	description = "Admin Shield Mode 3 (no speed and jump)",
	inventory_image = "shields_inv_shield_admin.png^technic_tool_mode3.png",
    wield_image = "shields_inv_shield_admin.png",
	groups = {armor_shield=5000, armor_heal=2500, armor_use=0, armor_fire=2000, physics_jump=0.25},
	wear = 0,
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("shields:shield_admin4")
        end
        return itemstack
    end,
})

minetest.register_tool("shields:shield_admin4", {
	description = "Admin Shield Mode 4 (speed and jump)",
	inventory_image = "shields_inv_shield_admin.png^technic_tool_mode4.png",
    wield_image = "shields_inv_shield_admin.png",
	groups = {armor_shield=5000, armor_heal=2500, armor_use=0, armor_fire=2000, physics_jump=0.25, physics_speed=0.25},
	wear = 0,
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("shields:shield_admin")
        end
        return itemstack
    end,
})