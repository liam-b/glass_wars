execute as @e[type=minecraft:fireball,tag=!hellfireball,sort=random,limit=1] run tag @s add hellfireball

execute positioned 0 255 0 as @e[distance=..25,tag=hellfireball] at @s run tp @s ~ 90 ~

schedule function glass_wars:ultimates/hellfire/loop 8t
execute unless entity @e[type=minecraft:fireball] run schedule clear glass_wars:ultimates/hellfire/loop
execute unless entity @e[type=minecraft:fireball] run worldborder warning distance 0
