if mods["LoaderRedux"] then
    local loader_redux = require("__LoaderRedux__.make_loader")
    local uranium_tint = util.color("43ff4bd9")

    local item = loader_redux.make_loader_item("uranium-loader", "belt", "d-d", uranium_tint)
    local entity = loader_redux.make_loader_entity("uranium-loader", data.raw["transport-belt"]["uranium-transport-belt"], uranium_tint, nil)
   
    data:extend(
        {
            item,
            entity,
            {
                type = "recipe",
                name = "uranium-loader",
                category = "crafting-with-fluid",
                enabled = false,
                energy_required = 5,
                ingredients = {
                    {"express-loader", 1},
                    {"processing-unit", 20},
                    {"uranium-235", 5},
                    {name="sulfuric-acid", amount=250, type="fluid"},
                    {"steel-plate",30}
                },
                result = "uranium-loader"
            },
        }
    )
    table.insert(data.raw.technology["uranium-logistics"].effects, {type = "unlock-recipe", recipe = "uranium-loader"})
end