--load in items, recipes, entities, and remnant entities
require("prototypes.technology")
require("prototypes.uranium-splitter")
require("prototypes.uranium-transport-belt")
require("prototypes.uranium-underground-belt")

-- update express logistics to be upgradeable to our new belts
if data.raw.splitter["express-splitter"] then
    data.raw.splitter["express-splitter"].next_upgrade = "uranium-splitter"
end

if data.raw["transport-belt"]["express-transport-belt"] then
    data.raw["transport-belt"]["express-transport-belt"].next_upgrade = "uranium-transport-belt"
end

if data.raw["underground-belt"]["express-underground-belt"] then
    data.raw["underground-belt"]["express-underground-belt"].next_upgrade = "uranium-underground-belt"
end