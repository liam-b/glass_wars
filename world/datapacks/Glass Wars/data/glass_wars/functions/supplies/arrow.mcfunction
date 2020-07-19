execute as @a store result score @s dummy run clear @s minecraft:arrow 0
replaceitem entity @a[scores={dummy=0}] inventory.19 minecraft:arrow
give @a[scores={dummy=1..6}] minecraft:arrow
schedule function glass_wars:supplies/arrow 9s
