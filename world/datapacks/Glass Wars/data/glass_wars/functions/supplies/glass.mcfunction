execute as @a store result score @s dummy run clear @s minecraft:glass 0
replaceitem entity @a[scores={dummy=0}] hotbar.2 minecraft:glass
give @a[scores={dummy=1..39}] minecraft:glass
give CindaBCatLexy minecraft:glass
schedule function glass_wars:supplies/glass 25t
