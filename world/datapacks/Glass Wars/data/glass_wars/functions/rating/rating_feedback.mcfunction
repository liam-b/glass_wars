execute as @a[scores={rating=..17}] run tellraw @s ["",{"text":"Current rating: "},{"text":"[Leather]","color":"gold"},{"text":" ("},{"score":{"name":"@s","objective":"rating"}},{"text":")"}]
execute as @a[scores={rating=18..33}] run tellraw @s ["",{"text":"Current rating: "},{"text":"[Iron]","color":"gray"},{"text":" ("},{"score":{"name":"@s","objective":"rating"}},{"text":")"}]
execute as @a[scores={rating=34..50}] run tellraw @s ["",{"text":"Current rating: "},{"text":"[Gold]","color":"yellow"},{"text":" ("},{"score":{"name":"@s","objective":"rating"}},{"text":")"}]
execute as @a[scores={rating=51..67}] run tellraw @s ["",{"text":"Current rating: "},{"text":"[Diamond]","color":"aqua"},{"text":" ("},{"score":{"name":"@s","objective":"rating"}},{"text":")"}]
execute as @a[scores={rating=68..83}] run tellraw @s ["",{"text":"Current rating: "},{"text":"[Emerald]","color":"green"},{"text":" ("},{"score":{"name":"@s","objective":"rating"}},{"text":")"}]
execute as @a[scores={rating=84..}] run tellraw @s ["",{"text":"Current rating: "},{"text":"[Netherite]","color":"dark_gray"},{"text":" ("},{"score":{"name":"@s","objective":"rating"}},{"text":")"}]

replaceitem entity @a[scores={rating=..17}] armor.head minecraft:leather_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
replaceitem entity @a[scores={rating=18..33}] armor.head minecraft:iron_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
replaceitem entity @a[scores={rating=34..50}] armor.head minecraft:golden_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
replaceitem entity @a[scores={rating=51..67}] armor.head minecraft:diamond_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
replaceitem entity @a[scores={rating=68..83}] armor.head minecraft:chainmail_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
replaceitem entity @a[scores={rating=84..}] armor.head minecraft:netherite_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
