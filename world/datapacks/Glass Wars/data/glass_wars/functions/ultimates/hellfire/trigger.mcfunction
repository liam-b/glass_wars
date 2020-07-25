schedule clear glass_wars:ultimates/hellfire/loop
kill @e[type=fireball]

worldborder warning distance 1000000000
execute at @a run playsound minecraft:custom.hellfire.charge player @p ~ ~ ~ 1000
effect give @a[tag=ultimate_hellfire,tag=triggered_ultimate] minecraft:fire_resistance 1000000 0 false

summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}
summon minecraft:fireball 0 256 0 {ExplosionPower:4}

schedule function glass_wars:ultimates/hellfire/spread 5t
