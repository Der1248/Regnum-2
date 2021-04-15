minetest.register_tool("shields:regnumshield", {
	description = "Regnumshield Mode 1 (no speed and no jump)\nShield-lv.MAX",
	inventory_image = "shields_inv_regnumshield.png^technic_tool_mode1.png",
	groups = {armor_shield=15.0, armor_heal=13, armor_use=0,armor_fire=1, armor_water=0.2},
	wear = 0,
    wield_image = "shields_inv_regnumshield.png",
    on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("shields:regnumshield2")
        end
        return itemstack
    end,
})
minetest.register_tool("shields:regnumshield2", {
	description = "Regnumshield Mode 2 (speed and no jump)\nShield-lv.MAX",
	inventory_image = "shields_inv_regnumshield.png^technic_tool_mode2.png",
	groups = {armor_shield=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "shields_inv_regnumshield.png",
    on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("shields:regnumshield3")
        end
        return itemstack
    end,
})
minetest.register_tool("shields:regnumshield3", {
	description = "Regnumshield Mode 3 (no speed and jump)\nShield-lv.MAX",
	inventory_image = "shields_inv_regnumshield.png^technic_tool_mode3.png",
	groups = {armor_shield=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_jump=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "shields_inv_regnumshield.png",
    on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("shields:regnumshield4")
        end
        return itemstack
    end,
})
minetest.register_tool("shields:regnumshield4", {
	description = "Regnumshield Mode 4 (speed and jump)\nShield-lv.MAX",
	inventory_image = "shields_inv_regnumshield.png^technic_tool_mode4.png",
	groups = {armor_shield=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_jump=0.25, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "shields_inv_regnumshield.png",
    on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("shields:regnumshield")
        end
        return itemstack
    end,
})
