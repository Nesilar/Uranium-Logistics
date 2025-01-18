if mods["miniloader-redux"] then
    local util = require('util')

    local const = require('__miniloader-redux__.lib.constants')
    local functions = require('__miniloader-redux__.prototypes.functions')

    local upgrades = {}


    local loader_definition = {
        order = 'd[a]-e',
        subgroup = 'belt',
        stack_size = 50,
        tint = util.color('4cff4c'),
        speed = data.raw['transport-belt']['uranium-transport-belt'].speed,
        ingredients = {
            { type = 'item', name = const:name_from_prefix('uranium'), amount = 1 },
            { type = 'item', name = 'uranium-underground-belt',        amount = 1 },
            { type = 'item', name = 'bulk-inserter',                   amount = 4 },
        },
        prerequisites = { 'uranium-logistics', const:name_from_prefix('express'), },
        upgrade_from = const:name_from_prefix('express'),
    }

    local params = loader_definition
    params.prefix = 'uranium'
    params.name = const:name_from_prefix(params.prefix)
    params.localised_name = params.localised_name and params.localised_name or { 'entity-name.' .. params.name }

    if params.upgrade_from then
        upgrades[params.upgrade_from] = params.name
    end

    functions.create_item(params)
    functions.create_entity(params)
    functions.create_recipe(params)


    for upgrade, target in pairs(upgrades) do
        local previous_tier = data.raw['inserter'][upgrade]
        if previous_tier then
            assert(previous_tier.next_upgrade == nil)
            previous_tier.next_upgrade = target
        end
    end


    Framework.post_data_updates_stage()

end