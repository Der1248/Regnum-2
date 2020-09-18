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