#region // Characters
#macro CHAR_FIGHTER    0
#macro CHAR_SAMURAI    1
#macro CHAR_COOK       2
#macro CHAR_WINDNINJA      3 
#macro CHAR_LIGHTNINGNINJA   4

#macro MAX_CHARS	   5  // UPDATED: Changed from 3 to 4
#endregion

#region // Game Variables
#macro GRAVITY_FORCE   0.5
#macro MOVE_SPD        2.5
#macro DASH_SPD        10
#macro JUMP_FORCE      -11.5
#macro MAX_HP          200
#macro SPECIAL_MOVE_1  50  // Threshold for special move activation
#endregion

#region // Controllers
#macro CONT_P1         0
#macro CONT_P2         1
#macro CONT_CPU        2  // Changed from CONT_COM to CONT_CPU for clarity
#endregion

#region // States
#macro STATE_FREE      0
#macro STATE_ATTACK    1
#macro STATE_HURT      2
#macro STATE_DEATH     3
#macro STATE_BLOCK     4
#macro STATE_DASH      5
#macro STATE_EMOTE     6
#macro STATE_CHARGE    7
#macro STATE_SPECIAL2  8
#macro STATE_FROZEN    9
#macro STATE_SPECIAL4 10 
#macro STATE_ULTIMATE 11

#endregion

#region // Attacks
#macro ATK_1           0
#macro ATK_2           1
#macro ATK_3           2
#macro ATK_4           3
#macro ATK_5           4
#macro ATK_6           5
#macro ATK_7           6
#macro ATK_8           7
#macro ATK_9           8
#macro ATK_10		   9
#macro ATK_11		   10
#macro ATK_12		   11
#macro ATK_13		   12
#macro ATK_14		   13
#macro ATK_15		   14

#macro ATK_NONE       -1
#endregion

#region // AI States
#macro AI_IDLE         0
#macro AI_APPROACH     1
#macro AI_RETREAT      2
#macro AI_JUMP         3
#macro AI_DASH         4
#macro AI_CHARGE       5
#macro AI_TRANSFORM    6
#endregion

#region // AI Difficulty
#macro AI_EASY         0
#macro AI_MEDIUM       1
#macro AI_HARD         2
#endregion

#region // AI Timing
#macro AI_JUMP_COOLDOWN    90  // 1.5 seconds at 60fps
#macro AI_DASH_DISTANCE    150 // Distance to trigger dash
#macro AI_CHARGE_THRESHOLD 30  // When special meter is below this
#endregion


//#region // Dash Variables
//#macro DASH_SPEED_MULTIPLIER 2 // Dash moves at 2x speed
//#macro DASH_DURATION .5 // 2.5 seconds (assuming 60 FPS: 2.5 * 60 = 150 frames)
//#endregion
