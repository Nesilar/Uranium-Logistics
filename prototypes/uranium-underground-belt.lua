require("prototypes.uranium-transport-belt-pictures")

local cheap_recipe = settings.startup["uranium-logistics_cheap_recipe"].value

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  
  {
    type = "item",
    name = "uranium-underground-belt",
    icon = "__uraniumlogistics__/graphics/icons/uranium-underground-belt.png",    
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "belt",
    order = "b[underground-belt]-d[uranium-underground-belt]",
    place_result = "uranium-underground-belt",
    stack_size = 50,
    allow_as_intermediate = true,
  },

  {
    type = "recipe",
    name = "uranium-underground-belt",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 1,
    ingredients = cheap_recipe and
    {
      {type = "item",  name = "express-underground-belt", amount = 2},
      {type = "item",  name = "steel-plate", amount = 160},
      {type = "item",  name = "uranium-238", amount = 50},
      {type = "fluid", name = "sulfuric-acid", amount = 100}
    }
    or 
    {
      {type = "item",  name = "express-underground-belt", amount = 2},
      {type = "item",  name = "steel-plate", amount = 160},
      {type = "item",  name = "uranium-235", amount = 10},
      {type = "fluid", name = "sulfuric-acid", amount = 100}
    },

    results = {
      {type = "item", name = "uranium-underground-belt", amount = 2, probability = 1.0},
    },
    allow_as_intermediate = true,
    crafting_machine_tint = {
      primary = {r = 0.1, g = 1.0, b = 0.1, a = 0.8},
      secondary = {r = 0.1, g = 0.8, b = 0.1, a = 0.5},
    },    
  },

  {
      type = "underground-belt",
      name = "uranium-underground-belt",
      icon = "__uraniumlogistics__/graphics/icons/uranium-underground-belt.png",    
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "uranium-underground-belt"},
      max_health = 180,
      corpse = "uranium-underground-belt-remnants",
      dying_explosion = "medium-explosion",
      max_distance = 11,
      underground_sprite =
      {
        filename = "__core__/graphics/arrows/underground-lines.png",
        priority = "high",
        width = 64,
        height = 64,
        x = 64,
        scale = 0.5
      },
      underground_remove_belts_sprite =
      {
        filename = "__core__/graphics/arrows/underground-lines-remove.png",
        priority = "high",
        width = 64,
        height = 64,
        x = 64,
        scale = 0.5
      },
      resistances =
      {
        {
          type = "fire",
          percent = 60
        },
        {
          type = "impact",
          percent = 30
        }
      },
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      animation_speed_coefficient = 32,
      belt_animation_set = uranium_basic_belt_animation_set,
      fast_replaceable_group = "transport-belt",      
      speed = 0.125,
      structure =
      {
        direction_in =
        {
          sheet =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/uranium-underground-belt-structure.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 96,
            hr_version =
            {
              filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/hr-uranium-underground-belt-structure.png",
              priority = "extra-high",
              width = 192,
              height =192,
              y = 192,
              scale = 0.5
            }
          }
        },
        direction_out =
        {
          sheet =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/uranium-underground-belt-structure.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            hr_version =
            {
              filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/hr-uranium-underground-belt-structure.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              scale = 0.5
            }
  
          }
  
        },
        direction_in_side_loading =
        {
          sheet =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/uranium-underground-belt-structure.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 96*3,
            hr_version =
            {
              filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/hr-uranium-underground-belt-structure.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              y = 192*3,
              scale = 0.5
            }
          }
        },
        direction_out_side_loading =
        {
          sheet =
          {
            filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/uranium-underground-belt-structure.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 96*2,
            hr_version =
            {
              filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/hr-uranium-underground-belt-structure.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              y= 192*2,
              scale = 0.5
            },
  
          }
  
        },
        back_patch =
        {
          sheet =
          {
            filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            hr_version =
            {
              filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure-back-patch.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              scale = 0.5
            }
  
          }
        },
        front_patch =
        {
          sheet =
          {
            filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            hr_version =
            {
              filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure-front-patch.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              scale = 0.5
            }
  
          }
        }
      }
    },
    {
      type = "corpse",
      name = "uranium-underground-belt-remnants",
      icon = "__uraniumlogistics__/graphics/icons/uranium-underground-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
      subgroup = "belt-remnants",
      order="a-g-0",
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation =
      {
        filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/remnants/uranium-underground-belt-remnants.png",
        line_length = 1,
        width = 78,
        height =72,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(10, 3),
        hr_version =
        {
          filename = "__uraniumlogistics__/graphics/entity/uranium-underground-belt/remnants/hr-uranium-underground-belt-remnants.png",
          line_length = 1,
          width = 156,
          height = 144,
          frame_count = 1,
          variation_count = 1,
          axially_symmetrical = false,
          direction_count = 8,
          shift = util.by_pixel(10.5, 3),
          scale = 0.5,
        },
      }
    },
})