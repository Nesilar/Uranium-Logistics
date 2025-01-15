if mods["deadlock-beltboxes-loaders"] then 
	if data.raw["loader-1x1"]["express-transport-belt-loader"] then
		data.raw["loader-1x1"]["express-transport-belt-loader"].next_upgrade = "uranium-transport-belt-loader"
	end
	if data.raw.furnace["express-transport-belt-beltbox"] then
		data.raw.furnace["express-transport-belt-beltbox"].next_upgrade = "uranium-transport-belt-beltbox"
	end

	deadlock.add_tier({
		transport_belt      = "uranium-transport-belt",
		colour              = {r=67, g=255, b=75},
		underground_belt    = "uranium-underground-belt",
		splitter            = "uranium-splitter",
		technology          = "uranium-logistics",
		order               = "d",
		loader_ingredients  = {
			{name = "express-transport-belt-loader", type = "item", amount = 1},
			{name = "steel-plate", type = "item", amount = 20},
			{name = "lubricant", type = "fluid", amount = 20},
		},
		loader_category     = "crafting-with-fluid",
		beltbox_ingredients = {
			{name = "express-transport-belt-beltbox", type = "item", amount = 1},
			{name = "steel-plate", type = "item", amount = 15},
			{name = "iron-gear-wheel", type = "item", amount = 15},
			{name = "lubricant", type = "fluid", amount = 100},
		},
		beltbox_category    = "crafting-with-fluid",
		beltbox_technology  = "deadlock-stacking-4",
	})
	if data.raw.technology["deadlock-stacking-4"] then
		table.insert(data.raw.technology["deadlock-stacking-4"].prerequisites, "deadlock-stacking-3")
	end
end