schedule clear glass_wars:ultimates/hellfire/loop
worldborder warning distance 0

effect clear @a minecraft:fire_resistance
effect give @a[tag=during_ultimate,tag=ultimate_hellfire] minecraft:fire_resistance 30 0 false

tag @a[tag=during_ultimate,tag=ultimate_hellfire] remove during_ultimate
