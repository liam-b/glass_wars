title @a[tag=preparing_for_glass_wars] times 1 15 5
title @a[tag=preparing_for_glass_wars] title "1"
execute as @a[tag=preparing_for_glass_wars] at @s run playsound minecraft:block.note_block.bit player @s ~ ~ ~ 1 0.8
schedule function glass_wars:start 1s
