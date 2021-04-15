local path = minetest.get_modpath("mobs")
dofile(path.."/api.lua")
dofile(path.."/egg.lua")
dofile(path.."/knight.lua")
dofile(path.."/monsterx1.lua")
dofile(path.."/knight2.lua")
dofile(path.."/mummy.lua")


local animals = {
	{"knight","1248 Knight","knight_1248"},
	{"knight2","Knight","knight"},
}

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 1 then
		local players = minetest.get_connected_players()
		for _,player in ipairs(players) do
			for _, m in pairs(animals) do
				if player:get_attribute(m[1].."x") then
					local all_objects = minetest.get_objects_inside_radius({x=tonumber(player:get_attribute(m[1].."x")), y=tonumber(player:get_attribute(m[1].."y")), z=tonumber(player:get_attribute(m[1].."z"))}, 30)
					local is_player = false
					for _,obj in ipairs(all_objects) do
						if obj:is_player() then
							is_player = true
						end
					end
					local set_animal = true
					if is_player then
						for _,obj in ipairs(all_objects) do
							if obj:get_entity_name() == "mobs:"..m[3] and obj:get_luaentity().owner == player:get_player_name() then
								if set_animal == false then
									obj:remove()
								end
								set_animal = false
							end
						end
					end
					if set_animal and is_player then
						local obj2 =  minetest.env:add_entity({x=tonumber(player:get_attribute(m[1].."x")), y=tonumber(player:get_attribute(m[1].."y")), z=tonumber(player:get_attribute(m[1].."z"))},"mobs:"..m[3])
						local ent = obj2:get_luaentity()
						ent.owner = player:get_player_name()
						ent.npc_name = player:get_player_name().."'s "..m[2]
						obj2:set_properties({infotext=player:get_player_name().."'s "..m[2]})
						if player:get_attribute(m[1].."_meta1") then
							ent.metadata = tonumber(player:get_attribute(m[1].."_meta1"))
							ent.metadata2 = tonumber(player:get_attribute(m[1].."_meta2"))
							update_meta(player,m[1],obj2,ent)
						end
					end
				end
			end
		end
	end
end)

function update_meta(player,animal,obj,ent)
	if animal == "knight2" then
		if tonumber(player:get_attribute("knight2_meta1")) == 2 then
			obj:set_properties({textures={"mobs_knight_blue.png"}})
		elseif tonumber(player:get_attribute("knight2_meta1")) == 3 then
			obj:set_properties({textures={"mobs_knight_green.png"}})
		elseif tonumber(player:get_attribute("knight2_meta1")) == 4 then
			obj:set_properties({textures={"mobs_knight_pink.png"}})
		elseif tonumber(player:get_attribute("knight2_meta1")) == 5 then
			obj:set_properties({textures={"mobs_knight_purple.png"}})
		elseif tonumber(player:get_attribute("knight2_meta1")) == 1 then
			obj:set_properties({textures={"mobs_knight_red.png"}})
		end
	end
	if tonumber(player:get_attribute(animal.."_meta2")) == 2 then
		ent.walk_velocity = 0
		ent.run_velocity = 0
	elseif tonumber(player:get_attribute(animal.."_meta2")) == 1 then
		ent.walk_velocity = 1
		ent.run_velocity = 3
	end
end 