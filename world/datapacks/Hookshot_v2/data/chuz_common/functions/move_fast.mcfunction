#�����Ă�������ɃG���e�B�e�B�����������x�Ŕ�΂���
#���s�҂��ǂ̈ʒu��AEC���o�����ő��x�����\
#X��
execute as @s store result score @s Motion_Power run data get entity @s Pos[0] 1200
execute as @e[tag=pos] store result score @s Motion_Power run data get entity @s Pos[0] 1200
execute as @s at @s positioned ^ ^ ^1 run scoreboard players operation @s Motion_Power -= @e[tag=pos,limit=1,sort=nearest] Motion_Power
execute as @s at @s store result entity @s Motion[0] double -0.01 run scoreboard players get @s Motion_Power
#Y��
execute as @s store result score @s Motion_Power run data get entity @s Pos[1] 1200
execute as @e[tag=pos] store result score @s Motion_Power run data get entity @s Pos[1] 1200
execute as @s at @s positioned ^ ^ ^1 run scoreboard players operation @s Motion_Power -= @e[tag=pos,limit=1,sort=nearest] Motion_Power
execute as @s at @s store result entity @s Motion[1] double -0.01 run scoreboard players get @s Motion_Power
#Z��
execute as @s store result score @s Motion_Power run data get entity @s Pos[2] 1200
execute as @e[tag=pos] store result score @s Motion_Power run data get entity @s Pos[2] 1200
execute as @s at @s positioned ^ ^ ^1 run scoreboard players operation @s Motion_Power -= @e[tag=pos,limit=1,sort=nearest] Motion_Power
execute as @s at @s store result entity @s Motion[2] double -0.01 run scoreboard players get @s Motion_Power
