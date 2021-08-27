minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=10},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "For Minetest 	  :  5.4.x",
	})
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=30},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Game Version	 :  1.3.5",
	})
end)

dofile(minetest.get_modpath("tutorial").."/craft.lua")
dofile(minetest.get_modpath("tutorial").."/node.lua")
dofile(minetest.get_modpath("tutorial").."/tool.lua")
dofile(minetest.get_modpath("tutorial").."/craftitem.lua")
dofile(minetest.get_modpath("tutorial").."/ore.lua")
dofile(minetest.get_modpath("tutorial").."/abm.lua")
dofile(minetest.get_modpath("tutorial").."/entity.lua")
dofile(minetest.get_modpath("tutorial").."/chatcommand.lua")
dofile(minetest.get_modpath("tutorial").."/other.lua")
dofile(minetest.get_modpath("tutorial").."/alias.lua")

--v.0.1.0+
local backward = {}
backward.get_formspec = function(player, pos)
    if player == nil then
        return
    end
	local player_inv = player:get_inventory()
	player_inv:set_size("backward", 1)
	formspec = "size[8,7.5]"
		.."button[0,0;2,0.5;cr;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[8,7.5;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
        .."button[3,2.6;2,0.5;backwardcra;Get items back]"
        .."list[current_player;main;0,3.75;8,4;]"
        .."list[current_player;backward;3.5,1;1,1;]"
        .."listring[current_player;main]"
		.."listring[current_player;backward]"
		.."label[5,0.7;You can get your items back from:]"
		.."label[5,1.0;Molestick lv.1-4]"
	return formspec		
end

local S = minetest.get_translator("sfinv")
sfinv.override_page("sfinv:crafting", {
	title = S("Crafting"),
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
				list[current_player;craft;1.75,0.5;3,3;]
				list[current_player;craftpreview;5.75,1.5;1,1;]
				image[4.75,1.5;1,1;sfinv_crafting_arrow.png]
				listring[current_player;main]
				listring[current_player;craft]
				image_button[0,0;1.6,1.6;inventory_plus_inven.png;inven;]
				label[0.3,1.5;selection]
				button[6.6,1.4;1.5,0.5;craft10;Craft (10)]
				button[6.6,2.2;1.5,0.5;craft99;Craft (99)]
			]], true)
	end
})

minetest.register_craft({
        output = "tutorial:spawn_egg",
        recipe = {
                {'default:obsidian', 'default:obsidian', 'default:obsidian'},
                {'default:obsidian', 'default:ice', 'default:obsidian'},
                {'default:obsidian', 'default:obsidian', 'default:obsidian'},
        }
})
minetest.register_craftitem("tutorial:spawn_egg", {
	description = "Mummy spawn-egg",
	inventory_image = "tutorial_mummy_egg.png",
	liquids_pointable = false,
	stack_max = 99,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" then
			minetest.env:add_entity(pointed_thing.above,"mobs:mummy")
			if not minetest.setting_getbool("creative_mode") then itemstack:take_item() end
			return itemstack
		end
	end,
})

minetest.register_node("tutorial:trophy_year3", {
    description = "Three years Regnum 2!!",
	tiles = {
		"tutorial_trophy_year3.png"
	},
    groups = { snappy=3 },
    drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.1875, -0.4375, 0.1875}, -- NodeBox1
			{-0.0625, -0.4375, -0.0625, 0.125, -0.375, 0.125}, -- NodeBox2
			{-0.02, -0.375, -0.02, 0.0825, -0.1875, 0.0825}, -- NodeBox3
			{-0.0625, -0.1875, -0.0625, 0.125, -0.125, 0.125}, -- NodeBox4
			{-0.125, -0.1875, -0.0625, -0.0625, 0.125, 0.125}, -- NodeBox5
			{0.125, -0.1875, -0.0625, 0.1875, 0.125, 0.125}, -- NodeBox6
			{-0.125, -0.1875, 0.125, 0.1875, 0.125, 0.1875}, -- NodeBox7
			{-0.125, -0.1875, -0.125, 0.1875, 0.125, -0.0625}, -- NodeBox8
			{-0.0625, -0.25, -0.0625, 0.125, -0.1875, 0.125}, -- NodeBox9
			{0.1875, 0.05, 0, 0.23, 0.0925, 0.0625}, -- NodeBox10
			{0.1875, -0.15, 0, 0.23, -0.11, 0.0625}, -- NodeBox11
			{0.23, -0.15, 0, 0.2725, 0.0925, 0.0625}, -- NodeBox12
			{-0.1675, -0.15, 0, -0.125, -0.11, 0.0625}, -- NodeBox13
			{-0.1675, 0.05, 0, -0.125, 0.0925, 0.0625}, -- NodeBox14
			{-0.21, -0.15, 0, -0.1675, 0.0925, 0.0625}, -- NodeBox15
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.21, -0.5, -0.125, 0.2725, 0.125, 0.1875 }
	}
})

minetest.register_node("tutorial:trophy_year2", {
    description = "Two years Regnum 2!!",
	tiles = {
		"tutorial_trophy_year2.png"
	},
    groups = { snappy=3 },
    drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.1875, -0.4375, 0.1875}, -- NodeBox1
			{-0.0625, -0.4375, -0.0625, 0.125, -0.375, 0.125}, -- NodeBox2
			{-0.02, -0.375, -0.02, 0.0825, -0.1875, 0.0825}, -- NodeBox3
			{-0.0625, -0.1875, -0.0625, 0.125, -0.125, 0.125}, -- NodeBox4
			{-0.125, -0.1875, -0.0625, -0.0625, 0.125, 0.125}, -- NodeBox5
			{0.125, -0.1875, -0.0625, 0.1875, 0.125, 0.125}, -- NodeBox6
			{-0.125, -0.1875, 0.125, 0.1875, 0.125, 0.1875}, -- NodeBox7
			{-0.125, -0.1875, -0.125, 0.1875, 0.125, -0.0625}, -- NodeBox8
			{-0.0625, -0.25, -0.0625, 0.125, -0.1875, 0.125}, -- NodeBox9
			{0.1875, 0.05, 0, 0.23, 0.0925, 0.0625}, -- NodeBox10
			{0.1875, -0.15, 0, 0.23, -0.11, 0.0625}, -- NodeBox11
			{0.23, -0.15, 0, 0.2725, 0.0925, 0.0625}, -- NodeBox12
			{-0.1675, -0.15, 0, -0.125, -0.11, 0.0625}, -- NodeBox13
			{-0.1675, 0.05, 0, -0.125, 0.0925, 0.0625}, -- NodeBox14
			{-0.21, -0.15, 0, -0.1675, 0.0925, 0.0625}, -- NodeBox15
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.21, -0.5, -0.125, 0.2725, 0.125, 0.1875 }
	}
})

minetest.register_node("tutorial:trophy_year1", {
    description = "One year Regnum 2!!",
	tiles = {
		"tutorial_trophy_year1.png"
	},
    groups = { snappy=3 },
    drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.1875, -0.4375, 0.1875}, -- NodeBox1
			{-0.0625, -0.4375, -0.0625, 0.125, -0.375, 0.125}, -- NodeBox2
			{-0.02, -0.375, -0.02, 0.0825, -0.1875, 0.0825}, -- NodeBox3
			{-0.0625, -0.1875, -0.0625, 0.125, -0.125, 0.125}, -- NodeBox4
			{-0.125, -0.1875, -0.0625, -0.0625, 0.125, 0.125}, -- NodeBox5
			{0.125, -0.1875, -0.0625, 0.1875, 0.125, 0.125}, -- NodeBox6
			{-0.125, -0.1875, 0.125, 0.1875, 0.125, 0.1875}, -- NodeBox7
			{-0.125, -0.1875, -0.125, 0.1875, 0.125, -0.0625}, -- NodeBox8
			{-0.0625, -0.25, -0.0625, 0.125, -0.1875, 0.125}, -- NodeBox9
			{0.1875, 0.05, 0, 0.23, 0.0925, 0.0625}, -- NodeBox10
			{0.1875, -0.15, 0, 0.23, -0.11, 0.0625}, -- NodeBox11
			{0.23, -0.15, 0, 0.2725, 0.0925, 0.0625}, -- NodeBox12
			{-0.1675, -0.15, 0, -0.125, -0.11, 0.0625}, -- NodeBox13
			{-0.1675, 0.05, 0, -0.125, 0.0925, 0.0625}, -- NodeBox14
			{-0.21, -0.15, 0, -0.1675, 0.0925, 0.0625}, -- NodeBox15
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.21, -0.5, -0.125, 0.2725, 0.125, 0.1875 }
	}
})
minetest.register_craft({
    output = 'tutorial:superheart4',
    recipe = {
        {'tutorial:whiteblock6', 'tutorial:thunder', 'tutorial:blackblock6'},
        {'tutorial:whiteblock6', 'tutorial:superheart3', 'tutorial:blackblock6'},
        {'tutorial:whiteblock6', 'tutorial:thunder', 'tutorial:blackblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:superheart3',
    recipe = {
        {'tutorial:whiteblock6', 'tutorial:thunder', 'tutorial:blackblock6'},
        {'tutorial:whiteblock6', 'tutorial:superheart2', 'tutorial:blackblock6'},
        {'tutorial:whiteblock6', 'tutorial:thunder', 'tutorial:blackblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:superheart2',
    recipe = {
        {'tutorial:whiteblock5', 'tutorial:thunder', 'tutorial:blackblock5'},
        {'tutorial:whiteblock5', 'tutorial:superheart1', 'tutorial:blackblock5'},
        {'tutorial:whiteblock5', 'tutorial:thunder', 'tutorial:blackblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:superheart1',
    recipe = {
        {'tutorial:zauberstab9', 'tutorial:cloudheart_mega25', 'tutorial:swored_zauber9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega25',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudheart_mega24', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega24',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudheart_mega23', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega23',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudheart_mega22', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega22',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudheart_mega21', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega21',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudheart_mega20', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega20',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudheart_mega19', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega19',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudheart_mega18', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega18',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudheart_mega17', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega17',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudheart_mega16', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega16',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudheart_mega15', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega15',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudheart_mega14', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega14',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudheart_mega13', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega13',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudheart_mega12', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega12',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudheart_mega11', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega11',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudheart_mega10', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega10',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudheart_mega9', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega9',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudheart_mega8', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega8',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudheart_mega7', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega7',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudheart_mega6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega6',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudheart_mega5', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega5',
    recipe = {
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:cloudheart_mega4', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega4',
    recipe = {
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:cloudheart_mega3', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega3',
    recipe = {
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:cloudheart_mega2', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega2',
    recipe = {
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:cloudheart_mega1', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudheart_mega1',
    recipe = {
        {'tutorial:cloudentverner21', 'tutorial:heart_mega20'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega20',
    recipe = {
		{'tutorial:megablock2','tutorial:megablock2', 'tutorial:megablock2'},
		{'tutorial:megablock2','tutorial:heart_mega19','tutorial:megablock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega19',
    recipe = {
		{'tutorial:megablock1','tutorial:megablock1', 'tutorial:megablock1'},
		{'tutorial:megablock1','tutorial:heart_mega18','tutorial:megablock1'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega18',
    recipe = {
		{'tutorial:megablock1','tutorial:megablock1', 'tutorial:megablock1'},
		{'tutorial:megablock1','tutorial:heart_mega17','tutorial:megablock1'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega17',
    recipe = {
		{'tutorial:megablock1','tutorial:megablock1', 'tutorial:megablock1'},
		{'tutorial:megablock1','tutorial:heart_mega16','tutorial:megablock1'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega16',
    recipe = {
		{'tutorial:megablock1','tutorial:megablock1', 'tutorial:megablock1'},
		{'tutorial:megablock1','tutorial:heart_mega15','tutorial:megablock1'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega13',
    recipe = {
		{'default:goldblock','default:goldblock', 'default:goldblock'},
		{'default:goldblock','tutorial:heart_mega12','default:goldblock'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega14',
    recipe = {
		{'nyancat:nyancat_rainbow','nyancat:nyancat_rainbow', 'nyancat:nyancat_rainbow'},
		{'nyancat:nyancat_rainbow','tutorial:heart_mega13','nyancat:nyancat_rainbow'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega15',
    recipe = {
		{'nyancat:nyancat_rainbow','nyancat:nyancat_rainbow', 'nyancat:nyancat_rainbow'},
		{'nyancat:nyancat_rainbow','tutorial:heart_mega14','nyancat:nyancat_rainbow'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega9',
    recipe = {
		{'tutorial:diamondblock2','tutorial:diamondblock2', 'tutorial:diamondblock2'},
		{'tutorial:diamondblock2','tutorial:heart_mega8','tutorial:diamondblock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega10',
    recipe = {
		{'tutorial:diamondblock2','tutorial:diamondblock2', 'tutorial:diamondblock2'},
		{'tutorial:diamondblock2','tutorial:heart_mega9','tutorial:diamondblock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega11',
    recipe = {
		{'tutorial:diamondblock2','tutorial:diamondblock2', 'tutorial:diamondblock2'},
		{'tutorial:diamondblock2','tutorial:heart_mega10','tutorial:diamondblock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega12',
    recipe = {
		{'tutorial:diamondblock2','tutorial:diamondblock2', 'tutorial:diamondblock2'},
		{'tutorial:diamondblock2','tutorial:heart_mega11','tutorial:diamondblock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega5',
    recipe = {
		{'tutorial:dunklematerie4','tutorial:dunklematerie4', 'tutorial:dunklematerie4'},
		{'tutorial:dunklematerie4','tutorial:heart_mega4','tutorial:dunklematerie4'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega6',
    recipe = {
		{'tutorial:dunklematerie4','tutorial:dunklematerie4', 'tutorial:dunklematerie4'},
		{'tutorial:dunklematerie4','tutorial:heart_mega5','tutorial:dunklematerie4'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega7',
    recipe = {
		{'tutorial:dunklematerie5','tutorial:dunklematerie5', 'tutorial:dunklematerie5'},
		{'tutorial:dunklematerie5','tutorial:heart_mega6','tutorial:dunklematerie5'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega8',
    recipe = {
		{'tutorial:dunklematerie6','tutorial:dunklematerie6', 'tutorial:dunklematerie6'},
		{'tutorial:dunklematerie6','tutorial:heart_mega7','tutorial:dunklematerie6'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega1',
    recipe = {
        {'tutorial:obsidian4', 'tutorial:obsidian4', 'tutorial:obsidian4'},
        {'tutorial:obsidian4', 'tutorial:heart', 'tutorial:obsidian4'},
        {'tutorial:thunder', 'tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega2',
    recipe = {
        {'tutorial:obsidian4', 'tutorial:obsidian4', 'tutorial:obsidian4'},
        {'tutorial:obsidian4','tutorial:heart_mega1','tutorial:obsidian4'},
        {'tutorial:thunder', 'tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart_mega3',
    recipe = {
        {'tutorial:obsidian5', 'tutorial:obsidian5', 'tutorial:obsidian5'},
        {'tutorial:obsidian5','tutorial:heart_mega2','tutorial:obsidian5'},
        {'tutorial:thunder', 'tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = '"tutorial:heart_mega4"',
    recipe = {
        {'tutorial:obsidian6', 'tutorial:obsidian6', 'tutorial:obsidian6'},
        {'tutorial:obsidian6','tutorial:heart_mega3','tutorial:obsidian6'},
        {'tutorial:thunder', 'tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:heart',
    recipe = {
        {'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:wood', ''},
    }
})

minetest.register_on_joinplayer(function(player)
	local stack = player:get_inventory():get_stack("heart", 1)
	local new_max_hp = 20
	for i=1,20 do
		if stack:get_name() == "tutorial:heart_mega"..i then
			new_max_hp = 20+i
		end
	end
	for i=1,25 do
		if stack:get_name() == "tutorial:cloudheart_mega"..i then
			new_max_hp = 40+i
		end
	end
	for i=1,4 do
		if stack:get_name() == "tutorial:superheart"..i then
			new_max_hp = 65+i
		end
	end
	player:set_properties({hp_max = new_max_hp})
	local hpnum = player:get_attribute("hpnum")
	if hpnum then
		player:set_hp(hpnum)
	end
end)

timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer > 0.5 then
		local players = minetest.get_connected_players()
		for _,player in ipairs(players) do
			local pri = minetest.get_player_privs(player:get_player_name())
			local player_inv = player:get_inventory()
			player_inv:set_size("youtube", 1)
			local c = player_inv:get_stack("youtube",1):get_count()
			if c == 0 then
				if pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring and pri.server and pri.password and pri.delprotect and pri.kick and pri.ban and pri.rollback and pri.privs and pri.basic_privs and pri.give and pri.protection_bypass and pri.travelnet_remove and pri.travelnet_attach and pri.shop_admin and pri.creative then
					player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 255}, text = "[Admin]"..player:get_player_name()})
				elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring then
					player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 0}, text = "[Legend]"..player:get_player_name()})
				elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport and pri.noclip and pri.debug then
					player:set_nametag_attributes({color = {a = 255, r = 0, g = 255, b = 255}, text = "[Hero]"..player:get_player_name()})
				elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport then
					player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 0}, text = "[VIP]"..player:get_player_name()})
				elseif pri.interact and pri.shout and pri.fly and pri.fast and pri.home then
					player:set_nametag_attributes({color = {a = 255, r = 0, g = 0, b = 255}, text = "[Premium]"..player:get_player_name()})
				elseif pri.interact and pri.shout then
					player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}, text = "[Member]"..player:get_player_name()})
				else
					player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 0}, text = "[Enemy]"..player:get_player_name()})
				end
			else
				if pri.interact and pri.shout and pri.fly and pri.fast and pri.home and pri.teleport and pri.noclip and pri.debug and pri.settime and pri.bring and pri.server and pri.password and pri.delprotect and pri.kick and pri.ban and pri.rollback and pri.privs and pri.basic_privs and pri.give and pri.protection_bypass and pri.travelnet_remove and pri.travelnet_attach and pri.shop_admin and pri.creative then
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
					player:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}, text = "[Youtuber][Member]"..player:get_player_name()})
				else
					player:set_nametag_attributes({color = {a = 255, r = 255, g = 0, b = 0}, text = "[Youtuber][Enemy]"..player:get_player_name()})
				end
			end
			player_inv:set_size("year", 3)
			if player_inv:room_for_item("main", "tutorial:trophy_year3") and player_inv:get_stack("year", 3):get_count() == 0 then
				--player_inv:add_item("main", "tutorial:trophy_year3")
				--player_inv:set_stack("year", 3, "default:dirt")
			end
			local stack = player:get_inventory():get_stack("heart", 1)
			player:set_attribute("hpnum", player:get_hp())
			local new_max_hp = 20
			for i=1,20 do
				if stack:get_name() == "tutorial:heart_mega"..i then
					new_max_hp = 20+i
				end
			end
			for i=1,25 do
				if stack:get_name() == "tutorial:cloudheart_mega"..i then
					new_max_hp = 40+i
				end
			end
			for i=1,4 do
				if stack:get_name() == "tutorial:superheart"..i then
					new_max_hp = 65+i
				end
			end
			if player:get_properties().hp_max > new_max_hp and player:get_hp() > new_max_hp then
				player:set_hp(new_max_hp)
			end
			player:set_properties({hp_max = new_max_hp})
		end
		timer = 0
	end
end)


minetest.register_craftitem("tutorial:heart", {
	description = "Heart\nHeart-lv.0",
	inventory_image = "tutorial_heart.png",
	groups = {not_in_creative_inventory=1},
	stack_max = 1,
})
for i=1,20 do
    minetest.register_craftitem("tutorial:heart_mega"..i, {
        description = "Megaheart lv."..i.."\nHeart-lv."..i,
	    inventory_image = "tutorial_heart_mega"..i..".png",
		groups = {not_in_creative_inventory=1},
		stack_max = 1,
    })
end
for i=1,25 do
    minetest.register_craftitem("tutorial:cloudheart_mega"..i, {
        description = "Cloudheart lv."..i.."\nHeart-lv."..(i+20),
	    inventory_image = "tutorial_cloudheart_mega"..i..".png",
		groups = {not_in_creative_inventory=1},
		stack_max = 1,
    })
end
for i=1,3 do
    minetest.register_craftitem("tutorial:superheart"..i, {
        description = "Superheart lv."..i.."\nHeart-lv."..(i+45),
	    inventory_image = "tutorial_superheart"..i..".png",
		groups = {not_in_creative_inventory=1},
		stack_max = 1,
    })
end
minetest.register_craftitem("tutorial:superheart4", {
	description = "Superheart lv.4\nHeart-lv.49",
	inventory_image = "tutorial_superheart4.png",
	stack_max = 1,
})
for i=1,29 do
    minetest.register_craftitem("tutorial:colorstick_empty"..i, {
        description = "Colorstick (".. math.floor(i*3.33).."% filled)",
	    inventory_image = "tutorial_colorstick_empty"..i..".png",
		groups = {not_in_creative_inventory=1},
    })
end
minetest.register_craftitem("tutorial:colorstick1", {
	description = "Colorstick lv.1\nturns black in white ore and back",
	inventory_image = "tutorial_colorstick1.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.under then
			local node = minetest.get_node(pointed_thing.under)
			if node.name == "tutorial:stone_with_white" then
				minetest.set_node(pointed_thing.under,{name="tutorial:stone_with_black"})
			elseif node.name == "tutorial:stone_with_black" then
				minetest.set_node(pointed_thing.under,{name="tutorial:stone_with_white"})
			end
		end
	end,
})
minetest.register_craft({
    output = 'tutorial:xraystick1',
    recipe = {
        {'tutorial:coin_silver', 'tutorial:cloudentverner21', 'tutorial:coin_silver'},
        {'tutorial:coin_silver', 'tutorial:coin_silver', 'tutorial:coin_silver'},
        {'', 'tutorial:coin_silver', ''},
        {'', 'tutorial:coin_silver', ''},
        {'', 'tutorial:coin_silver', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:molestick1',
    recipe = {
        {'tutorial:coin_bronze', 'tutorial:cloudentverner21', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'', 'tutorial:coin_bronze', ''},
        {'', 'tutorial:coin_bronze', ''},
        {'', 'tutorial:coin_bronze', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:molestick2',
    recipe = {
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:molestick1', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
    }
})
minetest.register_craft({
    output = 'tutorial:molestick3',
    recipe = {
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:molestick2', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
    }
})
minetest.register_craft({
    output = 'tutorial:molestick4',
    recipe = {
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:molestick3', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
    }
})
minetest.register_craft({
    output = 'tutorial:molestick5',
    recipe = {
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:molestick4', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
        {'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze', 'tutorial:coin_bronze'},
    }
})
	
minetest.register_craftitem("tutorial:xraystick1", {
    description = "Xraystick lv.1",
    inventory_image = "tutorial_xraystick1.png",
    stack_max = 1,
	groups = {},
    on_use = function(itemstack, user, pointed_thing)
        local playername = user:get_player_name()
        local player_inv = user:get_inventory()
        local privs = minetest.get_player_privs(playername)
        if player_inv:get_stack("xray", 1):get_count() == 0 then
            local k = 5
            playereffects.apply_effect_type("xray", 10, user)
            player_inv:set_stack("xray", 1, "default:dirt "..(k+12))
        end
        return itemstack
    end,
})

minetest.register_craftitem("tutorial:molestick1", {
    description = "Molestick lv.1",
    inventory_image = "tutorial_superzauberstab1.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
    on_use = function(itemstack, user, pointed_thing)
        local playername = user:get_player_name()
        local player_inv = user:get_inventory()
        local privs = minetest.get_player_privs(playername)
        if player_inv:get_stack("mole", 1):get_count() == 0 then
            local k = 5
            playereffects.apply_effect_type("pepmole", 10, user)
            player_inv:set_stack("mole", 1, "default:dirt "..(k+12))
        end
        return itemstack
    end,
})
minetest.register_craftitem("tutorial:molestick2", {
    description = "Molestick lv.2",
    inventory_image = "tutorial_superzauberstab2.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
    on_use = function(itemstack, user, pointed_thing)
        local playername = user:get_player_name()
        local player_inv = user:get_inventory()
        local privs = minetest.get_player_privs(playername)
        if player_inv:get_stack("mole", 1):get_count() == 0 then
            local k = 5
            playereffects.apply_effect_type("pepmole", 20, user)
            player_inv:set_stack("mole", 1, "default:dirt "..(k+22))
        end
        return itemstack
    end,
})
minetest.register_craftitem("tutorial:molestick3", {
    description = "Molestick lv.3",
    inventory_image = "tutorial_superzauberstab3.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
    on_use = function(itemstack, user, pointed_thing)
        local playername = user:get_player_name()
        local player_inv = user:get_inventory()
        local privs = minetest.get_player_privs(playername)
        if player_inv:get_stack("mole", 1):get_count() == 0 then
            local k = 5
            playereffects.apply_effect_type("pepmole", 30, user)
            player_inv:set_stack("mole", 1, "default:dirt "..(k+32))
        end
        return itemstack
    end,
})
minetest.register_craftitem("tutorial:molestick4", {
    description = "Molestick lv.4",
    inventory_image = "tutorial_superzauberstab4.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
    on_use = function(itemstack, user, pointed_thing)
        local playername = user:get_player_name()
        local player_inv = user:get_inventory()
        local privs = minetest.get_player_privs(playername)
        if player_inv:get_stack("mole", 1):get_count() == 0 then
            local k = 5
            playereffects.apply_effect_type("pepmole", 40, user)
            player_inv:set_stack("mole", 1, "default:dirt "..(k+42))
        end
        return itemstack
    end,
})
minetest.register_craftitem("tutorial:molestick5", {
    description = "Molestick lv.MAX",
    inventory_image = "tutorial_superzauberstab5.png",
    stack_max = 1,
    on_use = function(itemstack, user, pointed_thing)
        local playername = user:get_player_name()
        local player_inv = user:get_inventory()
        local privs = minetest.get_player_privs(playername)
        if player_inv:get_stack("mole", 1):get_count() == 0 then
            local k = 5
            playereffects.apply_effect_type("pepmole", 50, user)
            player_inv:set_stack("mole", 1, "default:dirt "..(k+52))
        end
        return itemstack
    end,
})
minetest.register_on_joinplayer(function(player)
	local punched_player_privs = minetest.get_player_privs(player:get_player_name())
    punched_player_privs["home"] = true
    punched_player_privs["zoom"] = true
	punched_player_privs["fast"] = true
	minetest.set_player_privs(player:get_player_name(), punched_player_privs)
end)
minetest.register_node("tutorial:stone_with_precious_metal", {
	description = "Precious Metal ore",
	tiles = {"default_stone.png^tutorial_precious_metal_ore.png"},
	is_ground_content = true,
	groups = {cracky=13,xp=1},
	drop = 'tutorial:precious_metal',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craftitem("tutorial:precious_metal", {
	description = "Precious Metal",
	inventory_image = "tutorial_precious_metal_ore.png",
})

minetest.register_craftitem("tutorial:bronzekey", {
	description = "Bronzekey",
	inventory_image = "tutorial_bronze_schluessel.png",
})
minetest.register_craftitem("tutorial:coin_bronze", {
    description = "Coin bronze (very rare)",
	inventory_image = "tutorial_coin_bronze.png",
	stack_max = 9999,
})
minetest.register_craftitem("tutorial:coin_silver", {
    description = "Coin silver (very rare)",
	inventory_image = "tutorial_coin_silver.png",
	stack_max = 9999,
})
for i = 1, 100, 1 do
    minetest.register_node("tutorial:level"..i.."_bronze",{
	    tiles  = {"tutorial_level"..i..".png^tutorial_level_bronze.png"},
	    description = "You are now in Level bronze "..i,
	    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
    })
	minetest.register_node("tutorial:level"..i.."_silver",{
	    tiles  = {"tutorial_level"..i..".png^tutorial_level_silver.png"},
	    description = "You are now in Level silver "..i,
	    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
    })
end
minetest.register_node("tutorial:levelMAX_bronze",{
	tiles  = {"tutorial_levelMAX.png^tutorial_level_bronze.png"},
	description = "You are now in Level bronze MAX",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})
minetest.register_node("tutorial:levelMAX_silver",{
	tiles  = {"tutorial_levelMAX.png^tutorial_level_silver.png"},
	description = "You are now in Level silver MAX",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
})
minetest.register_craft({
    output = 'tutorial:regnumwings1',
    recipe = {
        {'', '', 'tutorial:regnum', '', ''},
		{'', '', 'tutorial:bottleSS', '', ''},
		{'tutorial:regnum', 'tutorial:bottleSS', 'tutorial:superlegendwings1', 'tutorial:bottleSS', 'tutorial:regnum'},
		{'', '', 'tutorial:bottleSS', '', ''},
		{'', '', 'tutorial:regnum', '', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:regnumwings2',
    recipe = {
        {'', '', 'tutorial:regnum', '', ''},
		{'', '', 'tutorial:bottleSS', '', ''},
		{'tutorial:regnum', 'tutorial:bottleSS', 'tutorial:superlegendwings2', 'tutorial:bottleSS', 'tutorial:regnum'},
		{'', '', 'tutorial:bottleSS', '', ''},
		{'', '', 'tutorial:regnum', '', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:regnumwings3',
    recipe = {
        {'', '', 'tutorial:regnum', '', ''},
		{'', '', 'tutorial:bottleSS', '', ''},
		{'tutorial:regnum', 'tutorial:bottleSS', 'tutorial:superlegendwings3', 'tutorial:bottleSS', 'tutorial:regnum'},
		{'', '', 'tutorial:bottleSS', '', ''},
		{'', '', 'tutorial:regnum', '', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:superlegendwings1',
    recipe = {
        {'tutorial:lilabattleaxe2', 'tutorial:legendwings6'},
    }
})
minetest.register_craft({
    output = 'tutorial:legendwings1',
    recipe = {
        {'tutorial:titanwings10', 'default:grass_1', 'default:grass_1', 'tutorial:bottle5'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'tutorial:bottle5', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
    }
})
minetest.register_craft({
    output = 'tutorial:legendwings2',
    recipe = {
        {'tutorial:legendwings1', 'default:grass_1', 'default:grass_1', 'tutorial:bottle7'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'tutorial:bottle7', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
    }
})
minetest.register_craft({
    output = 'tutorial:legendwings3',
    recipe = {
        {'tutorial:legendwings2', 'default:grass_1', 'default:grass_1', 'tutorial:bottle9'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'tutorial:bottle9', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
    }
})
minetest.register_craft({
    output = 'tutorial:legendwings4',
    recipe = {
        {'tutorial:legendwings3', 'default:grass_1', 'default:grass_1', 'tutorial:bottle11'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'tutorial:bottle11', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
    }
})
minetest.register_craft({
    output = 'tutorial:legendwings5',
    recipe = {
        {'tutorial:legendwings4', 'default:grass_1', 'default:grass_1', 'tutorial:bottleS1'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'tutorial:bottleS1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
    }
})
minetest.register_craft({
    output = 'tutorial:legendwings6',
    recipe = {
        {'tutorial:legendwings5', 'default:grass_1', 'default:grass_1', 'tutorial:bottleS3'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'default:grass_1', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
		{'tutorial:bottleS3', 'default:grass_1', 'default:grass_1', 'default:grass_1'},
    }
})

minetest.register_craft({
    output = 'tutorial:titanwings10',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings9', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings9',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings8', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings8',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings7', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings7',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings6', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings6',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings5', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings5',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings4', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings4',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings3', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings3',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings2', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings2',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:titanwings1', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:titanwings1',
    recipe = {
        {'', 'tutorial:titan', ''},
        {'tutorial:titan', 'tutorial:arenawings4', 'tutorial:titan'},
        {'', 'tutorial:titan', ''},
    }
})
minetest.register_craft({
    output = 'tutorial:arenawings4',
    recipe = {
        {'tutorial:arena_block', 'tutorial:arena_block', 'tutorial:arena_block'},
        {'tutorial:arena_block', 'tutorial:arenawings3', 'tutorial:arena_block'},
        {'tutorial:arena_block', 'tutorial:arena_block', 'tutorial:arena_block'},
    }
})
minetest.register_craft({
    output = 'tutorial:arenawings3',
    recipe = {
        {'tutorial:arena_block', 'tutorial:arena_block', 'tutorial:arena_block'},
        {'tutorial:arena_block', 'tutorial:arenawings2', 'tutorial:arena_block'},
        {'tutorial:arena_block', 'tutorial:arena_block', 'tutorial:arena_block'},
    }
})
minetest.register_craft({
    output = 'tutorial:arenawings2',
    recipe = {
        {'tutorial:arena_block', 'tutorial:arena_block', 'tutorial:arena_block'},
        {'tutorial:arena_block', 'tutorial:arenawings1', 'tutorial:arena_block'},
        {'tutorial:arena_block', 'tutorial:arena_block', 'tutorial:arena_block'},
    }
})
minetest.register_craft({
    output = 'tutorial:arenawings1',
    recipe = {
        {'tutorial:arena_block', 'tutorial:arena_block', 'tutorial:arena_block'},
        {'tutorial:arena_block', 'tutorial:superultrawings', 'tutorial:arena_block'},
        {'tutorial:arena_block', 'tutorial:arena_block', 'tutorial:arena_block'},
    }
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings25',
    cooktime = 10000,
	output = 'tutorial:superultrawings',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings24',
    cooktime = 5000,
	output = 'tutorial:ultrawings25',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings23',
    cooktime = 4800,
	output = 'tutorial:ultrawings24',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings22',
    cooktime = 4600,
	output = 'tutorial:ultrawings23',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings21',
    cooktime = 4400,
	output = 'tutorial:ultrawings22',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings20',
    cooktime = 4200,
	output = 'tutorial:ultrawings21',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings19',
    cooktime = 4000,
	output = 'tutorial:ultrawings20',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings18',
    cooktime = 3800,
	output = 'tutorial:ultrawings19',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings17',
    cooktime = 3600,
	output = 'tutorial:ultrawings18',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings16',
    cooktime = 3400,
	output = 'tutorial:ultrawings17',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings15',
    cooktime = 3200,
	output = 'tutorial:ultrawings16',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings14',
    cooktime = 3000,
	output = 'tutorial:ultrawings15',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings13',
    cooktime = 2800,
	output = 'tutorial:ultrawings14',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings12',
    cooktime = 2600,
	output = 'tutorial:ultrawings13',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings11',
    cooktime = 2400,
	output = 'tutorial:ultrawings12',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings10',
    cooktime = 2200,
	output = 'tutorial:ultrawings11',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings9',
    cooktime = 2000,
	output = 'tutorial:ultrawings10',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings8',
    cooktime = 1800,
	output = 'tutorial:ultrawings9',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings7',
    cooktime = 1600,
	output = 'tutorial:ultrawings8',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings6',
    cooktime = 1400,
	output = 'tutorial:ultrawings7',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings5',
    cooktime = 1200,
	output = 'tutorial:ultrawings6',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings4',
    cooktime = 1000,
	output = 'tutorial:ultrawings5',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings3',
    cooktime = 800,
	output = 'tutorial:ultrawings4',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings2',
    cooktime = 600,
	output = 'tutorial:ultrawings3',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:ultrawings1',
    cooktime = 400,
	output = 'tutorial:ultrawings2',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:crystalwings5',
    cooktime = 200,
	output = 'tutorial:ultrawings1',
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:uraniumwings2',
    cooktime = 100,
	output = 'tutorial:energywings1',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings1',
    cooktime = 100,
	output = 'tutorial:energywings2',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings2',
    cooktime = 200,
	output = 'tutorial:energywings3',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings3',
    cooktime = 300,
	output = 'tutorial:energywings4',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings4',
    cooktime = 400,
	output = 'tutorial:energywings5',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings5',
    cooktime = 500,
	output = 'tutorial:energywings6',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings6',
    cooktime = 600,
	output = 'tutorial:energywings7',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings7',
    cooktime = 700,
	output = 'tutorial:energywings8',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings8',
    cooktime = 800,
	output = 'tutorial:energywings9',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings9',
    cooktime = 900,
	output = 'tutorial:energywings10',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings10',
    cooktime = 1000,
	output = 'tutorial:energywings11',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings11',
    cooktime = 1500,
	output = 'tutorial:energywings12',
})

minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:energywings12',
    cooktime = 1000,
	output = 'tutorial:superenergywings1',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:superenergywings1',
    cooktime = 1200,
	output = 'tutorial:superenergywings2',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:superenergywings2',
    cooktime = 1400,
	output = 'tutorial:superenergywings3',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:superenergywings3',
    cooktime = 1600,
	output = 'tutorial:superenergywings4',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:superenergywings4',
    cooktime = 1800,
	output = 'tutorial:superenergywings5',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:superenergywings5',
    cooktime = 2000,
	output = 'tutorial:superenergywings6',
})
minetest.register_craft({
	type = 'cooking',
	recipe = 'tutorial:superenergywings6',
    cooktime = 2500,
	output = 'tutorial:superenergywings7',
})

minetest.register_craft({
    output = 'tutorial:crystalwings5',
    recipe = {
        {'tutorial:admin', 'tutorial:thunder', 'tutorial:admin'},
        {'tutorial:admin', 'tutorial:crystalwings4', 'tutorial:admin'},
        {'tutorial:admin', 'tutorial:thunder', 'tutorial:admin'},
    }
})
minetest.register_craft({
    output = 'tutorial:crystalwings4',
    recipe = {
        {'gems:emerald_block', 'tutorial:thunder', 'gems:emerald_block'},
        {'gems:emerald_block', 'tutorial:crystalwings3', 'gems:emerald_block'},
        {'gems:emerald_block', 'tutorial:thunder', 'gems:emerald_block'},
    }
})
minetest.register_craft({
    output = 'tutorial:crystalwings3',
    recipe = {
        {'gems:pearl_block', 'tutorial:thunder', 'gems:shadow_block'},
        {'gems:pearl_block', 'tutorial:crystalwings2', 'gems:shadow_block'},
        {'gems:pearl_block', 'tutorial:thunder', 'gems:shadow_block'},
    }
})
minetest.register_craft({
    output = 'tutorial:crystalwings2',
    recipe = {
        {'gems:amethyst_block', 'tutorial:thunder', 'gems:amethyst_block'},
        {'gems:amethyst_block', 'tutorial:crystalwings1', 'gems:amethyst_block'},
        {'gems:amethyst_block', 'tutorial:thunder', 'gems:amethyst_block'},
    }
})
minetest.register_craft({
    output = 'tutorial:crystalwings1',
    recipe = {
        {'gems:ruby_block', 'tutorial:thunder', 'gems:sapphire_block'},
        {'gems:ruby_block', 'tutorial:superenergywings7', 'gems:sapphire_block'},
        {'gems:ruby_block', 'tutorial:thunder', 'gems:sapphire_block'},
    }
})

minetest.register_craft({
    output = 'tutorial:uraniumwings2',
    recipe = {
        {'tutorial:uranium9', 'tutorial:uranium9', 'tutorial:uranium9'},
        {'tutorial:uranium9', 'tutorial:uraniumwings1', 'tutorial:uranium9'},
        {'tutorial:uranium9', 'tutorial:uranium9', 'tutorial:uranium9'},
    }
})
minetest.register_craft({
    output = 'tutorial:uraniumwings1',
    recipe = {
        {'tutorial:uranium8', 'tutorial:uranium8', 'tutorial:uranium8'},
        {'tutorial:uranium8', 'tutorial:superwings4', 'tutorial:uranium8'},
        {'tutorial:uranium8', 'tutorial:uranium8', 'tutorial:uranium8'},
    }
})
minetest.register_craft({
    output = 'tutorial:superwings4',
    recipe = {
        {'tutorial:whiteblock6', 'tutorial:thunder', 'tutorial:blackblock6'},
        {'tutorial:whiteblock6', 'tutorial:superwings3', 'tutorial:blackblock6'},
        {'tutorial:whiteblock6', 'tutorial:thunder', 'tutorial:blackblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:superwings3',
    recipe = {
        {'tutorial:whiteblock6', 'tutorial:thunder', 'tutorial:blackblock6'},
        {'tutorial:whiteblock6', 'tutorial:superwings2', 'tutorial:blackblock6'},
        {'tutorial:whiteblock6', 'tutorial:thunder', 'tutorial:blackblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:superwings2',
    recipe = {
        {'tutorial:whiteblock5', 'tutorial:thunder', 'tutorial:blackblock5'},
        {'tutorial:whiteblock5', 'tutorial:superwings1', 'tutorial:blackblock5'},
        {'tutorial:whiteblock5', 'tutorial:thunder', 'tutorial:blackblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:superwings1',
    recipe = {
        {'tutorial:zauberstab9', 'tutorial:cloudwings_mega25', 'tutorial:swored_zauber9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega25',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudwings_mega24', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega24',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudwings_mega23', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega23',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudwings_mega22', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega22',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudwings_mega21', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega21',
    recipe = {
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:cloudwings_mega20', 'tutorial:superblock9'},
        {'tutorial:superblock9', 'tutorial:superblock9', 'tutorial:superblock9'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega20',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudwings_mega19', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega19',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudwings_mega18', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega18',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudwings_mega17', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega17',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudwings_mega16', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega16',
    recipe = {
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:cloudwings_mega15', 'tutorial:superblock8'},
        {'tutorial:superblock8', 'tutorial:superblock8', 'tutorial:superblock8'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega15',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudwings_mega14', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega14',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudwings_mega13', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega13',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudwings_mega12', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega12',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudwings_mega11', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega11',
    recipe = {
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:cloudwings_mega10', 'tutorial:superblock7'},
        {'tutorial:superblock7', 'tutorial:superblock7', 'tutorial:superblock7'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega10',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudwings_mega9', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega9',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudwings_mega8', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega8',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudwings_mega7', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega7',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudwings_mega6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega6',
    recipe = {
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:cloudwings_mega5', 'tutorial:superblock6'},
        {'tutorial:superblock6', 'tutorial:superblock6', 'tutorial:superblock6'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega5',
    recipe = {
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:cloudwings_mega4', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega4',
    recipe = {
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:cloudwings_mega3', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega3',
    recipe = {
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:cloudwings_mega2', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega2',
    recipe = {
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:cloudwings_mega1', 'tutorial:superblock5'},
        {'tutorial:superblock5', 'tutorial:superblock5', 'tutorial:superblock5'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega1',
    recipe = {
        {'tutorial:cloudentverner21', 'tutorial:wings_mega20'},
    }
})
minetest.register_craft({
    output = 'tutorial:cloudwings_mega1',
    recipe = {
        {'tutorial:wings_mega20', 'tutorial:cloudentverner21'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega20',
    recipe = {
		{'tutorial:megablock2','tutorial:megablock2', 'tutorial:megablock2'},
		{'tutorial:megablock2','tutorial:wings_mega19','tutorial:megablock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega19',
    recipe = {
		{'tutorial:megablock1','tutorial:megablock1', 'tutorial:megablock1'},
		{'tutorial:megablock1','tutorial:wings_mega18','tutorial:megablock1'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega18',
    recipe = {
		{'tutorial:megablock1','tutorial:megablock1', 'tutorial:megablock1'},
		{'tutorial:megablock1','tutorial:wings_mega17','tutorial:megablock1'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega17',
    recipe = {
		{'tutorial:megablock1','tutorial:megablock1', 'tutorial:megablock1'},
		{'tutorial:megablock1','tutorial:wings_mega16','tutorial:megablock1'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega16',
    recipe = {
		{'tutorial:megablock1','tutorial:megablock1', 'tutorial:megablock1'},
		{'tutorial:megablock1','tutorial:wings_mega15','tutorial:megablock1'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega13',
    recipe = {
		{'default:goldblock','default:goldblock', 'default:goldblock'},
		{'default:goldblock','tutorial:wings_mega12','default:goldblock'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega14',
    recipe = {
		{'nyancat:nyancat_rainbow','nyancat:nyancat_rainbow', 'nyancat:nyancat_rainbow'},
		{'nyancat:nyancat_rainbow','tutorial:wings_mega13','nyancat:nyancat_rainbow'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega15',
    recipe = {
		{'nyancat:nyancat_rainbow','nyancat:nyancat_rainbow', 'nyancat:nyancat_rainbow'},
		{'nyancat:nyancat_rainbow','tutorial:wings_mega14','nyancat:nyancat_rainbow'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega9',
    recipe = {
		{'tutorial:diamondblock2','tutorial:diamondblock2', 'tutorial:diamondblock2'},
		{'tutorial:diamondblock2','tutorial:wings_mega8','tutorial:diamondblock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega10',
    recipe = {
		{'tutorial:diamondblock2','tutorial:diamondblock2', 'tutorial:diamondblock2'},
		{'tutorial:diamondblock2','tutorial:wings_mega9','tutorial:diamondblock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega11',
    recipe = {
		{'tutorial:diamondblock2','tutorial:diamondblock2', 'tutorial:diamondblock2'},
		{'tutorial:diamondblock2','tutorial:wings_mega10','tutorial:diamondblock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega12',
    recipe = {
		{'tutorial:diamondblock2','tutorial:diamondblock2', 'tutorial:diamondblock2'},
		{'tutorial:diamondblock2','tutorial:wings_mega11','tutorial:diamondblock2'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega5',
    recipe = {
		{'tutorial:dunklematerie4','tutorial:dunklematerie4', 'tutorial:dunklematerie4'},
		{'tutorial:dunklematerie4','tutorial:wings_mega4','tutorial:dunklematerie4'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega6',
    recipe = {
		{'tutorial:dunklematerie4','tutorial:dunklematerie4', 'tutorial:dunklematerie4'},
		{'tutorial:dunklematerie4','tutorial:wings_mega5','tutorial:dunklematerie4'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega7',
    recipe = {
		{'tutorial:dunklematerie5','tutorial:dunklematerie5', 'tutorial:dunklematerie5'},
		{'tutorial:dunklematerie5','tutorial:wings_mega6','tutorial:dunklematerie5'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega8',
    recipe = {
		{'tutorial:dunklematerie6','tutorial:dunklematerie6', 'tutorial:dunklematerie6'},
		{'tutorial:dunklematerie6','tutorial:wings_mega7','tutorial:dunklematerie6'},
		{'tutorial:thunder','tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega1',
    recipe = {
        {'tutorial:obsidian4', 'tutorial:obsidian4', 'tutorial:obsidian4'},
        {'tutorial:obsidian4', 'tutorial:wings', 'tutorial:obsidian4'},
        {'tutorial:thunder', 'tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega2',
    recipe = {
        {'tutorial:obsidian4', 'tutorial:obsidian4', 'tutorial:obsidian4'},
        {'tutorial:obsidian4','tutorial:wings_mega1','tutorial:obsidian4'},
        {'tutorial:thunder', 'tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings_mega3',
    recipe = {
        {'tutorial:obsidian5', 'tutorial:obsidian5', 'tutorial:obsidian5'},
        {'tutorial:obsidian5','tutorial:wings_mega2','tutorial:obsidian5'},
        {'tutorial:thunder', 'tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = '"tutorial:wings_mega4"',
    recipe = {
        {'tutorial:obsidian6', 'tutorial:obsidian6', 'tutorial:obsidian6'},
        {'tutorial:obsidian6','tutorial:wings_mega3','tutorial:obsidian6'},
        {'tutorial:thunder', 'tutorial:thunder', 'tutorial:thunder'},
    }
})
minetest.register_craft({
    output = 'tutorial:wings',
    recipe = {
        {'group:wood', '', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:wood', ''},
    }
})
playereffects.register_effect_type("fly", "Fly mode available", "tutorial_wings_plain.png", {"fly"},
    function(player)
        local playername = player:get_player_name()
        local privs = minetest.get_player_privs(playername)
        privs.fly = true
        minetest.set_player_privs(playername, privs)
    end,
    function(effect, player)
        local privs = minetest.get_player_privs(effect.playername)
        privs.fly = nil
        minetest.set_player_privs(effect.playername, privs)
    end,
    false, false
)
minetest.register_craftitem("tutorial:wings", {
    description = "Wings\nWings-lv.0",
    inventory_image = "tutorial_wings.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
    on_use = function(itemstack, user, pointed_thing)
        local playername = user:get_player_name()
        local player_inv = user:get_inventory()
        local privs = minetest.get_player_privs(playername)
        if privs.fly == true then
        else
            if player_inv:get_stack("wings", 1):get_count() == 0 then
                player_inv:set_stack("wings", 1, "default:dirt 13")
                playereffects.apply_effect_type("fly", 0.5, user)
            end
            return itemstack
        end
    end,
})
for i=1,20 do
    minetest.register_craftitem("tutorial:wings_mega"..i, {
        description = "Megawings lv."..i.."\nWings-lv."..i,
        inventory_image = "tutorial_wings_mega"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil((i*0.5))
                    playereffects.apply_effect_type("fly", i*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,25 do
    minetest.register_craftitem("tutorial:cloudwings_mega"..i, {
        description = "Cloudwings lv."..i.."\nWings-lv."..(i+20),
        inventory_image = "tutorial_cloudwings_mega"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+20)*0.5))
                    playereffects.apply_effect_type("fly", (i+20)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,4 do
    minetest.register_craftitem("tutorial:superwings"..i, {
        description = "Superwings lv."..i.."\nWings-lv."..(i+45),
        inventory_image = "tutorial_superwings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+45)*0.5))
                    playereffects.apply_effect_type("fly", (i+45)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,2 do
    minetest.register_craftitem("tutorial:uraniumwings"..i, {
        description = "Uraniumwings lv."..i.."\nWings-lv."..(i+49),
        inventory_image = "tutorial_uraniumwings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+49)*0.5))
                    playereffects.apply_effect_type("fly", (i+49)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,12 do
    minetest.register_craftitem("tutorial:energywings"..i, {
        description = "Energywings lv."..i.."\nWings-lv."..(i+51),
        inventory_image = "tutorial_energywings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+51)*0.5))
                    playereffects.apply_effect_type("fly", (i+51)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,7 do
    minetest.register_craftitem("tutorial:superenergywings"..i, {
        description = "Superenergywings lv."..i.."\nWings-lv."..(i+63),
        inventory_image = "tutorial_superenergywings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+63)*0.5))
                    playereffects.apply_effect_type("fly", (i+63)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,5 do
    minetest.register_craftitem("tutorial:crystalwings"..i, {
        description = "Crystalwings lv."..i.."\nWings-lv."..(i+70),
        inventory_image = "tutorial_kristallwings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+70)*0.5))
                    playereffects.apply_effect_type("fly", (i+70)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,25 do
    minetest.register_craftitem("tutorial:ultrawings"..i, {
        description = "Ultrawings lv."..i.."\nWings-lv."..(i+75),
        inventory_image = "tutorial_ultrawings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+75)*0.5))
                    playereffects.apply_effect_type("fly", (i+75)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
minetest.register_craftitem("tutorial:superultrawings", {
    description = "Superultrawings\nWings-lv.101",
    inventory_image = "tutorial_superultrawings.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
    on_use = function(itemstack, user, pointed_thing)
        local playername = user:get_player_name()
        local player_inv = user:get_inventory()
        local privs = minetest.get_player_privs(playername)
        if privs.fly == true then
        else
            if player_inv:get_stack("wings", 1):get_count() == 0 then
                local k = math.ceil((101*0.5))
                playereffects.apply_effect_type("fly", 101*0.5, user)
                player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
            end
            return itemstack
        end
    end,
})
for i=1,4 do
    minetest.register_craftitem("tutorial:arenawings"..i, {
        description = "Arenawings lv."..i.."\nWings-lv."..(i+101),
        inventory_image = "tutorial_arenawings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+101)*0.5))
                    playereffects.apply_effect_type("fly", (i+101)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,10 do
    minetest.register_craftitem("tutorial:titanwings"..i, {
        description = "Titanwings lv."..i.."\nWings-lv."..(i+105),
        inventory_image = "tutorial_titanwings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+105)*0.5))
                    playereffects.apply_effect_type("fly", (i+105)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end
for i=1,6 do
    minetest.register_craftitem("tutorial:legendwings"..i, {
        description = "Legendwings lv."..i.."\nWings-lv."..(i+115),
        inventory_image = "tutorial_legendwings"..i..".png",
        stack_max = 1,
		groups = {not_in_creative_inventory=1},
        on_use = function(itemstack, user, pointed_thing)
            local playername = user:get_player_name()
            local player_inv = user:get_inventory()
            local privs = minetest.get_player_privs(playername)
            if privs.fly == true then
            else
                if player_inv:get_stack("wings", 1):get_count() == 0 then
                    local k = math.ceil(((i+115)*0.5))
                    playereffects.apply_effect_type("fly", (i+115)*0.5, user)
                    player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
                end
                return itemstack
            end
        end,
    })
end



minetest.register_craftitem("tutorial:superlegendwings1", {
    description = "Superlegendwings Mode 1 (fly and normal gravity)\nWings-lv.122",
    inventory_image = "tutorial_superlegendwings.png^technic_tool_mode1.png",
    wield_image = "tutorial_superlegendwings.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:superlegendwings2")
        end
        return itemstack
    end,
    on_use = function(itemstack, user, pointed_thing)
		local playername = user:get_player_name()
		local player_inv = user:get_inventory()
		local privs = minetest.get_player_privs(playername)
		if privs.fly == true then
		else
			if player_inv:get_stack("wings", 1):get_count() == 0 then
				local k = math.ceil((122*0.5))
				playereffects.apply_effect_type("fly", 122*0.5, user)
				player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
			end
		end
        return itemstack
    end,
})
minetest.register_craftitem("tutorial:superlegendwings2", {
    description = "Superlegendwings Mode 2 (no fly and low gravity)\nWings-lv.122",
    inventory_image = "tutorial_superlegendwings.png^technic_tool_mode2.png",
    wield_image = "tutorial_superlegendwings.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:superlegendwings3")
        end
        return itemstack
    end,
    on_use = function(itemstack, user, pointed_thing)
		local playername = user:get_player_name()
		local player_inv = user:get_inventory()
		local privs = minetest.get_player_privs(playername)
		if player_inv:get_stack("wings", 1):get_count() == 0 then
			local k = math.ceil((122*0.5))
			playereffects.apply_effect_type("pepgrav0", 122*0.5, user)
			player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
		end
        return itemstack
    end,
})
minetest.register_craftitem("tutorial:superlegendwings3", {
    description = "Superlegendwings Mode 3 (fly and low gravity)\nWings-lv.122",
    inventory_image = "tutorial_superlegendwings.png^technic_tool_mode3.png",
    wield_image = "tutorial_superlegendwings.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:superlegendwings1")
        end
        return itemstack
    end,
    on_use = function(itemstack, user, pointed_thing)
		local playername = user:get_player_name()
		local player_inv = user:get_inventory()
		local privs = minetest.get_player_privs(playername)
		if player_inv:get_stack("wings", 1):get_count() == 0 then
			local k = math.ceil((122*0.5))
			playereffects.apply_effect_type("pepgrav0", 122*0.5, user)
			if privs.fly == true then
			else
				playereffects.apply_effect_type("fly", 122*0.5, user)
			end
			player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
		end
        return itemstack
    end,
})

minetest.register_craftitem("tutorial:regnumwings1", {
    description = "Regnumwings Mode 1 (fly and normal gravity)\nWings-lv.MAX",
    inventory_image = "tutorial_regnumwings.png^technic_tool_mode1.png",
    wield_image = "tutorial_regnumwings.png",
    stack_max = 1,
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:regnumwings2")
        end
        return itemstack
    end,
    on_use = function(itemstack, user, pointed_thing)
		local playername = user:get_player_name()
		local player_inv = user:get_inventory()
		local privs = minetest.get_player_privs(playername)
		if privs.fly == true then
		else
			if player_inv:get_stack("wings", 1):get_count() == 0 then
				local k = math.ceil((150*0.5))
				playereffects.apply_effect_type("fly", 150*0.5, user)
				player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
			end
		end
        return itemstack
    end,
})
minetest.register_craftitem("tutorial:regnumwings2", {
    description = "Regnumwings Mode 2 (no fly and low gravity)\nWings-lv.MAX",
    inventory_image = "tutorial_regnumwings.png^technic_tool_mode2.png",
    wield_image = "tutorial_regnumwings.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:regnumwings3")
        end
        return itemstack
    end,
    on_use = function(itemstack, user, pointed_thing)
		local playername = user:get_player_name()
		local player_inv = user:get_inventory()
		local privs = minetest.get_player_privs(playername)
		if player_inv:get_stack("wings", 1):get_count() == 0 then
			local k = math.ceil((150*0.5))
			playereffects.apply_effect_type("pepgrav0", 150*0.5, user)
			player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
		end
        return itemstack
    end,
})
minetest.register_craftitem("tutorial:regnumwings3", {
    description = "Regnumwings Mode 3 (fly and low gravity)\nWings-lv.MAX",
    inventory_image = "tutorial_regnumwings.png^technic_tool_mode3.png",
    wield_image = "tutorial_regnumwings.png",
    stack_max = 1,
	groups = {not_in_creative_inventory=1},
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:regnumwings1")
        end
        return itemstack
    end,
    on_use = function(itemstack, user, pointed_thing)
		local playername = user:get_player_name()
		local player_inv = user:get_inventory()
		local privs = minetest.get_player_privs(playername)
		if player_inv:get_stack("wings", 1):get_count() == 0 then
			local k = math.ceil((150*0.5))
			playereffects.apply_effect_type("pepgrav0", 150*0.5, user)
			if privs.fly == true then
			else
				playereffects.apply_effect_type("fly", 150*0.5, user)
			end
			player_inv:set_stack("wings", 1, "default:dirt "..(k+12))
		end
        return itemstack
    end,
})
minetest.register_on_newplayer(function(player)
	minetest.chat_send_player(player:get_player_name(), "Welcome to Regnum 2.")
    minetest.chat_send_player(player:get_player_name(), "You will get all important things from Regnum 1.")
    local inv = player:get_inventory()
    inv:set_size("armor", 5)
    inv:add_item("main", "tutorial:regnumbattleaxe1")
    inv:add_item("main", "tutorial:regnumgun1")
    inv:add_item("main", "tutorial:wallplacer5_1")
    inv:add_item("main", "tutorial:legendstick9")
    inv:add_item("main", "technic:laser_mkS150")
    inv:add_item("main", "technic:drill_mkS150")
    inv:add_item("main", "tutorial:colorstick_empty")
    inv:add_item("armor", "3d_armor:regnumhelmet")
    inv:add_item("armor", "3d_armor:regnumchestplate")
    inv:add_item("armor", "3d_armor:regnumleggings")
    inv:add_item("armor", "3d_armor:regnumboots")
    inv:add_item("armor", "shields:regnumshield")
    inv:add_item("main", "mobs:knight_egg")
end)
minetest.register_craftitem("tutorial:colorstick_empty", {
    description = "Colorstick (empty)",
	inventory_image = "tutorial_colorstick_empty.png",
})

minetest.register_tool("tutorial:legendstick9", {
	description = "Legendstick lv.MAX",
	inventory_image = "tutorial_legendzauberstab9.png",
	on_use = function(itemstack, placer, pointed_thing)
        local dir = placer:get_look_dir();
		local inv = placer:get_inventory()
		local playerpos = placer:getpos();
		local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "tutorial:legendball")
		local vec = {x=dir.x*3,y=dir.y*3,z=dir.z*3}
		obj:setvelocity(vec)
	    return itemstack
	end,
	light_source = 12,
})
minetest.register_entity("tutorial:legendballadmin", {
	visual = "mesh",
	visual_size = {x=5, y=5},
	mesh = "tutorial_fireball.x",
	textures = {"tutorial_adminball.png"},
	velocity = 5,
	light_source = 12,
	on_step = function(self, dtime)
			local pos = self.object:getpos()
			if minetest.env:get_node(self.object:getpos()).name ~= "air" then
				self.hit_node(self, pos, node)
				self.object:remove()
				return
			end
			pos.y = pos.y-1
			for _,player in pairs(minetest.env:get_objects_inside_radius(pos, 1)) do
				if player:is_player() then
					self.hit_player(self, player)
					self.object:remove()
					return
				end
			end
		end,
	hit_player = function(self, player)
		local hp = player:get_hp()
		player:set_hp(0)
		local s = player:getpos()
		local p = player:get_look_dir()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		local pos = player:getpos()
		for dx=0,1 do
			for dy=0,1 do
				for dz=0,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if (n == "air") then
						minetest.env:add_node(p, {name="tutorial:legend_thunderadmin"})
					end
				end
			end
		end
	end,
	hit_node = function(self, pos, node)
		for dx=-1,1 do
			for dy=-2,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if (n == "air") then
						minetest.env:add_node(p, {name="tutorial:legend_thunderadmin"})
					end
				end
			end
		end
	end
})
minetest.register_tool("tutorial:legendball_admin", {
	description = "Admin Legend Ball",
	inventory_image = "tutorial_legendball.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local inv = placer:get_inventory()
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "tutorial:legendball_admin")
			local vec = {x=dir.x*3,y=dir.y*3,z=dir.z*3}
			if not minetest.setting_getbool("creative_mode") then 
                itemstack:take_item() 
            end
			obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 12,
})
minetest.register_node("tutorial:legend_thunderadmin", {
	description = "Admin Legend thunder",
	drawtype = "plantlike",
	tiles = {{
		name="tutorial_legend_thunderadmin.png",
	}},
	light_source = 12,
	walkable = false,
	buildable_to = true,
	damage_per_second = 100,
	drop = {},
	groups = {dig_immediate=3},
})
minetest.register_abm({
	nodenames = {"tutorial:legend_thunderadmin"},
	interval = 30,
	chance = 1,
	action = function(pos)
		minetest.env:remove_node(pos)
	end,
})
minetest.register_tool("tutorial:legendstick_admin", {
	description = "Admin tool 10: Legendstick",
	inventory_image = "tutorial_legendzauberstabadmin.png",
	on_use = function(itemstack, placer, pointed_thing)
        local dir = placer:get_look_dir();
		local inv = placer:get_inventory()
		local playerpos = placer:getpos();
		local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "tutorial:legendballadmin")
		local vec = {x=dir.x*3,y=dir.y*3,z=dir.z*3}
		obj:setvelocity(vec)
	    return itemstack
	end,
	light_source = 12,
})
minetest.register_craftitem("tutorial:big_dna_string", {
	description = "Big DNA string",
	inventory_image = "tutorial_big_dna_string.png",
})
minetest.register_craft({
    output = 'tutorial:big_dna_string',
    recipe = {
		{'tutorial:dna_string', 'tutorial:dna_string', 'tutorial:dna_string', 'tutorial:dna_string', 'tutorial:dna_string'},
    }
})
minetest.register_craft({
    output = 'tutorial:lightstone',
    recipe = {
        {'', 'default:cobble', ''},
		{'default:cobble', 'default:coal_lump', 'default:cobble'},
		{'', 'default:cobble', ''},
    }
})
minetest.register_on_joinplayer(function(player)
	local override_table = player:get_physics_override()
	override_table.new_move = false
	override_table.sneak_glitch = true
	player:set_physics_override(override_table)
	local player_inv = player:get_inventory()
	player_inv:set_stack("crtime", 1, nil)
end)
local crafting6 = {}
crafting6.get_formspec = function(player, pos)
    if player:is_player() then
    else
        return
    end
    local player_inv = player:get_inventory()
    player_inv:set_size("uranin", 1)
    player_inv:set_size("cookin", 1)
    player_inv:set_size("cookkey", 1)
    player_inv:set_size("fuel", 1)
    local fuel = player_inv:get_stack("fuel", 1):get_count()
	formspec = "size[8,8.3]"
		.."button[0,0;2,0.5;cr;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."label[0,1;Fuel:"..fuel.."]"
		.."list[current_player;main;0,4.25;8,1;]"
        .."list[current_player;uranin;1,2;1,1]"
        .."button[2.5,3.3;2,0.5;cook;Craft (MAX)]"
        .."list[current_player;cookin;3,2;1,1]"
        .."label[1.15,2.8;Uranium]"
        .."button[0.5,3.3;2,0.5;fuel;Get Fuel]"
        .."list[current_player;main;0,5.5;8,3;8]"
        .."background[10,11.3.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
	return formspec		
end

minetest.register_on_joinplayer(function(player)
	local player_inv = player:get_inventory()
    player_inv:set_size("wings", 1)
    player_inv:set_size("mole", 1)
	player_inv:set_size("xray", 1)
    local d = 0
    function af2()
        minetest.after(1, function()
            local wings = player_inv:get_stack("wings", 1):get_count()
            if wings > 0 then
                player_inv:set_stack("wings", 1, "default:dirt "..(wings-1))
            end
            local mole = player_inv:get_stack("mole", 1):get_count()
            if mole > 0 then
                player_inv:set_stack("mole", 1, "default:dirt "..(mole-1))
            end
			local xray = player_inv:get_stack("xray", 1):get_count()
            if xray > 0 then
                player_inv:set_stack("xray", 1, "default:dirt "..(xray-1))
            end
            af2()
        end)
    end
    af2()
end)
minetest.override_item("default:obsidian", {
	description = "Obsidian Lv.1",
})
minetest.override_item("default:diamondblock", {
	description = "Diamond block lv.1",
})
minetest.register_craftitem("tutorial:wallplacer5_1", {
	description = "Wallplacer lv.MAX Mode 1 (place 3x3 wall)",
	inventory_image = "tutorial_block_placer5.png^technic_tool_mode1.png",
    wield_image = "tutorial_block_placer5.png",
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:wallplacer5_2")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,3,1 do
                            for j=1,3,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-2), z=pos.z+(j-2)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-2), z=pos.z+(j-2)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,3,1 do
                            for j=1,3,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-2)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-2)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,3,1 do
                            for j=1,3,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-3), z=pos.z+(j-2)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-3), z=pos.z+(j-2)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,3,1 do
                            for j=1,3,1 do
                                local name = minetest.get_node({x=pos.x+(j-2), y=pos.y+(i-2), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-2), y=pos.y+(i-2), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,3,1 do
                            for j=1,3,1 do
                                local name = minetest.get_node({x=pos.x+(j-2), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-2), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,3,1 do
                            for j=1,3,1 do 
                                local name = minetest.get_node({x=pos.x+(j-2), y=pos.y+(i-3), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-2), y=pos.y+(i-3), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:wallplacer5_2", {
	description = "Wallplacer lv.MAX Mode 2 (place 5x5 wall)",
	inventory_image = "tutorial_block_placer5.png^technic_tool_mode2.png",
    wield_image = "tutorial_block_placer5.png",
	groups = {not_in_creative_inventory=1},
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:wallplacer5_3")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,5,1 do
                            for j=1,5,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-3), z=pos.z+(j-3)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-3), z=pos.z+(j-3)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,5,1 do
                            for j=1,5,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-3)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-3)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,5,1 do
                            for j=1,5,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-5), z=pos.z+(j-3)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-5), z=pos.z+(j-3)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,5,1 do
                            for j=1,5,1 do
                                local name = minetest.get_node({x=pos.x+(j-3), y=pos.y+(i-3), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-3), y=pos.y+(i-3), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,5,1 do
                            for j=1,5,1 do
                                local name = minetest.get_node({x=pos.x+(j-3), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-3), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,5,1 do
                            for j=1,5,1 do 
                                local name = minetest.get_node({x=pos.x+(j-3), y=pos.y+(i-5), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-3), y=pos.y+(i-5), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:wallplacer5_3", {
	description = "Wallplacer lv.MAX Mode 3 (place 7x7 wall)",
	inventory_image = "tutorial_block_placer5.png^technic_tool_mode3.png",
    wield_image = "tutorial_block_placer5.png",
	groups = {not_in_creative_inventory=1},
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:wallplacer5_4")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,7,1 do
                            for j=1,7,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-4), z=pos.z+(j-4)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-4), z=pos.z+(j-4)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,7,1 do
                            for j=1,7,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-4)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-4)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,7,1 do
                            for j=1,7,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-7), z=pos.z+(j-4)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-7), z=pos.z+(j-4)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,7,1 do
                            for j=1,7,1 do
                                local name = minetest.get_node({x=pos.x+(j-4), y=pos.y+(i-4), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-4), y=pos.y+(i-4), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,7,1 do
                            for j=1,7,1 do
                                local name = minetest.get_node({x=pos.x+(j-4), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-4), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,7,1 do
                            for j=1,7,1 do 
                                local name = minetest.get_node({x=pos.x+(j-4), y=pos.y+(i-7), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-4), y=pos.y+(i-7), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:wallplacer5_4", {
	description = "Wallplacer lv.MAX Mode 4 (place 9x9 wall)",
	inventory_image = "tutorial_block_placer5.png^technic_tool_mode4.png",
    wield_image = "tutorial_block_placer5.png",
	groups = {not_in_creative_inventory=1},
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:wallplacer5_5")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,9,1 do
                            for j=1,9,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-5), z=pos.z+(j-5)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-5), z=pos.z+(j-5)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,9,1 do
                            for j=1,9,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-5)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-5)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,9,1 do
                            for j=1,9,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-9), z=pos.z+(j-5)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-9), z=pos.z+(j-5)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,9,1 do
                            for j=1,9,1 do
                                local name = minetest.get_node({x=pos.x+(j-5), y=pos.y+(i-5), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-5), y=pos.y+(i-5), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,9,1 do
                            for j=1,9,1 do
                                local name = minetest.get_node({x=pos.x+(j-5), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-5), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,9,1 do
                            for j=1,9,1 do 
                                local name = minetest.get_node({x=pos.x+(j-5), y=pos.y+(i-9), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-5), y=pos.y+(i-9), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:wallplacer5_5", {
	description = "Wallplacer lv.MAX Mode 5 (place 11x11 wall)",
	inventory_image = "tutorial_block_placer5.png^technic_tool_mode5.png",
    wield_image = "tutorial_block_placer5.png",
	groups = {not_in_creative_inventory=1},
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:wallplacer5_1")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,11,1 do
                            for j=1,11,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-6), z=pos.z+(j-6)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-6), z=pos.z+(j-6)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,11,1 do
                            for j=1,11,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-6)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-6)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,11,1 do
                            for j=1,11,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-11), z=pos.z+(j-6)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-11), z=pos.z+(j-6)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,11,1 do
                            for j=1,11,1 do
                                local name = minetest.get_node({x=pos.x+(j-6), y=pos.y+(i-6), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-6), y=pos.y+(i-6), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,11,1 do
                            for j=1,11,1 do
                                local name = minetest.get_node({x=pos.x+(j-6), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-6), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,11,1 do
                            for j=1,11,1 do 
                                local name = minetest.get_node({x=pos.x+(j-6), y=pos.y+(i-11), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-6), y=pos.y+(i-11), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:adminwallplacer_1", {
	description = "Admin tool 9: Wallplacer Mode 1 (place 3x3 wall)",
	inventory_image = "tutorial_block_placerAdmin.png^technic_tool_mode1.png",
    wield_image = "tutorial_block_placerAdmin.png",
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:adminwallplacer_2")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,3,1 do
                            for j=1,3,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-2), z=pos.z+(j-2)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-2), z=pos.z+(j-2)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,3,1 do
                            for j=1,3,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-2)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-2)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,3,1 do
                            for j=1,3,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-3), z=pos.z+(j-2)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-3), z=pos.z+(j-2)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,3,1 do
                            for j=1,3,1 do
                                local name = minetest.get_node({x=pos.x+(j-2), y=pos.y+(i-2), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-2), y=pos.y+(i-2), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,3,1 do
                            for j=1,3,1 do
                                local name = minetest.get_node({x=pos.x+(j-2), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-2), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,3,1 do
                            for j=1,3,1 do 
                                local name = minetest.get_node({x=pos.x+(j-2), y=pos.y+(i-3), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-2), y=pos.y+(i-3), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:adminwallplacer_2", {
	description = "Admin tool 9: Wallplacer Mode 2 (place 5x5 wall)",
	inventory_image = "tutorial_block_placerAdmin.png^technic_tool_mode2.png",
    wield_image = "tutorial_block_placerAdmin.png",
	groups = {not_in_creative_inventory=1},
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:adminwallplacer_3")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,5,1 do
                            for j=1,5,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-3), z=pos.z+(j-3)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-3), z=pos.z+(j-3)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,5,1 do
                            for j=1,5,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-3)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-3)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,5,1 do
                            for j=1,5,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-5), z=pos.z+(j-3)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-5), z=pos.z+(j-3)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,5,1 do
                            for j=1,5,1 do
                                local name = minetest.get_node({x=pos.x+(j-3), y=pos.y+(i-3), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-3), y=pos.y+(i-3), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,5,1 do
                            for j=1,5,1 do
                                local name = minetest.get_node({x=pos.x+(j-3), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-3), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,5,1 do
                            for j=1,5,1 do 
                                local name = minetest.get_node({x=pos.x+(j-3), y=pos.y+(i-5), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-3), y=pos.y+(i-5), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:adminwallplacer_3", {
	description = "Admin tool 9: Wallplacer Mode 3 (place 7x7 wall)",
	inventory_image = "tutorial_block_placerAdmin.png^technic_tool_mode3.png",
    wield_image = "tutorial_block_placerAdmin.png",
	groups = {not_in_creative_inventory=1},
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:adminwallplacer_4")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,7,1 do
                            for j=1,7,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-4), z=pos.z+(j-4)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-4), z=pos.z+(j-4)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,7,1 do
                            for j=1,7,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-4)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-4)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,7,1 do
                            for j=1,7,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-7), z=pos.z+(j-4)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-7), z=pos.z+(j-4)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,7,1 do
                            for j=1,7,1 do
                                local name = minetest.get_node({x=pos.x+(j-4), y=pos.y+(i-4), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-4), y=pos.y+(i-4), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,7,1 do
                            for j=1,7,1 do
                                local name = minetest.get_node({x=pos.x+(j-4), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-4), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,7,1 do
                            for j=1,7,1 do 
                                local name = minetest.get_node({x=pos.x+(j-4), y=pos.y+(i-7), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-4), y=pos.y+(i-7), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:adminwallplacer_4", {
	description = "Admin tool 9: Wallplacer Mode 4 (place 9x9 wall)",
	inventory_image = "tutorial_block_placerAdmin.png^technic_tool_mode4.png",
    wield_image = "tutorial_block_placerAdmin.png",
	groups = {not_in_creative_inventory=1},
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:adminwallplacer_5")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,9,1 do
                            for j=1,9,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-5), z=pos.z+(j-5)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-5), z=pos.z+(j-5)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,9,1 do
                            for j=1,9,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-5)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-5)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,9,1 do
                            for j=1,9,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-9), z=pos.z+(j-5)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-9), z=pos.z+(j-5)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,9,1 do
                            for j=1,9,1 do
                                local name = minetest.get_node({x=pos.x+(j-5), y=pos.y+(i-5), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-5), y=pos.y+(i-5), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,9,1 do
                            for j=1,9,1 do
                                local name = minetest.get_node({x=pos.x+(j-5), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-5), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,9,1 do
                            for j=1,9,1 do 
                                local name = minetest.get_node({x=pos.x+(j-5), y=pos.y+(i-9), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-5), y=pos.y+(i-9), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_craftitem("tutorial:adminwallplacer_5", {
	description = "Admin tool 9: Wallplacer Mode 5 (place 11x11 wall)",
	inventory_image = "tutorial_block_placerAdmin.png^technic_tool_mode5.png",
    wield_image = "tutorial_block_placerAdmin.png",
	groups = {not_in_creative_inventory=1},
    on_secondary_use  = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:adminwallplacer_1")
        end
        return itemstack
    end,
	on_place = function(itemstack, placer, pointed_thing)
		local main = placer:get_wield_index()+1
        local inv = placer:get_inventory()
        local stack = inv:get_stack("main", main)
        local count =  inv:get_stack("main", main):get_count()
        if pointed_thing ~= nil then
            local dir=placer:get_look_dir()
            local di = 0
	        if math.abs(dir.x)>math.abs(dir.z) then 
		        if dir.x>0 then 
                    di = 0
                else
                    di = 1
                end
            elseif dir.z>0 then
                di = 2
            else
                di = 3
	        end
            local pos = pointed_thing.above
            local pos2 = pointed_thing.under
            local ab = 0
            if minetest.registered_nodes[stack:get_name()] then
                if di == 1 or di == 0 then
                    if pos.y == pos2.y then
                        for i=  1,11,1 do
                            for j=1,11,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-6), z=pos.z+(j-6)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-6), z=pos.z+(j-6)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,11,1 do
                            for j=1,11,1 do
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-6)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-1), z=pos.z+(j-6)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,11,1 do
                            for j=1,11,1 do 
                                local name = minetest.get_node({x=pos.x, y=pos.y+(i-11), z=pos.z+(j-6)}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x, y=pos.y+(i-11), z=pos.z+(j-6)}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
                if di == 2 or di == 3 then
                    if pos.y == pos2.y then
                        for i=  1,11,1 do
                            for j=1,11,1 do
                                local name = minetest.get_node({x=pos.x+(j-6), y=pos.y+(i-6), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-6), y=pos.y+(i-6), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y > pos2.y then
                        for i=  1,11,1 do
                            for j=1,11,1 do
                                local name = minetest.get_node({x=pos.x+(j-6), y=pos.y+(i-1), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-6), y=pos.y+(i-1), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    elseif pos.y < pos2.y then
                        for i=1,11,1 do
                            for j=1,11,1 do 
                                local name = minetest.get_node({x=pos.x+(j-6), y=pos.y+(i-11), z=pos.z}).name
                                if name == "air" or name == "default:water_source" or name == "default:water_flowing" or name == "default:river_water_source" or name == "default:river_water_flowing" or name == "default:lava_source" or name == "default:lava_flowing" or name == "technic:corium_flowing" then
                                    local count =  inv:get_stack("main", main):get_count()
                                    if count > 0 then
                                        minetest.set_node({x=pos.x+(j-6), y=pos.y+(i-11), z=pos.z}, {name=stack:get_name()})
                                        inv:remove_item("main", stack:get_name())
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
minetest.register_node("tutorial:legend_thunder", {
	description = "Legend thunder",
	drawtype = "plantlike",
	tiles = {{
		name="tutorial_legend_thunder.png",
	}},
	light_source = 12,
	walkable = false,
	buildable_to = true,
	damage_per_second = 64,
	drop = {},
	groups = {dig_immediate=3},
})
minetest.register_abm({
	nodenames = {"tutorial:legend_thunder"},
	interval = 24,
	chance = 1,
	action = function(pos)
		minetest.env:remove_node(pos)
	end,
})
minetest.register_entity("tutorial:legendball", {
	visual = "mesh",
	visual_size = {x=5, y=5},
	mesh = "tutorial_fireball.x",
	textures = {"tutorial_legendball.png"},
	velocity = 5,
	light_source = 12,
	on_step = function(self, dtime)
			local pos = self.object:getpos()
			if minetest.env:get_node(self.object:getpos()).name ~= "air"then
				self.hit_node(self, pos, node)
				self.object:remove()
				return
			end
			pos.y = pos.y-1
			for _,player in pairs(minetest.env:get_objects_inside_radius(pos, 1)) do
				if player:is_player() then
					self.hit_player(self, player)
					self.object:remove()
					return
				end
			end
		end,
	hit_player = function(self, player)
		local hp = player:get_hp()
		if hp > 16 then
			player:set_hp(hp-16)
		else
			player:set_hp(0)
		end
		local s = player:getpos()
		local p = player:get_look_dir()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		local pos = player:getpos()
		for dx=0,1 do
			for dy=0,1 do
				for dz=0,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if (n == "air") then
						minetest.env:add_node(p, {name="tutorial:legend_thunder"})
					end
				end
			end
		end
	end,
	hit_node = function(self, pos, node)
		for dx=-1,1 do
			for dy=-2,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(p).name
					if (n == "air") then
						minetest.env:add_node(p, {name="tutorial:legend_thunder"})
					end
				end
			end
		end
	end
})
minetest.register_tool("tutorial:legendball", {
	description = "Legend Ball",
	inventory_image = "tutorial_legendball.png",
	on_use = function(itemstack, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local inv = placer:get_inventory()
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+0+dir.z}, "tutorial:legendball")
			local vec = {x=dir.x*3,y=dir.y*3,z=dir.z*3}
			if not minetest.setting_getbool("creative_mode") then 
                itemstack:take_item() 
            end
			obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 12,
})

for i = 123, 127 do
    local XTRAORES_TB = {
	    physical = false,
	    timer = 0,
	    visual = "sprite",
	    visual_size = {x=0.075, y=0.075,},
	    textures = {'tutorial_titanium_shot.png'},
	    lastpos= {},
	    collisionbox = {0, 0, 0, 0, 0, 0},
        metadata = "",
    }
    XTRAORES_TB.on_step = function(self, dtime)
	    self.timer = self.timer + dtime
        local ki = 0
        if i == 0 then
            ki = 1
        elseif i == 122 then
            ki = 122
        elseif i == 123 then
            ki = 150
        elseif i == 124 then
            ki = 122
        elseif i == 125 then
            ki = 150
        elseif i == 126 then
            ki = 500
        elseif i == 127 then
            ki = 500
        else
            ki = i
        end
        local l = 0
        if i == 0 then
            l = 1
        elseif i < 21 then
            l = 2
        elseif i < 46 then
            l = 3
        elseif i < 50 then
            l = 4
        elseif i < 52 then
            l = 5
        elseif i < 64 then
            l = 6
        elseif i < 71 then
            l = 7
        elseif i < 76 then
            l = 8
        elseif i < 101 then
            l = 9
        elseif i < 102 then
            l = 10
        elseif i < 106 then
            l = 11
        elseif i < 116 then
            l = 12
        elseif i < 122 then
            l = 13
        elseif i < 123 then
            l = 14
        elseif i < 124 then
            l = 15
        elseif i < 125 then
            l = 14
        elseif i < 126 then
            l = 15
        elseif i < 128 then
            l = 20
        end
	    local pos = self.object:getpos()
	    local node = minetest.get_node(pos)
	    if self.timer > 0.08 then
		    local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, l)
		    for k, obj in pairs(objs) do
                local damage = ki
			    if obj:get_luaentity() ~= nil then
					if string.match(obj:get_luaentity().name, "monster") or string.match(obj:get_luaentity().name, "mobs_bat") or string.match(obj:get_luaentity().name, "mobs_birds") or string.match(obj:get_luaentity().name, "mobs_butterfly") or string.match(obj:get_luaentity().name, "mobs_crocs") or string.match(obj:get_luaentity().name, "mobs_fish") or string.match(obj:get_luaentity().name, "mobs_jellyfish") or string.match(obj:get_luaentity().name, "mobs_sharks") or string.match(obj:get_luaentity().name, "mobs_turtles") or string.match(obj:get_luaentity().name, "mummy") then
						if obj:get_luaentity().name ~= "tutorial:tb_"..i and obj:get_luaentity().name ~= "__builtin:item" then
							obj:punch(self.object, 1.0, {full_punch_interval = 1.0, damage_groups= {fleshy = damage}}, nil)
							minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
						end
					end
			    else
				    if obj:is_player() and self.player then
                        if obj:get_player_name() == self.player:get_player_name() then
                        else
                            obj:punch(self.object, 1.0, {full_punch_interval = 1.0, damage_groups= {fleshy = damage}}, nil)
					        minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
                        end
                    else
                        obj:punch(self.object, 1.0, {full_punch_interval = 1.0, damage_groups= {fleshy = damage}}, nil)
					    minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
                    end
			    end
		    end
	    end
	    if self.lastpos.x ~= nil then
		    if minetest.registered_nodes[node.name].walkable then
			    if not minetest.setting_getbool("creative_mode") then
				    minetest.add_item(self.lastpos, "")
			    end
                if i > 126 then
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunderadmin"})
                    end
			        minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
                elseif i > 124 and i ~= 126 then
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunder"})
                    end
			        minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
                end
			    self.object:remove()
		    end
	    end
	    self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
    end
    minetest.register_entity("tutorial:tb_"..i, XTRAORES_TB)
end
for i = 123, 127 do
    local XTRAORES_TB2 = {
	    physical = false,
	    timer = 0,
	    visual = "sprite",
	    visual_size = {x=0.075, y=0.075,},
	    textures = {'tutorial_titanium_shot.png'},
	    lastpos= {},
	    collisionbox = {0, 0, 0, 0, 0, 0},
        metadata = "",
    }
    XTRAORES_TB2.on_step = function(self, dtime)
	    self.timer = self.timer + dtime
        local ki = 0
        if i == 0 then
            ki = 1
        elseif i == 122 then
            ki = 122
        elseif i == 123 then
            ki = 150
        elseif i == 124 then
            ki = 122
        elseif i == 125 then
            ki = 150
        elseif i == 126 then
            ki = 500
        elseif i == 127 then
            ki = 500
        else
            ki = i
        end
        local l = 0
        if i == 0 then
            l = 1
        elseif i < 21 then
            l = 2
        elseif i < 46 then
            l = 3
        elseif i < 50 then
            l = 4
        elseif i < 52 then
            l = 5
        elseif i < 64 then
            l = 6
        elseif i < 71 then
            l = 7
        elseif i < 76 then
            l = 8
        elseif i < 101 then
            l = 9
        elseif i < 102 then
            l = 10
        elseif i < 106 then
            l = 11
        elseif i < 116 then
            l = 12
        elseif i < 122 then
            l = 13
        elseif i < 123 then
            l = 14
        elseif i < 124 then
            l = 15
        elseif i < 125 then
            l = 14
        elseif i < 126 then
            l = 15
        elseif i < 128 then
            l = 20
        end
	    local pos = self.object:getpos()
	    local node = minetest.get_node(pos)
	    if self.timer > 0.08 then
		    local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, l)
		    for k, obj in pairs(objs) do
                local damage = ki
			    if obj:get_luaentity() ~= nil then
					if string.match(obj:get_luaentity().name, "monster") or string.match(obj:get_luaentity().name, "mobs_bat") or string.match(obj:get_luaentity().name, "mobs_birds") or string.match(obj:get_luaentity().name, "mobs_butterfly") or string.match(obj:get_luaentity().name, "mobs_crocs") or string.match(obj:get_luaentity().name, "mobs_fish") or string.match(obj:get_luaentity().name, "mobs_jellyfish") or string.match(obj:get_luaentity().name, "mobs_sharks") or string.match(obj:get_luaentity().name, "mobs_turtles") or string.match(obj:get_luaentity().name, "mummy") then
						if obj:get_luaentity().name ~= "tutorial:tb_"..i and obj:get_luaentity().name ~= "__builtin:item" then
							obj:punch(self.object, 1.0, {full_punch_interval = 1.0, damage_groups= {fleshy = damage}}, nil)
							minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
						end
					end
			    end
		    end
	    end
	    if self.lastpos.x ~= nil then
		    if minetest.registered_nodes[node.name].walkable then
			    if not minetest.setting_getbool("creative_mode") then
				    minetest.add_item(self.lastpos, "")
			    end
                if i > 126 then
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunderadmin"})
                    end
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunderadmin"})
                    end
			        minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
                elseif i >= 124 and i ~= 126 then
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x+1, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x+1, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z+1}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z+1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x-1, y = pos.y+1, z = pos.z-1}).name == "air" then
                        minetest.set_node({x = pos.x-1, y = pos.y+1, z = pos.z-1}, {name="tutorial:legend_thunder"})
                    end
                    if minetest.get_node({x = pos.x, y = pos.y+1, z = pos.z}).name == "air" then
                        minetest.set_node({x = pos.x, y = pos.y+1, z = pos.z}, {name="tutorial:legend_thunder"})
                    end
			        minetest.sound_play("default_dig_cracky", {pos = self.lastpos, gain = 0.8})
                end
			    self.object:remove()
		    end
	    end
	    self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
    end
    minetest.register_entity("tutorial:tb2_"..i, XTRAORES_TB2)
end

minetest.register_tool("tutorial:regnumgun1", {
	description = "Regnumgun Mode 1 (damage to players and no thunder)\nGun-lv.MAX",
	inventory_image = "tutorial_regnumgun.png^technic_tool_mode1.png",
    wield_image = "tutorial_regnumgun.png",
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "tutorial:tb_123")
			if obj then
				minetest.sound_play("shot", {object=obj})
				obj:setvelocity({x=dir.x * 60, y=dir.y * 60, z=dir.z * 60})
				obj:setacceleration({x=dir.x * -0, y=-0, z=dir.z * -0})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = user
				end
			end
		end
		return itemstack
	end,
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:regnumgun3")
        end
        return itemstack
    end,
})
minetest.register_tool("tutorial:regnumgun2", {
	description = "Regnumgun Mode 3 (damage to players and thunder)\nGun-lv.MAX",
	inventory_image = "tutorial_regnumgun.png^technic_tool_mode3.png",
    wield_image = "tutorial_regnumgun.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "tutorial:tb_125")
			if obj then
				minetest.sound_play("shot", {object=obj})
				obj:setvelocity({x=dir.x * 60, y=dir.y * 60, z=dir.z * 60})
				obj:setacceleration({x=dir.x * -0, y=-0, z=dir.z * -0})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = user
				end
			end
		end
		return itemstack
	end,
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:regnumgun1")
        end
        return itemstack
    end,
})

minetest.register_tool("tutorial:regnumgun3", {
	description = "Regnumgun Mode 2 (no damage to players and no thunder)\nGun-lv.MAX",
	inventory_image = "tutorial_regnumgun.png^technic_tool_mode2.png",
    wield_image = "tutorial_regnumgun.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "tutorial:tb2_123")
			if obj then
				minetest.sound_play("shot", {object=obj})
				obj:setvelocity({x=dir.x * 60, y=dir.y * 60, z=dir.z * 60})
				obj:setacceleration({x=dir.x * -0, y=-0, z=dir.z * -0})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = user
				end
			end
		end
		return itemstack
	end,
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:regnumgun2")
        end
        return itemstack
    end,
})


minetest.register_tool("tutorial:gun_admin1", {
	description = "Admin tool 11: Gun Mode 1 (damage to players and no thunder)",
	inventory_image = "tutorial_admingun.png^technic_tool_mode1.png",
    wield_image = "tutorial_admingun.png",
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "tutorial:tb_126")
			if obj then
				minetest.sound_play("shot", {object=obj})
				obj:setvelocity({x=dir.x * 60, y=dir.y * 60, z=dir.z * 60})
				obj:setacceleration({x=dir.x * -0, y=-0, z=dir.z * -0})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = user
				end
			end
		end
		return itemstack
	end,
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:gun_admin3")
        end
        return itemstack
    end,
})
minetest.register_tool("tutorial:gun_admin2", {
	description = "Admin tool 11: Gun Mode 3 (damage to players and thunder)",
	inventory_image = "tutorial_admingun.png^technic_tool_mode3.png",
    wield_image = "tutorial_admingun.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "tutorial:tb_127")
			if obj then
				minetest.sound_play("shot", {object=obj})
				obj:setvelocity({x=dir.x * 60, y=dir.y * 60, z=dir.z * 60})
				obj:setacceleration({x=dir.x * -0, y=-0, z=dir.z * -0})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = user
				end
			end
		end
		return itemstack
	end,
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:gun_admin1")
        end
        return itemstack
    end,
})

minetest.register_tool("tutorial:gun_admin3", {
	description = "Admin tool 11: Gun Mode 2 (no damage to players and no thunder)",
	inventory_image = "tutorial_admingun.png^technic_tool_mode2.png",
    wield_image = "tutorial_admingun.png",
	groups = {not_in_creative_inventory=1},
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "tutorial:tb2_126")
			if obj then
				minetest.sound_play("shot", {object=obj})
				obj:setvelocity({x=dir.x * 60, y=dir.y * 60, z=dir.z * 60})
				obj:setacceleration({x=dir.x * -0, y=-0, z=dir.z * -0})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = user
				end
			end
		end
		return itemstack
	end,
	on_secondary_use = function(itemstack, user, pointed_thing)
        local keys = user:get_player_control()
        if keys["sneak"] == true then
            itemstack:set_name("tutorial:gun_admin2")
        end
        return itemstack
    end,
})

local recraft = {}
recraft.get_formspec = function(player,pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    local lv = {
	    {1,     "normal",   5,  "tutorial:obsidian4",           "tutorial:obsidian4",           "tutorial:obsidian4",           "tutorial:obsidian4",           "",     "tutorial:obsidian4",               "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {2,     "normal",   5,  "tutorial:obsidian4",           "tutorial:obsidian4",           "tutorial:obsidian4",           "tutorial:obsidian4",           "",     "tutorial:obsidian4",               "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {3,     "normal",   5,  "tutorial:obsidian5",           "tutorial:obsidian5",           "tutorial:obsidian5",           "tutorial:obsidian5",           "",     "tutorial:obsidian5",               "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {4,     "normal",   5,  "tutorial:obsidian6",           "tutorial:obsidian6",           "tutorial:obsidian6",           "tutorial:obsidian6",           "",     "tutorial:obsidian6",               "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {5,     "normal",   5,  "tutorial:dunklematerie4",      "tutorial:dunklematerie4",      "tutorial:dunklematerie4",      "tutorial:dunklematerie4",      "",     "tutorial:dunklematerie4",          "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {6,     "normal",   5,  "tutorial:dunklematerie4",      "tutorial:dunklematerie4",      "tutorial:dunklematerie4",      "tutorial:dunklematerie4",      "",     "tutorial:dunklematerie4",          "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {7,     "normal",   5,  "tutorial:dunklematerie5",      "tutorial:dunklematerie5",      "tutorial:dunklematerie5",      "tutorial:dunklematerie5",      "",     "tutorial:dunklematerie5",          "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {8,     "normal",   5,  "tutorial:dunklematerie6",      "tutorial:dunklematerie6",      "tutorial:dunklematerie6",      "tutorial:dunklematerie6",      "",     "tutorial:dunklematerie6",          "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {9,     "normal",   5,  "tutorial:diamondblock2",       "tutorial:diamondblock2",       "tutorial:diamondblock2",       "tutorial:diamondblock2",       "",     "tutorial:diamondblock2",           "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {10,    "normal",   5,  "tutorial:diamondblock2",       "tutorial:diamondblock2",       "tutorial:diamondblock2",       "tutorial:diamondblock2",       "",     "tutorial:diamondblock2",           "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {11,    "normal",   5,  "tutorial:diamondblock2",       "tutorial:diamondblock2",       "tutorial:diamondblock2",       "tutorial:diamondblock2",       "",     "tutorial:diamondblock2",           "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {12,    "normal",   5,  "tutorial:diamondblock2",       "tutorial:diamondblock2",       "tutorial:diamondblock2",       "tutorial:diamondblock2",       "",     "tutorial:diamondblock2",           "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {13,    "normal",   5,  "default:goldblock",            "default:goldblock",            "default:goldblock",            "default:goldblock",            "",     "default:goldblock",                "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {14,    "normal",   5,  "nyancat:nyancat_rainbow",      "nyancat:nyancat_rainbow",      "nyancat:nyancat_rainbow",      "nyancat:nyancat_rainbow",      "",     "nyancat:nyancat_rainbow",          "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {15,    "normal",   5,  "nyancat:nyancat_rainbow",      "nyancat:nyancat_rainbow",      "nyancat:nyancat_rainbow",      "nyancat:nyancat_rainbow",      "",     "nyancat:nyancat_rainbow",          "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {16,    "normal",   5,  "tutorial:megablock1",          "tutorial:megablock1",          "tutorial:megablock1",          "tutorial:megablock1",          "",     "tutorial:megablock1",              "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {17,    "normal",   5,  "tutorial:megablock1",          "tutorial:megablock1",          "tutorial:megablock1",          "tutorial:megablock1",          "",     "tutorial:megablock1",              "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {18,    "normal",   5,  "tutorial:megablock1",          "tutorial:megablock1",          "tutorial:megablock1",          "tutorial:megablock1",          "",     "tutorial:megablock1",              "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {19,    "normal",   5,  "tutorial:megablock1",          "tutorial:megablock1",          "tutorial:megablock1",          "tutorial:megablock1",          "",     "tutorial:megablock1",              "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {20,    "normal",   5,  "tutorial:megablock2",          "tutorial:megablock2",          "tutorial:megablock2",          "tutorial:megablock2",          "",     "tutorial:megablock2",              "tutorial:thunder",     "tutorial:thunder",     "tutorial:thunder",     0},
        {21,    "normal",   2,  "tutorial:cloudentverner21",    "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
        {22,    "normal",   5,  "tutorial:superblock5",         "tutorial:superblock5",         "tutorial:superblock5",         "tutorial:superblock5",         "",     "tutorial:superblock5",             "tutorial:superblock5", "tutorial:superblock5", "tutorial:superblock5", 0},
        {23,    "normal",   5,  "tutorial:superblock5",         "tutorial:superblock5",         "tutorial:superblock5",         "tutorial:superblock5",         "",     "tutorial:superblock5",             "tutorial:superblock5", "tutorial:superblock5", "tutorial:superblock5", 0},
        {24,    "normal",   5,  "tutorial:superblock5",         "tutorial:superblock5",         "tutorial:superblock5",         "tutorial:superblock5",         "",     "tutorial:superblock5",             "tutorial:superblock5", "tutorial:superblock5", "tutorial:superblock5", 0},
        {25,    "normal",   5,  "tutorial:superblock5",         "tutorial:superblock5",         "tutorial:superblock5",         "tutorial:superblock5",         "",     "tutorial:superblock5",             "tutorial:superblock5", "tutorial:superblock5", "tutorial:superblock5", 0},
        {26,    "normal",   5,  "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "",     "tutorial:superblock6",             "tutorial:superblock6", "tutorial:superblock6", "tutorial:superblock6", 0},
        {27,    "normal",   5,  "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "",     "tutorial:superblock6",             "tutorial:superblock6", "tutorial:superblock6", "tutorial:superblock6", 0},
        {28,    "normal",   5,  "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "",     "tutorial:superblock6",             "tutorial:superblock6", "tutorial:superblock6", "tutorial:superblock6", 0},
        {29,    "normal",   5,  "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "",     "tutorial:superblock6",             "tutorial:superblock6", "tutorial:superblock6", "tutorial:superblock6", 0},
        {30,    "normal",   5,  "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "tutorial:superblock6",         "",     "tutorial:superblock6",             "tutorial:superblock6", "tutorial:superblock6", "tutorial:superblock6", 0},
        {31,    "normal",   5,  "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "",     "tutorial:superblock7",             "tutorial:superblock7", "tutorial:superblock7", "tutorial:superblock7", 0},
        {32,    "normal",   5,  "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "",     "tutorial:superblock7",             "tutorial:superblock7", "tutorial:superblock7", "tutorial:superblock7", 0},
        {33,    "normal",   5,  "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "",     "tutorial:superblock7",             "tutorial:superblock7", "tutorial:superblock7", "tutorial:superblock7", 0},
        {34,    "normal",   5,  "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "",     "tutorial:superblock7",             "tutorial:superblock7", "tutorial:superblock7", "tutorial:superblock7", 0},
        {35,    "normal",   5,  "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "tutorial:superblock7",         "",     "tutorial:superblock7",             "tutorial:superblock7", "tutorial:superblock7", "tutorial:superblock7", 0},
        {36,    "normal",   5,  "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "",     "tutorial:superblock8",             "tutorial:superblock8", "tutorial:superblock8", "tutorial:superblock8", 0},
        {37,    "normal",   5,  "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "",     "tutorial:superblock8",             "tutorial:superblock8", "tutorial:superblock8", "tutorial:superblock8", 0},
        {38,    "normal",   5,  "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "",     "tutorial:superblock8",             "tutorial:superblock8", "tutorial:superblock8", "tutorial:superblock8", 0},
        {39,    "normal",   5,  "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "",     "tutorial:superblock8",             "tutorial:superblock8", "tutorial:superblock8", "tutorial:superblock8", 0},
        {40,    "normal",   5,  "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "tutorial:superblock8",         "",     "tutorial:superblock8",             "tutorial:superblock8", "tutorial:superblock8", "tutorial:superblock8", 0},
        {41,    "normal",   5,  "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "",     "tutorial:superblock9",             "tutorial:superblock9", "tutorial:superblock9", "tutorial:superblock9", 0},
        {42,    "normal",   5,  "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "",     "tutorial:superblock9",             "tutorial:superblock9", "tutorial:superblock9", "tutorial:superblock9", 0},
        {43,    "normal",   5,  "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "",     "tutorial:superblock9",             "tutorial:superblock9", "tutorial:superblock9", "tutorial:superblock9", 0},
        {44,    "normal",   5,  "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "",     "tutorial:superblock9",             "tutorial:superblock9", "tutorial:superblock9", "tutorial:superblock9", 0},
        {45,    "normal",   5,  "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "tutorial:superblock9",         "",     "tutorial:superblock9",             "tutorial:superblock9", "tutorial:superblock9", "tutorial:superblock9", 0},
        {46,    "normal",   2,  "tutorial:zauberstab9",         "",                             "tutorial:swored_zauber9",      "",                             "",     "",                                 "",                     "",                     "",                     0},
        {47,    "normal",   5,  "tutorial:whiteblock5",         "tutorial:thunder",             "tutorial:blackblock5",         "tutorial:whiteblock5",         "",     "tutorial:blackblock5",             "tutorial:whiteblock5", "tutorial:thunder",     "tutorial:blackblock5", 0},
        {48,    "normal",   5,  "tutorial:whiteblock6",         "tutorial:thunder",             "tutorial:blackblock6",         "tutorial:whiteblock6",         "",     "tutorial:blackblock6",             "tutorial:whiteblock6", "tutorial:thunder",     "tutorial:blackblock6", 0},
        {49,    "normal",   5,  "tutorial:whiteblock6",         "tutorial:thunder",             "tutorial:blackblock6",         "tutorial:whiteblock6",         "",     "tutorial:blackblock6",             "tutorial:whiteblock6", "tutorial:thunder",     "tutorial:blackblock6", 0},
        {50,    "normal",   5,  "tutorial:uranium8",            "tutorial:uranium8",            "tutorial:uranium8",            "tutorial:uranium8",            "",     "tutorial:uranium8",                "tutorial:uranium8",    "tutorial:uranium8",    "tutorial:uranium8",    0},
        {51,    "normal",   5,  "tutorial:uranium9",            "tutorial:uranium9",            "tutorial:uranium9",            "tutorial:uranium9",            "",     "tutorial:uranium9",                "tutorial:uranium9",    "tutorial:uranium9",    "tutorial:uranium9",    0},
        {52,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     100},
        {53,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     100},
        {54,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     200},
        {55,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     300},
        {56,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     400},
        {57,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     500},
        {58,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     600},
        {59,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     700},
        {60,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     800},
        {61,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     900},
        {62,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1000},
        {63,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1500},
        {64,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1000},
        {65,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1200},
        {66,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1400},
        {67,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1600},
        {68,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1800},
        {69,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     2000},
        {70,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     2500},
        {71,    "normal",   5,  "gems:ruby_block",              "tutorial:thunder",             "gems:sapphire_block",          "gems:ruby_block",              "",     "gems:sapphire_block",              "gems:ruby_block",      "tutorial:thunder",     "gems:sapphire_block",  0},
        {72,    "normal",   5,  "gems:amethyst_block",          "tutorial:thunder",             "gems:amethyst_block",          "gems:amethyst_block",          "",     "gems:amethyst_block",              "gems:amethyst_block",  "tutorial:thunder",     "gems:amethyst_block",  0},
        {73,    "normal",   5,  "gems:pearl_block",             "tutorial:thunder",             "gems:shadow_block",            "gems:pearl_block",             "",     "gems:shadow_block",                "gems:pearl_block",     "tutorial:thunder",     "gems:shadow_block",    0},
        {74,    "normal",   5,  "gems:emerald_block",           "tutorial:thunder",             "gems:emerald_block",           "gems:emerald_block",           "",     "gems:emerald_block",               "gems:emerald_block",   "tutorial:thunder",     "gems:emerald_block",   0},
        {75,    "normal",   5,  "tutorial:admin",               "tutorial:thunder",             "tutorial:admin",               "tutorial:admin",               "",     "tutorial:admin",                   "tutorial:admin",       "tutorial:thunder",     "tutorial:admin",       0},
        {76,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     200},
        {77,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     400},
        {78,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     600},
        {79,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     800},
        {80,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1000},
        {81,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1200},
        {82,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1400},
        {83,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1600},
        {84,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     1800},
        {85,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     2000},
        {86,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     2200},
        {87,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     2400},
        {88,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     2600},
        {89,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     2800},
        {90,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     3000},
        {91,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     3200},
        {92,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     3400},
        {93,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     3600},
        {94,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     3800},
        {95,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     4000},
        {96,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     4200},
        {97,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     4400},
        {98,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     4600},
        {99,    "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     4800},
        {100,   "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     5000},
        {101,   "cooking",  1,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     10000},
        {102,   "normal",   5,  "tutorial:arena_block",         "tutorial:arena_block",         "tutorial:arena_block",         "tutorial:arena_block",         "",     "tutorial:arena_block",             "tutorial:arena_block", "tutorial:arena_block", "tutorial:arena_block", 0},
        {103,   "normal",   5,  "tutorial:arena_block",         "tutorial:arena_block",         "tutorial:arena_block",         "tutorial:arena_block",         "",     "tutorial:arena_block",             "tutorial:arena_block", "tutorial:arena_block", "tutorial:arena_block", 0},
        {104,   "normal",   5,  "tutorial:arena_block",         "tutorial:arena_block",         "tutorial:arena_block",         "tutorial:arena_block",         "",     "tutorial:arena_block",             "tutorial:arena_block", "tutorial:arena_block", "tutorial:arena_block", 0},
        {105,   "normal",   5,  "tutorial:arena_block",         "tutorial:arena_block",         "tutorial:arena_block",         "tutorial:arena_block",         "",     "tutorial:arena_block",             "tutorial:arena_block", "tutorial:arena_block", "tutorial:arena_block", 0},
        {106,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{107,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{108,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{109,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{110,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{111,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{112,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{113,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
        {114,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{115,   "normal",   5,  "",               				"tutorial:titan",               "",               				"tutorial:titan",               "",     "tutorial:titan",                   "",       				"tutorial:titan",       "",       				0},
		{116,   "normal",   1,  "tutorial:bottle5",             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
        {117,   "normal",   1,  "tutorial:bottle7",             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
        {118,   "normal",   1,  "tutorial:bottle9",             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
        {119,   "normal",   1,  "tutorial:bottle11",            "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
        {120,   "normal",   1,  "tutorial:bottleS1",            "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
        {121,   "normal",   1,  "tutorial:bottleS3",            "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
        {122,   "normal",   2,  "tutorial:lilabattleaxe2",      "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
        {123,   "normal",   0,  "",                             "",                             "",                             "",                             "",     "",                                 "",                     "",                     "",                     0},
    }
    player_inv:set_size("recr", 1)
    local re = player_inv:get_stack("recr", 1):get_count()
    player_inv:set_size("recr2", 1)
    local re2 = player_inv:get_stack("recr2", 1):get_count()
	if re2 == 1 and re > 49 then
		re = 49
		player_inv:set_stack("recr", 1, "default:dirt 45")
	end
	formspec = "size[16,12.5]"
		.."button[0,0;2,0.5;zcg;Back]"
		.."button[2,0;2,0.5;main;Main]"
        .."background[16,12.5;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
        if re ~= 0 then
            local pr = ""
            if re2 == 0 then 
				pr = "regnum:wings_"  
            elseif re2 == 1 then  
				pr = "regnum:heart_" 
            elseif re2 == 2 then 
            elseif re2 == 3 then
            elseif re2 == 4 then
            elseif re2 == 5 then
            elseif re2 == 6 then
            end
            local can = 0
            
            if can ~= 1 then
                if lv[re][1] > 115 and lv[re][1] ~= 122 and lv[re][1] ~= 123 then
                    formspec = formspec 
                    .."item_image_button[5,0;1,1;"..pr..""..(lv[re][1]-1)..";;]"
                    .."item_image_button[6,0;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[7,0;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[8,0;1,1;"..lv[re][4]..";zcg:"..lv[re][4]..";]"
                    .."item_image_button[5,1;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[6,1;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[7,1;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[8,1;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[5,2;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[6,2;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[7,2;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[8,2;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[5,3;1,1;"..lv[re][4]..";zcg:"..lv[re][4]..";]"
                    .."item_image_button[6,3;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[7,3;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[8,3;1,1;default:grass_1;zcg:default:grass_1;]"
                    .."item_image_button[11,1;1,1;"..pr..""..lv[re][1]..";;]"
                elseif lv[re][1] == 123 then
                    formspec = formspec 
                    .."item_image_button[7,0;1,1;tutorial:regnum;zcg:tutorial:regnum;]"
                    .."item_image_button[7,1;1,1;tutorial:bottleSS;zcg:tutorial:bottleSS;]"
                    .."item_image_button[5,2;1,1;tutorial:regnum;zcg:tutorial:regnum;]"
                    .."item_image_button[6,2;1,1;tutorial:bottleSS;zcg:tutorial:bottleSS;]"
                    .."item_image_button[7,2;1,1;"..pr..""..(lv[re][1]-1)..";;]"
                    .."item_image_button[8,2;1,1;tutorial:bottleSS;zcg:tutorial:bottleSS;]"
                    .."item_image_button[9,2;1,1;tutorial:regnum;zcg:tutorial:regnum;]"
                    .."item_image_button[7,3;1,1;tutorial:bottleSS;zcg:tutorial:bottleSS;]"
                    .."item_image_button[7,4;1,1;tutorial:regnum;zcg:tutorial:regnum;]"
                    .."item_image_button[11,1;1,1;"..pr..""..lv[re][1]..";;]"
                else
                    if lv[re][4] ~= "" or lv[re][3] == 1 then
                        if lv[re][3]  == 1 then
                            formspec = formspec .."item_image_button[5,0;1,1;"..pr..""..(lv[re][1]-1)..";fia;]"
                        else
                            formspec = formspec .."item_image_button[5,0;1,1;"..lv[re][4]..";zcg:"..lv[re][4]..";]"
                        end
                    end
                    if lv[re][5] ~= "" or lv[re][3] == 2 then
                        if lv[re][3]  == 2 then
                            formspec = formspec .."item_image_button[6,0;1,1;"..pr..""..(lv[re][1]-1)..";fib;]"
                        else
                            formspec = formspec .."item_image_button[6,0;1,1;"..lv[re][5]..";zcg:"..lv[re][5]..";]"
                        end
                    end
                    if lv[re][6] ~= "" or lv[re][3] == 3 then
                        if lv[re][3]  == 3 then
                            formspec = formspec .."item_image_button[7,0;1,1;"..pr..""..(lv[re][1]-1)..";fic;]"
                        else
                            formspec = formspec .."item_image_button[7,0;1,1;"..lv[re][6]..";zcg:"..lv[re][6]..";]"
                        end
                    end
                    if lv[re][7] ~= "" or lv[re][3] == 4 then
                        if lv[re][3]  == 4 then
                            formspec = formspec .."item_image_button[5,1;1,1;"..pr..""..(lv[re][1]-1)..";fid;]"
                        else
                            formspec = formspec .."item_image_button[5,1;1,1;"..lv[re][7]..";zcg:"..lv[re][7]..";]"
                        end
                    end
                    if lv[re][8] ~= "" or lv[re][3] == 5 then
                        if lv[re][3]  == 5 then
                            formspec = formspec .."item_image_button[6,1;1,1;"..pr..""..(lv[re][1]-1)..";fie;]"
                        else
                            formspec = formspec .."item_image_button[6,1;1,1;"..lv[re][8]..";zcg:"..lv[re][8]..";]"
                        end
                    end
                    if lv[re][9] ~= "" or lv[re][3] == 6 then
                        if lv[re][3]  == 6 then
                            formspec = formspec .."item_image_button[7,1;1,1;"..pr..""..(lv[re][1]-1)..";fif;]"
                        else
                            formspec = formspec .."item_image_button[7,1;1,1;"..lv[re][9]..";zcg:"..lv[re][9]..";]"
                        end
                    end
                    if lv[re][10] ~= "" or lv[re][3] == 7 then
                        if lv[re][3]  == 7 then
                            formspec = formspec .."item_image_button[5,2;1,1;"..pr..""..(lv[re][1]-1)..";fig;]"
                        else
                            formspec = formspec .."item_image_button[5,2;1,1;"..lv[re][10]..";zcg:"..lv[re][10]..";]"
                        end
                    end
                    if lv[re][11] ~= "" or lv[re][3] == 8 then
                        if lv[re][3]  == 8 then
                            formspec = formspec .."item_image_button[6,2;1,1;"..pr..""..(lv[re][1]-1)..";fih;]"
                        else
                            formspec = formspec .."item_image_button[6,2;1,1;"..lv[re][11]..";zcg:"..lv[re][11]..";]"
                        end
                    end
                    if lv[re][12] ~= "" or lv[re][3] == 9 then
                        if lv[re][3]  == 9 then
                            formspec = formspec .."item_image_button[7,2;1,1;"..pr..""..(lv[re][1]-1)..";fii;]"
                        else
                            formspec = formspec .."item_image_button[7,2;1,1;"..lv[re][12]..";zcg:"..lv[re][12]..";]"
                        end
                    end
                    formspec = formspec .."item_image_button[11,1;1,1;"..pr..""..lv[re][1]..";;]"
                end
                formspec = formspec .."image[10,2;1,1;zcg_method_"..lv[re][2]..".png]"
                .."image[10,1;1,1;zcg_craft_arrow.png]"
                if lv[re][13] ~= 0 then
                    formspec = formspec .."label[10.1.4,2.7i;"..lv[re][13].."s]"
                end
                
            end
        end
        formspec = formspec
        .."item_image_button[0,1;1,1;regnum:wings_0;reg1;]"
		.."item_image_button[1,1;1,1;regnum:heart_0;reg2;]"
        .."button[0,5;1,1;recrafta;1]"
        .."button[1,5;1,1;recraftb;2]"
        .."button[2,5;1,1;recraftc;3]"
        .."button[3,5;1,1;recraftd;4]"
        .."button[4,5;1,1;recrafte;5]"
        .."button[5,5;1,1;recraftf;6]"
        .."button[6,5;1,1;recraftg;7]"
        .."button[7,5;1,1;recrafth;8]"
        .."button[8,5;1,1;recrafti;9]"
        .."button[9,5;1,1;recraftj;10]"
        .."button[10,5;1,1;recraftk;11]"
        .."button[11,5;1,1;recraftl;12]"
        .."button[12,5;1,1;recraftm;13]"
        .."button[13,5;1,1;recraftn;14]"
        .."button[14,5;1,1;recrafto;15]"
        .."button[15,5;1,1;recraftp;16]"
        .."button[0,6;1,1;recraftq;17]"
        .."button[1,6;1,1;recraftr;18]"
        .."button[2,6;1,1;recrafts;19]"
        .."button[3,6;1,1;recraftt;20]"
		.."button[4,6;1,1;recraftaa;21]"
		.."button[5,6;1,1;recraftab;22]"
		.."button[6,6;1,1;recraftac;23]"
		.."button[7,6;1,1;recraftad;24]"
		.."button[8,6;1,1;recraftae;25]"
		.."button[9,6;1,1;recraftaf;26]"
		.."button[10,6;1,1;recraftag;27]"
		.."button[11,6;1,1;recraftah;28]"
		.."button[12,6;1,1;recraftai;29]"
		.."button[13,6;1,1;recraftaj;30]"
		.."button[14,6;1,1;recraftak;31]"
		.."button[15,6;1,1;recraftal;32]"
		.."button[0,7;1,1;recraftam;33]"
		.."button[1,7;1,1;recraftan;34]"
		.."button[2,7;1,1;recraftao;35]"
		.."button[3,7;1,1;recraftap;36]"
		.."button[4,7;1,1;recraftaq;37]"
		.."button[5,7;1,1;recraftar;38]"
		.."button[6,7;1,1;recraftas;39]"
		.."button[7,7;1,1;recraftat;40]"
		.."button[8,7;1,1;recraftau;41]"
		.."button[9,7;1,1;recraftav;42]"
		.."button[10,7;1,1;recraftaw;43]"
		.."button[11,7;1,1;recraftax;44]"
		.."button[12,7;1,1;recraftay;45]"
		.."button[13,7;1,1;recraftba;46]"
		.."button[14,7;1,1;recraftbb;47]"
		.."button[15,7;1,1;recraftbc;48]"
		.."button[0,8;1,1;recraftbd;49]"
		if re2 < 1 then
			formspec = formspec
			.."button[1,8;1,1;recraftca;50]"
			.."button[2,8;1,1;recraftcb;51]"
			.."button[3,8;1,1;recraftda;52]"
			.."button[4,8;1,1;recraftdb;53]"
			.."button[5,8;1,1;recraftdc;54]"
			.."button[6,8;1,1;recraftdd;55]"
			.."button[7,8;1,1;recraftde;56]"
			.."button[8,8;1,1;recraftdf;57]"
			.."button[9,8;1,1;recraftdg;58]"
			.."button[10,8;1,1;recraftdh;59]"
			.."button[11,8;1,1;recraftdi;60]"
			.."button[12,8;1,1;recraftdj;61]"
			.."button[13,8;1,1;recraftdk;62]"
			.."button[14,8;1,1;recraftdl;63]"
			.."button[15,8;1,1;recraftea;64]"
			.."button[0,9;1,1;recrafteb;65]"
			.."button[1,9;1,1;recraftec;66]"
			.."button[2,9;1,1;recrafted;67]"
			.."button[3,9;1,1;recraftee;68]"
			.."button[4,9;1,1;recraftef;69]"
			.."button[5,9;1,1;recrafteg;70]"
			.."button[6,9;1,1;recraftfa;71]"
			.."button[7,9;1,1;recraftfb;72]"
			.."button[8,9;1,1;recraftfc;73]"
			.."button[9,9;1,1;recraftfd;74]"
			.."button[10,9;1,1;recraftfe;75]"
			.."button[11,9;1,1;recraftga;76]"
			.."button[12,9;1,1;recraftgb;77]"
			.."button[13,9;1,1;recraftgc;78]"
			.."button[14,9;1,1;recraftgd;79]"
			.."button[15,9;1,1;recraftge;80]"
			.."button[0,10;1,1;recraftgf;81]"
			.."button[1,10;1,1;recraftgg;82]"
			.."button[2,10;1,1;recraftgh;83]"
			.."button[3,10;1,1;recraftgi;84]"
			.."button[4,10;1,1;recraftgj;85]"
			.."button[5,10;1,1;recraftgk;86]"
			.."button[6,10;1,1;recraftgl;87]"
			.."button[7,10;1,1;recraftgm;88]"
			.."button[8,10;1,1;recraftgn;89]"
			.."button[9,10;1,1;recraftgo;90]"
			.."button[10,10;1,1;recraftgp;91]"
			.."button[11,10;1,1;recraftgq;92]"
			.."button[12,10;1,1;recraftgr;93]"
			.."button[13,10;1,1;recraftgs;94]"
			.."button[14,10;1,1;recraftgt;95]"
			.."button[15,10;1,1;recraftgu;96]"
			.."button[0,11;1,1;recraftgv;97]"
			.."button[1,11;1,1;recraftgw;98]"
			.."button[2,11;1,1;recraftgx;99]"
			.."button[3,11;1,1;recraftgy;100]"
			.."button[4,11;1,1;recraftha;101]"
			.."button[5,11;1,1;recraftia;102]"
			.."button[6,11;1,1;recraftib;103]"
			.."button[7,11;1,1;recraftic;104]"
			.."button[8,11;1,1;recraftid;105]"
			.."button[9,11;1,1;recraftja;106]"
			.."button[10,11;1,1;recraftjb;107]"
			.."button[11,11;1,1;recraftjc;108]"
			.."button[12,11;1,1;recraftjd;109]"
			.."button[13,11;1,1;recraftje;110]"
			.."button[14,11;1,1;recraftjf;111]"
			.."button[15,11;1,1;recraftjg;112]"
			.."button[0,12;1,1;recraftjh;113]"
			.."button[1,12;1,1;recraftji;114]"
			.."button[2,12;1,1;recraftjj;115]"
			.."button[3,12;1,1;recraftka;116]"
			.."button[4,12;1,1;recraftkb;117]"
			.."button[5,12;1,1;recraftkc;118]"
			.."button[6,12;1,1;recraftkd;119]"
			.."button[7,12;1,1;recraftke;120]"
			.."button[8,12;1,1;recraftkf;121]"
			.."button[9,12;1,1;recraftla;122]"
			.."button[10,12;1,1;recraftma;MAX]"
		end
	return formspec
end
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    if fields.fuel then
        local uran = player_inv:get_stack("uranin", 1):get_name()
        local key = player_inv:get_stack("cookkey", 1):get_name()
        fuel2 = 8
        local fuel = 0
        if uran == "tutorial:uranium1" then
            fuel = fuel2
        elseif uran == "tutorial:uranium2" then
            fuel = fuel2*2
        elseif uran == "tutorial:uranium3" then
            fuel = fuel2*4
        elseif uran == "tutorial:uranium4" then
            fuel = fuel2*8
        elseif uran == "tutorial:uranium5" then
            fuel = fuel2*16
        elseif uran == "tutorial:uranium6" then
            fuel = fuel2*32
        elseif uran == "tutorial:uranium7" then
            fuel = fuel2*64
        elseif uran == "tutorial:uranium8" then
            fuel = fuel2*128
        elseif uran == "tutorial:uranium9" then
            fuel = fuel2*256
        end
        if (player_inv:get_stack("fuel", 1):get_count()+fuel) > 60000 then
        else
            if fuel > 0 then
                player_inv:set_stack("uranin", 1, uran.." "..(player_inv:get_stack("uranin", 1):get_count()-1))
            end
            player_inv:set_stack("fuel", 1, "default:dirt "..(player_inv:get_stack("fuel", 1):get_count()+fuel))
        end
		inventory_plus.set_inventory_formspec(player, crafting6.get_formspec(player))
	end
    if fields.cook then
        local count = player_inv:get_stack("cookin", 1):get_count()
        local input = player_inv:get_stack("cookin", 1):get_name()
        local time = minetest.get_craft_result({method="cooking", width=1, items={player_inv:get_stack("cookin", 1)}}).time
        local output = minetest.get_craft_result({method="cooking", width=1, items={player_inv:get_stack("cookin", 1)}})
        for i=1,count do
            if player_inv:room_for_item("main", output.item) and output.item:get_count() ~= 0 then
                if (player_inv:get_stack("fuel", 1):get_count()-time) > -1 then
                     player_inv:set_stack("fuel", 1, "default:dirt "..(player_inv:get_stack("fuel", 1):get_count()-time))
                     player_inv:add_item("main",output.item)
                     player_inv:set_stack("cookin", 1, input.." "..(player_inv:get_stack("cookin", 1):get_count()-1))
                end
            end
        end
		inventory_plus.set_inventory_formspec(player, crafting6.get_formspec(player))
	end
    if fields.reg1 then
        player_inv:set_size("recr2", 1)
        player_inv:set_stack("recr2", 1, "")
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
	if fields.reg2 then
        player_inv:set_size("recr2", 1)
        player_inv:set_stack("recr2", 1, "default:dirt")
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
	if fields.recraft then
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.crafting6 then
		inventory_plus.set_inventory_formspec(player, crafting6.get_formspec(player))
	end
    if fields.recrafta then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..1)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..2)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftc then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..3)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftd then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..4)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recrafte then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..5)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftf then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..6)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftg then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..7)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recrafth then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..8)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recrafti then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..9)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftj then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..10)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftk then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..11)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftl then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..12)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftm then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..13)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftn then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..14)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recrafto then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..15)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftp then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..16)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftq then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..17)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftr then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..18)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recrafts then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..19)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftt then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..20)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftaa then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..21)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftab then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..22)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftac then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..23)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftad then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..24)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftae then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..25)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftaf then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..26)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftag then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..27)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftah then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..28)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftai then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..29)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftaj then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..30)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftak then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..31)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftal then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..32)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftam then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..33)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftan then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..34)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftao then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..35)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftap then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..36)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftaq then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..37)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftar then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..38)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftas then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..39)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftat then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..40)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftau then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..41)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftav then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..42)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftaw then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..43)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftax then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..44)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftay then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..45)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftba then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..46)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftbb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..47)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftbc then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..48)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftbd then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..49)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftca then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..50)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftcb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..51)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftda then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..52)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..53)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdc then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..54)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdd then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..55)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftde then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..56)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdf then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..57)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdg then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..58)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdh then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..59)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdi then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..60)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdj then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..61)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdk then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..62)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftdl then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..63)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftea then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..64)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recrafteb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..65)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftec then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..66)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recrafted then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..67)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftee then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..68)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftef then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..69)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recrafteg then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..70)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftfa then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..71)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftfb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..72)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftfc then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..73)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftfd then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..74)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftfe then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..75)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftga then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..76)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..77)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgc then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..78)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgd then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..79)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftge then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..80)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgf then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..81)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgg then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..82)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgh then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..83)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgi then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..84)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgj then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..85)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgk then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..86)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgl then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..87)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgm then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..88)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgn then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..89)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgo then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..90)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgp then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..91)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgq then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..92)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgr then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..93)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgs then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..94)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgt then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..95)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgu then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..96)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgv then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..97)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgw then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..98)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgx then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..99)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftgy then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..100)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftha then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..101)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftia then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..102)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftib then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..103)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftic then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..104)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftid then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..105)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftja then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..106)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftjb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..107)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftjc then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..108)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftjd then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..109)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftje then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..110)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftjf then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..111)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftjg then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..112)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftjh then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..113)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftji then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..114)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftjj then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..115)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftka then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..116)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftkb then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..117)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftkc then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..118)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftkd then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..119)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftke then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..120)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftkf then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..121)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftla then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..122)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
    if fields.recraftma then
        player_inv:set_size("recr", 1)
        player_inv:set_stack("recr", 1, "default:dirt "..123)
		inventory_plus.set_inventory_formspec(player, recraft.get_formspec(player))
	end
	if fields.backward then
		inventory_plus.set_inventory_formspec(player, backward.get_formspec(player))
	end
	if fields.backwardcra then  
        local player_inv = player:get_inventory()
        player_inv:set_size("backward", 1)
		local name = player_inv:get_stack("backward", 1):get_name()
		local item1 = ""
		local item2 = ""
		local item3 = ""
		local item4 = ""
		local re = false
		if string.match(name, "tutorial:molestick") then
			local level = string.gsub(name, "tutorial:molestick", "")
			if tonumber(level) > 0 and tonumber(level) < 5 then
				item1 = "tutorial:coin_bronze "..((level-1)*24+8)
				item2 = "tutorial:cloudentverner21 "
				re = true
			end
		end
		if re == true and player_inv:room_for_item("main", item1) and player_inv:room_for_item("main", item2) and player_inv:room_for_item("main", item3) and player_inv:room_for_item("main", item4) then
			player_inv:remove_item("backward", name)
			player_inv:add_item("main", item1)
			player_inv:add_item("main", item2)
			player_inv:add_item("main", item3)
			player_inv:add_item("main", item4)
		end
		inventory_plus.set_inventory_formspec(player, backward.get_formspec(player))
	end
end)
minetest.register_craft({
    output = 'tutorial:bottleSS',
    recipe = {
        {'', 'tutorial:admin', ''},
        {'tutorial:admin', 'tutorial:bottleS3', 'tutorial:admin'},
        {'', 'tutorial:admin', ''},
    }
})
minetest.register_node("tutorial:bottleSS", {
	description = "Ultra magic bottle",
	drawtype = "plantlike",
	tiles = {"tutorial_bottleSS.png"},
	wield_image = "tutorial_bottleSS.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
})