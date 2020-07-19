
#スコアボード作成
scoreboard objectives add Motion_Power dummy
scoreboard objectives add BulletRemain dummy
scoreboard objectives add Used_NeoHookRod minecraft.used:minecraft.fishing_rod
scoreboard objectives add PlayerID dummy
scoreboard objectives add ScoreID2 dummy
scoreboard objectives add PlayerID_Core dummy
scoreboard objectives add Hook_Y_Check dummy
scoreboard objectives add FloatUse minecraft.custom:minecraft.sneak_time
scoreboard objectives add FloatFuel dummy
#�`�[���쐬
team add Hook_NoCol
team modify Hook_NoCol collisionRule pushOwnTeam
#�Q�[�����[���ύX
gamerule commandBlockOutput false

