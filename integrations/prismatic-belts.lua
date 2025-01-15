if mods["prismatic-belts"] then
    local prismatic_api = require("__prismatic-belts__.prototypes.api")
    
    local tiers = {
        ["uranium"] = { tint = util.color("4cff4c"), technology = "uranium-logistics" }
    }
    
    -- Setup all the entities to use the updated belt animation sets
    for prefix, properties in pairs(tiers) do
        -- Fetch entities
        local entities = {
            belt = data.raw["transport-belt"][prefix .. "-transport-belt"],
            splitter = data.raw["splitter"][prefix .. "-splitter"],
            underground = data.raw["underground-belt"][prefix .. "-underground-belt"],
            loader = data.raw["loader"][prefix .. "-loader"],
    
            -- Deadlock Stacking Beltboxes and Compact loaders
            deadlock_loader = data.raw["loader-1x1"][prefix .. "-transport-belt-loader"],

            -- Loaders Modernized
            mdrn_loader = data.raw["loader-1x1"][prefix .. "-mdrn-loader"],
            mdrn_loader_split = data.raw["loader-1x1"][prefix .. "-mdrn-loader-split"],

            -- AAI Loaders
            aai_loader = data.raw["loader-1x1"]["aai-" .. prefix .. "-loader"],
        }
    
        -- Reskin the belt item
        local belt_item = data.raw["item"][prefix .. "-transport-belt"]
        if belt_item then
            belt_item.icons = prismatic_api.get_transport_belt_icon({
                mask_tint = properties.tint,
            })
    
            -- Update entity icon to match
            if entities.belt then
                entities.belt.icons = belt_item.icons
            end
        end
    
        -- Reskin all related entity types
        for _, entity in pairs(entities) do
            if entity then
                entity.belt_animation_set = prismatic_api.get_transport_belt_animation_set({
                    mask_tint = properties.tint,
                    tint_mask_as_overlay = true,
                    variant = 2,
                })
            end
        end
    
        -- Setup remnants
        if entities.belt then
            prismatic_api.create_remnant(prefix .. "-transport-belt", {
                mask_tint = properties.tint,
                tint_mask_as_overlay = true,
            })
        end
    
        -- Setup logistics technologies
        local technology = data.raw["technology"][properties.technology]
    
        if technology then
            technology.icons = prismatic_api.get_transport_belt_technology_icon({
                mask_tint = properties.tint,
            })
        end
    end
    
end