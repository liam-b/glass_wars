schedule clear glass_wars:ultimates/hellfire/loop
worldborder warning distance 0

effect clear @a minecraft:fire_resistance
effect give @a[tag=during_ultimate] minecraft:fire_resistance 30 0 true

tag @a[tag=during_ultimate] remove during_ultimate
