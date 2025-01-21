if mods["belt-legacy"] then 
    if settings.startup["FastReplaceableProtection"].value == true then
        data.raw["splitter"]["uranium-splitter"].fast_replaceable_group = "splitter"
		data.raw["underground-belt"]["uranium-underground-belt"].fast_replaceable_group = "underground-belt"
    end
end