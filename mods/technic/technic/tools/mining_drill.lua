local max_charge = {50000, 200000, 650000,1}
local power_usage_per_node = {1000, 2000, 3000,0}

local S = technic.getter

local mining_drill_mode_text = {
	{S("Single node.")},
	{S("3 nodes deep.")},
	{S("3 nodes wide.")},
	{S("3 nodes tall.")},
	{S("3x3 nodes.")},
}

local function drill_dig_it0 (pos,player)
	if minetest.is_protected(pos, player:get_player_name()) then
		minetest.record_protection_violation(pos, player:get_player_name())
		return
	end
	local node=minetest.get_node(pos)
	if node.name == "air" or node.name == "ignore" then return end
	if node.name == "default:lava_source" then return end
	if node.name == "default:lava_flowing" then return end
	if node.name == "tutorial:stone_with_titan" then return end
	if node.name == "default:water_source" then minetest.remove_node(pos) return end
	if node.name == "default:water_flowing" then minetest.remove_node(pos) return end
	minetest.node_dig(pos,node,player)
end

local function drill_dig_it1 (player)
	local dir=player:get_look_dir()
	if math.abs(dir.x)>math.abs(dir.z) then 
		if dir.x>0 then return 0 end
		return 1
	end
	if dir.z>0 then return 2 end
	return 3
end

local function drill_dig_it2 (pos,player)
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	drill_dig_it0 (pos,player)
	pos.z=pos.z-2
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	pos.y=pos.y+1
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	drill_dig_it0 (pos,player)
	pos.z=pos.z-2
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	pos.y=pos.y-2
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	drill_dig_it0 (pos,player)
	pos.z=pos.z-2
	drill_dig_it0 (pos,player)
end

local function drill_dig_it3 (pos,player)
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	pos.y=pos.y+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	pos.y=pos.y-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
end

local function drill_dig_it4 (pos,player)
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	pos.z=pos.z+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	pos.z=pos.z-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
end
local function drill_dig_it(pos, player, mode)
	if mode == 1 then
		drill_dig_it0(pos, player)
	end
	
	if mode == 2 then -- 3 deep
		dir = drill_dig_it1(player)
		if dir == 0 then -- x+
			drill_dig_it0(pos, player)
			pos.x = pos.x + 1
			drill_dig_it0(pos, player)
			pos.x = pos.x + 1
			drill_dig_it0(pos, player)
		end
		if dir == 1 then  -- x-
			drill_dig_it0(pos, player)
			pos.x=pos.x-1
			drill_dig_it0 (pos,player)
			pos.x=pos.x-1
			drill_dig_it0 (pos,player)
		end
		if dir==2 then  -- z+
			drill_dig_it0 (pos,player)
			pos.z=pos.z+1
			drill_dig_it0 (pos,player)
			pos.z=pos.z+1
			drill_dig_it0 (pos,player)
		end
		if dir==3 then  -- z-
			drill_dig_it0 (pos,player)
			pos.z=pos.z-1
			drill_dig_it0 (pos,player)
			pos.z=pos.z-1
			drill_dig_it0 (pos,player)
		end
	end
	
	if mode==3 then -- 3 wide
		dir=drill_dig_it1(player)
		if dir==0 or dir==1 then -- x
			drill_dig_it0 (pos,player)
			pos.z=pos.z+1
			drill_dig_it0 (pos,player)
			pos.z=pos.z-2
			drill_dig_it0 (pos,player)
		end
		if dir==2 or dir==3 then  -- z
			drill_dig_it0 (pos,player)
			pos.x=pos.x+1
			drill_dig_it0 (pos,player)
			pos.x=pos.x-2
			drill_dig_it0 (pos,player)
		end
	end
	
	if mode==4 then -- 3 tall, selected in the middle
		drill_dig_it0 (pos,player)
		pos.y=pos.y-1
		drill_dig_it0 (pos,player)
		pos.y=pos.y-1
		drill_dig_it0 (pos,player)
	end

	if mode==5 then -- 3 x 3
		local dir=player:get_look_dir()
		if math.abs(dir.y)<0.5 then
			dir=drill_dig_it1(player)
				if dir==0 or dir==1 then -- x
					drill_dig_it2(pos,player)
				end
				if dir==2 or dir==3 then  -- z
					drill_dig_it3(pos,player)
				end
		else
		drill_dig_it4(pos,player)
		end
	end
	
	minetest.sound_play("mining_drill", {pos = pos, gain = 1.0, max_hear_distance = 10,})
end

local function pos_is_pointable(pos)
	local node = minetest.get_node(pos)
	local nodedef = minetest.registered_nodes[node.name]
	return nodedef and nodedef.pointable
end


local function mining_drill_setmode(user,itemstack)
	local player_name=user:get_player_name()
	local item=itemstack:to_table()
	local meta=minetest.deserialize(item["metadata"])
	if meta==nil then
		meta={}
		mode=0
	end
    
	if meta["mode"]==nil then
		minetest.chat_send_player(player_name, S("Use while sneaking to change Mining Drill Mk%d modes."):format(3))
		meta["mode"]=0
		mode=0
	end
	mode=(meta["mode"])
    local mode2 = mode
	mode=mode+1
	if mode>=6 then mode=1 end
	minetest.chat_send_player(player_name, S("Mining Drill Mk%d Mode %d"):format(3, mode)..": "..mining_drill_mode_text[mode][1])
	local items = user:get_wielded_item():get_name()
    if mode2 == 0 then
	  item["name"]=items.."_"..mode
    else
      text = items:sub(1, -3)
      item["name"]=text.."_"..mode
    end
	meta["mode"]=mode
	item["metadata"]=minetest.serialize(meta)
	itemstack:replace(item)
	return itemstack
end


local function mining_drill_mk_handler(itemstack, user, pointed_thing)
	local keys = user:get_player_control()
	local player_name = user:get_player_name()
	local meta = minetest.deserialize(itemstack:get_metadata())
	if not meta or not meta.mode or keys.sneak then
		return mining_drill_setmode(user, itemstack)
	end
	if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) or not meta.charge then
		return
	end
    local items = user:get_wielded_item():get_name()
    local text = items:sub(24, 24)
	local charge_to_take = power_usage_per_node[tonumber(text)]
	if meta.charge >= charge_to_take then
		local pos = minetest.get_pointed_thing_position(pointed_thing, above)
		drill_dig_it(pos, user, meta.mode)
		meta.charge = meta.charge - charge_to_take
		itemstack:set_metadata(minetest.serialize(meta))
		technic.set_RE_wear(itemstack, meta.charge, max_charge[tonumber(text)])
        print(max_charge[tonumber(text)])
        print(power_usage_per_node[tonumber(text)])
        print(meta.charge)
	end
	return itemstack
end

local function mining_drill_mk1_handler(itemstack, user, pointed_thing)
	local keys = user:get_player_control()
	local player_name = user:get_player_name()
	local meta = minetest.deserialize(itemstack:get_metadata())
	if not meta or not meta.mode or keys.sneak then
		return mining_drill_setmode(user, itemstack)
	end
	if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) or not meta.charge then
		return
	end
    local items = user:get_wielded_item():get_name()
    local text = items:sub(24, 24)
	local charge_to_take = power_usage_per_node[1]
	if meta.charge >= charge_to_take then
		local pos = minetest.get_pointed_thing_position(pointed_thing, above)
		drill_dig_it(pos, user, meta.mode)
		meta.charge = meta.charge - charge_to_take
		itemstack:set_metadata(minetest.serialize(meta))
		technic.set_RE_wear(itemstack, meta.charge, max_charge[1])
        print(max_charge[1])
        print(power_usage_per_node[1])
        print(meta.charge)
	end
	return itemstack
end
local function mining_drill_mkA_handler(itemstack, user, pointed_thing)
	local keys = user:get_player_control()
	local player_name = user:get_player_name()
	local meta = minetest.deserialize(itemstack:get_metadata())
	if not meta or not meta.mode or keys.sneak then
		return mining_drill_setmode(user, itemstack)
	end
	if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) or not meta.charge then
		return
	end
    local items = user:get_wielded_item():get_name()
    local text = items:sub(24, 24)
	local charge_to_take = power_usage_per_node[4]
	if meta.charge >= charge_to_take then
		local pos = minetest.get_pointed_thing_position(pointed_thing, above)
		drill_dig_it(pos, user, meta.mode)
		meta.charge = meta.charge - charge_to_take
		itemstack:set_metadata(minetest.serialize(meta))
		technic.set_RE_wear(itemstack, meta.charge, max_charge[4])
        print(max_charge[4])
        print(power_usage_per_node[4])
        print(meta.charge)
	end
	return itemstack
end
minetest.register_tool("technic:mining_drill", {
	description = S("Mining Drill Mk%d"):format(1),
	inventory_image = "technic_mining_drill.png",
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	on_use = function(itemstack, user, pointed_thing)
		mining_drill_mk1_handler(itemstack, user, pointed_thing)
		return itemstack
	end,
})

technic.register_power_tool("technic:mining_drill", max_charge[1])

for i = 1, 5 do
	technic.register_power_tool("technic:mining_drill_"..i, max_charge[1])
	minetest.register_tool("technic:mining_drill_"..i, {
		description = S("Mining Drill Mk%d Mode %d"):format(1, i),
		inventory_image = "technic_mining_drill.png^technic_tool_mode"..i..".png",
		wield_image = "technic_mining_drill_mk2.png",
		wear_represents = "technic_RE_charge",
		on_refill = technic.refill_RE_charge,
		groups = {not_in_creative_inventory=1},
		on_use = function(itemstack, user, pointed_thing)
			mining_drill_mk1_handler(itemstack, user, pointed_thing)
			return itemstack
		end,
	})
end
minetest.register_tool("technic:mining_drill_mk2", {
	description = S("Mining Drill Mk%d"):format(2),
	inventory_image = "technic_mining_drill_mk2.png",
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	on_use = function(itemstack, user, pointed_thing)
		mining_drill_mk_handler(itemstack, user, pointed_thing)
		return itemstack
	end,
})

technic.register_power_tool("technic:mining_drill_mk2", max_charge[2])

for i = 1, 5 do
	technic.register_power_tool("technic:mining_drill_mk2_"..i, max_charge[2])
	minetest.register_tool("technic:mining_drill_mk2_"..i, {
		description = S("Mining Drill Mk%d Mode %d"):format(2, i),
		inventory_image = "technic_mining_drill_mk2.png^technic_tool_mode"..i..".png",
		wield_image = "technic_mining_drill_mk2.png",
		wear_represents = "technic_RE_charge",
		on_refill = technic.refill_RE_charge,
		groups = {not_in_creative_inventory=1},
		on_use = function(itemstack, user, pointed_thing)
			mining_drill_mk_handler(itemstack, user, pointed_thing)
			return itemstack
		end,
	})
end

minetest.register_tool("technic:mining_drill_mk3", {
	description = S("Mining Drill Mk%d"):format(3),
	inventory_image = "technic_mining_drill_mk3.png",
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	on_use = function(itemstack, user, pointed_thing)
	mining_drill_mk_handler(itemstack,user,pointed_thing)
	return itemstack
	end,
})

technic.register_power_tool("technic:mining_drill_mk3", max_charge[3])

for i=1,5,1 do
	technic.register_power_tool("technic:mining_drill_mk3_"..i, max_charge[3])
	minetest.register_tool("technic:mining_drill_mk3_"..i, {
		description = S("Mining Drill Mk%d Mode %d"):format(3, i),
		inventory_image = "technic_mining_drill_mk3.png^technic_tool_mode"..i..".png",
		wield_image = "technic_mining_drill_mk3.png",
		wear_represents = "technic_RE_charge",
		on_refill = technic.refill_RE_charge,
		groups = {not_in_creative_inventory=1},
		on_use = function(itemstack, user, pointed_thing)
		mining_drill_mk_handler(itemstack,user,pointed_thing)
		return itemstack
		end,
	})
end


minetest.register_tool("technic:mining_drill_mkA1", {
	description = "Admin tool 8: Mining drill",
	inventory_image = "technic_mining_drill_Admin1.png",
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	on_use = function(itemstack, user, pointed_thing)
	    local keys = user:get_player_control()
	    local player_name = user:get_player_name()
	    local meta = minetest.deserialize(itemstack:get_metadata())
	    if not meta or not meta.mode or keys.sneak then
		    return mining_drill_setmode(user, itemstack)
	    end
	    if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) then
		    return
	    end
        local items = user:get_wielded_item():get_name()
		local pos = minetest.get_pointed_thing_position(pointed_thing, above)
		drill_dig_it(pos, user, meta.mode)
	    return itemstack
	end,
})

technic.register_power_tool("technic:mining_drill_mkA1", max_charge[4])

for i=1,5,1 do
	technic.register_power_tool("technic:mining_drill_mkA1_"..i, max_charge[4])
	minetest.register_tool("technic:mining_drill_mkA1_"..i, {
		description = "Admin tool 8: Mining drill Mode "..i,
		inventory_image = "technic_mining_drill_Admin1.png^technic_tool_mode"..i..".png",
		wield_image = "technic_mining_drill_Admin1.png",
		wear_represents = "technic_RE_charge",
		on_refill = technic.refill_RE_charge,
		groups = {not_in_creative_inventory=1},
		on_use = function(itemstack, user, pointed_thing)
		    local keys = user:get_player_control()
	        local player_name = user:get_player_name()
	        local meta = minetest.deserialize(itemstack:get_metadata())
	        if not meta or not meta.mode or keys.sneak then
		        return mining_drill_setmode(user, itemstack)
	        end
	        if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) then
		        return
	        end
            local items = user:get_wielded_item():get_name()
		    local pos = minetest.get_pointed_thing_position(pointed_thing, above)
		    drill_dig_it(pos, user, meta.mode)
		    return itemstack
		end,
	})
end



local mining_drill_list = {
--	{<num>, <max_charge>, <charge_per_shot>},
	{"150",  2000000, 1},
} 
for _, m in pairs(mining_drill_list) do
    technic.register_power_tool("technic:drill_mkS"..m[1], m[2])
    minetest.register_tool("technic:drill_mkS"..m[1], {
	    description = "Spezial Mining drill lv."..m[1],
	    inventory_image = "technic_mining_drill_mkS"..m[1]..".png",
	    wear_represents = "technic_RE_charge",
	    on_refill = technic.refill_RE_charge,
	    on_use = function(itemstack, user, pointed_thing)
	        local keys = user:get_player_control()
	            local player_name = user:get_player_name()
	            local meta = minetest.deserialize(itemstack:get_metadata())
	            if not meta or not meta.mode or keys.sneak then
		            return mining_drill_setmode(user, itemstack)
	            end
	            if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) then
		            return
	            end
                local items = user:get_wielded_item():get_name()
		        local pos = minetest.get_pointed_thing_position(pointed_thing, above)
		        drill_dig_it(pos, user, meta.mode)
	        return itemstack
	    end,
    })
    for i=1,5,1 do
	    technic.register_power_tool("technic:drill_mkS"..m[1].."_"..i, m[2])
	    minetest.register_tool("technic:drill_mkS"..m[1].."_"..i, {
		    description = "Spezial Mining drill lv."..m[1].." Mode "..i,
		    inventory_image = "technic_mining_drill_mkS"..m[1]..".png^technic_tool_mode"..i..".png",
		    wield_image = "technic_mining_drill_mkS"..m[1]..".png",
		    wear_represents = "technic_RE_charge",
		    on_refill = technic.refill_RE_charge,
		    groups = {not_in_creative_inventory=1},
		    on_use = function(itemstack, user, pointed_thing)
		        local keys = user:get_player_control()
	            local player_name = user:get_player_name()
	            local meta = minetest.deserialize(itemstack:get_metadata())
	            if not meta or not meta.mode or keys.sneak then
		            return mining_drill_setmode(user, itemstack)
	            end
	            if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) then
		            return
	            end
                local items = user:get_wielded_item():get_name()
		        local pos = minetest.get_pointed_thing_position(pointed_thing, above)
		        drill_dig_it(pos, user, meta.mode)
		        return itemstack
		    end,
	    })
    end
end