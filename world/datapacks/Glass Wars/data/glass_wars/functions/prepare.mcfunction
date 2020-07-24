# setup
function glass_wars:reset
tag @a remove playing_glass_wars
tag @a add preparing_for_glass_wars
xp set @a 0 levels

# clear supplies
schedule clear glass_wars:supplies/glass
schedule clear glass_wars:supplies/grenade
schedule clear glass_wars:supplies/tnt
schedule clear glass_wars:supplies/pearl
schedule clear glass_wars:supplies/shield
schedule clear glass_wars:supplies/web
schedule clear glass_wars:supplies/arrow

clear @a
xp set @a 0 levels
kill @e[type=item]
tp @a 256 16 0

# move players to spawnpoints
execute positioned 256 16 0 as @p[tag=preparing_for_glass_wars,distance=..100] positioned 0 16 0 run tp @s ~40 ~ ~
execute positioned 256 26 0 as @p[tag=preparing_for_glass_wars,distance=..100] positioned 0 16 0 run tp @s ~-40 ~ ~
execute positioned 256 26 0 as @p[tag=preparing_for_glass_wars,distance=..100] positioned 0 16 0 run tp @s ~ ~ ~-40
execute positioned 256 26 0 as @p[tag=preparing_for_glass_wars,distance=..100] positioned 0 16 0 run tp @s ~ ~ ~40
execute positioned 256 26 0 as @p[tag=preparing_for_glass_wars,distance=..100] positioned 0 16 0 run tp @s ~33 ~ ~33
execute positioned 256 26 0 as @p[tag=preparing_for_glass_wars,distance=..100] positioned 0 16 0 run tp @s ~-33 ~ ~-33
execute positioned 256 26 0 as @p[tag=preparing_for_glass_wars,distance=..100] positioned 0 16 0 run tp @s ~33 ~ ~-33
execute positioned 256 26 0 as @p[tag=preparing_for_glass_wars,distance=..100] positioned 0 16 0 run tp @s ~-33 ~ ~33
execute as @a[tag=preparing_for_glass_wars] at @s run spawnpoint

# reset scoreboard
scoreboard players reset * deathCount
scoreboard objectives setdisplay sidebar deathCount
scoreboard players reset * killCount
scoreboard objectives setdisplay list killCount
scoreboard players set * deathStreak 0
scoreboard players set * deathTrigger 0

# setups players
gamemode survival @a[tag=preparing_for_glass_wars]
effect give @a[tag=preparing_for_glass_wars] minecraft:instant_health 1 10 true
effect give @a[tag=preparing_for_glass_wars] minecraft:saturation 1 10 true

# begin countdown
schedule function glass_wars:time/countdown_3 3s
