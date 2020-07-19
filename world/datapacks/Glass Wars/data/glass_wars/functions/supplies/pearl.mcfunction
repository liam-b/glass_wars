execute as @a store result score @s dummy run clear @s minecraft:ender_pearl 0
replaceitem entity @a[scores={dummy=0}] hotbar.5 minecraft:ender_pearl
give @a[scores={dummy=1..1}] minecraft:ender_pearl
schedule function glass_wars:supplies/pearl 35s
