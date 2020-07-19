title @a[tag=preparing_for_glass_wars] times 1 15 5
title @a[tag=preparing_for_glass_wars] title "Go!"
execute as @a[tag=preparing_for_glass_wars] at @s run playsound minecraft:block.note_block.bit player @s ~ ~ ~ 1 1.6

# change player states
tag @a[tag=preparing_for_glass_wars] add playing_glass_wars
tag @a[tag=playing_glass_wars] remove preparing_for_glass_wars

# restart supplies
function glass_wars:supplies/glass
function glass_wars:supplies/grenade
function glass_wars:supplies/tnt
function glass_wars:supplies/pearl
function glass_wars:supplies/shield
function glass_wars:supplies/arrow
give @a[tag=playing_glass_wars] glass 25

# start game timer
scoreboard players set time0 seconds 0
scoreboard players set time1 seconds 0
scoreboard players set time0 minutes 5
scoreboard players set time1 minutes 1

# remove barriers
execute positioned 0 16 0 positioned ~40 ~ ~ run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace barrier
execute positioned 0 16 0 positioned ~-40 ~ ~ run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace barrier
execute positioned 0 16 0 positioned ~ ~ ~40 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace barrier
execute positioned 0 16 0 positioned ~ ~ ~-40 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace barrier

execute positioned 0 16 0 positioned ~33 ~ ~33 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace barrier
execute positioned 0 16 0 positioned ~-33 ~ ~-33 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace barrier
execute positioned 0 16 0 positioned ~33 ~ ~-33 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace barrier
execute positioned 0 16 0 positioned ~-33 ~ ~33 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 air replace barrier
