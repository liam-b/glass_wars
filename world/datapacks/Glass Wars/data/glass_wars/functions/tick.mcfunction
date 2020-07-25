function glass_wars:equip/equip
execute positioned 0 121 0 as @p[distance=..0.5] if block ~ ~ ~ minecraft:light_weighted_pressure_plate run effect give @s minecraft:levitation 10 10

#/summon armor_stand 7.5 100.75 6 {CustomNameVisible:1b,NoGravity:1b,Invisible:1b,CustomName:"{\"text\":\"Speed\"}"}

# start bell
execute as @a[scores={bellTrigger=1..}] run function glass_wars:prepare
scoreboard players set @a[scores={bellTrigger=1..}] bellTrigger 0

# scoreboard
execute as @a run scoreboard players operation @s score = @s deathCount
execute as @a run scoreboard players operation @s score -= @s killCount

scoreboard players set @a[tag=!intialised_rating] rating 50
tag @a[tag=!intialised_rating] add intialised_rating

# permanent
replaceitem entity @a[tag=playing_glass_wars,scores={deathStreak=..2}] hotbar.0 minecraft:wooden_sword
replaceitem entity @a[tag=playing_glass_wars,scores={deathStreak=3..}] hotbar.0 minecraft:iron_sword
replaceitem entity @a[tag=playing_glass_wars] hotbar.1 minecraft:bow
replaceitem entity @a[tag=playing_glass_wars] hotbar.8 minecraft:cooked_beef

replaceitem entity @a[tag=playing_glass_wars] armor.head minecraft:iron_helmet
replaceitem entity @a[tag=playing_glass_wars] armor.chest minecraft:leather_chestplate{Enchantments:[{id:projectile_protection,lvl:2}]}
replaceitem entity @a[tag=playing_glass_wars] armor.legs minecraft:leather_leggings{Enchantments:[{id:projectile_protection,lvl:2}]}
replaceitem entity @a[tag=playing_glass_wars] armor.feet minecraft:iron_boots{Enchantments:[{id:feather_falling,lvl:2}]}
clear @a[tag=playing_glass_wars] glass_bottle

execute as @a[tag=playing_glass_wars,nbt={Inventory:[{Slot:6b,id:"minecraft:glass"}]}] run replaceitem entity @s hotbar.6 air
execute as @a[tag=playing_glass_wars,nbt={Inventory:[{Slot:7b,id:"minecraft:glass"}]}] run replaceitem entity @s hotbar.7 air
# execute as @a[tag=playing_glass_wars,nbt={Inventory:[{Slot:9b,id:"minecraft:glass"}]}] run replaceitem entity @s inventory.0 air
replaceitem entity @a[tag=playing_glass_wars] inventory.0 air

execute as @a[tag=playing_glass_wars,nbt={Inventory:[{Slot:7b,id:"minecraft:carrot_on_a_stick"}]}] run replaceitem entity @s hotbar.7 air
execute as @a[tag=playing_glass_wars,nbt={Inventory:[{Slot:7b,id:"minecraft:snowball"}]}] run replaceitem entity @s hotbar.7 air
execute as @a[tag=playing_glass_wars,nbt={Inventory:[{Slot:7b,id:"minecraft:fishing_rod"}]}] run replaceitem entity @s hotbar.7 air

# data modify entity @e[tag=hellfireball,limit=1] Motion set value [0.0,-3.0,0.0]
execute as @e[tag=hellfireball] run data modify entity @s Motion set value [0.0,-3.0,0.0]
execute as @e[tag=hellfireball] positioned as @s as @s[y=15,dy=2] run setblock ~ ~-1 ~ glass keep
# execute at @e[tag=hellfireball] run setblock ~ ~1 ~ glass keep
# execute at @e[tag=hellfireball] as @p[distance=..3.5] run setblock ~ ~-1 ~ glass keep

# execute at @e[tag=hellfireball] positioned ~2 ~ ~ as @p[distance=..2] at @s run setblock ~ ~-1 ~ glass keep
# execute at @e[tag=hellfireball] positioned ~-2 ~ ~ as @p[distance=..2] at @s run setblock ~ ~-1 ~ glass keep
# execute at @e[tag=hellfireball] positioned ~ ~ ~2 as @p[distance=..2] at @s run setblock ~ ~-1 ~ glass keep
# execute at @e[tag=hellfireball] positioned ~ ~ ~-2 as @p[distance=..2] at @s run setblock ~ ~-1 ~ glass keep
# execute at @e[tag=hellfireball] positioned ~2 ~ ~2 as @p[distance=..2] at @s run setblock ~ ~-1 ~ glass keep
# execute at @e[tag=hellfireball] positioned ~-2 ~ ~-2 as @p[distance=..2] at @s run setblock ~ ~-1 ~ glass keep
# execute at @e[tag=hellfireball] positioned ~-2 ~ ~2 as @p[distance=..2] at @s run setblock ~ ~-1 ~ glass keep
# execute at @e[tag=hellfireball] positioned ~2 ~ ~-2 as @p[distance=..2] at @s run setblock ~ ~-1 ~ glass keep

# remove air above bedrock
execute positioned 0 16 0 positioned ~40 ~ ~ run fill ~ ~ ~ ~ ~1 ~ air
execute positioned 0 16 0 positioned ~-40 ~ ~ run fill ~ ~ ~ ~ ~1 ~ air
execute positioned 0 16 0 positioned ~ ~ ~40 run fill ~ ~ ~ ~ ~1 ~ air
execute positioned 0 16 0 positioned ~ ~ ~-40 run fill ~ ~ ~ ~ ~1 ~ air

execute positioned 0 16 0 positioned ~33 ~ ~33 run fill ~ ~ ~ ~ ~1 ~ air
execute positioned 0 16 0 positioned ~-33 ~ ~-33 run fill ~ ~ ~ ~ ~1 ~ air
execute positioned 0 16 0 positioned ~33 ~ ~-33 run fill ~ ~ ~ ~ ~1 ~ air
execute positioned 0 16 0 positioned ~-33 ~ ~33 run fill ~ ~ ~ ~ ~1 ~ air

# cinda buffs
effect give CindaBCatLexy minecraft:resistance 1 0 true
effect give CindaBCatLexy minecraft:strength 1 0 true

# auto glass
execute as @a[tag=!glass_path_blocked,tag=playing_glass_wars,tag=auto_glass,nbt=!{Inventory:[{id:"minecraft:fishing_rod"}]}] store result score @s dummy run data get entity @s Motion[1]
scoreboard players add @a[tag=!glass_path_blocked,tag=playing_glass_wars,tag=auto_glass,scores={dummy=..-1},nbt={OnGround:0b},nbt=!{Inventory:[{id:"minecraft:fishing_rod"}]}] fallTrigger 1
scoreboard players set @a[tag=!glass_path_blocked,tag=playing_glass_wars,tag=auto_glass,nbt={OnGround:1b},nbt=!{Inventory:[{id:"minecraft:fishing_rod"}]}] fallTrigger 0
execute at @a[tag=!glass_path_blocked,tag=playing_glass_wars,tag=auto_glass,scores={fallTrigger=14..},nbt=!{Inventory:[{id:"minecraft:fishing_rod"}]}] run setblock ~ ~-1 ~ glass keep
scoreboard players set @a[tag=!glass_path_blocked,tag=playing_glass_wars,tag=auto_glass,scores={fallTrigger=14..},nbt=!{Inventory:[{id:"minecraft:fishing_rod"}]}] fallTrigger 0

# item removal
kill @e[type=item,nbt={Item:{id:"minecraft:bow"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:wooden_sword"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:cooked_beef"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:glass_bottle"}}]

kill @e[type=item,nbt={Item:{id:"minecraft:iron_helmet"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:leather_chestplate"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:leather_leggings"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:iron_boots"}}]

kill @e[type=item,nbt={Item:{id:"minecraft:cobblestone"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:stone"}}]

kill @e[type=minecraft:experience_orb]

# on spawn
give @e[type=player,scores={deathTrigger=1..},tag=playing_glass_wars] glass 20
execute as @e[scores={deathTrigger=1..},tag=playing_glass_wars] run xp set @s 0 points
execute as @e[scores={deathTrigger=1..},tag=playing_glass_wars] run xp set @s 0 levels
execute as @e[scores={deathTrigger=1..,deathStreak=3..},tag=playing_glass_wars] run title @s actionbar {"text":"Death streak buff active"}
scoreboard players set @e[scores={deathTrigger=1..},tag=playing_glass_wars] deathTrigger 0

# glass path
execute as @a[nbt={SelectedItem:{id:"minecraft:glass"}},tag=!glass_path_blocked,tag=playing_glass_wars,y=0,dy=50,x=-40,dx=80,z=-40,dz=80] at @s if block ~ ~-1 ~ air run tag @s add placing_glass_path
execute at @a[tag=placing_glass_path,tag=playing_glass_wars] run setblock ~ ~-1 ~ glass keep
execute as @a[tag=placing_glass_path,nbt=!{ActiveEffects:[{Id:1b}]},tag=playing_glass_wars] run clear @s glass 1
execute as @a[tag=placing_glass_path,tag=playing_glass_wars] run tag @s remove placing_glass_path

# grenade
execute at @e[type=egg,tag=!tracked_grenade] run summon armor_stand ~ ~ ~ {Invisible:1b,Tags:["grenade_tracker"]}
tag @e[type=egg,tag=!tracked_grenade] add tracked_grenade

execute as @e[tag=grenade_tracker] at @s unless entity @e[tag=tracked_grenade,distance=..2] run tag @s add grenade_detonation
execute at @e[tag=grenade_detonation] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:1}
kill @e[tag=grenade_detonation]
execute as @e[tag=grenade_tracker] at @s run tp @s @e[tag=tracked_grenade,sort=nearest,limit=1]

# tnt
execute at @e[type=tnt] run setblock ~ ~ ~ air replace

# pearl
# tag @e[type=item,tag=!dropped_ender_pearl,nbt={Item:{id:"minecraft:ender_pearl"}}] add dropped_ender_pearl
# execute at @e[tag=dropped_ender_pearl] run scoreboard players set @p[scores={timer=1..}] timer -80
# scoreboard players add @a timer 1

# execute as @e[tag=dropped_ender_pearl] store result score @s dummy run data get entity @s Thrower.L
# execute as @a[scores={timer=0}] store result score @s dummy run data get entity @s UUIDLeast
# scoreboard players operation @e[tag=dropped_ender_pearl] dummy -= @a[scores={timer=0}] dummy
# execute at @e[tag=dropped_ender_pearl,scores={dummy=0},limit=1] run tp @a[scores={timer=0}] ~ ~ ~
# kill @e[tag=dropped_ender_pearl,scores={dummy=0}]

# shield
execute at @a[scores={shieldTrigger=1..}] run fill ~-2 ~-2 ~-2 ~2 ~2 ~2 glass hollow
execute at @a[scores={shieldTrigger=1..}] run playsound minecraft:block.beehive.exit player @a
execute as @a[scores={shieldTrigger=1..}] run effect give @s minecraft:regeneration 10 0
execute as @a[scores={shieldTrigger=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:16}}}] run replaceitem entity @s weapon.mainhand minecraft:air
execute as @a[scores={shieldTrigger=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:8}}}] run replaceitem entity @s weapon.mainhand minecraft:carrot_on_a_stick{Damage:16,display:{Name:"{\"text\":\"Shield\",\"italic\":\"false\"}"}}
execute as @a[scores={shieldTrigger=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{Damage:0}}}] run replaceitem entity @s weapon.mainhand minecraft:carrot_on_a_stick{Damage:8,display:{Name:"{\"text\":\"Shield\",\"italic\":\"false\"}"}}
scoreboard players set @a[scores={shieldTrigger=1..}] shieldTrigger 0

# grappling hook
execute as @a[tag=!glass_wars_grappling_connected,tag=!glass_wars_grappling_trigger,nbt={SelectedItem:{id:"minecraft:fishing_rod",tag:{Damage:63}}}] run replaceitem entity @s weapon.mainhand minecraft:air
execute as @a[tag=glass_wars_grappling_connected,tag=!glass_wars_grappling_trigger,nbt={SelectedItem:{id:"minecraft:fishing_rod",tag:{Damage:48}}}] run replaceitem entity @s weapon.mainhand minecraft:fishing_rod{Damage:63,display:{Name:"{\"text\":\"Grappling Hook\",\"italic\":\"false\"}"}}
execute as @a[tag=glass_wars_grappling_connected,tag=!glass_wars_grappling_trigger,nbt={SelectedItem:{id:"minecraft:fishing_rod",tag:{Damage:32}}}] run replaceitem entity @s weapon.mainhand minecraft:fishing_rod{Damage:48,display:{Name:"{\"text\":\"Grappling Hook\",\"italic\":\"false\"}"}}
execute as @a[tag=glass_wars_grappling_connected,tag=!glass_wars_grappling_trigger,nbt={SelectedItem:{id:"minecraft:fishing_rod",tag:{Damage:16}}}] run replaceitem entity @s weapon.mainhand minecraft:fishing_rod{Damage:32,display:{Name:"{\"text\":\"Grappling Hook\",\"italic\":\"false\"}"}}
execute as @a[tag=glass_wars_grappling_connected,tag=!glass_wars_grappling_trigger,nbt={SelectedItem:{id:"minecraft:fishing_rod",tag:{Damage:0}}}] run replaceitem entity @s weapon.mainhand minecraft:fishing_rod{Damage:16,display:{Name:"{\"text\":\"Grappling Hook\",\"italic\":\"false\"}"}}

execute as @a[tag=glass_wars_grappling_connected] run clear @s cooked_beef
tag @a[tag=glass_wars_grappling_connected] add glass_wars_grappling_trigger
tag @a[tag=!glass_wars_grappling_connected] remove glass_wars_grappling_trigger
tag @a[tag=glass_wars_grappling_connected] remove glass_wars_grappling_connected

# spleef
execute as @a[scores={spleefTrigger=1..}] run playsound minecraft:block.respawn_anchor.deplete player @a ~ ~ ~ 1 0 1
# execute as @a[scores={spleefTrigger=1..}] at @a run playsound minecraft:block.beacon.power_select player @s
# execute as @a[scores={spleefTrigger=1..}] at @a run playsound minecraft:item.totem.use player @s
# execute as @a[scores={spleefTrigger=1..}] at @a run playsound minecraft:block.end_portal.spawn @s
scoreboard players set @a[scores={spleefTrigger=1..}] spleefTrigger 0

execute as @e[type=snowball] run scoreboard players add @s dummy 1
execute at @e[type=snowball,scores={dummy=4..}] run fill ~-2 ~-1 ~-1 ~2 ~1 ~1 air replace glass
execute at @e[type=snowball,scores={dummy=4..}] run fill ~-1 ~-2 ~-1 ~1 ~2 ~1 air replace glass
execute at @e[type=snowball,scores={dummy=4..}] run fill ~-1 ~-1 ~-2 ~1 ~1 ~2 air replace glass
execute at @e[type=snowball,scores={dummy=4..}] run fill ~-2 ~-1 ~-1 ~2 ~1 ~1 air replace stone
execute at @e[type=snowball,scores={dummy=4..}] run fill ~-1 ~-2 ~-1 ~1 ~2 ~1 air replace stone
execute at @e[type=snowball,scores={dummy=4..}] run fill ~-1 ~-1 ~-2 ~1 ~1 ~2 air replace stone
execute at @e[type=snowball,scores={dummy=2..}] run particle minecraft:smoke ~ ~ ~

execute at @e[type=snowball,scores={dummy=8..}] as @a[distance=..8,tag=!in_spleef_effect] at @s run playsound minecraft:block.fire.extinguish player @s
tag @a remove in_spleef_effect
execute at @e[type=snowball,scores={dummy=8..}] run tag @a[distance=..8] add in_spleef_effect
execute as @e[tag=in_spleef_effect] run effect give @s minecraft:weakness 5 0 true

tag @a remove glass_path_blocked
tag @a[nbt={ActiveEffects:[{Id:18b, Amplifier: 0b}]}] add glass_path_blocked
execute at @a[nbt={ActiveEffects:[{Id:18b, Amplifier: 0b}]}] run particle minecraft:cloud ~ ~1.5 ~ 0.3 0.3 0.3 0 1 normal

# death streak
scoreboard players set @e[scores={killTrigger=1..},tag=playing_glass_wars] deathStreak 0

# kill tracker
execute as @a[scores={killTrigger=1..},tag=playing_glass_wars] run xp add @s 3 points
execute at @a[scores={killTrigger=1..}] run playsound minecraft:block.anvil.land player @a
scoreboard players set @a[scores={killTrigger=1..},tag=playing_glass_wars,level=1] killTrigger 0

execute as @a[scores={killTrigger=1..}] run title @s times 1 30 5
execute as @a[scores={killTrigger=1..}] run title @s subtitle "Ability ready"
execute as @a[scores={killTrigger=1..}] run title @s title ""

replaceitem entity @a[scores={killTrigger=1..},tag=ability_speed] hotbar.6 minecraft:potion{CustomPotionEffects:[{Id:1,Amplifier:1,Duration:300},{Id:8,Amplifier:1,Duration:300}],CustomPotionColor:16122033,display:{Name:"{\"text\":\"Speed\",\"italic\":\"false\"}"}}
replaceitem entity @a[scores={killTrigger=1..},tag=ability_shield] hotbar.6 minecraft:carrot_on_a_stick{display:{Name:"{\"text\":\"Shield\",\"italic\":\"false\"}"}}
replaceitem entity @a[scores={killTrigger=1..},tag=ability_grappling] hotbar.6 minecraft:fishing_rod{display:{Name:"{\"text\":\"Grappling Hook\",\"italic\":\"false\"}"}}
execute as @a[scores={killTrigger=1..},tag=ability_spleef] store result score @s dummy run clear @s minecraft:snowball 0
replaceitem entity @a[tag=ability_spleef,scores={killTrigger=1..,dummy=0}] hotbar.6 minecraft:snowball{display:{Name:"{\"text\":\"Spleef-ball\",\"italic\":\"false\"}"}}
give @a[tag=ability_spleef,scores={killTrigger=1..,dummy=1..}] minecraft:snowball{display:{Name:"{\"text\":\"Spleef-ball\",\"italic\":\"false\"}"}}

# highlight
team leave @a[tag=playing_glass_wars,nbt=!{Inventory:[{Slot:6b},{Slot:7b}]},nbt=!{ActiveEffects:[{Id:1b}]},nbt=!{ActiveEffects:[{Id:2b}]},nbt=!{ActiveEffects:[{Id:12b}]}]
team join white @a[tag=!during_ultimate,nbt={Inventory:[{id:"minecraft:snowball"}]}]
team join blue @a[tag=!during_ultimate,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick"}]}]
team join green @a[tag=!during_ultimate,nbt={Inventory:[{id:"minecraft:fishing_rod"}]}]

team join black @a[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick"}]}]
team join black @a[nbt={ActiveEffects:[{Id:1b}]}]
team join red @a[nbt={ActiveEffects:[{Id:2b}]}]
team join yellow @a[nbt={Inventory:[{id:"minecraft:experience_bottle"}]}]
team join yellow @a[nbt={ActiveEffects:[{Id:12b}]}]

effect clear @a[nbt=!{Inventory:[{Slot:6b},{Slot:7b}]},nbt=!{ActiveEffects:[{Id:1b}]},nbt=!{ActiveEffects:[{Id:2b}]},nbt=!{ActiveEffects:[{Id:12b}]}] minecraft:glowing
effect give @a[tag=playing_glass_wars,nbt={Inventory:[{Slot:6b}]}] minecraft:glowing 1000000 0 true
effect give @a[tag=playing_glass_wars,nbt={Inventory:[{Slot:7b}]}] minecraft:glowing 1000000 0 true
effect give @a[tag=playing_glass_wars,nbt={ActiveEffects:[{Id:1b}]}] minecraft:glowing 1000000 0 true
effect give @a[tag=playing_glass_wars,nbt={ActiveEffects:[{Id:2b}]}] minecraft:glowing 1000000 0 true
effect give @a[tag=playing_glass_wars,nbt={ActiveEffects:[{Id:12b}]}] minecraft:glowing 1000000 0 true

scoreboard players set @a[scores={killTrigger=1..},tag=playing_glass_wars] killTrigger 0

# killstreak
execute as @a[level=1] run title @s subtitle {"text":"Ultimate ready","color":"red"}
execute as @a[level=1] run title @s title ""
replaceitem entity @a[level=1,tag=ultimate_beast] hotbar.7 minecraft:warped_fungus_on_a_stick{display:{Name:"{\"text\":\"Beast of The Hunt\",\"color\":\"red\",\"italic\":\"false\"}"}}
replaceitem entity @a[level=1,tag=ultimate_hellfire] hotbar.7 minecraft:experience_bottle{display:{Name:"{\"text\":\"Hellfire\",\"color\":\"yellow\",\"italic\":\"false\"}"}}
execute as @a[level=1] run xp set @s 0 points
execute as @a[level=1] run xp set @s 0 levels

# ultimate
execute at @e[type=minecraft:experience_bottle] run tag @p add triggered_ultimate
kill @e[type=minecraft:experience_bottle]
tag @a[scores={ultTrigger=1..},tag=playing_glass_wars] add triggered_ultimate
scoreboard players set @a[scores={ultTrigger=1..},tag=playing_glass_wars] ultTrigger 0

execute as @a[tag=ultimate_hellfire,tag=triggered_ultimate] run function glass_wars:ultimates/hellfire/trigger
execute as @a[tag=ultimate_beast,tag=triggered_ultimate] run function glass_wars:ultimates/beast/trigger

tag @a[tag=triggered_ultimate] add during_ultimate
tag @a[tag=triggered_ultimate] remove triggered_ultimate

# timer text
title @a[tag=playing_glass_wars] actionbar ["",{"score":{"name":"time1","objective":"minutes"},"color":"white"},{"score":{"name":"time0","objective":"minutes"},"color":"white"},{"text":":"},{"score":{"name":"time1","objective":"seconds"}},{"score":{"name":"time0","objective":"seconds"}}]

