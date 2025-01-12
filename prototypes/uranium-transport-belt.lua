require("prototypes.uranium-transport-belt-pictures")

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({ 
  {
    type = "item",
    name = "uranium-transport-belt",
    icon = "__uraniumlogistics__/graphics/icons/uranium-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "a[transport-belt]-d[uranium-transport-belt]",
    place_result = "uranium-transport-belt",
    stack_size = 100,
    allow_as_intermediate = true,
  },

  {
    type = "recipe",
    name = "uranium-transport-belt",
    category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
      {type = "item",  name = "express-transport-belt", amount = 1},
      {type = "item",  name = "steel-plate", amount = 20},
      {type = "item",  name = "uranium-235", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 50}
    },

    results = {
      {type = "item", name = "uranium-transport-belt", amount = 1, probability = 1.0},
    },
    allow_as_intermediate = true,
    crafting_machine_tint = {
      primary = {r = 0.1, g = 1.0, b = 0.1, a = 0.8},
      secondary = {r = 0.1, g = 0.8, b = 0.1, a = 0.5},
    },    
  },

  {
      type = "transport-belt",
      name = "uranium-transport-belt",
      icon = "__uraniumlogistics__/graphics/icons/uranium-transport-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "uranium-transport-belt"},
      max_health = 180,
      corpse = "uranium-transport-belt-remnants",
      dying_explosion = "medium-explosion",
      resistances =
      {
        {
          type = "fire",
          percent = 50
        }
      },
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      working_sound =
      {
        sound =
        {
          filename = "__base__/sound/transport-belt.ogg",
          volume = 0.3
        },
        persistent = true
      },
      animation_speed_coefficient = 32,
      belt_animation_set = uranium_basic_belt_animation_set,
      fast_replaceable_group = "transport-belt",      
      speed = 0.125,
      connector_frame_sprites = transport_belt_connector_frame_sprites,
      circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
      circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
      circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "corpse",
    name = "uranium-transport-belt-remnants",
    icon = "__uraniumlogistics__/graphics/icons/uranium-transport-belt.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "belt-remnants",
    order = "a-d-0",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__uraniumlogistics__/graphics/entity/uranium-transport-belt/remnants/uranium-transport-belt-remnants.png",
      line_length = 1,
      width = 54,
      height = 52,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
      shift = util.by_pixel(1, 0),
      hr_version =
      {
        filename = "__uraniumlogistics__/graphics/entity/uranium-transport-belt/remnants/hr-uranium-transport-belt-remnants.png",
        line_length = 1,
        width = 106,
        height = 102,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(1, -0.5),
        scale = 0.5,
      },
    })
  }
})
