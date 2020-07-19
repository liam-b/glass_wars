#向いている方向にエンティティを飛ばすよ
#実行者がどの位置にAECを出すかで速度調整可能
#X軸
execute as @s store result score @s Motion_Power run data get entity @s Pos[0] 300
execute as @e[tag=pos] store result score @s Motion_Power run data get entity @s Pos[0] 300
execute as @s at @s positioned ^ ^ ^1 run scoreboard players operation @s Motion_Power -= @e[tag=pos,limit=1,sort=nearest] Motion_Power
execute as @s at @s store result entity @s Motion[0] double -0.01 run scoreboard players get @s Motion_Power
#Y軸
execute as @s store result score @s Motion_Power run data get entity @s Pos[1] 300
execute as @e[tag=pos] store result score @s Motion_Power run data get entity @s Pos[1] 300
execute as @s at @s positioned ^ ^ ^1 run scoreboard players operation @s Motion_Power -= @e[tag=pos,limit=1,sort=nearest] Motion_Power
execute as @s at @s store result entity @s Motion[1] double -0.01 run scoreboard players get @s Motion_Power
#Z軸
execute as @s store result score @s Motion_Power run data get entity @s Pos[2] 300
execute as @e[tag=pos] store result score @s Motion_Power run data get entity @s Pos[2] 300
execute as @s at @s positioned ^ ^ ^1 run scoreboard players operation @s Motion_Power -= @e[tag=pos,limit=1,sort=nearest] Motion_Power
execute as @s at @s store result entity @s Motion[2] double -0.01 run scoreboard players get @s Motion_Power
