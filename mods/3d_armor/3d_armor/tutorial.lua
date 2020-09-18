minetest.register_tool("3d_armor:regnumboots", {
	description = "Regnumboots Mode 1 (no speed and no jump)\nBoots-lv.MAX",
	inventory_image = "3d_armor_inv_regnumboots.png^technic_tool_mode1.png",
	groups = {armor_feet=15.0, armor_heal=13, armor_use=0,armor_fire=1, armor_water=0.2},
	wear = 0,
    wield_image = "3d_armor_inv_regnumboots.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumboots2")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumboots2", {
	description = "Regnumboots Mode 2 (speed and no jump)\nBoots-lv.MAX",
	inventory_image = "3d_armor_inv_regnumboots.png^technic_tool_mode2.png",
	groups = {armor_feet=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumboots.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumboots3")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumboots3", {
	description = "Regnumboots Mode 3 (no speed and jump)\nBoots-lv.MAX",
	inventory_image = "3d_armor_inv_regnumboots.png^technic_tool_mode3.png",
	groups = {armor_feet=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_jump=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumboots.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumboots4")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumboots4", {
	description = "Regnumboots Mode 4 (speed and jump)\nBoots-lv.MAX",
	inventory_image = "3d_armor_inv_regnumboots.png^technic_tool_mode4.png",
	groups = {armor_feet=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_jump=0.25, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumboots.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumboots")
        end
        return itemstack
    end,
})

minetest.register_tool("3d_armor:regnumchestplate", {
	description = "Regnumchestplate Mode 1 (no speed and no jump)\nChestplate-lv.MAX",
	inventory_image = "3d_armor_inv_regnumchestplate.png^technic_tool_mode1.png",
	groups = {armor_torso=15.0, armor_heal=13, armor_use=0, armor_fire=1, armor_water=0.2},
	wear = 0,
    wield_image = "3d_armor_inv_regnumchestplate.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumchestplate2")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumchestplate2", {
	description = "Regnumchestplate Mode 2 (speed and no jump)\nChestplate-lv.MAX",
	inventory_image = "3d_armor_inv_regnumchestplate.png^technic_tool_mode2.png",
	groups = {armor_torso=15.0, armor_heal=13, armor_use=0, armor_fire=1, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumchestplate.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumchestplate3")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumchestplate3", {
	description = "Regnumchestplate Mode 3 (no speed and jump)\nChestplate-lv.MAX",
	inventory_image = "3d_armor_inv_regnumchestplate.png^technic_tool_mode3.png",
	groups = {armor_torso=15.0, armor_heal=13, armor_use=0, armor_fire=1, physics_jump=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumchestplate.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumchestplate4")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumchestplate4", {
	description = "Regnumchestplate Mode 4 (speed and jump)\nChestplate-lv.MAX",
	inventory_image = "3d_armor_inv_regnumchestplate.png^technic_tool_mode4.png",
	groups = {armor_torso=15.0, armor_heal=13, armor_use=0, armor_fire=1, physics_jump=0.25, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumchestplate.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumchestplate")
        end
        return itemstack
    end,
})

minetest.register_tool("3d_armor:regnumhelmet", {
	description = "Regnumhelmet Mode 1 (no speed and no jump)\nHelmet-lv.MAX",
	inventory_image = "3d_armor_inv_regnumhelmet.png^technic_tool_mode1.png",
	groups = {armor_head=15.0, armor_heal=13, armor_use=0,armor_fire=1, armor_water=0.2},
	wear = 0,
    wield_image = "3d_armor_inv_regnumhelmet.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumhelmet2")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumhelmet2", {
	description = "Regnumhelmet Mode 2 (speed and no jump)\nHelmet-lv.MAX",
	inventory_image = "3d_armor_inv_regnumhelmet.png^technic_tool_mode2.png",
	groups = {armor_head=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumhelmet.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumhelmet3")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumhelmet3", {
	description = "Regnumhelmet Mode 3 (no speed and jump)\nHelmet-lv.MAX",
	inventory_image = "3d_armor_inv_regnumhelmet.png^technic_tool_mode3.png",
	groups = {armor_head=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_jump=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumhelmet.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumhelmet4")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumhelmet4", {
	description = "Regnumhelmet Mode 4 (speed and jump)\nHelmet-lv.MAX",
	inventory_image = "3d_armor_inv_regnumhelmet.png^technic_tool_mode4.png",
	groups = {armor_head=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_jump=0.25, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumhelmet.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumhelmet")
        end
        return itemstack
    end,
})

minetest.register_tool("3d_armor:regnumleggings", {
	description = "Regnumleggings Mode 1 (no speed and no jump)\nLeggings-lv.MAX",
	inventory_image = "3d_armor_inv_regnumleggings.png^technic_tool_mode1.png",
	groups = {armor_legs=15.0, armor_heal=13, armor_use=0,armor_fire=1, armor_water=0.2},
	wear = 0,
    wield_image = "3d_armor_inv_regnumleggings.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumleggings2")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumleggings2", {
	description = "Regnumleggings Mode 2 (speed and no jump)\nLeggings-lv.MAX",
	inventory_image = "3d_armor_inv_regnumleggings.png^technic_tool_mode2.png",
	groups = {armor_legs=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumleggings.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumleggings3")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumleggings3", {
	description = "Regnumleggings Mode 3 (no speed and jump)\nLeggings-lv.MAX",
	inventory_image = "3d_armor_inv_regnumleggings.png^technic_tool_mode3.png",
	groups = {armor_legs=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_jump=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumleggings.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumleggings4")
        end
        return itemstack
    end,
})
minetest.register_tool("3d_armor:regnumleggings4", {
	description = "Regnumleggings Mode 4 (speed and jump)\nLeggings-lv.MAX",
	inventory_image = "3d_armor_inv_regnumleggings.png^technic_tool_mode4.png",
	groups = {armor_legs=15.0, armor_heal=13, armor_use=0,armor_fire=1, physics_jump=0.25, physics_speed=0.25, armor_water=0.2, not_in_creative_inventory=1},
	wear = 0,
    wield_image = "3d_armor_inv_regnumleggings.png",
    on_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("3d_armor:regnumleggings")
        end
        return itemstack
    end,
})