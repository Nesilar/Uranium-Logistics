require("prototypes.uranium-transport-belt-pictures")

local cheap_recipe = settings.startup["uranium-logistics_cheap_recipe"].value

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({  
  {
    type = "item",
    name = "uranium-splitter",
    icon = "__uraniumlogistics__/graphics/icons/uranium-splitter.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "c[splitter]-d[uranium-splitter]",
    place_result = "uranium-splitter",
    stack_size = 50,
    allow_as_intermediate = true,
  },

  {
    type = "recipe",
    name = "uranium-splitter",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 1,
    ingredients = cheap_recipe and
    {
      {type = "item",  name = "processing-unit", amount = 10},
      {type = "item",  name = "express-splitter", amount = 1},
      {type = "item",  name = "steel-plate", amount = 10},
      {type = "item",  name = "uranium-238", amount = 15},
      {type = "fluid", name = "sulfuric-acid", amount = 200}
    }
    or 
    {
      {type = "item",  name = "processing-unit", amount = 10},
      {type = "item",  name = "express-splitter", amount = 1},
      {type = "item",  name = "steel-plate", amount = 10},
      {type = "item",  name = "uranium-235", amount = 3},
      {type = "fluid", name = "sulfuric-acid", amount = 200}
    },

    results = {
      {type = "item", name = "uranium-splitter", amount = 1, probability = 1.0},
    },
    allow_as_intermediate = true,
    crafting_machine_tint = {
      primary = {r = 0.1, g = 1.0, b = 0.1, a = 0.8},
      secondary = {r = 0.1, g = 0.8, b = 0.1, a = 0.5},
    },
  },

  {
      type = "splitter",
      name = "uranium-splitter",
      icon = "__uraniumlogistics__/graphics/icons/uranium-splitter.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "uranium-splitter"},
      max_health = 200,
      corpse = "uranium-splitter-remnants",
      dying_explosion = "medium-explosion",--"splitter-explosion",
      resistances =
      {
        {
          type = "fire",
          percent = 60
        }
      },
      collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
      selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      animation_speed_coefficient = 32,
      structure_animation_speed_coefficient = 0.7,
      structure_animation_movement_cooldown = 10,
      fast_replaceable_group = "transport-belt",      
      speed = 0.125,
      belt_animation_set = uranium_basic_belt_animation_set,
      working_sound = sounds.splitter,
      next_upgrade = nil,
      structure =
      {
        north =
        {
          filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/uranium-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 82,
          height = 36,
          shift = util.by_pixel(6, 0),
          hr_version =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/hr-uranium-splitter-north.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 160,
            height = 70,
            shift = util.by_pixel(7, 0),
            scale = 0.5
          }
        },
        east =
        {
          filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/uranium-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 46,
          height = 44,
          shift = util.by_pixel(4, 12),
          hr_version =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/hr-uranium-splitter-east.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 84,
            shift = util.by_pixel(4, 13),
            scale = 0.5
          }
        },
        south =
        {
          filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/uranium-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 82,
          height = 32,
          shift = util.by_pixel(4, 0),
          hr_version =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/hr-uranium-splitter-south.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 164,
            height = 64,
            shift = util.by_pixel(4, 0),
            scale = 0.5
          }
        },
        west =
        {
          filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/uranium-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 46,
          height = 44,
          shift = util.by_pixel(6, 12),
          hr_version =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/hr-uranium-splitter-west.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 86,
            shift = util.by_pixel(6, 12),
            scale = 0.5
          }
        }
      },
      structure_patch =
      {
        north = util.empty_sprite(),
        east =
        {
          filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/uranium-splitter-east-top_patch.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 46,
          height = 52,
          shift = util.by_pixel(4, -20),
          hr_version =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/hr-uranium-splitter-east-top_patch.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 104,
            shift = util.by_pixel(4, -20),
            scale = 0.5
          }
        },
        south = util.empty_sprite(),
        west =
        {
          filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/uranium-splitter-west-top_patch.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 46,
          height = 48,
          shift = util.by_pixel(6, -18),
          hr_version =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/hr-uranium-splitter-west-top_patch.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 96,
            shift = util.by_pixel(6, -18),
            scale = 0.5
          }
        }
      }
    },
    {
      type = "corpse",
      name = "uranium-splitter-remnants",
      icon = "__uraniumlogistics__/graphics/icons/uranium-splitter.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "not-on-map"},
      subgroup = "belt-remnants",
      order = "a-j-0",
      selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
      tile_width = 2,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation =
      {
        filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/remnants/uranium-splitter-remnants.png",
        line_length = 1,
        width = 96,
        height = 96,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(4, 1.5),
        hr_version =
        {
          filename = "__uraniumlogistics__/graphics/entity/uranium-splitter/remnants/hr-uranium-splitter-remnants.png",
          line_length = 1,
          width = 190,
          height = 190,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 4,
          shift = util.by_pixel(3.5, 1.5),
          scale = 0.5,
        },
      }
    },
})