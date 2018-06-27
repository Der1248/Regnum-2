
local S = technic.worldgen.gettext
minetest.register_alias("technic:wrought_iron_ingot", "default:steel_ingot")

minetest.override_item("default:steel_ingot", {
	description = S("Wrought Iron Ingot"),
	inventory_image = "technic_wrought_iron_ingot.png",
})

minetest.register_craftitem(":technic:cast_iron_ingot", {
	description = S("Cast Iron Ingot"),
	inventory_image = "technic_cast_iron_ingot.png",
})

minetest.register_craftitem(":technic:carbon_steel_ingot", {
	description = S("Carbon Steel Ingot"),
	inventory_image = "technic_carbon_steel_ingot.png",
})

minetest.register_craftitem(":technic:stainless_steel_ingot", {
	description = S("Stainless Steel Ingot"),
	inventory_image = "technic_stainless_steel_ingot.png",
})

local function register_block(block, ingot)
	minetest.register_craft({
		output = block,
		recipe = {
			{ingot, ingot, ingot},
			{ingot, ingot, ingot},
			{ingot, ingot, ingot},
		}
	})

	minetest.register_craft({
		output = ingot.." 9",
		recipe = {
			{block}
		}
	})
end

register_block("technic:cast_iron_block", "technic:cast_iron_ingot")


minetest.register_craft({
	type = 'cooking',
	recipe = minetest.registered_aliases["technic:wrought_iron_ingot"],
	output = "technic:cast_iron_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "technic:cast_iron_ingot",
	cooktime = 2,
	output = "technic:wrought_iron_ingot",
})



local function for_each_registered_item(action)
	local already_reg = {}
	for k, _ in pairs(minetest.registered_items) do
		table.insert(already_reg, k)
	end
	local really_register_craftitem = minetest.register_craftitem
	minetest.register_craftitem = function(name, def)
		really_register_craftitem(name, def)
		action(string.gsub(name, "^:", ""))
	end
	local really_register_tool = minetest.register_tool
	minetest.register_tool = function(name, def)
		really_register_tool(name, def)
		action(string.gsub(name, "^:", ""))
	end
	local really_register_node = minetest.register_node
	minetest.register_node = function(name, def)
		really_register_node(name, def)
		action(string.gsub(name, "^:", ""))
	end
	for _, name in ipairs(already_reg) do
		action(name)
	end
end

local steel_to_iron = {}
for _, i in ipairs({
	"default:axe_steel",
	"default:pick_steel",
	"default:shovel_steel",
	"default:sword_steel",
	"doors:door_steel",
	"farming:hoe_steel",
	"glooptest:hammer_steel",
	"glooptest:handsaw_steel",
	"glooptest:reinforced_crystal_glass",
	"mesecons_doors:op_door_steel",
	"mesecons_doors:sig_door_steel",
	"vessels:steel_bottle",
}) do
	steel_to_iron[i] = true
end

for_each_registered_item(function(item_name)
	local item_def = minetest.registered_items[item_name]
	if steel_to_iron[item_name] and string.find(item_def.description, "Steel") then
		minetest.override_item(item_name, { description = string.gsub(item_def.description, "Steel", S("Iron")) })
	end
end)
