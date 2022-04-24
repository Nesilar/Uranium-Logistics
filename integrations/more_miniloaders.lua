if mods["more-miniloaders"] then 
    more_miniloaders.create_miniloader{
        name = "uranium",
        color = "43ff4b",
        ingredients = {
            {"express-miniloader", 1}, 
            {"uranium-underground-belt", 1}, 
            {"stack-inserter", 4}, 
        },
        filter_ingredients = {
            {"express-filter-miniloader", 1}, 
            {"uranium-underground-belt", 1}, 
            {"stack-filter-inserter", 4}, 
        },
        tech_prereq = {"uranium-logistics", "express-miniloader"},
    }

    more_miniloaders.modify_miniloader{
        name = "express", 
        next_upgrade = "uranium",
        fix_description = true,
    }
end