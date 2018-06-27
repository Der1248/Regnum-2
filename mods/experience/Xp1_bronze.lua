minetest.register_on_dignode(function(pos, oldnode, digger)
	local namer = oldnode.name
	local see_if_mineral = minetest.get_item_group(namer, "xpb")
	if see_if_mineral > 0 then
		minetest.env:add_entity(pos, "experience:orb_bronze")
	end
end)

minetest.register_on_newplayer(function(player)
	local file = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience_bronze", "w")
	file:write("0")
	file:close()
end)

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local pos = player:getpos()
		pos.y = pos.y+0.5
		for _,object in ipairs(minetest.env:get_objects_inside_radius(pos, 1)) do
			if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "experience:orb_bronze" then
				--RIGHT HERE ADD IN THE CODE TO UPGRADE PLAYERS 
				object:setvelocity({x=0,y=0,z=0})
				object:get_luaentity().name = "STOP"
				minetest.sound_play("orb", {
					to_player = player:get_player_name(),
				})
				xp = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience_bronze", "r")
				experience_bronze = xp:read("*l")
				xp:close()
                experience_bronze = experience_bronze+0
				if experience_bronze ~= nil then
					new_xp = experience_bronze + 1
					xp_write = io.open(minetest.get_worldpath().."/"..player:get_player_name().."_experience_bronze", "w")
					xp_write:write(new_xp)
					xp_write:close()
                    local player_inv = player:get_inventory()
                    local h = 0
                    for i=1,100 do
                        local g = 0
                        if i < 11 then
                            g = i*2
                        elseif i < 21 then
                            g = 20+(i-10)*4
                        elseif i < 31 then
                            g = 60+(i-20)*6
                        elseif i < 41 then
                            g = 120+(i-30)*8
                        elseif i < 51 then
                            g = 200+(i-40)*10
                        elseif i < 61 then
                            g = 300+(i-50)*12
                        elseif i < 71 then
                            g = 420+(i-60)*14
                        elseif i < 81 then
                            g = 560+(i-70)*16
                        elseif i < 91 then
                            g = 720+(i-80)*18
                        elseif i < 101 then
                            g = 900+(i-90)*20
                        end
                        if new_xp == g then
                            player_inv:set_size("xpi01", 10)
                            player_inv:add_item("xpi01", "tutorial:coin_bronze 1")
                            player_inv:set_size("xpi1", 100)
                            player_inv:set_stack("xpi1", i, "tutorial:level"..i.."_bronze 1")
                            minetest.sound_play("level_up", {
							    to_player = player:get_player_name(),
						    })
                        end
                    end
                    if new_xp == 1100 then
						player_inv:set_size("xpi01", 10)
						player_inv:add_item("xpi01", "tutorial:bronzekey")
						minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
					end
                    if new_xp == 1500 then
                        player_inv:set_size("xpi01", 10)
                        player_inv:add_item("xpi01", "tutorial:coin_bronze 4")
                        player_inv:add_item("xpi01", "tutorial:levelMAX_bronze 1")
                        minetest.sound_play("level_up", {
							to_player = player:get_player_name(),
						})
                    end 
				end
				object:remove()
		end
	end
for _,object in ipairs(minetest.env:get_objects_inside_radius(pos, 3)) do
			if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "experience:orb_gelb" then
				if object:get_luaentity().collect then
					local pos1 = pos
					pos1.y = pos1.y+0.2
					local pos2 = object:getpos()
					local vec = {x=pos1.x-pos2.x, y=pos1.y-pos2.y, z=pos1.z-pos2.z}
					vec.x = vec.x*3
					vec.y = vec.y*3
					vec.z = vec.z*3
					object:setvelocity(vec)
				end
			end
		end
	end
end)

minetest.register_entity("experience:orb_bronze", {
	physical = true,
	timer = 0,
	textures = {"orb_bronze.png"},
	visual_size = {x=0.3, y=0.3},
	collisionbox = {-0.17,-0.17,-0.17,0.17,0.17,0.17},
	on_activate = function(self, staticdata)
		self.object:set_armor_groups({immortal=1})
		self.object:setvelocity({x=0, y=1, z=0})
		self.object:setacceleration({x=0, y=-10, z=0})
	end,
	collect = true,
	on_step = function(self, dtime)
		self.timer = self.timer + dtime
		if (self.timer > 300) then
			self.object:remove()
		end
		local p = self.object:getpos()
		local nn = minetest.env:get_node(p).name
		noder = minetest.env:get_node(p).name
		p.y = p.y - 0.3
		local nn = minetest.env:get_node(p).name
		if not minetest.registered_nodes[nn] or minetest.registered_nodes[nn].walkable then
			if self.physical_state then
				self.object:setvelocity({x=0, y=0, z=0})
				self.object:setacceleration({x=0, y=0, z=0})
				self.physical_state = false
				self.object:set_properties({
					physical = false
				})
			end
		else
			if not self.physical_state then
				self.object:setvelocity({x=0,y=0,z=0})
				self.object:setacceleration({x=0, y=-10, z=0})
				self.physical_state = true
				self.object:set_properties({
					physical = true
				})
			end
		end
	end,
})



