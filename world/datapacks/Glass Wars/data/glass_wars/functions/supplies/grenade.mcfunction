execute as @a store result score @s dummy run clear @s minecraft:egg 0
replaceitem entity @a[scores={dummy=0}] hotbar.3 minecraft:egg{display:{Name:"{\"text\":\"Grenade\",\"italic\":\"false\"}"}}
give @a[scores={dummy=1..4}] minecraft:egg{display:{Name:"{\"text\":\"Grenade\",\"italic\":\"false\"}"}}
schedule function glass_wars:supplies/grenade 7s
