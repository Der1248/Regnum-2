minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool1"},
	interval = 5,
	chance = 6,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:blue_wool_titan30"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool1"},
	interval = 5,
	chance = 6,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:orange_wool_titan30"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool1"},
	interval = 5,
	chance = 6,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:red_wool_titan30"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool1"},
	interval = 5,
	chance = 6,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:violet_wool_titan30"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool1"},
	interval = 5,
	chance = 6,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:white_wool_titan30"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool1"},
	interval = 5,
	chance = 6,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:yellow_wool_titan30"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:yellow_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:white_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:violet_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:red_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:pink_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:orange_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:magenta_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:grey_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:green_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:dark_grey_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:dark_green_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:cyan_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:brown_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:blue_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:geschenk_wool2"},
	interval = 5,
	chance = 15,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:black_wool_titan50"})
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:thunder"},
	interval = 3.0,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.env:remove_node(pos)
	end,
})
minetest.register_abm({
	nodenames = {"tutorial:stampfi_ei"},
	interval = 2,
	chance = 4,
	action = function(pos)
		minetest.env:add_node(pos, {name="tutorial:stampfi"})
	end,
})