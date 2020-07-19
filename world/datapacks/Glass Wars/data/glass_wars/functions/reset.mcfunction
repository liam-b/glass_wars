# clear glass
execute positioned 0 16 0 run fill ~ ~ ~ ~42 0 ~42 air replace glass
execute positioned 0 16 0 run fill ~ ~ ~ ~42 0 ~-42 air replace glass
execute positioned 0 16 0 run fill ~ ~ ~ ~-42 0 ~42 air replace glass
execute positioned 0 16 0 run fill ~ ~ ~ ~-42 0 ~-42 air replace glass

execute positioned 0 16 0 run fill ~ ~15 ~ ~42 ~ ~42 air replace glass
execute positioned 0 16 0 run fill ~ ~15 ~ ~42 ~ ~-42 air replace glass
execute positioned 0 16 0 run fill ~ ~15 ~ ~-42 ~ ~42 air replace glass
execute positioned 0 16 0 run fill ~ ~15 ~ ~-42 ~ ~-42 air replace glass

execute positioned 0 16 0 run fill ~ ~30 ~ ~42 ~15 ~42 air replace glass
execute positioned 0 16 0 run fill ~ ~30 ~ ~42 ~15 ~-42 air replace glass
execute positioned 0 16 0 run fill ~ ~30 ~ ~-42 ~15 ~42 air replace glass
execute positioned 0 16 0 run fill ~ ~30 ~ ~-42 ~15 ~-42 air replace glass

execute positioned 0 16 0 run fill ~ ~45 ~ ~42 ~30 ~42 air replace glass
execute positioned 0 16 0 run fill ~ ~45 ~ ~42 ~30 ~-42 air replace glass
execute positioned 0 16 0 run fill ~ ~45 ~ ~-42 ~30 ~42 air replace glass
execute positioned 0 16 0 run fill ~ ~45 ~ ~-42 ~30 ~-42 air replace glass

# place stone
execute positioned 0 16 0 run fill ~-16 ~-2 ~-16 ~16 ~-1 ~16 stone

# place barriers
execute positioned 0 16 0 positioned ~40 ~ ~ run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 barrier hollow
execute positioned 0 16 0 positioned ~-40 ~ ~ run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 barrier hollow
execute positioned 0 16 0 positioned ~ ~ ~40 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 barrier hollow
execute positioned 0 16 0 positioned ~ ~ ~-40 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 barrier hollow

execute positioned 0 16 0 positioned ~33 ~ ~33 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 barrier hollow
execute positioned 0 16 0 positioned ~-33 ~ ~-33 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 barrier hollow
execute positioned 0 16 0 positioned ~33 ~ ~-33 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 barrier hollow
execute positioned 0 16 0 positioned ~-33 ~ ~33 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 barrier hollow

# place bedrock
execute positioned 0 16 0 run setblock ~40 ~-1 ~ bedrock
execute positioned 0 16 0 run setblock ~-40 ~-1 ~ bedrock
execute positioned 0 16 0 run setblock ~ ~-1 ~40 bedrock
execute positioned 0 16 0 run setblock ~ ~-1 ~-40 bedrock

execute positioned 0 16 0 run setblock ~33 ~-1 ~33 bedrock
execute positioned 0 16 0 run setblock ~-33 ~-1 ~-33 bedrock
execute positioned 0 16 0 run setblock ~33 ~-1 ~-33 bedrock
execute positioned 0 16 0 run setblock ~-33 ~-1 ~33 bedrock
