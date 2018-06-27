local S = technic.getter
-- Based on code by Uberi: https://gist.github.com/Uberi/3125280
local function rayIter(pos, dir, range)
	local p = vector.round(pos)
	local x_step,      y_step,      z_step      = 0, 0, 0
	local x_component, y_component, z_component = 0, 0, 0
	local x_intersect, y_intersect, z_intersect = 0, 0, 0

	if dir.x == 0 then
		x_intersect = math.huge
	elseif dir.x > 0 then
		x_step = 1
		x_component = 1 / dir.x
		x_intersect = x_component
	else
		x_step = -1
		x_component = 1 / -dir.x
	end
	if dir.y == 0 then
		y_intersect = math.huge
	elseif dir.y > 0 then
		y_step = 1
		y_component = 1 / dir.y
		y_intersect = y_component
	else
		y_step = -1
		y_component = 1 / -dir.y
	end
	if dir.z == 0 then
		z_intersect = math.huge
	elseif dir.z > 0 then
		z_step = 1
		z_component = 1 / dir.z
		z_intersect = z_component
	else
		z_step = -1
		z_component = 1 / -dir.z
	end

	return function()
		if x_intersect < y_intersect then
			if x_intersect < z_intersect then
				p.x = p.x + x_step
				x_intersect = x_intersect + x_component
			else
				p.z = p.z + z_step
				z_intersect = z_intersect + z_component
			end
		elseif y_intersect < z_intersect then
			p.y = p.y + y_step
			y_intersect = y_intersect + y_component
		else
			p.z = p.z + z_step
			z_intersect = z_intersect + z_component
		end
		if vector.distance(pos, p) > range then
			return nil
		end
		return p
	end
end
local function laser_node(pos, node, player)
	local def = minetest.registered_nodes[node.name]
	if def and def.liquidtype ~= "none" then
		minetest.remove_node(pos)
		minetest.add_particle({
			pos = pos,
			vel = {x=0, y=2, z=0},
			acc = {x=0, y=-1, z=0},
			expirationtime = 1.5,
			size = 6 + math.random() * 2,
			texture = "smoke_puff.png^[transform" .. math.random(0, 7),
		})
		return
	end
	minetest.node_dig(pos, node, player)
end

local no_destroy = {
	["air"] = true,
	["default:lava_source"] = true,
	["default:lava_flowing"] = true,
}
local function laser_shoot(player, range, particle_texture, sound)
	local player_pos = player:getpos()
	local player_name = player:get_player_name()
	local dir = player:get_look_dir()

	local start_pos = vector.new(player_pos)
	-- Adjust to head height
	start_pos.y = start_pos.y + 1.9
	minetest.add_particle({
		pos = startpos,
		vel = dir,
		acc = vector.multiply(dir, 50),
		expirationtime = range / 11,
		size = 1,
		texture = particle_texture .. "^[transform" .. math.random(0, 7),
	})
	minetest.sound_play(sound, {pos = player_pos, max_hear_distance = range})
	for pos in rayIter(start_pos, dir, range) do
		if minetest.is_protected(pos, player_name) then
			minetest.record_protection_violation(pos, player_name)
			break
		end
		local node = minetest.get_node_or_nil(pos)
		if not node then
			break
		end
		if not no_destroy[node.name] then
			laser_node(pos, node, player)
		end
	end
end
technic.register_power_tool("technic:laser_mkS150", 2000000)
minetest.register_tool("technic:laser_mkS150", {
	description = S("Spezial Mining Laser lv.150"),
	inventory_image = "technic_mining_laser_mkS150.png",
	stack_max = 1,
	on_use = function(itemstack, user)
		laser_shoot(user, 30, "technic_laser_beam_mk150.png", "technic_laser_mk150")
		return itemstack
	end,
})
technic.register_power_tool("technic:laser_mkA1", 1)
minetest.register_tool("technic:laser_mkA1", {
	description = S("Admin tool 4: Laser Gun"),
	inventory_image = "technic_mining_laser_Admin1.png",
	stack_max = 1,
	on_use = function(itemstack, user)
		laser_shoot(user, 50, "technic_laser_beam_mk1.png", "technic_laser_mk1")
		return itemstack
	end,
})
