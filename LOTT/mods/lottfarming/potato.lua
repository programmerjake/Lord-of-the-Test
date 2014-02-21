minetest.register_craftitem("lottfarming:potato_seed", {
	description = "Potato Seeds",
	inventory_image = "lottfarming_potato_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		local above = minetest.env:get_node(pointed_thing.above)
		if above.name == "air" then
			above.name = "lottfarming:potato_1"
			minetest.env:set_node(pointed_thing.above, above)
			itemstack:take_item(1)
			return itemstack
		end
	end
})

minetest.register_node("lottfarming:potato_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"lottfarming_potato_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+6/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottfarming:potato_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"lottfarming_potato_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+9/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("lottfarming:potato_3", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"lottfarming_potato_3.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'lottfarming:potato_seed'} },
			{ items = {'lottfarming:potato_seed'}, rarity = 2},
			{ items = {'lottfarming:potato_seed'}, rarity = 5},
			{ items = {'lottfarming:potato'} },
			{ items = {'lottfarming:potato'}, rarity = 2 },
			{ items = {'lottfarming:potato'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("lottfarming:potato", {
	description = "Potato",
	inventory_image = "lottfarming_potato.png",
	on_use = minetest.item_eat(4),
})

farming:add_plant("lottfarming:potato_3", {"lottfarming:potato_1", "lottfarming:potato_2"}, 50, 20)