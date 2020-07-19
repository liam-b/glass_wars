execute as @a store result score @s dummy run clear @s minecraft:creeper_spawn_egg 0
replaceitem entity @a[scores={dummy=0}] hotbar.4 creeper_spawn_egg{EntityTag:{id:"minecraft:tnt",Fuse:30},display:{Name:"{\"text\":\"Tnt\",\"italic\":\"false\"}"}}
give @a[scores={dummy=1..2}] creeper_spawn_egg{EntityTag:{id:"minecraft:tnt",Fuse:30},display:{Name:"{\"text\":\"Tnt\",\"italic\":\"false\"}"}}
schedule function glass_wars:supplies/tnt 20s
