minetest.register_craftitem("tutorial:monster_remover", {
	description = "Admin tool 7: Monster Remover",
	inventory_image = "tutorial_monster_entverner.png",
	stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
		local pos = user:getpos()
		for _,object in ipairs(minetest.env:get_objects_inside_radius(pos, 15)) do
			if not object:is_player() then
				if object:get_entity_name() then
					if object:get_entity_name() == "mobs:dirt_monster" or object:get_entity_name() == "mobs:stone_monster" or object:get_entity_name() == "mobs:sand_monster" or object:get_entity_name() == "mobs:silver_sand_monster" or object:get_entity_name() == "mobs:desert_sand_monster" or object:get_entity_name() == "mobs:desert_stone_monster" or object:get_entity_name() == "mobs:snow_monster" or object:get_entity_name() == "mobs:ice_monster" or object:get_entity_name() == "mobs:green_monster" or object:get_entity_name() == "mobs:dry_grass_monster" or object:get_entity_name() == "mobs:rainforest_litter_monster" then
				        object:remove()
					end
				end
			end
		end
	end,
})
minetest.register_craftitem("tutorial:dna_string", {
	description = "DNA string",
	inventory_image = "tutorial_dna_string.png",
})
minetest.register_craftitem("tutorial:regnum_part", {
	description = "Regnumpart",
	inventory_image = "tutorial_regnum_part.png",
})
minetest.register_craftitem("tutorial:geschenkpapier_death", {
    description = "Death Wrapping paper",
	inventory_image = "tutorial_geschenkpapier_death.png",
})
minetest.register_craftitem("tutorial:regnum", {
	description = "Regnum",
	inventory_image = "tutorial_regnum.png",
})
minetest.register_craftitem("tutorial:waterbattleaxe", {
	description = "Waterbattleaxe",
	inventory_image = "tutorial_waterbattleaxe.png",
	stack_max = 1,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		if pointed_thing.type ~= "node" then
			return
		end
		local nodes = minetest.get_node(pointed_thing.under)
		local name = nodes.name
		if name == "default:water_source" then
		    minetest.add_node(pointed_thing.under, {name="air"})
		    inv:add_item("main", "default:water_source")
		end
	end,
})
minetest.register_craftitem("tutorial:lavabattleaxe", {
	description = "Lavabattleaxe",
	inventory_image = "tutorial_lavabattleaxe.png",
	stack_max = 1,
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		if pointed_thing.type ~= "node" then
			return
		end
		local nodes = minetest.get_node(pointed_thing.under)
		local name = nodes.name
		if name == "default:lava_source" then
		    minetest.add_node(pointed_thing.under, {name="air"})
		    inv:add_item("main", "default:lava_source")
		end
	end,
})
minetest.register_craftitem("tutorial:lila_erz1", {
	description = "Purple Lv.1",
	inventory_image = "tutorial_lila_erz1.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:lila_erz2", {
	description = "Purple Lv.2",
	inventory_image = "tutorial_lila_erz2.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:lila_erz3", {
	description = "Purple Lv.MAX",
	inventory_image = "tutorial_lila_erz3.png",
})
minetest.register_craftitem("tutorial:blau_erz", {
    description = "Blue",
	inventory_image = "tutorial_blau_erz.png",
})
minetest.register_craftitem("tutorial:rot_erz", {
    description = "Red",
	inventory_image = "tutorial_rot_erz.png",
})
minetest.register_craftitem("tutorial:titan", {
	description = "Titanium",
	inventory_image = "tutorial_titan.png",
})
minetest.register_craftitem("tutorial:admin", {
	description = "Admin",
	inventory_image = "tutorial_admin_ore.png",
})
minetest.register_craftitem("tutorial:geschenkpapier", {
    description = "Wrapping paper",
	inventory_image = "tutorial_geschenkpapier.png",
})
minetest.register_craftitem("tutorial:geld", {
	inventory_image = "tutorial_geld.png",
	description = "Super material",
})
minetest.register_craftitem("tutorial:stone_coal_lump", {
	description = "Stone coal lump",
	inventory_image = "tutorial_stone_coal_lump.png",
})
minetest.register_craftitem("tutorial:uranium1", {
	description = "Uranium lv.1",
	inventory_image = "tutorial_uranium1.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:uranium2", {
	description = "Uranium lv.2",
	inventory_image = "tutorial_uranium2.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:uranium3", {
	description = "Uranium lv.3",
	inventory_image = "tutorial_uranium3.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:uranium4", {
	description = "Uranium lv.4",
	inventory_image = "tutorial_uranium4.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:uranium5", {
	description = "Uranium lv.5",
	inventory_image = "tutorial_uranium5.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:uranium6", {
	description = "Uranium lv.6",
	inventory_image = "tutorial_uranium6.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:uranium7", {
	description = "Uranium lv.7",
	inventory_image = "tutorial_uranium7.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:uranium8", {
	description = "Uranium lv.8",
	inventory_image = "tutorial_uranium8.png",
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem("tutorial:uranium9", {
	description = "Uranium lv.MAX",
	inventory_image = "tutorial_uranium9.png",
})
minetest.register_craftitem( "tutorial:blackblock1", {
	description = "Black item lv.1",
	inventory_image = "tutorial_blackblock1.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:blackblock2", {
	description = "Black item lv.2",
	inventory_image = "tutorial_blackblock2.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:blackblock3", {
	description = "Black item lv.3",
	inventory_image = "tutorial_blackblock3.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:blackblock4", {
	description = "Black item lv.4",
	inventory_image = "tutorial_blackblock4.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:blackblock5", {
	description = "Black item lv.5",
	inventory_image = "tutorial_blackblock5.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:blackblock6", {
	description = "Black item lv.MAX",
	inventory_image = "tutorial_blackblock6.png",
	on_place_on_ground = minetest.craftitem_place_item,
})
minetest.register_craftitem( "tutorial:whiteblock1", {
	description = "White item lv.1",
	inventory_image = "tutorial_whiteblock1.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:whiteblock2", {
	description = "White item lv.2",
	inventory_image = "tutorial_whiteblock2.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:whiteblock3", {
	description = "White item lv.3",
	inventory_image = "tutorial_whiteblock3.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:whiteblock4", {
	description = "White item lv.4",
	inventory_image = "tutorial_whiteblock4.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:whiteblock5", {
	description = "White item lv.5",
	inventory_image = "tutorial_whiteblock5.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:whiteblock6", {
	description = "White item lv.MAX",
	inventory_image = "tutorial_whiteblock6.png",
	on_place_on_ground = minetest.craftitem_place_item,
})
minetest.register_craftitem("tutorial:white", {
	description = "White",
	inventory_image = "tutorial_white.png",
})
minetest.register_craftitem("tutorial:black", {
	description = "Black",
	inventory_image = "tutorial_black.png",
})
minetest.register_craftitem( "tutorial:superblock1", {
	description = "Super item lv.1",
	inventory_image = "tutorial_superblock1.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:superblock2", {
	description = "Super item lv.2",
	inventory_image = "tutorial_superblock2.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:superblock3", {
	description = "Super item lv.3",
	inventory_image = "tutorial_superblock3.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:superblock4", {
	description = "Super item lv.4",
	inventory_image = "tutorial_superblock4.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:superblock5", {
	description = "Super item lv.5",
	inventory_image = "tutorial_superblock5.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:superblock6", {
	description = "Super item lv.6",
	inventory_image = "tutorial_superblock6.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:superblock7", {
	description = "Super item lv.7",
	inventory_image = "tutorial_superblock7.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:superblock8", {
	description = "Super item lv.8",
	inventory_image = "tutorial_superblock8.png",
	on_place_on_ground = minetest.craftitem_place_item,
	groups = {not_in_creative_inventory=1},
})
minetest.register_craftitem( "tutorial:superblock9", {
	description = "Super item lv.MAX",
	inventory_image = "tutorial_superblock9.png",
	on_place_on_ground = minetest.craftitem_place_item,
})
minetest.register_craftitem("tutorial:blades",{
	description = "Helicopter Blades",
	inventory_image = "helicopter_blades_inv.png",
})
minetest.register_craftitem("tutorial:cabin",{
	description = "Cabin for Helicopter",
	inventory_image = "helicopter_cabin_inv.png",
})
minetest.register_craftitem("tutorial:heli", {
	description = "Helicopter",
	inventory_image = "helicopter_heli_inv.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		if minetest.get_node(pointed_thing.above).name ~= "air" then
			return
		end
		minetest.add_entity(pointed_thing.above, "helicopter:heli")
		if not (creative_exists and placer and
				creative.is_enabled_for(placer:get_player_name())) then
			itemstack:take_item()
		end
		return itemstack
	end,
})