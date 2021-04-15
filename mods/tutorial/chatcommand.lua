minetest.register_chatcommand("regnum", {
	params = "",
	description = "Gives you all regnum things",
	privs = {give=true},
	func = function(name, param)
        local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
        inv:set_size("bronze_key", 1)
        inv:set_size("xpi1", 100)
        inv:add_item("bronze_key", "tutorial:bronzekey")
        inv:add_item("main", "tutorial:regnumwings1")
        inv:add_item("main", "tutorial:molestick5")
        inv:add_item("main", "tutorial:levelMAX_bronze")
        for i=1,100 do
            inv:set_stack("xpi1",i,"tutorial:level"..i.."_bronze")
		end
        file = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience_bronze", "w")
		file:write("1500")
		file:close()
        inv:set_size("a1", 1)
		inv:set_size("a2", 1)
		inv:set_size("a3", 1)
		inv:set_size("a4", 1)
        inv:set_stack("a1", 1, "default:dirt")
		inv:set_stack("a2", 1, "default:dirt")
		inv:set_stack("a3", 1, "default:dirt")
		inv:set_stack("a4", 1, "default:dirt")
	end,
})
minetest.register_chatcommand("rank", {
	params = "",
	description = "Show your Rank",
	privs = {},
	func = function(name, param)
		pri = minetest.get_player_privs(name)
        if pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring and pri.server and pri.password and pri.delprotect and pri.kick and pri.ban and pri.rollback and pri.privs and pri.basic_privs and pri.give and pri.protection_bypass and pri.travelnet_remove and pri.travelnet_attach and pri.shop_admin and pri.creative then
			minetest.chat_send_player(name, "Your Rank: Admin")
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring then
			minetest.chat_send_player(name, "Your Rank: Legend")
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport and pri.noclip and pri.debug then
			minetest.chat_send_player(name, "Your Rank: Hero")
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom and pri.teleport then
			minetest.chat_send_player(name, "Your Rank: VIP")
		elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.zoom then
			minetest.chat_send_player(name, "Your Rank: Premium")
		elseif pri.interact and pri.shout then
			minetest.chat_send_player(name, "Your Rank: Member")
		else
			minetest.chat_send_player(name, "Your Rank: Enemy")
		end
	end,
})
minetest.register_chatcommand("admin", {
	params = "",
	description = "Gives you all admin tools",
	privs = {give=true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		inv:add_item("main", "ban_hammer:hammer1")			--admin tool 1
		inv:add_item("main", "tutorial:pistole")			--admin tool 2
		inv:add_item("main", "tutorial:adminbattleaxe")		--admin tool 3
		inv:add_item("main", "technic:laser_mkA1")			--admin tool 4
		inv:add_item("main", "technic:chainsaw")			--admin tool 5
		inv:add_item("main", "tutorial:server_hammer1")		--admin tool 6
		inv:add_item("main", "tutorial:monster_remover")	--admin tool 7
        inv:add_item("main", "technic:mining_drill_mkA1")	--admin tool 8
        inv:add_item("main", "tutorial:adminwallplacer_1")	--admin tool 9
        inv:add_item("main", "tutorial:legendstick_admin")	--admin tool 10
        inv:add_item("main", "tutorial:gun_admin1")	        --admin tool 11
		inv:add_item("main", "3d_armor:helmet_admin")
		inv:add_item("main", "3d_armor:chestplate_admin")
		inv:add_item("main", "3d_armor:leggings_admin")
		inv:add_item("main", "3d_armor:boots_admin")
		inv:add_item("main", "shields:shield_admin")
	end,
})