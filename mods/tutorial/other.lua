--v.2.0.0
local ach3 = {}
ach3.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
    player_inv:set_size("year", 4)
	local year = player_inv:get_stack("year", 1):get_count()
	local year2 = player_inv:get_stack("year", 2):get_count()
	local year3 = player_inv:get_stack("year", 3):get_count()
	local year4 = player_inv:get_stack("year", 4):get_count()
    local d = 0
    if year == 1 then
        d = d+1
    end
	if year2 == 1 then
        d = d+1
    end
	if year3 == 1 then
        d = d+1
    end
	if year4 == 1 then
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
		.."label[0.8,2.7;Three years Trophy]"
		.."label[0.8,3.5;Four years Trophy]"
        .."label[5.5,0;"..d.."/4]"
        .."image[0,1;0.8,0.8;tutorial_"..year..".png]"
		.."image[0,1.8;0.8,0.8;tutorial_"..year2..".png]"
		.."image[0,2.6;0.8,0.8;tutorial_"..year3..".png]"
		.."image[0,3.4;0.8,0.8;tutorial_"..year4..".png]"
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
        player_inv:set_size("year", 4)
        if player:get_inventory():contains_item("main", "tutorial:trophy_year1") then
            player_inv:set_stack("year", 1,"tutorial:dirt")
		end
		if player:get_inventory():contains_item("main", "tutorial:trophy_year2") then
            player_inv:set_stack("year", 2,"tutorial:dirt")
		end
		if player:get_inventory():contains_item("main", "tutorial:trophy_year3") then
            player_inv:set_stack("year", 3,"tutorial:dirt")
		end
		if player:get_inventory():contains_item("main", "tutorial:trophy_year4") then
            player_inv:set_stack("year", 4,"tutorial:dirt")
		end
		inventory_plus.set_inventory_formspec(player, ach3.get_formspec(player))
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
		.."label[0,1;II. 4. Ores]"
        .."label[0,1.3;You can find ores in the depth.]"
        .."label[0,1.6;Where to find ores:]"
        .."label[0,1.9;(default) Coal: y < 65]"
        .."label[0,2.2;(default) Iron: y < 1]"
		.."label[0,2.5;(default) Copper: y < -15]"
		.."label[0,2.8;(default) Tin: y < -31]"
		.."label[0,3.1;(default) Gold: y < -63]"
		.."label[0,3.4;(default) Mese: y < -63]"
        .."label[0,3.7;(default) Diamond: y < -127]"
		.."label[0,4.0;(moreores) Tin: y < 9]"
		.."label[0,4.3;(moreores) Silver: y < -1]"
		.."label[0,4.6;(moreores) Mithril: y < -511]"
		.."label[0,4.9;(technic) Zinc: y < 3]"
		.."label[0,5.2;(technic) Cromium: y < -99]"
        .."label[0,5.5;(technic) Uranium: -301 < y < -79]"
        .."label[0,5.8;(regnum) Black/White: y < 2]"
        .."label[0,6.1;(regnum) Uranium: y < -128]"
		.."label[0,6.4;(regnum) Ruby/Sapphire: y < -300]"
		.."label[0,6.7;(regnum) Amethyst: y < -600]"
        .."label[0,7.0;(regnum) Shadow/Pearl: y < -900]"
        .."label[0,7.3;(regnum) Emerald: y < -1200]"
        .."label[0,7.6;(regnum) Admin: y < -500]"
		.."label[0,7.9;(regnum) Regnum: y < -600]"
        .."label[0,8.2;(regnum) Titan: y < -400]"
        .."label[0,8.5;(regnum) Rot/Blau: y < -100]"
		.."label[0,8.8;(regnum) Precious Metal: y < -100]"
        .."button[2,10;   2,0.5;rg11;<]"
        .."button[4,10;   2,0.5;rg16;>]"
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
		.."label[0,1;II. 6. Wings & Hearts]"
        .."label[0,1.3;There are over 120 differend wings and hearts]"
        .."label[0,1.6;Here you can see witch kind of wings and hearts you have to craft:]"
        .."label[0,1.9;(starter)]"
        .."label[0,2.2;mega lv.1-20]"
        .."label[0,2.5;cloud lv.1-25]"
        .."label[0,2.8;super lv.1-4]"
        .."label[0,3.1;uranium lv.1-2 (only wings so far)]"
        .."label[0,3.4;energie lv.1-12 (only wings so far)]"
        .."label[0,3.7;superenergy lv.1-7 (only wings so far)]"
        .."label[0,4.0;crystal lv.1-5 (only wings so far)]"
        .."label[0,4.3;ultra lv.1-25 (only wings so far)]"
        .."label[0,4.6;superultra (only wings so far)]"
        .."label[0,4.9;arena lv.1-4 (only wings so far)]"
        .."label[0,5.2;titan lv.1-10 (only wings so far)]"
        .."label[0,5.5;legendary lv.1-6 (only wings so far)]"
        .."label[0,5.8;superlegendary (only wings so far)]"
        .."label[0,6.1;regnum (only wings so far)]"
        .."label[0,6.4;There are differend modes for the superlegendary wings]"
        .."label[0,6.7;and also for the regnum:]"
		.."label[0,7.0;With wings Mode 2 you will have low gravity.]"
		.."label[0,7.3;With wings Mode 3 you will have low gravity and you can fly.]"
        .."label[0,7.6;For changing the mode of a tool (also Wallplacer and mining Drill),]"
		.."label[0,7.9;you have to press the right mouse and sneak (don't point at a node)]"
        .."button[2,10;   2,0.5;rg16;<]"
        .."button[4,10;   2,0.5;rg14;>]"
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
		.."label[0,1;II. 5. Armor, Battleaxes & Guns]"
		.."label[0,1.3;You will start with a regnum battleaxe, a regnum gun and a full regnum armor.]"
		.."label[0,1.6;With battleaxe Mode 2 you can dig water and lava.]"
		.."label[0,1.9;With battleaxe Mode 3 you can only hunt monster.]"
		.."label[0,2.2;With armor Mode 2 you can run faster.]"
        .."label[0,2.5;With armor Mode 3 you can jump higher.]"
        .."label[0,2.8;With armor Mode 4 you can run faster and jump higher.]"
		.."label[0,3.1;With gun Mode 2 you can only make damage to monsters.]"
		.."label[0,3.4;With gun Mode 3 you will also add thunder.]"
        .."label[0,3.7;For changing the mode of a tool (also Wallplacer and mining Drill),]"
		.."label[0,4.0;you have to press the right mouse and sneak (don't point at a node)]"
        .."button[2,10;   2,0.5;rg12;<]"
        .."button[4,10;   2,0.5;rg13;>]"
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
		.."label[0,1;II. 7. Chat commands]"
        .."label[0,1.3;/admin for all admin tools]"
        .."label[0,1.6;/regnum for all regnum things]"
        .."label[0,1.9;/rank to see your rank]"
        .."button[2,10;   2,0.5;rg13;<]"
		.."button[4,10;   2,0.5;rg15;>]"
	return formspec		
end
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
		.."label[0,1;II. 8. Keys]"
        .."label[0,1.3;Bronzekey: can be got as a reward for bronze level 100]"
        .."button[2,10;   2,0.5;rg14;<]"
	return formspec		
end
--v.1.13.0
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
		.."label[0,1;II. 2. Mobs]"
        .."label[0,1.3;There are monsters, animals and pets in Regnum 2.]"
        .."label[0,1.6;The monster will kill you, but you can get wrapping paper and DNA strings.]"
        .."label[0,1.9;You can get water and sky animals from the dna gift.]"
        .."label[0,2.2;There are turtles, sharks, gulls and many other.]"
		.."label[0,2.5;You will start the game with one pet: the knight.]"
        .."label[0,2.8;If you use the DNA craft you can get more pets.]"
		.."label[0,3.1;The knight will kill monsters and collect the wrapping paper and DNA strings.]"
        .."label[0,3.4;You can change the color of the pets and they can folow you.]"
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
		.."label[0,1;II. 3. Xp & Level]"
        .."label[0,1.3;If you dig some things you can get xp.]"
        .."label[0,1.6;There are 2 differend kind of xp:]"
        .."label[0,1.9;bronze and silver xp]"
        .."label[0,2.2;If you dig precious metal you will get 1 bronze xp.]"
        .."label[0,2.5;If you reach level bronze 100, you will get the bronze key.]"
		.."label[0,2.8;If you dig precious metal and have the bronze key, you will get 1 silver xp.]"
        .."label[0,3.1;Look in the 'Xp Guide' for your xp and how much xp you need.]"
        .."label[0,3.4;If you reach a new level you will get a reward.]"
        .."label[0,3.7;Look in 'Xp Items' for the reward.]"
        .."button[2,10;   2,0.5;rg10;<]"
        .."button[4,10;   2,0.5;rg12;>]"
	return formspec		
end
--v.1.12.0
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
		.."label[0,1;I. 5. Achievements]"
        .."label[0,1.3;comming soon]"
        .."button[2,10;   2,0.5;rg6;<]"
        .."button[4,10;   2,0.5;rg8;>]"
	return formspec		
end
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
		.."label[0,1;I. 6. Music]"
        .."label[0,1.3;Enable Background Music.]"
        .."label[0,1.6;Choose Themes to be randomly selected and listen to the Regnum Themes.]"
        .."button[2,10;   2,0.5;rg7;<]"
        .."button[4,10;   2,0.5;rg9;>]"
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
		.."label[0,1;I. 4. Xp items]"
        .."label[0,1.3;Here you can get your rewards, if you reach a new level.]"
		.."label[0,1.6;You will also get a block for every level.]"
        .."button[2,10;   2,0.5;rg5;<]"
        .."button[4,10;   2,0.5;rg7;>]"
	return formspec		
end
--v.1.11.1
--v.1.11.0
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
	xpi01_inv:set_size("xpi02", 15)
	player_inv:set_size("xpi02", 15)
    for i=1, 15 do
		local stack = player_inv:get_stack("xpi01", i)
		xpi01_inv:set_stack("xpi01", i, stack)
		local stack = player_inv:get_stack("xpi02", i)
		xpi01_inv:set_stack("xpi02", i, stack)
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
		.."list[detached:"..player:get_player_name().."_xpi01;xpi02;3,2.7;5,1]"
        .."listring[current_player;main]" 
	    .."listring[detached:"..player:get_player_name().."_xpi01;xpi01]"
        .."listring[current_player;main]" 
	    .."listring[detached:"..player:get_player_name().."_xpi01;xpi02]"
        .."listring[current_player;main]" 
        .."label[3,1.1;Bronze Xp Items]"
		.."label[3,2.3;Silver Xp Items]"
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
		.."button[9,12;2,0.5;xpi2;>]"
	return formspec		
end
local xpi2 = {}
xpi2.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    local xpi2_inv = minetest.create_detached_inventory(player:get_player_name().."_xpi2",{
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
	xpi2_inv:set_size("xpi2", 100)
	player_inv:set_size("xpi2", 100)
    for i=1, 100 do
		local stack = player_inv:get_stack("xpi2", i)
		xpi2_inv:set_stack("xpi2", i, stack)
    end
	formspec = "size[18,12.3]"
	    .."button[0,0;2,0.5;inven;Back]"
	    .."button[2,0;2,0.5;main;Main]"
        .."list[current_player;main;5,7.5;8,1;]"
		.."list[current_player;main;5,8.75;8,3;8]"
        .."background[18,12.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
        .."list[detached:"..player:get_player_name().."_xpi2;xpi2;0,1.3;10,1]"
        .."listring[current_player;main]" 
	    .."listring[detached:"..player:get_player_name().."_xpi2;xpi2]"
        .."label[0,0.7;Silver Level Blocks]"
        .."button[7,12;2,0.5;xpi;<]"
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
		.."label[0,1;I. 2. Crafting]"
        .."label[0,1.3;There are 6 differend crafts:]"
        .."label[0,1.6;The '4x4 craft' and 5x5 to craft in a 4x4 and 5x5 field.]"
		.."label[0,1.9;Look in the 'Craft Guide' which item you can craft in 4x4 and 5x5.]"
		.."label[0,2.2;The Cooking craft, works like furnaces but with (regnum) uranium (every level) as fuel.]"
		.."label[0,2.5;The DNA craft is comming soon.]"
		.."label[0,2.8;The Color craft to fill the colorstick.]"
		.."label[0,3.1;You will need 10 dye of every color to fill the color stick by 3.33%.]"
		.."label[0,3.4;The Reverse craft to get your items back, if you craft the wrong one.]"
		.."label[0,3.7;You can only use some items.]"
        .."button[2,10;   2,0.5;rg3;<]"
        .."button[4,10;   2,0.5;rg5;>]"
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
        .."label[0,1.6;   1. Equipment]"
        .."label[0,1.9;   2. Crafting]"
        .."label[0,2.2;   3. Help]"
        .."label[0,2.5;   4. Xp items]"
        .."label[0,2.8;   5. Achievments]"
        .."label[0,3.1;   6. Music]"
        .."label[0,3.4; II. Game]"
        .."label[0,3.7;   1. Gifts]"
        .."label[0,4.0;   2. Mobs]"
        .."label[0,4.3;   3. Xp & Level]"
        .."label[0,4.6;   4. Ores]"
		.."label[0,4.9;   5. Armor, Battleaxes & Guns]"
        .."label[0,5.2;   6. Wings & Hearts]"
        .."label[0,5.5;   7. Chat commands]"
		.."label[0,5.8;   8. Keys]"
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
		.."label[0,1;I. 1. Equipment]"
		.."label[0.0,1.3;a) Skins]"
		.."label[0.2,1.6;Here you can change your skin.]"
        .."label[0.2,1.9;Click on one skin to change your skin.]"
        .."label[0.2,2.2;You can also use some special skins like a see-through skin.]"
		.."label[0.0,2.5;b) Bags]"
        .."label[0.2,2.8;You can use bags to take more things with you.]"
        .."label[0.2,3.1;You can't change your bags because your bags are already fully leveled.]"
        .."label[0.2,3.4;If you use the button below, you could put your items in the new inventory.]"
		.."label[0.0,3.7;c) Armor]"
        .."label[0.2,4.0;You can use armor to save you from monsters.]"
        .."label[0.2,4.3;There are 5 differend armor parts.]"
		.."label[0.2,4.6;Helmets, chestplates, leggings, boots and shields.]"
		.."label[0.2,4.9;You start the game with a full regnum armor.]"
		.."label[0.2,5.2;If you have a full regnum armor you can't burn or drown.]"
        .."label[0.2,5.5;You can also make your armor invisible to other.]"
        .."button[2,10;   2,0.5;rg2;<]"
        .."button[4,10;   2,0.5;rg4;>]"
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
		.."label[0,1;I. 3. Help]"
		.."label[0.0,1.3;a) Regnum Guide]"
		.."label[0.2,1.6;You can read something about the Regnum Game :)]"
		.."label[0.0,1.9;b) Craft Guide]"
		.."label[0.2,2.2;Here you can see how to craft items.]"
        .."label[0.2,2.5;Click on one item to see the crafting.]"
        .."label[0.2,2.8;You can also see 4x4 and 5x5 craftings.]"
        .."label[0.2,3.1;You can see the craftings for wings/hearts in the Regnum Craft Guide.]"
		.."label[0.0,3.4;c) Xp Guide]"
        .."label[0.2,3.7;If you dig precious metal ore, you will get xp.]"
		.."label[0.2,4.0;There are 2 differend kinds of xp.]"
        .."label[0.2,4.3;You can see here how many xp you have and how many you will need for the next level.]"
		
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
        .."label[0,1.6;about my game: Regnum 2]"
		.."label[0,1.9;This game is a continuation of the first part of Regnum.]"
        .."label[0,2.5;I will maybe add in the next version (1.4.0):]"
		.."label[0,2.8;many bug fixes from the upcomming Regnum version 3.6.0]"
        .."label[0,3.1;silber xp lv.11-40]"
        .."label[0,3.4;xray stick lv.2]"
		.."label[0,3.7;some mod updates]"
		.."label[0,4.0;awards mod]"
        .."button[4,10;2,0.5;rg2;>]"
	return formspec		
end
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
	if fields.xpi2 then
		inventory_plus.set_inventory_formspec(player, xpi2.get_formspec(player))
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
	{"give player Enemy rank. (revoke all privs)"},
	{"give player Member rank. (interact,shout)"},
	{"give player Premium rank. (interact,shout,fly,fast,home)"},
	{"give player VIP rank. (interact,shout,fly,fast,home,teleport)"},
	{"give player Hero rank. (interact,shout,fly,fast,home,teleport,noclip,debug)"},
	{"give player Legend rank (interact,shout,fly,fast,home,teleport,noclip,debug,bring,settime)"},
	{"give player Admin rank (all privs)"},
	{"mark player as a youtuber"},
}
local function server_hammer_setmode(user, itemstack, mode, keys)
	local puncher = user:get_player_name()
	if keys["sneak"] == false and mode == 0 then
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
		minetest.chat_send_player(punched_player, puncher.." gives you Premium rank. You can use interact,shout,fly,fast and home")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
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
		minetest.chat_send_player(punched_player, puncher.." gives you VIP rank. You can use interact,shout,fly,fast,home and teleport")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
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
		minetest.chat_send_player(punched_player, puncher.." gives you Hero rank. You can use interact,shout,fly,fast,home,teleport,noclip and debug")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
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
		minetest.chat_send_player(punched_player, puncher.." gives you Legend rank. You can use interact,shout,fly,fast,home,teleport,noclip,debug,bring and settime")
		minetest.set_player_privs(punched_player, {})
		local punched_player_privs = minetest.get_player_privs(punched_player)
		punched_player_privs["interact"] = true
		punched_player_privs["shout"] = true
		punched_player_privs["fly"] = true
		punched_player_privs["fast"] = true
		punched_player_privs["home"] = true
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
		if pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring and pri.server and pri.password and pri.delprotect and pri.kick and pri.ban and pri.rollback and pri.privs and pri.basic_privs and pri.give and pri.sign_editor and pri.protection_bypass and pri.travelnet_remove and pri.travelnet_attach and pri.shop_admin and pri.creative then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 255}, text = "[Youtuber][Admin]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 0}, text = "[Youtuber][Legend]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport and pri.noclip and pri.debug then
			player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 255}, text = "[Youtuber][Hero]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport then
			player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 0}, text = "[Youtuber][VIP]"..player:get_player_name()})
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home then
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
	groups = {not_in_creative_inventory=1},
	on_secondary_use = function(itemstack, user, pointed_thing)
		local mode = 0
		server_hammer_handler(itemstack, user, pointed_thing, mode)
		return itemstack
	end,
	on_use = function(itemstack, user, pointed_thing)
		local mode = 0
		server_hammer_handler(itemstack, user, pointed_thing, mode)
		return itemstack
	end,
})
minetest.register_craftitem("tutorial:server_hammer1", {
		description = "Admin tool 6: Server Hammer Mode 1 ("..mode_text[1][1]..")",
		inventory_image = "ban_hammer.png^technic_tool_mode1.png",
		wield_image = "ban_hammer.png",
		on_secondary_use = function(itemstack, user, pointed_thing)
			server_hammer_handler(itemstack, user, pointed_thing, 1)
			return itemstack
		end,
	})
for i = 2, 8 do
	minetest.register_craftitem("tutorial:server_hammer"..i, {
		description = "Admin tool 6: Server Hammer in Mode "..i.." ("..mode_text[i][1]..")",
		inventory_image = "ban_hammer.png^technic_tool_mode"..i..".png",
		wield_image = "ban_hammer.png",
		groups = {not_in_creative_inventory=1},
		on_secondary_use = function(itemstack, user, pointed_thing)
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
local xp_silver = {}
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
		.."button[0,2.0;2,0.5;crafting;4x4 craft]"
		.."button[2,2.0;2,0.5;crafting3;5x5 craft]"
        .."button[4,2.0;2,0.5;crafting6;Cooking]"
		.."button[6,2.0;2,0.5;dna;DNA craft]"
        .."button[8,2.0;2,0.5;color;Color craft]"
		.."button[4,3.0;2,0.5;backward;Backward craft]"
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
		.."textlist[0,1;6,5;xp;Lv.1 = 2xp,Lv.2 = 4xp,Lv.3 = 6xp,Lv.4 = 8xp,Lv.5 = 10xp,Lv.6 = 12xp,Lv.7 = 14xp,Lv.8 = 16xp,Lv.9 = 18xp,Lv.10 = 20xp,Lv.11 = 24xp,Lv.12 = 28xp,Lv.13 = 32xp,Lv.14 = 36xp,Lv.15 = 40xp,Lv.16 = 44xp,Lv.17 = 48xp,Lv.18 = 52xp,Lv.19 = 56xp,Lv.20 = 60xp,Lv.21 = 66xp,Lv.22 = 72xp,Lv.23 = 78xp,Lv.24 = 84xp,Lv.25 = 90xp,Lv.26 = 96xp,Lv.27 = 102xp,Lv.28 = 108xp,Lv.29 = 114xp,Lv.30 = 120xp,Lv.31 = 128xp,Lv.32 = 136xp,Lv.33 = 144xp,Lv.34 = 152xp,Lv.35 = 160xp,Lv.36 = 168xp,Lv.37 = 176xp,Lv.38 = 184xp,Lv.39 = 192xp,Lv.40 = 200xp,Lv.41 = 210xp,Lv.42 = 220xp,Lv.43 = 230xp,Lv.44 = 240xp,Lv.45 = 250xp,Lv.46 = 260xp,Lv.47 = 270xp,Lv.48 = 280xp,Lv.49 = 290xp,Lv.50 = 300xp,Lv.51 = 312xp,Lv.52 = 324xp,Lv.53 = 336xp,Lv.54 = 348xp,Lv.55 = 360xp,Lv.56 = 372xp,Lv.57 = 384xp,Lv.58 = 396xp,Lv.59 = 408xp,Lv.60 = 420xp,Lv.61 = 434xp,Lv.62 = 448xp,Lv.63 = 462xp,Lv.64 = 476xp,Lv.65 = 490xp,Lv.66 = 504xp,Lv.67 = 518xp,Lv.68 = 532xp,Lv.69 = 546xp,Lv.70 = 560xp,Lv.71 = 576xp,Lv.72 = 592xp,Lv.73 = 608xp,Lv.74 = 624xp,Lv.75 = 640xp,Lv.76 = 656xp,Lv.77 = 672xp,Lv.78 = 688xp,Lv.79 = 704xp,Lv.80 = 720xp,Lv.81 = 738xp,Lv.82 = 756xp,Lv.83 = 774xp,Lv.84 = 792xp,Lv.85 = 810xp,Lv.86 = 828xp,Lv.87 = 846xp,Lv.88 = 864xp,Lv.89 = 882xp,Lv.90 = 900xp,Lv.91 = 920xp,Lv.92 = 940xp,Lv.93 = 960xp,Lv.94 = 980xp,Lv.95 = 1000xp,Lv.96 = 1020xp,Lv.97 = 1040xp,Lv.98 = 1060xp,Lv.99 = 1080xp,Lv.100 = 1100xp,Lv.MAX = 1500xp]"
	return formspec
end
xp_silver.get_formspec = function(player)
	formspec = "size[6.2,5.95]button[0,0;2,0.5;xp_gui;Back]"
        .."background[6.2,5.95;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[2.5,0;2,0.5;main;Main]"
		.."textlist[0,1;6,5;xp;Lv.1 = 4xp,Lv.2 = 8xp,Lv.3 = 12xp,Lv.4 = 16xp,Lv.5 = 20xp,Lv.6 = 24xp,Lv.7 = 28xp,Lv.8 = 32xp,Lv.9 = 36xp,Lv.10 = 40xp]"--,Lv.11 = 24xp,Lv.12 = 28xp,Lv.13 = 32xp,Lv.14 = 36xp,Lv.15 = 40xp,Lv.16 = 44xp,Lv.17 = 48xp,Lv.18 = 52xp,Lv.19 = 56xp,Lv.20 = 60xp,Lv.21 = 66xp,Lv.22 = 72xp,Lv.23 = 78xp,Lv.24 = 84xp,Lv.25 = 90xp,Lv.26 = 96xp,Lv.27 = 102xp,Lv.28 = 108xp,Lv.29 = 114xp,Lv.30 = 120xp,Lv.31 = 128xp,Lv.32 = 136xp,Lv.33 = 144xp,Lv.34 = 152xp,Lv.35 = 160xp,Lv.36 = 168xp,Lv.37 = 176xp,Lv.38 = 184xp,Lv.39 = 192xp,Lv.40 = 200xp,Lv.41 = 210xp,Lv.42 = 220xp,Lv.43 = 230xp,Lv.44 = 240xp,Lv.45 = 250xp,Lv.46 = 260xp,Lv.47 = 270xp,Lv.48 = 280xp,Lv.49 = 290xp,Lv.50 = 300xp,Lv.51 = 312xp,Lv.52 = 324xp,Lv.53 = 336xp,Lv.54 = 348xp,Lv.55 = 360xp,Lv.56 = 372xp,Lv.57 = 384xp,Lv.58 = 396xp,Lv.59 = 408xp,Lv.60 = 420xp,Lv.61 = 434xp,Lv.62 = 448xp,Lv.63 = 462xp,Lv.64 = 476xp,Lv.65 = 490xp,Lv.66 = 504xp,Lv.67 = 518xp,Lv.68 = 532xp,Lv.69 = 546xp,Lv.70 = 560xp,Lv.71 = 576xp,Lv.72 = 592xp,Lv.73 = 608xp,Lv.74 = 624xp,Lv.75 = 640xp,Lv.76 = 656xp,Lv.77 = 672xp,Lv.78 = 688xp,Lv.79 = 704xp,Lv.80 = 720xp,Lv.81 = 738xp,Lv.82 = 756xp,Lv.83 = 774xp,Lv.84 = 792xp,Lv.85 = 810xp,Lv.86 = 828xp,Lv.87 = 846xp,Lv.88 = 864xp,Lv.89 = 882xp,Lv.90 = 900xp,Lv.91 = 920xp,Lv.92 = 940xp,Lv.93 = 960xp,Lv.94 = 980xp,Lv.95 = 1000xp,Lv.96 = 1020xp,Lv.97 = 1040xp,Lv.98 = 1060xp,Lv.99 = 1080xp,Lv.100 = 1100xp,Lv.MAX = 1500xp]"
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
	local xp_silver_o = io.open(minetest.get_worldpath().."/"..name.."_experience_silver", "r")
	local xp_silver = xp_silver_o:read("*l")
	player_inv:set_size("bronze_key", 1)
	formspec = "size[8,8.3]button[0,0;2,0.5;inven;Back]"
        .."background[8,8.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
		.."button[2,0;2,0.5;main;Main]"
		.."label[0,1;Xp bronze (Part1) : "..xp_bronze.."xp]"
		.."label[0,1.3;Xp silver   (Part2) : "..xp_silver.."xp]"
		.."list[current_player;main;0,4.25;8,1;]"
		.."list[current_player;main;0,5.5;8,3;8]"
        .."list[current_player;bronze_key;5,2.7;8,1;]"
        .."label[5,3.5;Bronzekey]"
		.."button[3.5,1.5;2.0,0.2;xp_bronze;Xp bronze you need]"
		.."button[5.5,1.5;2.0,0.2;xp_silver;Xp silver you need]"
	return formspec
end	
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if player == nil then
        return
    end
	if fields.xp_bronze then
		inventory_plus.set_inventory_formspec(player, xp_bronze.get_formspec(player))
	end
	if fields.xp_silver then
		inventory_plus.set_inventory_formspec(player, xp_silver.get_formspec(player))
	end
    if fields.xp_gui then
		inventory_plus.set_inventory_formspec(player, xp_gui.get_formspec(player))
	end
	if fields.craft10 then
		local item_name = ""
		for i=1,10 do
			local player_inv = player:get_inventory()
			local crafted = nil
			local table_dec = nil
			local player_inv = player:get_inventory()
			local tablelist = player_inv:get_list("craft")
			if tablelist then
				crafted,table_dec = minetest.get_craft_result({method = "normal", width = 3, items = tablelist})
			end
			if item_name == "" or item_name == crafted.item:get_name() then
				item_name = crafted.item:get_name()
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
					player_inv:set_list("craft", table_dec.items)
				end
			end
		end
		inventory_plus.set_inventory_formspec(player, sfinv.get_formspec(player, sfinv.get_or_create_context(player)))
	end
	if fields.craft99 then
		local item_name = ""
		for i=1,99 do
			local player_inv = player:get_inventory()
			local crafted = nil
			local table_dec = nil
			local player_inv = player:get_inventory()
			local tablelist = player_inv:get_list("craft")
			if tablelist then
				crafted,table_dec = minetest.get_craft_result({method = "normal", width = 3, items = tablelist})
			end
			if item_name == "" or item_name == crafted.item:get_name() then
				item_name = crafted.item:get_name()
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
					player_inv:set_list("craft", table_dec.items)
				end
			end
		end
		inventory_plus.set_inventory_formspec(player, sfinv.get_formspec(player, sfinv.get_or_create_context(player)))
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
		local item_name = ""
        for i=1,10 do
            local player_inv = player:get_inventory()
		    local crafted = nil
		    local table_dec = nil
		    local player_inv = player:get_inventory()
		    local tablelist = player_inv:get_list("crvier")
		    if tablelist then
			    crafted,table_dec = minetest.get_craft_result({method = "normal", width = 4, items = tablelist})
		    end
		    if item_name == "" or item_name == crafted.item:get_name() then
				item_name = crafted.item:get_name()
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
			end
		    inventory_plus.set_inventory_formspec(player, crafting.get_formspec(player))
        end
    end
    if fields.cra99 then
		local item_name = ""
        for i=1,99 do
            local player_inv = player:get_inventory()
		    local crafted = nil
		    local table_dec = nil
		    local player_inv = player:get_inventory()
		    local tablelist = player_inv:get_list("crvier")
		    if tablelist then
			    crafted,table_dec = minetest.get_craft_result({method = "normal", width = 4, items = tablelist})
		    end
		    if item_name == "" or item_name == crafted.item:get_name() then
				item_name = crafted.item:get_name()
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
		local item_name = ""
        for i=1,10 do
		    local player_inv = player:get_inventory()
		    local crafted = nil
		    local table_dec = nil
		    local player_inv = player:get_inventory()
		    local tablelist = player_inv:get_list("crvier3")
		    if tablelist then
			    crafted,table_dec = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
		    end
		    if item_name == "" or item_name == crafted.item:get_name() then
				item_name = crafted.item:get_name()
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
			end
		    inventory_plus.set_inventory_formspec(player, crafting3.get_formspec(player))
        end
	end
    if fields.cra399 then
		local item_name = ""
        for i=1,99 do
		    local player_inv = player:get_inventory()
		    local crafted = nil
		    local table_dec = nil
		    local player_inv = player:get_inventory()
		    local tablelist = player_inv:get_list("crvier3")
		    if tablelist then
			    crafted,table_dec = minetest.get_craft_result({method = "normal", width = 5, items = tablelist})
		    end
			if item_name == "" or item_name == crafted.item:get_name() then
				item_name = crafted.item:get_name()
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