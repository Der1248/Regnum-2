--[[

Bags for Minetest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-particles
License: GPLv3

]]--


-- get_formspec
local get_formspec = function(player,page)
	if page=="bags" then
		local player_inv = player:get_inventory()
		return "size[8,10.3]"
			.."list[current_player;main;0,6.25;8,1;]"
		    .."list[current_player;main;0,7.5;8,3;8]"
            .."background[8,10.3;1,1;gui_formbg.png;true]"
            .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
            .."bgcolor[#080808BB;true]"
			.."button[0,0;2,0.5;inven;Back]"
			.."button[2,0;2,0.5;main;Main]"
			.."button[0,2;2,0.5;bag1;Bag 1]"
			.."button[2,2;2,0.5;bag2;Bag 2]"
			.."button[4,2;2,0.5;bag3;Bag 3]"
			.."button[6,2;2,0.5;bag4;Bag 4]"
			.."button[0,5;2,0.5;bag5;Bag 5]"
			.."button[2,5;2,0.5;bag6;Bag 6]"
			.."button[4,5;2,0.5;bag7;Bag 7]"
			.."button[6,5;2,0.5;bag8;Bag 8]"
            .."image[0.5,1;1,1;bags_trolley_admin.png]"
            .."image[2.5,1;1,1;bags_trolley_admin.png]"
            .."image[4.5,1;1,1;bags_trolley_admin.png]"
            .."image[6.5,1;1,1;bags_trolley_admin.png]"
            .."image[0.5,4;1,1;bags_trolley_admin.png]"
            .."image[2.5,4;1,1;bags_trolley_admin.png]"
            .."image[4.5,4;1,1;bags_trolley_admin.png]"
            .."image[6.5,4;1,1;bags_trolley_admin.png]"
	end
	for i=1,8 do
		if page=="bag"..i then
            player:get_inventory():set_size("bag"..i.."contents", 48)
			local image = player:get_inventory():get_stack("bag"..i, 1):get_definition().inventory_image
			return "size[8,11.5]"
                .."background[8,11.5;1,1;gui_formbg.png;true]"
                .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
                .."bgcolor[#080808BB;true]"
                .."list[current_player;main;0,7.5;8,1;]"
		        .."list[current_player;main;0,8.75;8,3;8]"
				.."button[0,0;2,0.75;bags;Back]"
				.."button[2,0;2,0.75;main;Main]"
				.."image[7,0;1,1;bags_trolley_admin.png]"
				.."list[current_player;bag"..i.."contents;0,1;8,8;]"
				.."listring[current_player;bag"..i.."contents]" 
				.."listring[current_player;main]"
		end
	end
end


-- register_on_player_receive_fields
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.bags then
		inventory_plus.set_inventory_formspec(player, get_formspec(player,"bags"))
		return
	end
	for i=1,8 do
		local page = "bag"..i
		if fields[page] then
			inventory_plus.set_inventory_formspec(player, get_formspec(player,page))
			return
		end
	end
end)

-- register_on_joinplayer
minetest.register_on_joinplayer(function(player)
	local player_inv = player:get_inventory()
	local bags_inv = minetest.create_detached_inventory(player:get_player_name().."_bags",{
		on_put = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, stack)
			player:get_inventory():set_size(listname.."contents", 48)
		end,
		on_take = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, nil)
		end,
		allow_put = function(inv, listname, index, stack, player)
		    return 1
		end,
		allow_take = function(inv, listname, index, stack, player)
			if player:get_inventory():is_empty(listname.."contents")==true then
				return stack:get_count()
			else
				return 0
			end
		end,
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
	})
	for i=1,8 do
		local bag = "bag"..i
		player_inv:set_size(bag, 1)
		bags_inv:set_size(bag, 1)
		bags_inv:set_stack(bag,1,player_inv:get_stack(bag,1))
	end
end)

-- log that we started
minetest.log("action", "[MOD]"..minetest.get_current_modname().." -- loaded from "..minetest.get_modpath(minetest.get_current_modname()))
