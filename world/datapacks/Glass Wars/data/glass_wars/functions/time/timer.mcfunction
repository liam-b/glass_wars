# scoreboard players add time0 seconds 1
# execute if score time0 seconds matches 10 run scoreboard players add time1 seconds 1
# execute if score time0 seconds matches 10 run scoreboard players set time0 seconds 0

# execute if score time1 seconds matches 6 run scoreboard players add time0 minutes 1
# execute if score time1 seconds matches 6 run scoreboard players set time1 seconds 0


scoreboard players remove time0 seconds 1

execute if score time0 seconds matches -1 run scoreboard players remove time1 seconds 1
execute if score time0 seconds matches -1 run scoreboard players set time0 seconds 9

execute if score time1 seconds matches -1 run scoreboard players remove time0 minutes 1
execute if score time1 seconds matches -1 run scoreboard players set time1 seconds 5

execute if score time0 minutes matches -1 run scoreboard players remove time1 minutes 1
execute if score time0 minutes matches -1 run scoreboard players set time0 minutes 9

schedule function glass_wars:time/timer 1s

execute if score time0 seconds matches 0 if score time1 seconds matches 0 if score time0 minutes matches 0 if score time1 minutes matches 0 run function glass_wars:stop
