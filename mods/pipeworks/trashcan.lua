minetest.register_node("pipeworks:trashcan", {
	description = "Trash Can", 
	drawtype = "normal", 
	tiles = {
		"pipeworks_trashcan_bottom.png",
		"pipeworks_trashcan_bottom.png",
		"pipeworks_trashcan_side.png",
		"pipeworks_trashcan_side.png",
		"pipeworks_trashcan_side.png",
		"pipeworks_trashcan_side.png",
	}, 
	groups = {snappy = 3, tubedevice = 1, tubedevice_receiver = 1}, 
	tube = {
		insert_object = function(pos, node, stack, direction)
			return ItemStack("")
		end,
		connect_sides = {left = 1, right = 1, front = 1, back = 1, top = 1, bottom = 1},
		priority = 1, -- Lower than anything else
	}, 
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,7]"..
				"item_image[0,0;1,1;pipeworks:trashcan]"..
				"label[1,0;Trash Can]"..
				"list[current_name;trash;3.5,1;1,1;]"..
				"list[current_player;main;0,3;8,4;]")
		meta:set_string("infotext", "Trash Can")
		meta:get_inventory():set_size("trash", 1)
	end, 
	after_place_node = function(pos)
		pipeworks.scan_for_tube_objects(pos)
	end,
	after_dig_node = function(pos)
		pipeworks.scan_for_tube_objects(pos)
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.get_meta(pos):get_inventory():set_stack(listname, index, ItemStack(""))
	end,
})
