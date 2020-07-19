# update tags
execute as @a[tag=playing_glass_wars] at @s run playsound minecraft:block.note_block.bell player @s ~ ~ ~ 1 0.1
tag @a[tag=playing_glass_wars] remove playing_glass_wars

# clear supplies
schedule clear glass_wars:supplies/glass
schedule clear glass_wars:supplies/grenade
schedule clear glass_wars:supplies/tnt
schedule clear glass_wars:supplies/pearl
schedule clear glass_wars:supplies/shield
schedule clear glass_wars:supplies/web
schedule clear glass_wars:supplies/arrow

gamemode adventure @a
clear @a
xp set @a 0 levels

# give effects to players
effect give @a minecraft:instant_health 1 10 true
effect give @a minecraft:saturation 1 10 true
effect give @a minecraft:slow_falling 8 0 true
effect give @a minecraft:resistance 8 2 true

# show title
title @a times 1 70 5
title @a title "Game over"

schedule function glass_wars:remove 8s

# scoreboard players operation $min deathCount < @a deathCount
