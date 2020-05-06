--v.2.0.0
local ach3 = {}
ach3.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
    player_inv:set_size("year", 2)
	local year = player_inv:get_stack("year", 1):get_count()
	local year2 = player_inv:get_stack("year", 2):get_count()
    local d = 0
    if year == 1 then
        d = d+1
    end
	if year2 == 1 then
        d = d+1
    end
    formspec= "size[10.5,11.3]"
        .."background[10.5,11.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[0,0;2,0.5;ach;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."label[0.8,1.1;One year Trophy]"
		.."label[0.8,1.9;Two years Trophy]"
        .."label[5.5,0;"..d.."/2]"
        .."image[0,1;0.8,0.8;tutorial_"..year..".png]"
		.."image[0,1.8;0.8,0.8;tutorial_"..year2..".png]"
	return formspec
end
minetest.register_on_joinplayer(function(player)
	minetest.setting_set("disable_anticheat", "true")
    minetest.setting_set("bones_mode", "keep")
    minetest.setting_set("time_speed", "0")
    minetest.set_timeofday(0.5)
end)
minetest.register_on_player_receive_fields(function(player, formname, fields)
    local player_inv = player:get_inventory()
    if fields.gem then
        inventory_plus.set_inventory_formspec(player, gem.get_formspec(player))
    end
	if fields.achc then
        local player_inv = player:get_inventory()
        player_inv:set_size("year", 2)
        if player:get_inventory():contains_item("main", "tutorial:trophy_year1") then
            player_inv:set_stack("year", 1,"tutorial:dirt")
		end
		if player:get_inventory():contains_item("main", "tutorial:trophy_year2") then
            player_inv:set_stack("year", 2,"tutorial:dirt")
		end
		inventory_plus.set_inventory_formspec(player, ach3.get_formspec(player))
	end
end)

local rg15 = {}
rg15.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;II. 4. Ores]"
        .."label[0,1.3;You can find ores in the depth.]"
        .."label[0,1.6;Where to find ores:]"
        .."label[0,1.9;Silver: y < -2]"
        .."label[0,2.2;Mithril: y < -512]"
        .."label[0,2.5;Tin: y < 8]"
        .."label[0,2.8;Coal: y < 0]"
        .."label[0,3.1;Iron: y < 2]"
        .."label[0,3.4;Mese: y < -64]"
        .."label[0,3.7;Gold: y < -64]"
        .."label[0,4.0;Diamond: y < -128]"
        .."label[0,4.3;Copper: y < ?]"
        .."label[0,4.6;Black/White: y < 2]"
        .."label[0,4.9;Uranium: y < -128]"
        .."label[0,5.2;Admin: y < -500]"
        .."label[0,5.5;Titan: y < -400]"
        .."label[0,5.8;Rot/Blau: y < -100]"
        .."label[0,6.1;Regnum: y < -600]"
        .."label[0,6.4;Ruby/Sapphire: y < -300]"
        .."label[0,6.7;Amethyst: y < -600]"
        .."label[0,7.0;Shadow/Pearl: y < -900]"
        .."label[0,7.3;Emerald: y < -1200]"
        .."button[2,10;   2,0.5;rg14;<]"
        .."button[4,10;   2,0.5;rg16;>]"
	return formspec		
end
local rg16 = {}
rg16.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;II. 5. Wings]"
        .."label[0,1.3;There are over 120 differend wings]"
        .."label[0,1.6;Here you can see witch kind of wings you have to craft:]"
        .."label[0,1.9;(starter)]"
        .."label[0,2.2;mega lv.1-20]"
        .."label[0,2.5;cloud lv.1-20]"
        .."label[0,2.8;super lv.1-4]"
        .."label[0,3.1;uranium lv.1-2]"
        .."label[0,3.4;energie lv.1-12]"
        .."label[0,3.7;superenergy lv.1-7]"
        .."label[0,4.0;crystal lv.1-5]"
        .."label[0,4.3;ultra lv.1-25]"
        .."label[0,4.6;superultra]"
        .."label[0,4.9;arena lv.1-4]"
        .."label[0,5.2;titan lv.1-10]"
        .."label[0,5.5;legendary lv.1-6]"
        .."label[0,5.8;superlegendary]"
        .."label[0,6.1;regnum]"
        .."label[0,6.4;There are differend modes for the superlegendary wings]"
        .."label[0,6.7;and also for the regnum:]"
        .."label[0,7.0;With the wings you can ...]"
        .."button[2,10;   2,0.5;rg15;<]"
        .."button[4,10;   2,0.5;rg17;>]"
	return formspec		
end
local rg17 = {}
rg17.get_formspec = function(player, pos)
    if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;II. 6. Chat commands]"
        .."label[0,1.3;/admin for all admin tools]"
        .."label[0,1.6;/regnum for all regnum things]"
        .."label[0,1.9;/rank to see your rank]"
        .."button[2,10;   2,0.5;rg16;<]"
	return formspec		
end
--v.1.13.0
minetest.register_on_dignode(function(pos, node, player)
	if player == nil then
        return
    end	
	local name = player:get_player_name()
	local inv = player:get_inventory()
    if node.name == "tutorial:geschenk" then
        local x = math.random(1, 29)
        if x < 10 then
            inv:add_item("main", "tutorial:lightstone 1")
        elseif x < 18 then
            inv:add_item("main", "default:mese_crystal_fragment 2")
        elseif x < 24 then
            inv:add_item("main", "default:ice")
        elseif x < 27 then
            inv:add_item("main", "tutorial:dunklematerie4")
        else
            inv:add_item("main", "tutorial:geschenk")
        end
	end
    if node.name == "tutorial:geschenk_silber" then
        local x = math.random(1, 20)
        if x < 10 then
            inv:add_item("main", "tutorial:lightstone 2")
        elseif x < 18 then
            inv:add_item("main", "default:mese_crystal_fragment 4")
        elseif x < 20 then
            inv:add_item("main", "tutorial:arena_block")
        else
            inv:add_item("main", "tutorial:arena_glass")
        end
	end
    if node.name == "tutorial:geschenk_gold" then
        local x = math.random(1, 17)
        if x < 2 then
            inv:add_item("main", "mobs:dirt_monster_egg")
        elseif x < 3 then
            inv:add_item("main", "mobs:stone_monster_egg")
        elseif x < 4 then
            inv:add_item("main", "mobs:sand_monster_egg")
        elseif x < 5 then
            inv:add_item("main", "mobs:desert_sand_monster_egg")
        elseif x < 6 then
            inv:add_item("main", "mobs:snow_monster_egg")
        elseif x < 7 then
            inv:add_item("main", "mobs:desert_stone_monster_egg")
        elseif x < 8 then
            inv:add_item("main", "mobs:ice_monster_egg")
        elseif x < 9 then
            inv:add_item("main", "mobs:grass_monster_egg")
        elseif x < 10 then
            inv:add_item("main", "mobs:rainforest_litter_monster_egg")
        elseif x < 11 then
            inv:add_item("main", "mobs:dry_grass_monster_egg")
        elseif x < 12 then
            inv:add_item("main", "mobs:silver_sand_monster_egg")
        else
            inv:add_item("main", "default:mese_crystal")
        end
	end
    if node.name == "tutorial:geschenk_platin" then
        local x = math.random(1, 10)
        if x < 5 then
            inv:add_item("main", "default:mese_crystal 2")
        elseif x < 8 then
            inv:add_item("main", "tutorial:geschenk_wool")
        elseif x < 10 then
            inv:add_item("main", "tutorial:geschenk_wool1")
        else
            inv:add_item("main", "tutorial:geschenk_wool2")
        end
	end
    if node.name == "tutorial:geschenk_wool1" then
        local x = math.random(1, 6)
        if x == 1 then
            inv:add_item("main", "wool:yellow 2")
        elseif x == 2 then
            inv:add_item("main", "wool:white 2")
        elseif x == 3 then
            inv:add_item("main", "wool:violet 2")
        elseif x == 4 then
            inv:add_item("main", "wool:red 2")
        elseif x == 5 then
            inv:add_item("main", "wool:orange 2")
        else
            inv:add_item("main", "wool:blue 2")
        end
	end
    if node.name == "tutorial:geschenk_wool2" then
        local x = math.random(1, 15)
        if x == 1 then
            inv:add_item("main", "wool:yellow 3")
        elseif x == 2 then
            inv:add_item("main", "wool:white 3")
        elseif x == 3 then
            inv:add_item("main", "wool:violet 3")
        elseif x == 4 then
            inv:add_item("main", "wool:red 3")
        elseif x == 5 then
            inv:add_item("main", "wool:pink 3")
        elseif x == 6 then
            inv:add_item("main", "wool:orange 3")
        elseif x == 7 then
            inv:add_item("main", "wool:magenta 3")
        elseif x == 8 then
            inv:add_item("main", "wool:grey 3")
        elseif x == 9 then
            inv:add_item("main", "wool:green 3")
        elseif x == 10 then
            inv:add_item("main", "wool:dark_grey 3")
        elseif x == 11 then
            inv:add_item("main", "wool:dark_green 3")
        elseif x == 12 then
            inv:add_item("main", "wool:cyan 3")
        elseif x == 13 then
            inv:add_item("main", "wool:brown 3")
        elseif x == 14 then
            inv:add_item("main", "wool:blue 3")
        else
            inv:add_item("main", "wool:black 3")
        end
	end
end)
local rg12 = {}
rg12.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;II. 1. Gifts]"
        .."label[0,1.3;Craft gifts to get nice differend things.]"
        .."label[0,1.6;Gift: gift, dark matter Lv.4, ice, mese, lightstone]"
        .."label[0,1.9;Gift (silver): arena glass, arena block, mese, lightstone, gift]"
        .."label[0,2.2;Gift (gold): dirt/sand/stone monster spawn-egg, mese]"
        .."label[0,2.5;Gift (platinum): wool gift, colored wool gift lv.1/2]"
        .."label[0,2.8;Deathgift: mese, lightstone, ice, deathgift, regnum part]"
        .."label[0,3.1;Deathgift (silver): mese, lightstone, ice, deathgift, regnum part]"
        .."label[0,3.4;Deathgift (gold): mese, lightstone, ice, deathgift, regnum part]"
        .."label[0,3.7;Deathgift (platinum): mese, lightstone, ice, deathgift, regnum part]"
        .."label[0,4.0;Gift (DNA): every spawn-egg (but no monsters)]"
        .."label[0,4.3;Wool gift: white wool]"
        .."label[0,4.6;Colored wool gift lv.1: yellow/white/violetta/red/orange/blue wool]"
        .."label[0,4.9;Colored wool gift lv.2: every wool]"
        .."button[2,10;   2,0.5;rg11;<]"
        .."button[4,10;   2,0.5;rg13;>]"
	return formspec		
end
local rg13 = {}
rg13.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;II. 2. Mobs]"
        .."label[0,1.3;There are monsters, animals and pets in Regnum 2]"
        .."label[0,1.6;The monster will kill you, but you can get wrapping paper and DNA strings]"
        .."label[0,1.9;You can get water and sky animals from the dna gift.]"
        .."label[0,2.2;There are turtles, sharks, gulls and many other.]"
        .."label[0,2.5;If you use the DNA craft you can get pets.]"
        .."label[0,2.8;You can chage the color of the pets and they can folow you.]"
        .."button[2,10;   2,0.5;rg12;<]"
        .."button[4,10;   2,0.5;rg14;>]"
	return formspec		
end
local rg14 = {}
rg14.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;II. 3. Xp & Level]"
        .."label[0,1.3;If you dig some things you can get Xp]"
        .."label[0,1.6;There is 1 differend kind of Xp:]"
        .."label[0,1.9;bronze Xp.]"
        .."label[0,2.2;If you dig precious metal you will get 1 bronze Xp]"
        --.."label[0,2.5;If you reach level green 100, you will get the lilabattleaxe.]"
        .."label[0,2.5;Look in the xp guide for your xp and how much xp you need.]"
        .."label[0,2.8;If you reach a new level you will get a reward]"
        .."label[0,3.1;Look in Xp items for the reward]"
        .."button[2,10;   2,0.5;rg13;<]"
        .."button[4,10;   2,0.5;rg15;>]"
	return formspec		
end
--v.1.12.0
local rg9 = {}
rg9.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 7. Achievements]"
        .."label[0,1.3;comming soon]"
        .."button[2,10;   2,0.5;rg8;<]"
        .."button[4,10;   2,0.5;rg10;>]"
	return formspec		
end
local rg10 = {}
rg10.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 8. Regnum Guide]"
        .."label[0,1.3;You can read something about the subgame]"
        .."label[0,1.6;How to use Regnum Guide:]"
        .."label[0,1.9;1. Read]"
        .."button[2,10;   2,0.5;rg9;<]"
        .."button[4,10;   2,0.5;rg11;>]"
	return formspec		
end
local rg11 = {}
rg11.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 9. Xp items]"
        .."label[0,1.3;Here you can get your rewards if you reach a new level.]"
        .."label[0,1.6;How to use Xp items:]"
        .."label[0,1.9;1. Reach a new level]"
        .."label[0,2.2;2. Take coins from the 1st page]"
        .."label[0,2.5;3. Take bronze level blocks from the 2nd page]"
        .."button[2,10;   2,0.5;rg10;<]"
        .."button[4,10;   2,0.5;rg12;>]"
	return formspec		
end
--v.1.11.1
--v.1.11.0
local rg8 = {}
rg8.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 6. Craft Guide]"
        .."label[0,1.3;Here you can see how to craft items]"
        .."label[0,1.6;Click on one item to see the crafting]"
        .."label[0,1.9;You can also see 4x4 and 5x5 craftings,]"
        .."label[0,2.2;You can see the craftings for wings]"
        .."label[0,2.5;in the Regnum Craft Guide.]"
        .."label[0,2.8;How to use Craft guide:]"
        .."label[0,3.1;1. Click on one item and you see the crafting above]"
        .."label[0,3.4;2. Click on the arrows below to switch to an other page]"
        .."label[0,3.7;3. Click on the arrows below 'main' to see the last]"
        .."label[0,4.0;   crafting you use]"
        .."label[0,4.3;4. Click on the arrows above and below the item to see]"
        .."label[0,4.6;   differend craftings for the same things]"
        .."label[0,4.9;5. Click on the 'Regnum' for wings crafts]"
        .."button[2,10;   2,0.5;rg7;<]"
        .."button[4,10;   2,0.5;rg9;>]"
	return formspec		
end
local xpi0 = {}
xpi0.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    local xpi01_inv = minetest.create_detached_inventory(player:get_player_name().."_xpi01",{
        on_take = function(inv, listname, index, stack, player)
			player:get_inventory():remove_item(listname,stack)
		end,
		allow_put = function(inv, listname, index, stack, player)
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			return stack:get_count()
		end,
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
	})
	xpi01_inv:set_size("xpi01", 15)
	player_inv:set_size("xpi01", 15)
    for i=1, 15 do
		local stack = player_inv:get_stack("xpi01", i)
		xpi01_inv:set_stack("xpi01", i, stack)
    end
	formspec = "size[18,12.3]"
	    .."button[0,0;2,0.5;inven;Back]"
	    .."button[2,0;2,0.5;main;Main]"
        .."list[current_player;main;5,7.5;8,1;]"
		.."list[current_player;main;5,8.75;8,3;8]"
        .."background[18,12.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
        .."list[detached:"..player:get_player_name().."_xpi01;xpi01;3,1.5;5,1]"
        .."listring[current_player;main]" 
	    .."listring[detached:"..player:get_player_name().."_xpi01;xpi01]"
        .."label[3,1.1;Bronze Xp Items]"
        .."button[9,12;2,0.5;xpi;>]"
	return formspec		
end
local xpi = {}
xpi.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    local xpi1_inv = minetest.create_detached_inventory(player:get_player_name().."_xpi1",{
        on_take = function(inv, listname, index, stack, player)
			player:get_inventory():remove_item(listname,stack)
		end,
		allow_put = function(inv, listname, index, stack, player)
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			return stack:get_count()
		end,
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
	})
	xpi1_inv:set_size("xpi1", 100)
	player_inv:set_size("xpi1", 100)
    for i=1, 100 do
		local stack = player_inv:get_stack("xpi1", i)
		xpi1_inv:set_stack("xpi1", i, stack)
    end
	formspec = "size[18,12.3]"
	    .."button[0,0;2,0.5;inven;Back]"
	    .."button[2,0;2,0.5;main;Main]"
        .."list[current_player;main;5,7.5;8,1;]"
		.."list[current_player;main;5,8.75;8,3;8]"
        .."background[18,12.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
        .."list[detached:"..player:get_player_name().."_xpi1;xpi1;0,1.3;18,6]"
        .."listring[current_player;main]" 
	    .."listring[detached:"..player:get_player_name().."_xpi1;xpi1]"
        .."label[0,0.7;Bronze Level Blocks]"
        .."button[7,12;2,0.5;xpi0;<]"
	return formspec		
end

local rg6 = {}
rg6.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 4. Crafting]"
        .."label[0,1.3;There are 4 differend crafts:]"
        .."label[0,1.6;The '4x4 craft' to craft in a 4x4 field]"
        .."label[0,1.9;The '5x5 craft' to craft in a 5x5 field]"
        .."label[0,2.2;The DNA craft to get mobs]"
        .."label[0,2.5;The Cooking craft, works like furnaces but without fuel]"
        .."label[0,2.8;Look in the Craft Guide which item you can craft in 4x4 and 5x5]"
        .."label[0,3.1;DNA craft will come soon]"
        .."label[0,3.4;For Cooking use uranium to get fuel]"
        .."label[0,3.7;How to use Crafting:]"
        .."label[0,4.0;1. put the needed items in the fields]"
        .."label[0,4.3;3. Press 'craft']"
        .."button[2,10;   2,0.5;rg5;<]"
        .."button[4,10;   2,0.5;rg7;>]"
	return formspec		
end
local rg7 = {}
rg7.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 5. Skins]"
        .."label[0,1.3;Here you can change your skin]"
        .."label[0,1.6;Click on one skin to change your skin]"
        .."label[0,1.9;You can use the see-through and knight skins]"
        .."label[0,2.2;How to use Skins:]"
        .."label[0,2.5;1. Click on one skin]"
        .."button[2,10;   2,0.5;rg6;<]"
        .."button[4,10;   2,0.5;rg8;>]"
	return formspec		
end
local rg2 = {}
rg2.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;                                     CONTENS]"
        .."label[0,1.3; I. Inventory]"
        .."label[0,1.6;   1. Bags]"
        .."label[0,1.9;   2. Armor]"
        .."label[0,2.2;   3. XP Guide]"
        .."label[0,2.5;   4. Crafting]"
        .."label[0,2.8;   5. Skins]"
        .."label[0,3.1;   6. Craft Guide]"
        .."label[0,3.4;   7. Achievements]"
        .."label[0,3.7;   8. Regnum guide]"
        .."label[0,4.0;   9. Xp items]"
        .."label[0,4.3; II. Game]"
        .."label[0,4.6;   1. Gifts]"
        .."label[0,4.9;   2. Mobs]"
        .."label[0,5.2;   3. Xp & Level]"
        .."label[0,5.5;   4. Ores]"
        .."label[0,5.8;   5. Wings]"
        .."label[0,6.1;   6. Chat commands]"
        .."button[2,10;   2,0.5;rg;<]"
        .."button[4,10;   2,0.5;rg3;>]"
	return formspec		
end
local rg3 = {}
rg3.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 1. Bags]"
        .."label[0,1.3;You can use bags to take more things with you.]"
        .."label[0,1.6;You can have up to eight bags.]"
        .."label[0,1.9;How to use bags:]"
        .."label[0,2.2;1. use the button below a bag.]"
        .."label[0,2.5;2. You can put your items in the new inventory.]"
        .."label[0,2.8;3. You can use shift to move items quickly (as you use for chests)]"
        .."button[2,10;   2,0.5;rg2;<]"
        .."button[4,10;   2,0.5;rg4;>]"
	return formspec		
end
local rg4 = {}
rg4.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 2. Armor]"
        .."label[0,1.3;You can use armor to save you from monsters.]"
        .."label[0,1.6;There are 5 differend armor parts.]"
        .."label[0,1.9;Make your armor invisible to other.]"
        .."label[0,2.2;Some armor will also save you from lava and fire]"
        .."label[0,2.5;and there is also armor that regenerate you.]"
        .."label[0,2.8;How to use Armor:]"
        .."label[0,3.1;1. You have to craft some armor (look in the craft guide how).]"
        .."label[0,3.4;2. You can see five fields on the left.]"
        .."label[0,3.7;3. You have to put the helmet at the top and the boots at the bottom.(like in minecraft)]"
        .."label[0,4.0;4. You have to put the shield in the right field]"
        .."label[0,4.3;5. you can press 'armor off']"
        .."button[2,10;   2,0.5;rg3;<]"
        .."button[4,10;   2,0.5;rg5;>]"
	return formspec		
end
local rg5 = {}
rg5.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."label[0,1;I. 3. XP Guide]"
        .."label[0,1.3;If you dig precious metal, you will get xp.]"
        .."label[0,1.6;Use the Xp Guide to see how many xp you have]"
        .."label[0,1.9;You can also see how many xp you need for the next level.]"
        .."label[0,2.2;How to use Xp Guide:]"
        .."label[0,2.5;1. On the left you can see how many xp you have]"
        .."label[0,2.8;2. You can also press 'xp bronze you need']"
        .."button[2,10;   2,0.5;rg4;<]"
        .."button[4,10;   2,0.5;rg6;>]"
	return formspec		
end
--v.1.8.0
local rg = {}
rg.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[9,10.3]"
	    .."button[0,0;2,0.5;inven;Back]"
	    .."button[2,0;2,0.5;main;Main]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
	    .."label[0,1;This is the first page of the Regnum guide.]"
        .."label[0,1.3;Here you can get some basic informations]"
        .."label[0,1.6;about my subgame: Regnum 2]"
        .."label[0,1.9;In the next version (1.1.0) there will be:]"
        .."label[0,2.2;color stick function]"
        .."label[0,2.5;bronzekey function]"
        .."label[0,2.8;?new xp?]"
        .."label[0,3.1;?new achievements?]"
        .."button[4,10;2,0.5;rg2;>]"
	return formspec		
end
minetest.register_on_dignode(function(pos, node, player)
	if player == nil then
        return
    end	
	local name = player:get_player_name()
	local inv = player:get_inventory()
	if node.name == "tutorial:geschenk_dna" then
		local x = math.random(0,15)
		print (x)
		if x == 0 then
			inv:add_item("main", "mobs:watermob_crocodile_lg_egg")
		elseif x == 1 then
			inv:add_item("main", "mobs:watermob_crocodile_md_egg")
		elseif x == 2 then
			inv:add_item("main", "mobs:watermob_crocodile_sm_egg")
		elseif x == 3 then
			inv:add_item("main", "mobs:watermob_clownfish_egg")
		elseif x == 4 then
			inv:add_item("main", "mobs:watermob_tropical_fish_egg")
		elseif x == 5 then
			inv:add_item("main", "mobs:watermob_jellyfish_egg")
		elseif x == 6 then
			inv:add_item("main", "mobs:watermob_shark_sm_egg")
		elseif x == 7 then
			inv:add_item("main", "mobs:watermob_shark_md_egg")
		elseif x == 8 then
			inv:add_item("main", "mobs:watermob_shark_lg_egg")
		elseif x == 9 then
			inv:add_item("main", "mobs:watermob_turtle_lg_egg")
		elseif x == 10 then
			inv:add_item("main", "mobs:watermob_turtle_sm_egg")
		elseif x == 11 then
			inv:add_item("main", "mobs:skymob_butterfly_egg")
		elseif x == 12 then
			inv:add_item("main", "mobs:skymob_gull_egg")
		elseif x == 13 then
			inv:add_item("main", "mobs:skymob_bird_sm_egg")
		elseif x == 14 then
			inv:add_item("main", "mobs:skymob_bird_lg_egg")
		elseif x == 15 then
			inv:add_item("main", "mobs:skymob_bat_egg")
		end
	end
end)
--v.1.6.0
local dna = {}
dna.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[8,9.5]"
        .."background[8,9.5;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[0,0;2,0.5;cr;Back]"
		.."button[2,0;2,0.5;main;Main]"
		.."label[0,1;comming soon]"
	return formspec		
end
local color = {}
color.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    player_inv:set_size("dye", 15)
    player_inv:set_size("colordye", 1)
    player_inv:set_size("stickdye", 1)
    local black = player_inv:get_stack("dye", 1):get_count()
    local blue = player_inv:get_stack("dye", 2):get_count()
    local brown = player_inv:get_stack("dye", 3):get_count()
    local cyan = player_inv:get_stack("dye", 4):get_count()
    local dgreen = player_inv:get_stack("dye", 5):get_count()
    local dgrey = player_inv:get_stack("dye", 6):get_count()
    local green = player_inv:get_stack("dye", 7):get_count()
    local grey = player_inv:get_stack("dye", 8):get_count()
    local magenta = player_inv:get_stack("dye", 9):get_count()
    local orange = player_inv:get_stack("dye", 10):get_count()
    local pink = player_inv:get_stack("dye", 11):get_count()
    local red = player_inv:get_stack("dye", 12):get_count()
    local violet = player_inv:get_stack("dye", 13):get_count()
    local white = player_inv:get_stack("dye", 14):get_count()
    local yellow = player_inv:get_stack("dye", 15):get_count()

	formspec = "size[8,9.5]"
        .."background[6,5.5;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[0,0;2,0.5;cr;Back]"
		.."button[2,0;2,0.5;main;Main]"
		.."label[0,1;Black:]"
        .."label[0,1.3;Blue:]"
        .."label[0,1.6;Brown:]"
        .."label[0,1.9;Cyan:]"
        .."label[0,2.2;Dark Green:]"
        .."label[1,1;"..black.."]"
        .."label[1,1.3;"..blue.."]"
        .."label[1,1.6;"..brown.."]"
        .."label[1,1.9;"..cyan.."]"
        .."label[1,2.2;"..dgreen.."]"

        .."label[2,1;Dark Grey:]"
        .."label[2,1.3;Green:]"
        .."label[2,1.6;Grey:]"
        .."label[2,1.9;Magenta:]"
        .."label[2,2.2;Orange:]"
        .."label[3,1;"..dgrey.."]"
        .."label[3,1.3;"..green.."]"
        .."label[3,1.6;"..grey.."]"
        .."label[3,1.9;"..magenta.."]"
        .."label[3,2.2;"..orange.."]"

        .."label[4,1;Pink:]"
        .."label[4,1.3;Red:]"
        .."label[4,1.6;Violet:]"
        .."label[4,1.9;White:]"
        .."label[4,2.2;Yellow:]"
        .."label[5,1;"..pink.."]"
        .."label[5,1.3;"..red.."]"
        .."label[5,1.6;"..violet.."]"
        .."label[5,1.9;"..white.."]"
        .."label[5,2.2;"..yellow.."]"
        .."list[current_player;main;0,5.5;8,1;]"
		.."list[current_player;main;0,6.75;8,3;8]"

        .."list[current_player;colordye;1,3;1,1;]"
        .."list[current_player;stickdye;3,3;1,1;]"
        .."button[0.5,4;2,0.5;colordye;Get Dye (MAX)]"
        .."button[2.5,4;2,0.5;stickdye;Fill Colorstick]"
	return formspec		
end
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.dna then
		inventory_plus.set_inventory_formspec(player, dna.get_formspec(player))
	end
    if fields.xpi0 then
		inventory_plus.set_inventory_formspec(player, xpi0.get_formspec(player))
	end
    if fields.xpi then
		inventory_plus.set_inventory_formspec(player, xpi.get_formspec(player))
	end
    if fields.rg then
		inventory_plus.set_inventory_formspec(player, rg.get_formspec(player))
	end
    if fields.color then
		inventory_plus.set_inventory_formspec(player, color.get_formspec(player))
	end
    if fields.rg2 then
		inventory_plus.set_inventory_formspec(player, rg2.get_formspec(player))
	end
    if fields.rg3 then
		inventory_plus.set_inventory_formspec(player, rg3.get_formspec(player))
	end
    if fields.rg4 then
		inventory_plus.set_inventory_formspec(player, rg4.get_formspec(player))
	end
    if fields.rg5 then
		inventory_plus.set_inventory_formspec(player, rg5.get_formspec(player))
	end
    if fields.rg6 then
		inventory_plus.set_inventory_formspec(player, rg6.get_formspec(player))
	end
    if fields.rg7 then
		inventory_plus.set_inventory_formspec(player, rg7.get_formspec(player))
	end
    if fields.rg8 then
		inventory_plus.set_inventory_formspec(player, rg8.get_formspec(player))
	end
    if fields.rg9 then
		inventory_plus.set_inventory_formspec(player, rg9.get_formspec(player))
	end
    if fields.rg10 then
		inventory_plus.set_inventory_formspec(player, rg10.get_formspec(player))
	end
    if fields.rg11 then
		inventory_plus.set_inventory_formspec(player, rg11.get_formspec(player))
	end
    if fields.rg12 then
		inventory_plus.set_inventory_formspec(player, rg12.get_formspec(player))
	end
    if fields.rg13 then
		inventory_plus.set_inventory_formspec(player, rg13.get_formspec(player))
	end
    if fields.rg14 then
		inventory_plus.set_inventory_formspec(player, rg14.get_formspec(player))
	end
    if fields.rg15 then
		inventory_plus.set_inventory_formspec(player, rg15.get_formspec(player))
	end
    if fields.rg16 then
		inventory_plus.set_inventory_formspec(player, rg16.get_formspec(player))
	end
    if fields.rg17 then
		inventory_plus.set_inventory_formspec(player, rg17.get_formspec(player))
	end
    if fields.colordye then
        local player_inv = player:get_inventory()
        local d = 0
        while d == 0 do
            local colordye = player_inv:get_stack("colordye", 1):get_name()
            if colordye == "dye:black" then
                player_inv:set_stack("dye", 1,"default:dirt "..(player_inv:get_stack("dye", 1):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:black "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:blue" then
                player_inv:set_stack("dye", 2,"default:dirt "..(player_inv:get_stack("dye", 2):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:blue "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:brown" then
                player_inv:set_stack("dye", 3,"default:dirt "..(player_inv:get_stack("dye", 3):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:brown "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:cyan" then
                player_inv:set_stack("dye", 4,"default:dirt "..(player_inv:get_stack("dye", 4):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:cyan "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:dark_green" then
                player_inv:set_stack("dye", 5,"default:dirt "..(player_inv:get_stack("dye", 5):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:dark_green "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:dark_grey" then
                player_inv:set_stack("dye", 6,"default:dirt "..(player_inv:get_stack("dye", 6):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:dark_grey "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:green" then
                player_inv:set_stack("dye", 7,"default:dirt "..(player_inv:get_stack("dye", 7):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:green "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:grey" then
                player_inv:set_stack("dye", 8,"default:dirt "..(player_inv:get_stack("dye", 8):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:grey "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:magenta" then
                player_inv:set_stack("dye", 9,"default:dirt "..(player_inv:get_stack("dye", 9):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:magenta "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:orange" then
                player_inv:set_stack("dye", 10,"default:dirt "..(player_inv:get_stack("dye", 10):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:orange "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:pink" then
                player_inv:set_stack("dye", 11,"default:dirt "..(player_inv:get_stack("dye", 11):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:pink "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:red" then
                player_inv:set_stack("dye", 12,"default:dirt "..(player_inv:get_stack("dye", 12):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:red "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:violet" then
                player_inv:set_stack("dye", 13,"default:dirt "..(player_inv:get_stack("dye", 13):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:violet "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:white" then
                player_inv:set_stack("dye", 14,"default:dirt "..(player_inv:get_stack("dye", 14):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:white "..(player_inv:get_stack("colordye", 1):get_count()-1))
            elseif colordye == "dye:yellow" then
                player_inv:set_stack("dye", 15,"default:dirt "..(player_inv:get_stack("dye", 15):get_count()+1))
                player_inv:set_stack("colordye", 1,"dye:yellow "..(player_inv:get_stack("colordye", 1):get_count()-1))
            else
                d = 1
            end
        end
		inventory_plus.set_inventory_formspec(player, color.get_formspec(player))
	end
    if fields.stickdye then
        local player_inv = player:get_inventory()
        local black = player_inv:get_stack("dye", 1):get_count()
        local blue = player_inv:get_stack("dye", 2):get_count()
        local brown = player_inv:get_stack("dye", 3):get_count()
        local cyan = player_inv:get_stack("dye", 4):get_count()
        local dgreen = player_inv:get_stack("dye", 5):get_count()
        local dgrey = player_inv:get_stack("dye", 6):get_count()
        local green = player_inv:get_stack("dye", 7):get_count()
        local grey = player_inv:get_stack("dye", 8):get_count()
        local magenta = player_inv:get_stack("dye", 9):get_count()
        local orange = player_inv:get_stack("dye", 10):get_count()
        local pink = player_inv:get_stack("dye", 11):get_count()
        local red = player_inv:get_stack("dye", 12):get_count()
        local violet = player_inv:get_stack("dye", 13):get_count()
        local white = player_inv:get_stack("dye", 14):get_count()
        local yellow = player_inv:get_stack("dye", 15):get_count()
        local stickdye = player_inv:get_stack("stickdye", 1):get_name()
        if black > 9 and blue > 9 and brown > 9 and cyan > 9 and dgreen > 9 and dgrey > 9 and green > 9 and grey > 9 and magenta > 9 and orange > 9 and pink > 9 and red > 9 and violet > 9 and white > 9 and yellow > 9 then
            local d = 0
            local get = ""
            if stickdye == "tutorial:colorstick_empty" then
                get = "tutorial:colorstick_empty1"
                d = 1
            end
            for i=1,28 do
                if stickdye == "tutorial:colorstick_empty"..i then
                    get = "tutorial:colorstick_empty"..(i+1)
                    d = 1
                end
            end
            if stickdye == "tutorial:colorstick_empty29" then
                get = "tutorial:colorstick1"
                d = 1
            end
            if d == 1 then
                player_inv:set_stack("dye", 1,"default:dirt "..(player_inv:get_stack("dye", 1):get_count()-10))
                player_inv:set_stack("dye", 2,"default:dirt "..(player_inv:get_stack("dye", 2):get_count()-10))
                player_inv:set_stack("dye", 3,"default:dirt "..(player_inv:get_stack("dye", 3):get_count()-10))
                player_inv:set_stack("dye", 4,"default:dirt "..(player_inv:get_stack("dye", 4):get_count()-10))
                player_inv:set_stack("dye", 5,"default:dirt "..(player_inv:get_stack("dye", 5):get_count()-10))
                player_inv:set_stack("dye", 6,"default:dirt "..(player_inv:get_stack("dye", 6):get_count()-10))
                player_inv:set_stack("dye", 7,"default:dirt "..(player_inv:get_stack("dye", 7):get_count()-10))
                player_inv:set_stack("dye", 8,"default:dirt "..(player_inv:get_stack("dye", 8):get_count()-10))
                player_inv:set_stack("dye", 9,"default:dirt "..(player_inv:get_stack("dye", 9):get_count()-10))
                player_inv:set_stack("dye", 10,"default:dirt "..(player_inv:get_stack("dye", 10):get_count()-10))
                player_inv:set_stack("dye", 11,"default:dirt "..(player_inv:get_stack("dye", 11):get_count()-10))
                player_inv:set_stack("dye", 12,"default:dirt "..(player_inv:get_stack("dye", 12):get_count()-10))
                player_inv:set_stack("dye", 13,"default:dirt "..(player_inv:get_stack("dye", 13):get_count()-10))
                player_inv:set_stack("dye", 14,"default:dirt "..(player_inv:get_stack("dye", 14):get_count()-10))
                player_inv:set_stack("dye", 15,"default:dirt "..(player_inv:get_stack("dye", 15):get_count()-10))
                player_inv:set_stack("stickdye", 1,get)
            end
        end
        inventory_plus.set_inventory_formspec(player, color.get_formspec(player))
    end
end)
local ach = {}
ach.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
	player_inv:set_size("a1", 1)
    player_inv:set_size("a2", 1)
    player_inv:set_size("a3", 1)
    player_inv:set_size("a4", 1)
    local a1 = player_inv:get_stack("a1", 1):get_count()
    local a2 = player_inv:get_stack("a2", 1):get_count()
    local a3 = player_inv:get_stack("a3", 1):get_count()
    local a4 = player_inv:get_stack("a4", 1):get_count()
    local d1 = 0
    if a1 == 1 then
        d1 = d1+1
    end
    if a2 == 1 then
        d1 = d1+1
    end
    if a3 == 1 then
        d1 = d1+1
    end
    if a4 == 1 then
        d1 = d1+1
    end
	formspec = "size[10.5,11.3]"
        .."label[6,0;"..d1.."/4]"
        .."background[10.5,11.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
		.."button[4,0;2,0.5;achc;Spezial]"
        .."bgcolor[#080808BB;true]"
        .."image[0,1;0.8,0.8;tutorial_"..a1..".png]"
        .."image[0,1.8;0.8,0.8;tutorial_"..a2..".png]"
        .."image[0,2.6;0.8,0.8;tutorial_"..a3..".png]"
        .."image[0,3.4;0.8,0.8;tutorial_"..a4..".png]"
        .."label[0.8,1.1;Regnumwings]"
        .."label[0.8,1.9;Bronzekey]"
        .."label[0.8,2.7;Xp bronze Lv.MAX]"
        .."label[0.8,3.5;Molestick Lv.MAX]"
	return formspec
end
local mode_text = {
	{"Give player Enemy rank. (revoke all privs)"},
	{"Give player Member rank. (interact,shout)"},
	{"Give player Premium rank. (interact,shout,fly,fast,home,zoom)"},
	{"Give player VIP rank. (interact,shout,fly,fast,home,teleport,zoom)"},
	{"Give player Hero rank. (interact,shout,fly,fast,home,teleport,noclip,zoom,debug)"},
	{"Give player Legend rank (interact,shout,fly,fast,home,teleport,bring,noclip,settime,zoom,debug)"},
	{"Give player Admin rank (all privs)"},
	{"Mark player as a youtuber "},
}
local function server_hammer_setmode(user, itemstack, mode, keys)
	local puncher = user:get_player_name()
	if keys["sneak"] == false and mode == 0 then
		minetest.chat_send_player(puncher, "Hold shift and use to change server hammer modes.")
		return 
	end
	if keys["sneak"] == true then
		mode = mode + 1
		if mode == 9 then 
			mode = 1
		end
		minetest.chat_send_player(puncher, "Ban hammer mode : "..mode.." - "..mode_text[mode][1] )
	end
	itemstack:set_name("tutorial:server_hammer"..mode)
	itemstack:set_metadata(mode)
	return itemstack, mode
end
local function server_hammer_handler(itemstack, user, pointed_thing, mode)
	local keys = user:get_player_control()
	server_hammer_setmode(user, itemstack, mode, keys)
	if pointed_thing.type ~= "object" then
		return
	end
	if not pointed_thing.ref:is_player() then
		return
	end
	local puncher = user:get_player_name()
	local puncher_privs = minetest.get_player_privs(puncher)
	if (puncher_privs["ban"] == false) then
		return
	end
	local punched_player = pointed_thing.ref:get_player_name()
	local punched_player_privs = minetest.get_player_privs(punched_player)
	if mode == 1 then
		minetest.chat_send_player(punched_player, puncher.." gives you Enemy rank. You have no privs")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		local player = minetest.get_player_by_name(punched_player)
		local player_inv = player:get_inventory()
		player_inv:set_size("youtube", 1)
		local c = player_inv:get_stack("youtube",1):get_count()
		if c == 0 then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 0}, text = "[Enemy]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 0}, text = "[Youtuber][Enemy]"..player:get_player_name()})
		end
	elseif mode == 2 then
		minetest.chat_send_player(punched_player, puncher.." gives you Member rank. You can use interact and shout")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		minetest.set_player_privs(punched_player, punched_player_privs)
		local player = minetest.get_player_by_name(punched_player)
		local player_inv = player:get_inventory()
		player_inv:set_size("youtube", 1)
		local c = player_inv:get_stack("youtube",1):get_count()
		if c == 0 then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}, text = "[Member]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}, text = "[Youtuber][Member]"..player:get_player_name()})
		end
	elseif mode == 3 then
		minetest.chat_send_player(punched_player, puncher.." gives you Premium rank. You can use interact,shout,fast,fly,home and zoom")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
        punched_player_privs["zoom"] = true
		minetest.set_player_privs(punched_player, punched_player_privs)
		local player = minetest.get_player_by_name(punched_player)
		local player_inv = player:get_inventory()
		player_inv:set_size("youtube", 1)
		local c = player_inv:get_stack("youtube",1):get_count()
		if c == 0 then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 0, b = 255}, text = "[Premium]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 0, b = 255}, text = "[Youtuber][Premium]"..player:get_player_name()})
		end
	elseif mode == 4 then
		minetest.chat_send_player(punched_player, puncher.." gives you VIP rank. You can use interact,shout,fast,home,zoom,teleport and fly")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
        punched_player_privs["zoom"] = true
		punched_player_privs["teleport"] = true
		minetest.set_player_privs(punched_player, punched_player_privs)	
		local player = minetest.get_player_by_name(punched_player)
		local player_inv = player:get_inventory()
		player_inv:set_size("youtube", 1)
		local c = player_inv:get_stack("youtube",1):get_count()
		if c == 0 then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 0}, text = "[VIP]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 0}, text = "[Youtuber][VIP]"..player:get_player_name()})
		end
	elseif mode == 5 then
		minetest.chat_send_player(punched_player, puncher.." gives you Hero rank. You can use interact,shout,fast,home,zoom,teleport,noclip,fly and debug")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
        punched_player_privs["zoom"] = true
		punched_player_privs["teleport"] = true
		punched_player_privs["noclip"] = true
        punched_player_privs["debug"] = true
		minetest.set_player_privs(punched_player, punched_player_privs)
		local player = minetest.get_player_by_name(punched_player)
		local player_inv = player:get_inventory()
		player_inv:set_size("youtube", 1)
		local c = player_inv:get_stack("youtube",1):get_count()
		if c == 0 then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 255}, text = "[Hero]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 255}, text = "[Youtuber][Hero]"..player:get_player_name()})
		end
	elseif mode == 6 then
		minetest.chat_send_player(punched_player, puncher.." gives you Legend rank. You can use interact,shout,fast,home,zoom,teleport,noclip,fly,debug,bring and settime")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
        punched_player_privs["zoom"] = true
		punched_player_privs["bring"] = true
		punched_player_privs["teleport"] = true
		punched_player_privs["noclip"] = true
        punched_player_privs["debug"] = true
		punched_player_privs["settime"] = true
		minetest.set_player_privs(punched_player, punched_player_privs)
		local player = minetest.get_player_by_name(punched_player)
		local player_inv = player:get_inventory()
		player_inv:set_size("youtube", 1)
		local c = player_inv:get_stack("youtube",1):get_count()
		if c == 0 then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 0}, text = "[Legend]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 0}, text = "[Youtuber][Legend]"..player:get_player_name()})
		end
	elseif mode == 7 then
		minetest.chat_send_player(punched_player, puncher.." gives you Admin rank. You can use every privs")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
        punched_player_privs["zoom"] = true
		punched_player_privs["bring"] = true
		punched_player_privs["teleport"] = true
		punched_player_privs["noclip"] = true
        punched_player_privs["debug"] = true
		punched_player_privs["settime"] = true
		punched_player_privs["server"] = true
		punched_player_privs["password"] = true
		punched_player_privs["delprotect"] = true
		punched_player_privs["kick"] = true
		punched_player_privs["ban"] = true
		punched_player_privs["rollback"] = true
		punched_player_privs["privs"] = true
		punched_player_privs["basic_privs"] = true
		punched_player_privs["give"] = true
		punched_player_privs["protection_bypass"] = true
        punched_player_privs["travelnet_remove"] = true
        punched_player_privs["travelnet_attach"] = true
        punched_player_privs["shop_admin"] = true
		punched_player_privs["creative"] = true
		minetest.set_player_privs(punched_player, punched_player_privs)
		local player = minetest.get_player_by_name(punched_player)
		local player_inv = player:get_inventory()
		player_inv:set_size("youtube", 1)
		local c = player_inv:get_stack("youtube",1):get_count()
		if c == 0 then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 255}, text = "[Admin]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 255}, text = "[Youtuber][Admin]"..player:get_player_name()})
		end
	elseif mode == 8 then
		minetest.chat_send_player(punched_player, puncher.." marks you as a youtuber")
		pri = minetest.get_player_privs(punched_player)
		local player = minetest.get_player_by_name(punched_player)
		if pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring and pri.server and pri.password and pri.delprotect and pri.kick and pri.ban and pri.rollback and pri.privs and pri.basic_privs and pri.give and pri.protection_bypass and pri.travelnet_remove and pri.travelnet_attach and pri.shop_admin and pri.creative then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 255}, text = "[Youtuber][Admin]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 0}, text = "[Youtuber][Legend]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 255}, text = "[Youtuber][Hero]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 0}, text = "[Youtuber][VIP]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 0, b = 255}, text = "[Youtuber][Premium]"..player:get_player_name()})
		elseif pri.interact and pri.shout then
			player:set_nametag_attributes({text = "[Youtuber][Member]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 0}, text = "[Youtuber][Enemy]"..player:get_player_name()})
		end
		local inv = player:get_inventory()
		inv:set_size("youtube",1)
		inv:set_stack("youtube",1,"default:dirt")
	end
	return itemstack
end
minetest.register_craftitem("tutorial:server_hammer", {
	description = "Admin tool 6: Server Hammer",
	inventory_image = "ban_hammer.png",
	stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
		local mode = 0
		server_hammer_handler(itemstack, user, pointed_thing, mode)
		return itemstack
	end,
})
for i = 1, 8 do
	minetest.register_craftitem("tutorial:server_hammer"..i, {
		description = "Admin tool 6: Server Hammer in Mode "..i,
		inventory_image = "ban_hammer.png^technic_tool_mode"..i..".png",
		wield_image = "ban_hammer.png",
		groups = {not_in_creative_inventory=1},
		on_use = function(itemstack, user, pointed_thing)
			local mode = i
			server_hammer_handler(itemstack, user, pointed_thing, mode)
			return itemstack
		end,
	})
end
minetest.register_on_joinplayer(function(player)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
	player_inv:set_size("t", 1)
	player_inv:add_item("t", "default:dirt")
	local pri = minetest.get_player_privs(player:get_player_name())
	player_inv:set_size("youtube", 1)
	local c = player_inv:get_stack("youtube",1):get_count()
	if c == 0 then
		if pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring and pri.server and pri.password and pri.delprotect and pri.kick and pri.ban and pri.rollback and pri.privs and pri.basic_privs and pri.give and pri.protection_bypass and pri.travelnet_remove and pri.travelnet_attach and pri.shop_admin and pri.creative then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 255}, text = "[Admin]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 0}, text = "[Legend]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 255}, text = "[Hero]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 0}, text = "[VIP]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 0, b = 255}, text = "[Premium]"..player:get_player_name()})
		elseif pri.interact and pri.shout then
			player:set_nametag_attributes({text = "[Member]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 0}, text = "[Enemy]"..player:get_player_name()})
		end
	else
		if pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring and pri.server and pri.password and pri.delprotect and pri.kick and pri.ban and pri.rollback and pri.privs and pri.basic_privs and pri.give and pri.protection_bypass and pri.travelnet_remove and pri.travelnet_attach and pri.shop_admin and pri.creative then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 255}, text = "[Youtuber][Admin]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 0}, text = "[Youtuber][Legend]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 255}, text = "[Youtuber][Hero]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 0}, text = "[Youtuber][VIP]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 0, b = 255}, text = "[Youtuber][Premium]"..player:get_player_name()})
		elseif pri.interact and pri.shout then
			player:set_nametag_attributes({text = "[Youtuber][Member]"..player:get_player_name()})
		else
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 0}, text = "[Youtuber][Enemy]"..player:get_player_name()})
		end
	end
end)
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if player == nil then
        return
    end
	if fields.ach then
        local player_inv = player:get_inventory()
		local name = player:get_player_name()
        player_inv:set_size("a1", 1)
        local ce = io.open(minetest.get_worldpath().."/"..name.."_experience_bronze", "r")
		local type1 = ce:read("*l")
        local type2 = player:get_inventory():get_stack("bronze_key",1):get_name()

        if tonumber(type1) > 1499 then
			player_inv:set_stack("a3", 1, "default:dirt")
		end
        if type2 == "tutorial:bronzekey" then
			player_inv:set_stack("a2", 1, "default:dirt")
		end
        if player:get_inventory():contains_item("main", "tutorial:molestick5") then
			player_inv:set_stack("a4", 1,"tutorial:dirt")
		end
        if player:get_inventory():contains_item("main", "tutorial:regnumwings1") or player:get_inventory():contains_item("main", "tutorial:regnumwings2") or player:get_inventory():contains_item("main", "tutorial:regnumwings3") then
			player_inv:set_stack("a1", 1,"tutorial:dirt")
		end
		inventory_plus.set_inventory_formspec(player, ach.get_formspec(player))
	end
    if fields.rg then
		inventory_plus.set_inventory_formspec(player, rg.get_formspec(player))
	end
end)
minetest.register_on_dignode(function(pos, node, player)
	if player == nil then
        return
    end	
	local name = player:get_player_name()
	local hp = player:get_hp()
	local drops = node.name
	local x = math.random(50)
	local inv = player:get_inventory()
	if node.name == "tutorial:geschenk_death" then
		if x < 6 then
			minetest.get_player_by_name(name):set_hp(0)
		elseif x < 21 then
			if hp > 3 then
				minetest.get_player_by_name(name):set_hp(hp-4)
			else
				minetest.get_player_by_name(name):set_hp(0)
			end
		elseif x < 31 then
			if hp > 9 then
				minetest.get_player_by_name(name):set_hp(hp-10)
			else
				minetest.get_player_by_name(name):set_hp(0)
			end
		elseif x < 36 then 
			inv:add_item("main", "default:mese_crystal_fragment 4")
		elseif x < 41 then 
			inv:add_item("main", "tutorial:lightstone")
		elseif x < 46 then 
			inv:add_item("main", "default:ice")
		elseif x < 50 then 
			inv:add_item("main", "tutorial:geschenk_death")
		elseif x == 50 then 
			inv:add_item("main", "tutorial:regnum_part")
		end
	end
	if node.name == "tutorial:geschenk_death_silber" then
		if x < 5 then
			minetest.get_player_by_name(name):set_hp(0)
		elseif x < 18 then
			if hp > 3 then
				minetest.get_player_by_name(name):set_hp(hp-4)
			else
				minetest.get_player_by_name(name):set_hp(0)
			end
		elseif x < 26 then
			if hp > 9 then
				minetest.get_player_by_name(name):set_hp(hp-10)
			else
				minetest.get_player_by_name(name):set_hp(0)
			end
		elseif x < 32 then 
			inv:add_item("main", "default:mese_crystal")
		elseif x < 38 then 
			inv:add_item("main", "tutorial:lightstone")
		elseif x < 44 then 
			inv:add_item("main", "default:ice")
		elseif x < 50 then 
			inv:add_item("main", "tutorial:geschenk_death_silber")
		elseif x == 50 then 
			local y = math.random(1,2)
			inv:add_item("main", "tutorial:regnum_part "..y)
		end
	end
	if node.name == "tutorial:geschenk_death_gold" then
		if x < 4 then
			minetest.get_player_by_name(name):set_hp(0)
		elseif x < 15 then
			if hp > 3 then
				minetest.get_player_by_name(name):set_hp(hp-4)
			else
				minetest.get_player_by_name(name):set_hp(0)
			end
		elseif x < 21 then
			if hp > 9 then
				minetest.get_player_by_name(name):set_hp(hp-10)
			else
				minetest.get_player_by_name(name):set_hp(0)
			end
		elseif x < 28 then 
			inv:add_item("main", "default:mese_crystal 2")
		elseif x < 35 then 
			inv:add_item("main", "tutorial:lightstone 2")
		elseif x < 42 then 
			inv:add_item("main", "default:ice")
		elseif x < 50 then 
			inv:add_item("main", "tutorial:geschenk_death_gold")
		elseif x == 50 then
			local y = math.random(1,3)
			inv:add_item("main", "tutorial:regnum_part "..y)
		end
	end
	if node.name == "tutorial:geschenk_death_platin" then
		if x < 4 then
			minetest.get_player_by_name(name):set_hp(0)
		elseif x < 15 then
			if hp > 3 then
				minetest.get_player_by_name(name):set_hp(hp-4)
			else
				minetest.get_player_by_name(name):set_hp(0)
			end
		elseif x < 16 then
			if hp > 9 then
				minetest.get_player_by_name(name):set_hp(hp-10)
			else
				minetest.get_player_by_name(name):set_hp(0)
			end
		elseif x < 24 then 
			inv:add_item("main", "default:mese_crystal 3")
		elseif x < 33 then 
			inv:add_item("main", "tutorial:lightstone 2")
		elseif x < 41 then 
			inv:add_item("main", "default:ice")
		elseif x < 50 then 
			inv:add_item("main", "tutorial:geschenk_death_platin")
		elseif x == 50 then
			local y = math.random(1,4)
			inv:add_item("main", "tutorial:regnum_part "..y)
		end
	end
end)
minetest.override_item("default:water_source", {
	groups = {water=3, liquid=3, puts_out_fire=1, cracky = 14},
	drop = "default:water_source",
    drawtype = "liquid",
	diggable = true,
    alpha = 180,
})
minetest.override_item("default:water_flowing", {
	groups = {water=3, liquid=3, puts_out_fire=1, cracky = 14},
	drop = "default:water_source",
    --use_texture_alpha = true,
    drawtype = "flowingliquid",
	diggable = true,
    alpha = 180,
})
minetest.override_item("default:lava_source", {
	groups = {lava=3, liquid=2, hot=3, igniter=1, cracky = 14},
	drop = "default:lava_source",
	diggable = true,
})
minetest.register_on_dignode(function(pos, node, player)
	local dig7 = {"default:stone_with_coal","default:stone_with_iron","default:stone_with_copper","default:stone_with_gold","default:stone_with_mese","default:stone_with_diamond","moreores:silver","moreores:mineral_tin","moreores:mineral_mithril","moreores:mineral_silver","technic:mineral_chromium","technic:mineral_zinc","technic:mineral_uranium","tutorial:stone_with_white","tutorial:stone_with_black","tutorial:stone_with_uranium","gems:ruby_ore","gems:sapphire_ore","gems:amethyst_ore","gems:pearl_ore","gems:shadow_ore","gems:emerald_ore","tutorial:stone_with_admin","tutorial:stone_with_titan","tutorial:stone_with_rot","tutorial:stone_with_blau","default:lava_source","default:water_source"}
	local dig8 = {"default:cobble","default:stone","default:dirt","default:sand","default:desert_sand","default:desert_stone","default:dirt_with_grass","default:gravel","default:clay","default:cobble","default:mossycobble","default:dirt_with_snow","default:dirt_with_rainforest_litter","default:grass_3","default:dry_grass_3","default:grass_4","default:dry_grass_4"}
    local name, tool, drops, i, drop, drop_name
	if player == nil then
        return
    end	
	local inv = player:get_inventory()
    tool = player:get_wielded_item():get_name()
	if tool == "tutorial:regnumbattleaxe1" or tool == "tutorial:regnumbattleaxe2" or tool == "tutorial:regnumbattleaxe3" then
        drops = node.name
		for _,node_name in ipairs(dig7) do
			if drops == node_name then
				droping = minetest.get_node_drops(node.name)
				for _, itemname in ipairs(droping) do
					inv:add_item("main", itemname)
				end
			end
		end
        for _,node_name in ipairs(dig8) do
			if drops == node_name then
				droping = minetest.get_node_drops(node.name)
				for _, itemname in ipairs(droping) do
					inv:add_item("main", itemname)
				end
			end
		end
        if drops == "default:grass_5" or drops == "default:dry_grass_5" then
            droping = minetest.get_node_drops(node.name)
			for _, itemname in ipairs(droping) do
				inv:add_item("main", itemname)
                inv:add_item("main", itemname)
			end
        end
	end
end)
local old_entities = {}
local old_nodes = {}
for _,node_name in ipairs(old_nodes) do
    minetest.register_node(":"..node_name, {
        groups = {old=1},
    })
end
minetest.register_abm({
    nodenames = {"group:old"},
    interval = 1,
    chance = 1,
    action = function(pos, node)
        minetest.env:remove_node(pos)
    end,
})
for _,entity_name in ipairs(old_entities) do
    minetest.register_entity(":"..entity_name, {
        on_activate = function(self, staticdata)
            self.object:remove()
        end,
    })
end
local xp_gui = {}
local crafting = {}
local crafting3 = {}
local cr = {}
local xp_bronze = {}
crafting3.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
    player_inv:set_size("crvier3", 25)
	formspec = "size[8,10.3]"
        .."background[8,11.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[0,0;2,0.5;cr;Back]"
		.."button[2,0;2,0.5;main;Main]"
		.."button[6,2;2,0.5;cra3;Craft (1)]"
        .."button[6,3;2,0.5;cra310;Craft (10)]"
        .."button[6,4;2,0.5;cra399;Craft (99)]"
		.."list[current_player;main;0,6.25;8,1;]"
		.."list[current_player;main;0,7.5;8,3;8]"
		.."list[current_player;crvier3;1,1;5,5;]"
		.."listring[current_player;main]"
		.."listring[current_player;crvier3]"
	return formspec		
end
crafting.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
    player_inv:set_size("crvier", 16)
	formspec = "size[8,9.3]"
        .."background[8,9.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[0,0;2,0.5;cr;Back]"
		.."button[2,0;2,0.5;main;Main]"
		.."button[5,1.5;2,0.5;cra;Craft (1)]"
        .."button[5,2.5;2,0.5;cra10;Craft (10)]"
        .."button[5,3.5;2,0.5;cra99;Craft (99)]"
		.."list[current_player;main;0,5.25;8,1;]"
		.."list[current_player;main;0,6.5;8,3;8]"
		.."list[current_player;crvier;1,1;4,4;]"
		.."listring[current_player;main]"
		.."listring[current_player;crvier]"
	
	return formspec		
end
cr.get_formspec = function(player,pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
	formspec = "size[10,8.55]"
        .."background[10,8.55;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[0,0;2,0.5;inven;Back]"
		.."button[2,0;2,0.5;main;Main]"
		.."button[0,2.5;2,0.5;crafting;4x4 craft]"
		.."button[2,2.5;2,0.5;crafting3;5x5 craft]"
        .."button[4,2.5;2,0.5;crafting6;Cooking]"
		.."button[6,2.5;2,0.5;dna;DNA craft]"
        .."button[8,2.5;2,0.5;color;Color craft]"
		.."list[current_player;main;1,4.5;8,1;]"
		.."list[current_player;main;1,5.75;8,3;8]"
	return formspec
end
xp_bronze.get_formspec = function(player)
	formspec = "size[6.2,5.95]button[0,0;2,0.5;xp_gui;Back]"
        .."background[6.2,5.95;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[2.5,0;2,0.5;main;Main]"
		.."textlist[0,1;6,5;xp_gra;Lv.1 = 2xp,Lv.2 = 4xp,Lv.3 = 6xp,Lv.4 = 8xp,Lv.5 = 10xp,Lv.6 = 12xp,Lv.7 = 14xp,Lv.8 = 16xp,Lv.9 = 18xp,Lv.10 = 20xp,Lv.11 = 24xp,Lv.12 = 28xp,Lv.13 = 32xp,Lv.14 = 36xp,Lv.15 = 40xp,Lv.16 = 44xp,Lv.17 = 48xp,Lv.18 = 52xp,Lv.19 = 56xp,Lv.20 = 60xp,Lv.21 = 66xp,Lv.22 = 72xp,Lv.23 = 78xp,Lv.24 = 84xp,Lv.25 = 90xp,Lv.26 = 96xp,Lv.27 = 102xp,Lv.28 = 108xp,Lv.29 = 114xp,Lv.30 = 120xp,Lv.31 = 128xp,Lv.32 = 136xp,Lv.33 = 144xp,Lv.34 = 152xp,Lv.35 = 160xp,Lv.36 = 168xp,Lv.37 = 176xp,Lv.38 = 184xp,Lv.39 = 192xp,Lv.40 = 200xp,Lv.41 = 210xp,Lv.42 = 220xp,Lv.43 = 230xp,Lv.44 = 240xp,Lv.45 = 250xp,Lv.46 = 260xp,Lv.47 = 270xp,Lv.48 = 280xp,Lv.49 = 290xp,Lv.50 = 300xp,Lv.51 = 312xp,Lv.52 = 324xp,Lv.53 = 336xp,Lv.54 = 348xp,Lv.55 = 360xp,Lv.56 = 372xp,Lv.57 = 384xp,Lv.58 = 396xp,Lv.59 = 408xp,Lv.60 = 420xp,Lv.61 = 434xp,Lv.62 = 448xp,Lv.63 = 462xp,Lv.64 = 476xp,Lv.65 = 490xp,Lv.66 = 504xp,Lv.67 = 518xp,Lv.68 = 532xp,Lv.69 = 546xp,Lv.70 = 560xp,Lv.71 = 576xp,Lv.72 = 592xp,Lv.73 = 608xp,Lv.74 = 624xp,Lv.75 = 640xp,Lv.76 = 656xp,Lv.77 = 672xp,Lv.78 = 688xp,Lv.79 = 704xp,Lv.80 = 720xp,Lv.81 = 738xp,Lv.82 = 756xp,Lv.83 = 774xp,Lv.84 = 792xp,Lv.85 = 810xp,Lv.86 = 828xp,Lv.87 = 846xp,Lv.88 = 864xp,Lv.89 = 882xp,Lv.90 = 900xp,Lv.91 = 920xp,Lv.92 = 940xp,Lv.93 = 960xp,Lv.94 = 980xp,Lv.95 = 1000xp,Lv.96 = 1020xp,Lv.97 = 1040xp,Lv.98 = 1060xp,Lv.99 = 1080xp,Lv.100 = 1100xp,Lv.MAX = 1500xp]"
	return formspec
end
xp_gui.get_formspec = function(player)
	if player == nil then
        return
    end
	local name = player:get_player_name()
	local player_inv = player:get_inventory()
	local xp_bronze_o = io.open(minetest.get_worldpath().."/"..name.."_experience_bronze", "r")
	local xp_bronze = xp_bronze_o:read("*l")
	player_inv:set_size("bronze_key", 1)

	image1 = "xp_bronze"
	formspec = "size[8,8.3]button[0,0;2,0.5;inven;Back]"
        .."background[8,8.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[2,0;2,0.5;main;Main]"
		.."label[0,1;Xp bronze (Part1) : "..xp_bronze.."xp]"
		.."list[current_player;main;0,4.25;8,1;]"
		.."list[current_player;main;0,5.5;8,3;8]"
        .."list[current_player;bronze_key;5,2.7;8,1;]"
        .."label[5,3.5;Bronzekey]"
		.."button[4.5,1.5;2.0,0.2;"..image1..";Xp bronze you need]"
	return formspec
end	
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if player == nil then
        return
    end
	if fields.xp_bronze then
		inventory_plus.set_inventory_formspec(player, xp_bronze.get_formspec(player))
	end
    if fields.xp_gui then
		inventory_plus.set_inventory_formspec(player, xp_gui.get_formspec(player))
	end
	if fields.cra then
		local player_inv = player:get_inventory()
		local crafted = nil
		local table_dec = nil
		local player_inv = player:get_inventory()
		local tablelist = player_inv:get_list("crvier")
		if tablelist then
			crafted,table_dec = minetest.get_craft_result({method = "normal", width = 4, items = tablelist})
		end
		local k = 0
		if player_inv:room_for_item("main", crafted.item) == true then
			k = 1
		end
		if crafted.item:get_name() == "" then
			k = 0
		end
		local kk = nil
		if not kk == ture then
			k = 0
		end
		if k == 1 then
			player_inv:add_item("main", crafted.item)
			player_inv:set_list("crvier", table_dec.items)
		end
		inventory_plus.set_inventory_formspec(player, crafting.get_formspec(player))
	end
	if fields.cra10 then
        for i=1,10 do
            local player_inv = player:get_inventory()
		    local crafted = nil
		    local table_dec = nil
		    local player_inv = player:get_inventory()
		    local tablelist = player_inv:get_list("crvier")
		    if tablelist then
			    crafted,table_dec = minetest.get_craft_result({method = "normal", width = 4, items = tablelist})
		    end
		    local k = 0
		    if player_inv:room_for_item("main", crafted.item) == true then
			    k = 1
		    end
		    if crafted.item:get_name() == "" then
			    k = 0
		    end
		    local kk = nil
		    if not kk == ture then
			    k = 0
		    end
		    if k == 1 then
			    player_inv:add_item("main", crafted.item)
			    player_inv:set_list("crvier", table_dec.items)
		    end
		    inventory_plus.set_inventory_formspec(player, crafting.get_formspec(player))
        end
    end
    if fields.cra99 then
        for i=1,99 do
            local player_inv = player:get_inventory()
		    local crafted = nil
		    local table_dec = nil
		    local player_inv = player:get_inventory()
		    local tablelist = player_inv:get_list("crvier")
		    if tablelist then
			    crafted,table_dec = minetest.get_craft_result({method = "normal", width = 4, items = tablelist})
		    end
		    local k = 0
		    if player_inv:room_for_item("main", crafted.item) == true then
			    k = 1
		    end
		    if crafted.item:get_name() == "" then
			    k = 0
		    end
		    local kk = nil
		    if not kk == ture then
			    k = 0
		    end
		    if k == 1 then
			    player_inv:add_item("main", crafted.item)
			    player_inv:set_list("crvier", table_dec.items)
		    end
		    inventory_plus.set_inventory_formspec(player, crafting.get_formspec(player))
        end
    end
	if fields.cra3 then
		local player_inv = player:get_inventory()
		local crafted = nil
		local table_dec = nil
		local player_inv = player:get_inventory()
		local tablelist = player_inv:get_list("crvier3")
		if tablelist then
			crafted,table_dec = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
		end
		local k = 0
		if player_inv:room_for_item("main", crafted.item) == true then
			k = 1
		end
		if crafted.item:get_name() == "" then
			k = 0
		end
		if k == 1 then
			player_inv:add_item("main", crafted.item)
			player_inv:set_list("crvier3", table_dec.items)
		end
		inventory_plus.set_inventory_formspec(player, crafting3.get_formspec(player))
	end
    if fields.cra310 then
        for i=1,10 do
		    local player_inv = player:get_inventory()
		    local crafted = nil
		    local table_dec = nil
		    local player_inv = player:get_inventory()
		    local tablelist = player_inv:get_list("crvier3")
		    if tablelist then
			    crafted,table_dec = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
		    end
		    local k = 0
		    if player_inv:room_for_item("main", crafted.item) == true then
			    k = 1
		    end
		    if crafted.item:get_name() == "" then
			    k = 0
		    end
		    if k == 1 then
			    player_inv:add_item("main", crafted.item)
			    player_inv:set_list("crvier3", table_dec.items)
		    end
		    inventory_plus.set_inventory_formspec(player, crafting3.get_formspec(player))
        end
	end
    if fields.cra399 then
        for i=1,99 do
		    local player_inv = player:get_inventory()
		    local crafted = nil
		    local table_dec = nil
		    local player_inv = player:get_inventory()
		    local tablelist = player_inv:get_list("crvier3")
		    if tablelist then
			    crafted,table_dec = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
		    end
		    local k = 0
		    if player_inv:room_for_item("main", crafted.item) == true then
			    k = 1
		    end
		    if crafted.item:get_name() == "" then
			    k = 0
		    end
		    if k == 1 then
			    player_inv:add_item("main", crafted.item)
			    player_inv:set_list("crvier3", table_dec.items)
		    end
		    inventory_plus.set_inventory_formspec(player, crafting3.get_formspec(player))
        end
	end
	if fields.cr then 
		inventory_plus.set_inventory_formspec(player, cr.get_formspec(player))
	end
	if fields.crafting then
		inventory_plus.set_inventory_formspec(player, crafting.get_formspec(player))
	end
	if fields.crafting3 then
		inventory_plus.set_inventory_formspec(player, crafting3.get_formspec(player))
	end
    
end)
local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end
tutorial = {}
local function add_spawner(pos)
	minetest.set_node(pos, {name="tutorial:spawner_mummy"})
	if not minetest.setting_getbool("only_peaceful_mobs") then tutorial.spawn_mummy({x=pos.x,y=pos.y,z=pos.z-2},2) end
end
local function can_replace(pos)
	local n = minetest.get_node_or_nil(pos)
	if n and n.name and minetest.registered_nodes[n.name] and not minetest.registered_nodes[n.name].walkable then
		return true
	elseif not n then
		return true
	else
		return false
	end
end
local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i/math.abs(i)
	end
end
local function get_velocity(vx, vy, vz, yaw)
	local x = math.cos(yaw)*vx+math.cos(math.pi/2+yaw)*vz
	local z = math.sin(yaw)*vx+math.sin(math.pi/2+yaw)*vz
	return {x=x, y=vy, z=z}
end
local function get_v(v)
	return math.sqrt(vx^2+vz^2)
end
local heli = {
	physical = true,
	collisionbox = {-1,-0.6,-1, 1,0.3,1},
	collide_with_objects = true,
	weight = 5,	
	visual = "mesh",
	mesh = "root.x",
	driver = nil,
	model = nil,
	motor = nil,
	left = true,
	timer=0,
	yaw=0,
	prev_y=0,
	vx=0,
	vy=0,
	vz=0
}
local heliModel = {
	visual = "mesh",
	mesh = "heli.x",
	textures = {"bladest.png","bladest.png","helit.png","Glasst.png"},
}	
local motor = {
	physical = true,
	collisionbox = {-2,0.5,-1, 1,1,1},
	visual = "mesh",
	mesh = "motor.x",
	textures = {"motort.png"},
	driver = nil,
	left = true,
	timer=0,
	vx = 0,--Velo. for/back-ward
	vy = 0,--Velo. up/down
	vz = 0--Velo. side
}
function heli:on_rightclick(clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	if self.driver and clicker == self.driver then
		clicker:set_attach(self.model, "Root", {x=0,y=0,z=0}, {x=0,y=0,z=0})
		self.driver = nil
		clicker:set_detach()
		self.model:set_animation({x=0,y=1},0, 0)
	elseif not self.driver then
		self.model:set_animation({x=0,y=10},10, 0)
		self.driver = clicker
		clicker:set_attach(self.model, "Root", {x=0,y=0,z=-10}, {x=-90,y=0,z=-90})
	end
end
function heliModel:on_activate(staticdata, dtime_s)
	self.object:set_armor_groups({immortal=1})
	local is_attached = false
	for _,object in ipairs(minetest.env:get_objects_inside_radius(self.object:getpos(), 2)) do
		if object and object:get_luaentity() and object:get_luaentity().name=="tutorial:heli" then
			if object:get_luaentity().model == nil then
				object:get_luaentity().model = self
			end
			if object:get_luaentity().model == self then
				is_attached = true
			end
		end
	end
	if is_attached == false then
		self.object:remove()
	end
end
function heli:on_activate(staticdata, dtime_s)
	self.object:set_armor_groups({immortal=1})
	self.prev_y=self.object:getpos()
	if self.model == nil then
		self.model = minetest.env:add_entity(self.object:getpos(), "tutorial:heliModel")
		self.model:set_attach(self.object, "Root", {x=0,y=0,z=2}, {x=0,y=0,z=0})	
	end
end
function heli:get_staticdata(self)	
end
function heli:on_punch(puncher, time_from_last_punch, tool_capabilities, direction)
	if self.model ~= nil then
		self.model:remove()
	end
	self.object:remove()
	if puncher and puncher:is_player() then
		puncher:get_inventory():add_item("main", "tutorial:heli")
	end
end
function heliModel:on_punch(puncher, time_from_last_punch, tool_capabilities, direction)
	self.object:remove()
end
function heli:on_step(dtime)
	if self.driver and ( math.abs(self.driver:getpos().x-self.object:getpos().x)>10*dtime or math.abs(self.driver:getpos().y-self.object:getpos().y)>10*dtime or math.abs(self.driver:getpos().z-self.object:getpos().z)>10*dtime) then
		self.driver = nil
	end
	if self.driver then
		--self.driver:set_animation({ x= 81, y=160, },10,0)
		self.yaw = self.driver:get_look_yaw()
		v = self.object:getvelocity()
		local ctrl = self.driver:get_player_control()
		--Forward/backward
		if ctrl.up then
			self.vx = self.vx + math.cos(self.driver:get_look_yaw())*0.1
			self.vz = self.vz + math.sin(self.driver:get_look_yaw())*0.1
		end
		if ctrl.down then
			self.vx = self.vx-math.cos(self.driver:get_look_yaw())*0.1
			self.vz = self.vz-math.sin(self.driver:get_look_yaw())*0.1
		end
		if ctrl.left then
			self.vz = self.vz+math.cos(self.driver:get_look_yaw())*0.1
			self.vx = self.vx+math.sin(math.pi+self.driver:get_look_yaw())*0.1
		end
		if ctrl.right then
			self.vz = self.vz-math.cos(self.driver:get_look_yaw())*0.1
			self.vx = self.vx-math.sin(math.pi+self.driver:get_look_yaw())*0.1
		end
		if ctrl.jump then
			if self.vy<1.5 then
				self.vy = self.vy+0.2
			end
		end
		if ctrl.sneak then
			if self.vy>-1.5 then
				self.vy = self.vy-0.2
			end
		end
		if math.abs(self.vx) > 4.5 then
			self.vx = 4.5*get_sign(self.vx)
		end
		if math.abs(self.vz) > 4.5 then
			self.vz = 4.5*get_sign(self.vz)
		end
		
	end
	local sx=get_sign(self.vx)
	self.vx = self.vx - 0.02*sx
	local sz=get_sign(self.vz)
	self.vz = self.vz - 0.02*sz
	local sy=get_sign(self.vy)
	self.vy = self.vy-0.01*sy
	if sx ~= get_sign(self.vx) then
		self.vx = 0
	end
	if sz ~= get_sign(self.vz) then
		self.vz = 0
	end
	if math.abs(self.vx) > 4.5 then
		self.vx = 4.5*get_sign(self.vx)
	end
	if math.abs(self.vz) > 4.5 then
		self.vz = 4.5*get_sign(self.vz)
	end
	if math.abs(self.vy) > 4.5 then
		self.vz = 4.5*get_sign(self.vz)
	end
	self.object:setvelocity({x=self.vx, y=self.vy,z=self.vz})
	if self.model then
		self.model:set_attach(self.object,"Root", {x=0,y=0,z=0}, {
			x=-90+self.vz*4*math.cos(self.yaw)-self.vx*4*math.sin(self.yaw), 
			y=0-self.vz*4*math.sin(self.yaw)-self.vx*4*math.cos(self.yaw), 
			z=self.yaw*57})
	end
end
minetest.register_entity("tutorial:heli", heli)
minetest.register_entity("tutorial:heliModel", heliModel)
minetest.register_entity("tutorial:motor", motor)
--v.0.1.0