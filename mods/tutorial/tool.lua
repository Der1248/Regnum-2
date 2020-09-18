minetest.register_tool("tutorial:regnumbattleaxe1", {
	description = "Regnumbattleaxe Mode 1. Can dig water/lava\nBattleaxe-lv.MAX",
	inventory_image = "tutorial_regnumbattleaxe.png^technic_tool_mode1.png",
    wield_image = "tutorial_regnumbattleaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={               		
			snappy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			choppy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			crumbly =	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			fleshy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			cracky	=	{times={[0]=0, [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=0, [8]=0, [9]=0, [10]=0, [11]=0, [12]=0, [13]=0, [14]=0, [15]=5.0}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=150}
	},
	liquids_pointable = true,
})
minetest.register_tool("tutorial:regnumbattleaxe2", {
	description = "Regnumbattleaxe Mode 2. Can not dig water/lava\nBattleaxe-lv.MAX",
	inventory_image = "tutorial_regnumbattleaxe.png^technic_tool_mode2.png",
    wield_image = "tutorial_regnumbattleaxe.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={               		
			snappy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			choppy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			crumbly =	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			fleshy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			cracky	=	{times={[0]=0, [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=0, [8]=0, [9]=0, [10]=0, [11]=0, [12]=0, [13]=0, [14]=0, [15]=5.0}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=150}
	},
	liquids_pointable = false,
})
minetest.register_tool("tutorial:lilabattleaxe2", {
	description = "Purplebattleaxe Lv.MAX",
	inventory_image = "tutorial_lilabattleaxe2.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={	
			cracky  = {times={[13]=0,[14]=0}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=10}
	},
	liquids_pointable = true,
})
minetest.register_tool("tutorial:lilabattleaxe", {
	description = "Purplebattleaxe Lv.1 (only for red and blue ores)",
	inventory_image = "tutorial_lilabattleaxe.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={			
			cracky  = {times={[13]=0,}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=10}
	},
})
minetest.register_tool("tutorial:adminbattleaxe", {
	description = "Admin tool 3: Admin battleaxe Mode 1. Can not dig water/lava",
	inventory_image = "tutorial_adminbattleaxe.png^technic_tool_mode1.png",
    wield_image = "tutorial_adminbattleaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			snappy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},                      
			choppy  =	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},			
			crumbly =	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			fleshy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},		
			cracky  =	{times={[0]=0, [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=0, [8]=0, [9]=0, [10]=0, [11]=0, [12]=0, [13]=0, [14]=0, [15]=0, [0]=0,}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=1000}
	},
	liquids_pointable = false,
})
minetest.register_tool("tutorial:adminbattleaxe2", {
	description = "Admin tool 3: Admin battleaxe Mode 2. Can dig water/lava",
	inventory_image = "tutorial_adminbattleaxe.png^technic_tool_mode2.png",
    wield_image = "tutorial_adminbattleaxe.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={	
			snappy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},	
			snappy  =	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},                      
			choppy  =	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},			
			crumbly =	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			fleshy	=	{times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
			cracky  =	{times={[0]=0, [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=0, [8]=0, [9]=0, [10]=0, [11]=0, [12]=0, [13]=0, [14]=0, [15]=0, [0]=0,}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=1000}
	},
	liquids_pointable = true,
})
minetest.register_tool("tutorial:pistole", {
	description = "Admin tool 2: Rocket Gun",
	inventory_image = "tutorial_rocket_gun.png",
	on_use = function(itemstack, placer, pointed_thing)
		local dir = placer:get_look_dir();
		local playerpos = placer:getpos();
		local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "tutorial:patrone")
		local vec = {x=dir.x*3,y=dir.y*3,z=dir.z*3}
		obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:zauberstab", {
	description = "Magic stick",
	inventory_image = "tutorial_zauberstab.png",
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab9", {
	description = "Magic stick lv.MAX",
	inventory_image = "tutorial_zauberstab9.png",
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab8", {
	description = "Magic stick lv.8",
	inventory_image = "tutorial_zauberstab8.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab7", {
	description = "Magic stick lv.7",
	inventory_image = "tutorial_zauberstab7.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab6", {
	description = "Magic stick lv.6",
	inventory_image = "tutorial_zauberstab6.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab5", {
	description = "Magic stick lv.5",
	inventory_image = "tutorial_zauberstab5.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab4", {
	description = "Magic stick lv.4",
	inventory_image = "tutorial_zauberstab4.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab3", {
	description = "Magic stick lv.3",
	inventory_image = "tutorial_zauberstab3.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)	
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab2", {
	description = "Magic stick lv.2",
	inventory_image = "tutorial_zauberstab2.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)	
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:zauberstab1", {
	description = "Magic stick lv.1",
	inventory_image = "tutorial_zauberstab1.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 12,
})
minetest.register_tool("tutorial:swored_zauber1", {
	description = "Magic sword lv.1",
	inventory_image = "tutorial_zauberschwert1.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:swored_zauber2", {
	description = "Magic sword lv.2",
	inventory_image = "tutorial_zauberschwert2.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:swored_zauber3", {
	description = "Magic sword lv.3",
	inventory_image = "tutorial_zauberschwert3.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:swored_zauber4", {
	description = "Magic sword lv.4",
	inventory_image = "tutorial_zauberschwert4.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:swored_zauber5", {
	description = "Magic sword lv.5",
	inventory_image = "tutorial_zauberschwert5.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:swored_zauber6", {
	description = "Magic sword lv.6",
	inventory_image = "tutorial_zauberschwert6.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:swored_zauber7", {
	description = "Magic sword lv.7",
	inventory_image = "tutorial_zauberschwert7.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:swored_zauber8", {
	description = "Magic sword lv.8",
	inventory_image = "tutorial_zauberschwert8.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:swored_zauber9", {
	description = "Magic sword lv.MAX",
	inventory_image = "tutorial_zauberschwert9.png",
	on_use = function(itemstack, placer, pointed_thing)
	end,
	light_source = 2,
})
minetest.register_tool("tutorial:cloudentverner1", {
	description = "Clouds remover lv.1",
	inventory_image = "tutorial_cloudentverner.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=1.0}, uses=50, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner2", {
	description = "Clouds remover lv.2",
	inventory_image = "tutorial_cloudentverner2.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.9}, uses=100, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner3", {
	description = "Clouds remover lv.3",
	inventory_image = "tutorial_cloudentverner3.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.8}, uses=150, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner4", {
	description = "Clouds remover lv.4",
	inventory_image = "tutorial_cloudentverner4.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.7}, uses=200, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner5", {
	description = "Clouds remover lv.5",
	inventory_image = "tutorial_cloudentverner5.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.6}, uses=250, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner6", {
	description = "Clouds remover lv.6",
	inventory_image = "tutorial_cloudentverner6.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.5}, uses=300, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner7", {
	description = "Clouds remover lv.7",
	inventory_image = "tutorial_cloudentverner7.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.4}, uses=350, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner8", {
	description = "Clouds remover lv.8",
	inventory_image = "tutorial_cloudentverner8.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.3}, uses=400, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner9", {
	description = "Clouds remover lv.9",
	inventory_image = "tutorial_cloudentverner9.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.2}, uses=450, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner10", {
	description = "Clouds remover lv.10",
	inventory_image = "tutorial_cloudentverner10.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0.1}, uses=500, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner11", {
	description = "Clouds remover lv.11",
	inventory_image = "tutorial_cloudentverner11.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=550, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner12", {
	description = "Clouds remover lv.12",
	inventory_image = "tutorial_cloudentverner12.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=600, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner13", {
	description = "Clouds remover lv.13",
	inventory_image = "tutorial_cloudentverner13.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=650, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner14", {
	description = "Clouds remover lv.14",
	inventory_image = "tutorial_cloudentverner14.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=700, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner15", {
	description = "Clouds remover lv.15",
	inventory_image = "tutorial_cloudentverner15.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=750, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner16", {
	description = "Clouds remover lv.16",
	inventory_image = "tutorial_cloudentverner16.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=800, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner17", {
	description = "Clouds remover lv.17",
	inventory_image = "tutorial_cloudentverner17.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=850, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner18", {
	description = "Clouds remover lv.18",
	inventory_image = "tutorial_cloudentverner18.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=900, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner19", {
	description = "Clouds remover lv.19",
	inventory_image = "tutorial_cloudentverner19.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=950, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner20", {
	description = "Clouds remover lv.20",
	inventory_image = "tutorial_cloudentverner20.png",
	groups = {not_in_creative_inventory=1},
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0}, uses=1000, maxlevel=3}
		}
	},
})
minetest.register_tool("tutorial:cloudentverner21", {
	description = "Clouds remover lv.MAX",
	inventory_image = "tutorial_cloudentverner21.png",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps={
			cracky	=	{times={[0]=0, [4]=25.00}, uses=0, maxlevel=3}
		}
	},
})