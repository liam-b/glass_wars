# cosmetic
worldborder warning distance 1000000000
execute at @a run playsound minecraft:entity.ender_dragon.growl player @p
execute at @a run playsound minecraft:block.end_portal.spawn player @p

# others
execute at @a[tag=!triggered_ultimate] run summon minecraft:lightning_bolt ~ ~6 ~
effect give @a[tag=!triggered_ultimate] minecraft:glowing 20 0 true
effect give @a[tag=!triggered_ultimate] minecraft:slowness 20 1 true
effect give @a[tag=!triggered_ultimate] minecraft:blindness 3 0 true
team join red @a[tag=!triggered_ultimate]

# beast
clear @a[tag=triggered_ultimate] minecraft:warped_fungus_on_a_stick
effect give @a[tag=triggered_ultimate] minecraft:speed 20 1 true
effect give @a[tag=triggered_ultimate] minecraft:strength 20 1 true

schedule function glass_wars:ultimates/beast/clear 20s
