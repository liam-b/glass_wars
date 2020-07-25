scoreboard players set $one dummy 1
scoreboard players set $neg_one dummy -1
scoreboard players set $hundred dummy 100

scoreboard players set $global_rating_sigma dummy 20
scoreboard players set $rating_multiplier_default dummy 1

# score mean
scoreboard players set $score_mean dummy 0
execute as @a run scoreboard players operation $score_mean dummy += @s score
scoreboard players set $num_players dummy 0
execute as @a run scoreboard players add $num_players dummy 1
scoreboard players operation $score_mean dummy /= $num_players dummy

# score stdev
execute as @a run scoreboard players operation @s dummy = @s score
execute as @a run scoreboard players operation @s dummy -= $score_mean dummy
execute as @a run scoreboard players operation @s dummy *= @s dummy

scoreboard players set $score_stdev dummy 0
execute as @a run scoreboard players operation $score_stdev dummy += @s dummy
scoreboard players operation $score_stdev dummy /= $num_players dummy
scoreboard players operation @p math_in = $score_stdev dummy
execute as @p run function math:sqrt
scoreboard players operation $score_stdev dummy = @p math_out
scoreboard players operation $score_stdev dummy /= $hundred dummy

# rating mean
scoreboard players set $rating_mean dummy 0
execute as @a run scoreboard players operation $rating_mean dummy += @s rating
scoreboard players set $num_players dummy 0
execute as @a run scoreboard players add $num_players dummy 1
scoreboard players operation $rating_mean dummy /= $num_players dummy

# calcs #

# stdev from mean score
execute as @a run scoreboard players operation @s dummy += $score_mean dummy
execute as @a run scoreboard players operation @s dummy -= @s score
execute as @a run scoreboard players operation @s dummy /= $score_stdev dummy
# FIXME: missing cap limit

# stdev from mean lobby rating
execute as @a run scoreboard players operation @s dummy2 = $rating_mean dummy
execute as @a run scoreboard players operation @s dummy2 -= @s rating
execute as @a run scoreboard players operation @s math_in = @s dummy2
execute as @a run function math:abs
execute as @a run scoreboard players operation @s dummy2 = @s math_out
execute as @a run scoreboard players operation @s dummy2 /= $global_rating_sigma dummy

# expected result rating multiplier
execute as @a run scoreboard players operation @s dummy3 = $rating_multiplier_default dummy
execute as @a run scoreboard players operation @s dummy3 -= @s dummy2
execute as @a[scores={dummy3=..0}] run scoreboard players operation @s dummy3 *= $neg_one dummy

# unexpected result rating multiplier
execute as @a run scoreboard players operation @s dummy4 = $rating_multiplier_default dummy
execute as @a run scoreboard players operation @s dummy4 += @s dummy2

# game rating multiplier
execute as @a if score @s rating > $rating_mean dummy run tag @s add higher_rated_than_lobby_mean
execute as @a if score @s score < $score_mean dummy run tag @s add score_better_than_mean

execute as @a[tag=higher_rated_than_lobby_mean,tag=score_better_than_mean] run scoreboard players operation @s dummy5 = @s dummy3
execute as @a[tag=!higher_rated_than_lobby_mean,tag=score_better_than_mean] run scoreboard players operation @s dummy5 = @s dummy4
execute as @a[tag=higher_rated_than_lobby_mean,tag=!score_better_than_mean] run scoreboard players operation @s dummy5 = @s dummy4
execute as @a[tag=!higher_rated_than_lobby_mean,tag=!score_better_than_mean] run scoreboard players operation @s dummy5 = @s dummy3

# calculate next rating values
execute as @a run scoreboard players operation @s next_rating = @s dummy5
execute as @a run scoreboard players operation @s next_rating *= @s dummy
execute as @a run scoreboard players operation @s next_rating *= $base_rating_value dummy
execute as @a run scoreboard players operation @s next_rating += @s rating

# update ratings
execute as @a run scoreboard players operation @s rating = @s next_rating
