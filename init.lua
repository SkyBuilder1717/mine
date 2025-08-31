local modpath = core.get_modpath(core.get_current_modname())
mine = {
	registered_mines = {}
}
local S = core.get_translator("mine")
local Sdefault = core.get_translator("default")
dofile(modpath.."/api.lua")

mine.register_mine("mine:mine", {
    description = S("Mine"),
    tiles = {
		"mine_top.png",
		"mine_bottom.png",
		"mine_side.png",
		"mine_side.png",
		"mine_side.png",
		"mine_side.png"
	},
	walkable = false,
	groups = {cracky = 2},
    drawtype = "custom"
})

core.register_craft({
	output = "mine:mine",
	recipe = {
		{"", "dye:red", ""},
		{"dye:red", "default:mese_crystal", "dye:red"},
		{"default:tinblock", "tnt:tnt", "default:tinblock"},
	}
})

mine.register_mine("mine:marram_grass_1", {
    description = Sdefault("Marram Grass").." ("..S("Mine")..")",
	tiles = {"default_marram_grass_1.png^mine_hidden_small.png"},
	inventory_image = "default_marram_grass_1.png^mine_hidden.png",
	wield_image = "default_marram_grass_1.png^mine_hidden.png",
    drawtype = "plantlike",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1,
		attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},
	on_place = function(itemstack, placer, pointed_thing)
		local stack = ItemStack("mine:marram_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("mine:marram_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end
})

core.register_craft({
	type = "shapeless",
	output = "mine:marram_grass_1",
	recipe = {"mine:marram_grass_1", "mine:mine"},
})

for i = 2, 3 do
	mine.register_mine("mine:marram_grass_" .. i, {
		description = Sdefault("Marram Grass").." ("..S("Mine")..")",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_marram_grass_" .. i .. ".png^mine_hidden_small.png"},
		inventory_image = "default_marram_grass_" .. i .. ".png^mine_hidden.png",
		wield_image = "default_marram_grass_" .. i .. ".png^mine_hidden.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1, not_in_creative_inventory = 1},
		drop = "mine:marram_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		}
	})
end

mine.register_mine("mine:junglegrass", {
	description = Sdefault("Jungle Grass").." ("..S("Mine")..")",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.69,
	tiles = {"default_junglegrass.png^mine_hidden_small.png"},
	inventory_image = "default_junglegrass.png^mine_hidden.png",
	wield_image = "default_junglegrass.png^mine_hidden.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, junglegrass = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

core.register_craft({
	type = "shapeless",
	output = "mine:junglegrass",
	recipe = {"default:junglegrass", "mine:mine"}
})

mine.register_mine("mine:dry_grass_1", {
    description = Sdefault("Savanna Grass").." ("..S("Mine")..")",
	tiles = {"default_dry_grass_1.png^mine_hidden_small.png"},
	inventory_image = "default_dry_grass_3.png^mine_hidden.png",
	wield_image = "default_dry_grass_3.png^mine_hidden.png",
    drawtype = "plantlike",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1,
		attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},
	on_place = function(itemstack, placer, pointed_thing)
		local stack = ItemStack("mine:dry_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("mine:dry_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end
})

for i = 2, 5 do
	mine.register_mine("mine:dry_grass_" .. i, {
		description = Sdefault("Savanna Grass").." ("..S("Mine")..")",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_dry_grass_" .. i .. ".png^mine_hidden_small.png"},
		inventory_image = "default_dry_grass_" .. i .. ".png^mine_hidden.png",
		wield_image = "default_dry_grass_" .. i .. ".png^mine_hidden.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1, not_in_creative_inventory = 1},
		drop = "mine:dry_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		}
	})
end

core.register_craft({
	type = "shapeless",
	output = "mine:dry_grass_1",
	recipe = {"default:dry_grass_1", "mine:mine"}
})

mine.register_mine("mine:grass_1", {
    description = Sdefault("Grass").." ("..S("Mine")..")",
	tiles = {"default_grass_1.png^mine_hidden_small.png"},
	inventory_image = "default_grass_3.png^mine_hidden.png",
	wield_image = "default_grass_3.png^mine_hidden.png",
    drawtype = "plantlike",
	waving = 1,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1,
		attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},
	on_place = function(itemstack, placer, pointed_thing)
		local stack = ItemStack("mine:grass_" .. math.random(1, 3))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("mine:grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end
})

for i = 2, 5 do
	mine.register_mine("mine:grass_" .. i, {
		description = Sdefault("Grass").." ("..S("Mine")..")",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_grass_" .. i .. ".png^mine_hidden_small.png"},
		inventory_image = "default_grass_" .. i .. ".png^mine_hidden.png",
		wield_image = "default_grass_" .. i .. ".png^mine_hidden.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1, not_in_creative_inventory = 1},
		drop = "mine:grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		}
	})
end

core.register_craft({
	type = "shapeless",
	output = "mine:grass_1",
	recipe = {"default:grass_1", "mine:mine"}
})