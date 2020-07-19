
#使用時処理
# tag player with fishing rod
execute as @e[tag=NeoHookArrow] at @a if score @s ScoreID2 = @p PlayerID run tag @p add Hook_NoUse
execute as @e[tag=NeoHookPoint] at @a if score @s ScoreID2 = @p PlayerID run tag @p add Hook_NoUse
tag @a[nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] add Hold_NeoHook
execute at @a[tag=Hold_NeoHook,scores={Used_NeoHookRod=1}] run kill @e[type=fishing_bobber,limit=1,sort=nearest]

# summon arrow and play sounds / particles
tag @a[tag=Hold_NeoHook,tag=!Hook_NoUse,scores={Used_NeoHookRod=1}] add Hook_Used
execute at @a[tag=Hook_Used] run playsound minecraft:entity.iron_golem.hurt player @a ~ ~ ~ 2 2
execute at @a[tag=Hook_Used] run playsound minecraft:block.iron_door.open player @a ~ ~ ~ 2 1
execute at @a[tag=Hook_Used] run playsound minecraft:entity.skeleton.shoot player @a ~ ~ ~ 2 0.8
execute at @a[tag=Hook_Used] run summon arrow ~ ~1.67 ~ {PierceLevel:1b,damage:0d,Silent:1b,Color:-1b,NoGravity:1b,Tags:["NeoHookArrow","NeedID","NeoHook","NeoHook_Start"]}
execute at @a[tag=Hook_Used] positioned ~ ~1.67 ~ run summon area_effect_cloud ^ ^ ^0.7 {Duration:1,Radius:0f,Tags:[pos]}
tag @a[tag=Hook_Used] remove Hook_Used
tag @a[tag=Hook_NoUse] remove Hook_NoUse

#フック射出
# more particles
execute at @e[tag=NeoHook] run particle crit ~ ~ ~ 0 0 0 0 2 force
execute at @e[tag=NeoHook] run particle minecraft:dust 0.5 1 0.5 1 ~ ~ ~ 0.01 0.01 0.01 1 1

# run a movement script?
execute as @e[tag=NeoHook_Start] run function chuz_common:move_fast
tag @e[tag=NeoHook_Start] remove NeoHook_Start

#地形にヒット
tag @e[tag=NeoHookArrow,nbt={inGround:1b}] add NeoHookHit

#ヒット時サウンドなど
execute at @e[tag=NeoHookArrow,tag=NeoHookHit] run particle minecraft:crit ~ ~ ~ 0 0 0 0.5 5 force
execute at @e[tag=NeoHookArrow,tag=NeoHookHit] run summon area_effect_cloud ~ ~ ~ {Duration:100,Radius:0f,Tags:[NeoHookPoint]}
execute as @e[tag=NeoHookArrow,tag=NeoHookHit] at @s run scoreboard players operation @e[tag=NeoHookPoint,sort=nearest,limit=1] ScoreID2 = @s ScoreID2
execute at @e[tag=NeoHookArrow,tag=NeoHookHit] run playsound minecraft:entity.blaze.hurt player @a ~ ~ ~ 5 2
kill @e[tag=NeoHookArrow,tag=NeoHookHit]


#引き寄せ
execute as @e[tag=NeoHookPoint] at @a if score @s ScoreID2 = @p PlayerID run particle minecraft:cloud ~ ~ ~ 0.15 0.15 0.15 0 2
execute as @e[tag=NeoHookPoint] at @a if score @s ScoreID2 = @p PlayerID run playsound minecraft:entity.fishing_bobber.retrieve player @a ~ ~ ~ 1 0.5
execute as @a at @e[tag=NeoHookPoint] if score @s PlayerID = @e[limit=1,sort=nearest] ScoreID2 facing entity @s feet run function neo_hookshot:chain_particle
execute as @e[tag=NeoHookPoint] at @a if score @s ScoreID2 = @p PlayerID facing entity @s eyes rotated ~ 45 run summon area_effect_cloud ^ ^ ^-0.35 {Marker:1b,Invisible:1b,Tags:["Hook_Slime"],Passengers:[{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]},{id:"minecraft:slime",Silent:1b,Invulnerable:1b,DeathTime:19,NoAI:1b,Tags:["Hook_Slime"]}]}
execute as @e[tag=NeoHookPoint] at @a if score @s ScoreID2 = @p PlayerID run tag @p add glass_wars_grappling_connected
execute as @e[tag=Hook_Slime] at @s run tp @s ~ ~-1000 ~
kill @e[tag=Hook_Slime]

#フック着弾ポイントとのY軸の差で上がったり下がったり
execute as @e[tag=NeoHookPoint] at @a if score @s ScoreID2 = @p PlayerID run execute store result score @p Hook_Y_Check run data get entity @p Pos[1] 1
execute as @e[tag=NeoHookPoint] store result score @s Hook_Y_Check run data get entity @s Pos[1] 1

#高さチェック
execute as @e[tag=NeoHookPoint] at @a if score @s ScoreID2 = @p PlayerID run scoreboard players operation @p Hook_Y_Check -= @s Hook_Y_Check

#自分のほうが高いところにいる
execute at @a[scores={Hook_Y_Check=2..}] run summon area_effect_cloud ~ ~ ~ {Particle:"dust",Radius:0f,Duration:6,Age:4,Effects:[{Id:28b,Amplifier:0b,Duration:10,ShowParticles:0b}]}
#どっちも同じ高さ
execute at @a[scores={Hook_Y_Check=-1..1}] run summon area_effect_cloud ~ ~ ~ {Particle:"dust",Radius:0f,Duration:6,Age:4,Effects:[{Id:25b,Amplifier:255b,Duration:10,ShowParticles:0b}]}
#自分のほうが低いところにいる
execute at @a[scores={Hook_Y_Check=..-2}] run summon area_effect_cloud ~ ~ ~ {Particle:"dust",Radius:0f,Duration:6,Age:4,Effects:[{Id:25b,Amplifier:10b,Duration:2,ShowParticles:0b}]}
#Yスコアリセット
scoreboard players reset @a Hook_Y_Check

#引き寄せ解除
execute at @e[tag=NeoHookPoint] run tag @a[distance=..5] add NeoHookOff
execute as @e[tag=NeoHookPoint] at @a[tag=NeoHookOff] if score @s ScoreID2 = @p PlayerID run tag @s add NeoHookRemove

#引寄中に右クリックで引き寄せキャンセル
scoreboard players add @e[tag=NeoHookPoint] BulletRemain 1
execute as @e[tag=NeoHookPoint,scores={BulletRemain=5..}] at @a[tag=Hold_NeoHook,scores={Used_NeoHookRod=1}] if score @s ScoreID2 = @p PlayerID run tag @s add NeoHookRemove
#
execute as @e[tag=NeoHookRemove] at @a if score @s ScoreID2 = @p PlayerID run scoreboard players set @p FloatFuel 0
execute as @e[tag=NeoHookRemove] at @a if score @s ScoreID2 = @p PlayerID run playsound minecraft:entity.zombie.infect player @a ~ ~ ~ 1 2
execute as @e[tag=NeoHookRemove] at @a if score @s ScoreID2 = @p PlayerID run summon area_effect_cloud ~ ~ ~ {Particle:"dust",Radius:0f,Duration:6,Age:4,Effects:[{Id:25b,Amplifier:17b,Duration:5,ShowParticles:0b}]}
execute as @e[tag=NeoHookRemove] run kill @s
tag @a[tag=NeoHookOff] remove NeoHookOff

#エンティティ引き寄せ
execute at @e[tag=NeoHookArrow] run tag @e[distance=..5,type=!player,type=!fishing_bobber,type=!arrow,type=!armor_stand,type=!ghast,type=!iron_golem,type=!ender_dragon,type=!wither,type=!ravager,type=!area_effect_cloud,nbt={HurtTime:10s},limit=1,sort=nearest] add NeoHookPull
execute as @e[tag=NeoHookArrow] at @s if entity @e[tag=NeoHookPull,distance=..5,limit=1,sort=nearest] run particle minecraft:crit ~ ~ ~ 0 0 0 0.5 5 force
execute as @e[tag=NeoHookArrow] at @s if entity @e[tag=NeoHookPull,distance=..5,limit=1,sort=nearest] run playsound minecraft:entity.blaze.hurt player @a ~ ~ ~ 5 2
execute at @e[tag=NeoHookArrow] run scoreboard players reset @e[tag=NeoHookPull,distance=..5,limit=1,sort=nearest] BulletRemain
execute as @e[tag=NeoHookArrow] at @s run scoreboard players operation @e[tag=NeoHookPull,distance=..5,limit=1,sort=nearest] ScoreID2 = @s ScoreID2
execute as @e[tag=NeoHookArrow] at @s if entity @e[type=!arrow,type=!area_effect_cloud,type=!fishing_bobber,nbt={HurtTime:10s},distance=..5,limit=1,sort=nearest] run kill @s 

#移動
execute as @a at @e[tag=NeoHookPull] if score @s PlayerID = @e[tag=NeoHookPull,limit=1,sort=nearest] ScoreID2 facing entity @s feet run summon area_effect_cloud ^ ^ ^0.7 {Duration:1,Radius:0f,Tags:[pos]}
execute as @e[tag=NeoHookPull] run function chuz_common:move
execute at @e[tag=NeoHookPull] run playsound minecraft:entity.fishing_bobber.retrieve player @a ~ ~ ~ 1 0.5

#プレイヤーが近い、または時間が経つと引き寄せ解除
execute as @e[tag=NeoHookPull] at @s if score @s ScoreID2 = @p[distance=..2] PlayerID run effect give @s slowness 1 10 true 
execute as @e[tag=NeoHookPull] at @s if score @s ScoreID2 = @p[distance=..2] PlayerID run effect give @s weakness 1 10 true 
execute as @e[tag=NeoHookPull] at @s if score @s ScoreID2 = @p[distance=..2] PlayerID run data merge entity @s {Motion:[0.0,0.0,0.0]}
execute as @e[tag=NeoHookPull] at @s if score @s ScoreID2 = @p[distance=..2] PlayerID run tag @s remove NeoHookPull
scoreboard players add @e[tag=NeoHookPull] BulletRemain 1
tag @e[tag=NeoHookPull,scores={BulletRemain=20..}] remove NeoHookPull 

#飛距離
scoreboard players add @e[type=arrow,tag=NeoHookArrow] BulletRemain 1
kill @e[tag=NeoHookArrow,scores={BulletRemain=10}]

#フック手に持ってスニークでフロート
execute as @a[tag=Hold_NeoHook,scores={FloatUse=1..},nbt={OnGround:0b}] at @s unless entity @s[scores={FloatFuel=40..}] run summon minecraft:area_effect_cloud ~ ~ ~ {Particle:"entity_effect",Radius:0.25f,Duration:6,Age:4,Color:16777215,Effects:[{Id:25b,Amplifier:1b,Duration:2,ShowParticles:0b},{Id:28b,Amplifier:0b,Duration:2,ShowParticles:0b}]}
execute as @a[tag=Hold_NeoHook,scores={FloatUse=1..},nbt={OnGround:0b}] at @s unless entity @s[scores={FloatFuel=40..}] run particle minecraft:cloud ~ ~ ~ 0.5 0 0.5 0 1 normal
execute as @a[tag=Hold_NeoHook,scores={FloatUse=1..},nbt={OnGround:0b}] at @s unless entity @s[scores={FloatFuel=40..}] run particle minecraft:firework ~ ~ ~ 0.5 0 0.5 0 1 normal
scoreboard players add @a[tag=Hold_NeoHook,scores={FloatUse=1..},nbt={OnGround:0b}] FloatFuel 1

#フロート残量
execute at @a[scores={FloatFuel=20,FloatUse=1..}] run playsound minecraft:block.note_block.pling player @p ~ ~ ~ 1 2
execute at @a[scores={FloatFuel=30,FloatUse=1..}] run playsound minecraft:block.note_block.pling player @p ~ ~ ~ 1 2
execute at @a[scores={FloatFuel=40,FloatUse=1..}] run playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 1 1
execute at @a[scores={FloatFuel=40,FloatUse=1..}] run particle minecraft:large_smoke ~ ~ ~ 0 0 0 0.05 20

#気まぐれなフックショットの作成
execute as @e[type=item,nbt={Item:{id:"minecraft:dispenser",Count:1b}}] at @s if block ~ ~-1 ~ crafting_table if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:lead",Count:2b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:emerald",Count:3b}}] if entity @e[type=item,distance=..0.5,nbt={Item:{id:"minecraft:slime_block",Count:2b}}] run tag @s add CraftSlimeHook
execute at @e[tag=CraftSlimeHook] run summon item ~ ~ ~ {Item:{id:"minecraft:fishing_rod",Count:1b,tag:{display:{Name:"{\"text\":\"Masterpiece Hookrod\",\"color\":\"gold\",\"italic\":false}",Lore:["{\"text\":\"[RClick:Shoot/Cancel]\",\"color\":\"white\",\"italic\":false}","{\"text\":\"[Sneak:Float]\",\"color\":\"white\",\"italic\":false}"]},HideFlags:1,Unbreakable:1b,ItemName:Masterpiece_Hookrod,Enchantments:[{id:"minecraft:unbreaking",lvl:1s}]}}}
execute at @e[tag=CraftSlimeHook] run particle minecraft:crit ~ ~0.2 ~ 0 0 0 0.2 10
execute at @e[tag=CraftSlimeHook] run particle minecraft:end_rod ~ ~0.2 ~ 0 0 0 0.05 10
execute at @e[tag=CraftSlimeHook] run playsound minecraft:block.anvil.use neutral @a ~ ~ ~ 1 2
execute at @e[tag=CraftSlimeHook] run playsound minecraft:entity.player.levelup neutral @a ~ ~ ~ 1 1.5
execute at @e[tag=CraftSlimeHook] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:lead",Count:2b}}]
execute at @e[tag=CraftSlimeHook] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:emerald",Count:3b}}]
execute at @e[tag=CraftSlimeHook] run kill @e[sort=nearest,limit=1,type=item,nbt={Item:{id:"minecraft:slime_block",Count:2b}}]
execute as @e[tag=CraftSlimeHook] run kill @s
function chuz_common:player_score_id

#クラフト

execute as @e[tag=Custom_Crafter_Crafting] at @s if block ~ ~-0.5 ~ minecraft:dropper{Items:[{Slot:1b,id:"minecraft:slime_block",Count:1b},{Slot:2b,id:"minecraft:dispenser",Count:1b},{Slot:3b,id:"minecraft:slime_block",Count:1b},{Slot:4b,id:"minecraft:emerald",Count:1b},{Slot:5b,id:"minecraft:lead",Count:1b},{Slot:6b,id:"minecraft:emerald",Count:1b},{Slot:8b,id:"minecraft:lead",Count:1b}]} run tag @s add Custom_Crafter_Succes
execute as @e[tag=Custom_Crafter_Crafting] at @s if block ~ ~-0.5 ~ minecraft:dropper{Items:[{Slot:1b,id:"minecraft:slime_block",Count:1b},{Slot:2b,id:"minecraft:dispenser",Count:1b},{Slot:3b,id:"minecraft:slime_block",Count:1b},{Slot:4b,id:"minecraft:emerald",Count:1b},{Slot:5b,id:"minecraft:lead",Count:1b},{Slot:6b,id:"minecraft:emerald",Count:1b},{Slot:8b,id:"minecraft:lead",Count:1b}]} run data merge block ~ ~-1 ~ {Items:[{Slot:4b,id:"minecraft:fishing_rod",Count:1b,tag:{Unbreakable:1b,HideFlags:1,display:{Lore:['{"text":"[RClick:Shoot/Retract]","color":"white","italic":false}','{"text":"[Sneak:Float]","color":"white","italic":false}'],Name:'{"text":"Masterpiece Hookrod","color":"gold","italic":false}'},Enchantments:[{lvl:1s,id:"minecraft:unbreaking"}],ItemName:"Masterpiece_Hookrod",Damage:0}}]}

#スコアボードリセット、タグ消去(最後の行)
scoreboard players reset @a[scores={FloatUse=1..}] FloatUse
scoreboard players reset @a[scores={Used_NeoHookRod=1..}] Used_NeoHookRod
scoreboard players set @a[nbt={OnGround:1b}] FloatFuel 0
tag @e[tag=NeoHookFacing] remove NeoHookFacing
tag @a[tag=Hold_NeoHook] remove Hold_NeoHook
