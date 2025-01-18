if mods["aai-loaders"] then 
    local fluid_crafting_category =  mods["space-age"] and "crafting-with-fluid-or-metallurgy" or "crafting-with-fluid"

    AAILoaders.make_tier{
        name = "uranium",
        transport_belt = "uranium-transport-belt",
        color = { 67, 255, 75 },
        fluid = "lubricant",
        fluid_per_minute = "0.25",
        fluid_technology_prerequisites = {"oil-processing"},
        technology = {
            prerequisites = {"uranium-logistics", "aai-express-loader", "processing-unit"},
            unit = {
                count = 450,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 15
            }
        },
        recipe = {
            crafting_category = fluid_crafting_category,
            ingredients = {
                {type = "item", name =  "uranium-transport-belt", amount = 1},
                {type = "item", name =  "electric-engine-unit", amount = 5},
                {type = "item", name =  "processing-unit", amount = 5},
                {type = "fluid", name = "lubricant", amount = 75}
            },
            energy_required = 2
        },
        unlubricated_recipe = {
            crafting_category = fluid_crafting_category,
            ingredients = {
                {type = "item", name =  "uranium-transport-belt", amount = 1},
                {type = "item", name =  "electric-engine-unit", amount = 75},
                {type = "item", name =  "processing-unit", amount = 75},
                {type = "fluid", name = "lubricant", amount = 750}
            },
            energy_required = 10
        },
        next_upgrade = nil,
        localise = false
    }

    if settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
        --graphics only mode won't have aai's loader defined
        data.raw["loader-1x1"]["aai-express-loader"].next_upgrade = "aai-uranium-loader"
    end
end