execute at @e[type=item_frame,nbt={Item:{id:"minecraft:snowball"}}] as @p[distance=..2,tag=!currently_equipping] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate run function glass_wars:equip/spleef_ball
execute at @e[type=item_frame,nbt={Item:{id:"minecraft:fishing_rod"}}] as @p[distance=..2,tag=!currently_equipping] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate run function glass_wars:equip/grappling_hook
execute at @e[type=item_frame,nbt={Item:{id:"minecraft:carrot_on_a_stick"}}] as @p[distance=..2,tag=!currently_equipping] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate run function glass_wars:equip/shield
execute at @e[type=item_frame,nbt={Item:{id:"minecraft:potion"}}] as @p[distance=..2,tag=!currently_equipping] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate run function glass_wars:equip/speed

execute at @e[type=item_frame,nbt={Item:{id:"minecraft:warped_fungus_on_a_stick"}}] as @p[distance=..2,tag=!currently_equipping] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate run function glass_wars:equip/beast
execute at @e[type=item_frame,nbt={Item:{id:"minecraft:experience_bottle"}}] as @p[distance=..2,tag=!currently_equipping] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate run function glass_wars:equip/hellfire

execute as @a at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate run tag @s add currently_equipping
execute as @a at @s unless block ~ ~ ~ minecraft:light_weighted_pressure_plate run tag @s remove currently_equipping
