  // @description 
/*
//hspd = 0
vspd = 0
grv = GRAVITY_FORCE



character = CHAR_FIGHTER
controller = CONT_P1

opp = CHAR_SAMURAI

state = STATE_FREE

shield = false
landed = false
can_attack = true
atk_type = ATK_1

//stats

character_hp = max(0,100);
opp_hp = max(0,100);



hit_base_id = -999
last_hit_id = 999 
*/

// obj_player Create Event
// Movement variables
hspd = 0; // Horizontal speed
vspd = 0; // Vertical speed
grv = GRAVITY_FORCE; // Gravity force applied to the character

// Character and control assignment
character = CHAR_FIGHTER; // Default character type
controller = CONT_P1; // Default controller assignment

// Opponent assignment
opp = CHAR_SAMURAI; // Default opponent character type

// State variables
state = STATE_FREE; // Current state (e.g., idle, attacking)
shield = false;     // Shield status
landed = false;     // Whether the character is grounded
can_attack = true;  // Attack availability
atk_type = ATK_1;   // Current attack type

// Stats (health points)
character_hp = 100; // Set HP to maximum
opp_hp = 100;       // Opponent's HP

// Lives system (add to Create Event)
lives = 3; // Total lives per player
opp_lives = 3; // Opponent lives
is_defeated = false; // Tracks if the player is fully out of lives
opp_is_defeated = false; // Tracks if the opponent is fully out of lives


// Hit tracking
hit_base_id = -999; // Base ID for hit detection
last_hit_id = 999;  // Last hit ID

// Dash variables
is_dashing = false; // Tracks if the player is currently dashing
dash_distance = 0; // Distance limit for the dash
dash_speed = 0; // Stores the dash speed
initial_x = 0; // Stores the X position at the start of the dash
initial_y = 0; // Stores the Y position at the start of the dash

// Jump tracking
has_double_jumped = false; // Track if the character has used their double jump
has_dashed_in_air = false; // Track if the character has dashed in the air

// Hitbox data initialization - changed to character-specific
hitbox_frames_fighter = ds_map_create();
hitbox_frames_samurai = ds_map_create();
hitbox_frames_cook = ds_map_create();  // Added Cook's hitbox map
hitbox_frames_ninja = ds_map_create();  // ADD THIS LINE - CREATE THE MAP FIRST


// Fighter hitbox data
ds_map_add(hitbox_frames_fighter, ATK_1, [{ frames: [3], x_offset: 29.7, y_offset: 50 }]);
ds_map_add(hitbox_frames_fighter, ATK_2, [{ frames: [5], x_offset: 75, y_offset: 55 }]);
ds_map_add(hitbox_frames_fighter, ATK_3, [{ frames: [6], x_offset: 150, y_offset: 40 }]);
ds_map_add(hitbox_frames_fighter, ATK_4, [
    { frames: [15], x_offset: 120, y_offset: 40 },
    { frames: [16], x_offset: 170, y_offset: 40 }
]); 
ds_map_add(hitbox_frames_fighter, ATK_5, [
    { frames: [3], x_offset: -10, y_offset: -30 }
])
ds_map_add(hitbox_frames_fighter, ATK_6, [{ frames: [4], x_offset: 29.7, y_offset: 50 }]);
ds_map_add(hitbox_frames_fighter, ATK_7, [{ frames: [4], x_offset: 75, y_offset: 55 }]);
ds_map_add(hitbox_frames_fighter, ATK_8, [{ frames: [5], x_offset: 150, y_offset: 40 }]);
ds_map_add(hitbox_frames_fighter, ATK_9, [{ frames: [15], x_offset: 150, y_offset: 40 }]);
ds_map_add(hitbox_frames_fighter, ATK_10, [{ frames: [3], x_offset: 150, y_offset: 40 }]);
ds_map_add(hitbox_frames_fighter, ATK_11, [{ frames: [4], x_offset: 150, y_offset: 40 }]);
ds_map_add(hitbox_frames_fighter, ATK_12, [{ frames: [3], x_offset: 150, y_offset: 40 }]);
ds_map_add(hitbox_frames_fighter, ATK_13, [{ frames: [3], x_offset: 150, y_offset: 40 }]);
ds_map_add(hitbox_frames_fighter, ATK_14, [{ frames: [3], x_offset: 150, y_offset: 40 }]);
ds_map_add(hitbox_frames_fighter, ATK_15, [{ frames: [9], x_offset: 150, y_offset: 40 }]);


// Samurai hitbox data
ds_map_add(hitbox_frames_samurai, ATK_1, [{ frames: [4], x_offset: 70, y_offset: 35 },
{ frames: [12], x_offset: 70, y_offset: 35 }]);
ds_map_add(hitbox_frames_samurai, ATK_2, [{ frames: [4], x_offset: 70, y_offset: 35 }]);

ds_map_add(hitbox_frames_samurai, ATK_6, [
    { frames: [4], x_offset: 65, y_offset: 40 },
    //{ frames: [10], x_offset: 65, y_offset: 40 }
]);
ds_map_add(hitbox_frames_samurai, ATK_3, [{ frames: [2], x_offset: 60, y_offset: 40 }]);
ds_map_add(hitbox_frames_samurai, ATK_4, [
    { frames: [5], x_offset: 125, y_offset: 40 },
    { frames: [6], x_offset: 175, y_offset: 40 }
]);
ds_map_add(hitbox_frames_samurai, ATK_5, [
    { frames: [3], x_offset: 45, y_offset: 10 }
]) 
ds_map_add(hitbox_frames_samurai, ATK_7, [
    { frames: [5], x_offset: 45, y_offset: 10 }
])
ds_map_add(hitbox_frames_samurai, ATK_8, [
    { frames: [5], x_offset: 45, y_offset: 10 }
])
ds_map_add(hitbox_frames_samurai, ATK_9, [
    { frames: [8], x_offset: 45, y_offset: 10 }
])
ds_map_add(hitbox_frames_samurai, ATK_10, [
    { frames: [3], x_offset: 45, y_offset: 10 }
])
ds_map_add(hitbox_frames_samurai, ATK_11, [
    { frames: [4], x_offset: 45, y_offset: 10 }
])
ds_map_add(hitbox_frames_samurai, ATK_12, [
    { frames: [3], x_offset: 45, y_offset: 10 }
]);

// Cook hitbox data
ds_map_add(hitbox_frames_cook, ATK_1, [{ frames: [4], x_offset: 70, y_offset: 55 }]);
ds_map_add(hitbox_frames_cook, ATK_2, [
    { frames: [5], x_offset: 65, y_offset: 40 },
    { frames: [10], x_offset: 65, y_offset: 40 }
]); 
ds_map_add(hitbox_frames_cook, ATK_3, [{ frames: [6], x_offset: 80, y_offset: 35 }])
ds_map_add(hitbox_frames_cook, ATK_4, [{ frames: [13], x_offset: 80, y_offset: 35 }])
ds_map_add(hitbox_frames_cook, ATK_5, [{ frames: [5], x_offset: 45, y_offset: 20 }])
ds_map_add(hitbox_frames_cook, ATK_6, [{ frames: [3], x_offset: 65, y_offset: 40 }])
ds_map_add(hitbox_frames_cook, ATK_7, [
{ frames: [3], x_offset: 80, y_offset: 35 },
{ frames: [6], x_offset: 80, y_offset: 35 }

])
ds_map_add(hitbox_frames_cook, ATK_8, [{ frames: [3], x_offset: 80, y_offset: 35 }])
ds_map_add(hitbox_frames_cook, ATK_9, [{ frames: [6], x_offset: 80, y_offset: 35 }]);


// Ninja hitbox data
ds_map_add(hitbox_frames_ninja, ATK_1, [{ frames: [2], x_offset: 70, y_offset: 60 }]);
ds_map_add(hitbox_frames_ninja, ATK_2, [{ frames: [2], x_offset: 75, y_offset: 55 }]);
ds_map_add(hitbox_frames_ninja, ATK_3, [{ frames: [4], x_offset: 60, y_offset: 40 }]);
ds_map_add(hitbox_frames_ninja, ATK_4, [{ frames: [12], x_offset: 120, y_offset: 40 }]);
ds_map_add(hitbox_frames_ninja, ATK_9, [{ frames: [15], x_offset: 80, y_offset: 35 }]);

// Special move system
special_move_meter = 0; // Tracks the special move meter (0% to 100%)
special_move_ready = false;// Tracks if the special move is ready
special_move_meter2 = 0;
special_move2_ready = false;
special_move3_meter = 0;
special_move3_ready = false;
special_move4_meter = 0;
special_move4_ready = false;
ultimate_move_meter = 0;
ultimate_move_ready = false;



// Control bindings (added from Step Event)
right = (controller == CONT_P1) ? ord("D") : vk_right;
left = (controller == CONT_P1) ? ord("A") : vk_left;
up = (controller == CONT_P1) ? ord("W") : vk_up;
down = (controller == CONT_P1) ? ord("S") : vk_down;
attack_1 = (controller == CONT_P1) ? ord("E") : ord("K");
attack_2 = (controller == CONT_P1) ? ord("R") : ord("L");
attack_3 = (controller == CONT_P1) ? ord("F") : ord("M");
attack_4 = (controller == CONT_P1) ? ord("1") : ord("O"); 
emote_key = (controller == CONT_P1) ? ord("Q") : ord("O");
jump_attack = (controller == CONT_P1) ? ord("E") : ord("K");
dash_key = (controller == CONT_P1) ? ord("X") : vk_space;
charge_key = (controller == CONT_P1) ? ord("Z") : ord("P");
transformation_1_key = (controller == CONT_P1) ? ord("2") : ord("0");
attack_5 = (controller == CONT_P1) ? ord("2") : ord("O");

active_attack_frame = false;
current_attack_type = ATK_1;
attack_connected = false;


//character_damage = [2, 5, 2, 25, 4, 4, 7, 5, 35]; // Default damage values [ATK_1, ATK_2, ATK_3, ATK_4, ATK_5]

// If you need character-specific damage values:
//attack_1, attack_2, attack_3, special_1, jump_attack, trans1_attack1, 
//trans1_attack2, trans1_attack3, special_2

transformation1_active = false;
transformation1_on = false;
transformation2_active = false;
transformation2_on = false;
transformation3_active = false;
transformation3_on = false;



current_attack_damage = 0;

trans_1_timer = 60;  // Initialize to 1 second
trans_2_timer = 60;
trans_3_timer = 60;


atk_1_hit = false;
atk_1_combo2_hit = false;
atk_1_combo3_hit = false;
atk_2_hit = false; // Initialize just like atk_1_hit
atk_3_hit = false; 
trans1_atk_1_hit = false;
trans1_atk_2_hit = false;
trans2_atk_1_hit = false;
trans2_atk_2_hit = false;
trans1_special1_hit = false;
atk_1_chain_hit = false;
atk_1_chain2_hit = false;
atk_2_chain_hit = false; // For ATK_2 → ATK_1 chain
combo_1_chain_hit = false;
trans1_atk_1_combo1_hit = false;
// Add this with your other combo/chain flags
atk_2_to_1_chain_hit = false;  // NEW: For ATK_2 → ATK_1 chain
trans3_atk_1hit = false;

previous_sprite = -1;


// Freeze system variables
freeze_on_frame = -1;
unfreeze_on_frame = -1;
current_freeze_attack = -1;
frozen_sprite = -1;
frozen_image_index = 0;

//atk_1_combo2_hit = false; // New flag for second combo tier

// AI variables
ai_state = AI_IDLE;
ai_timer = 0;
ai_difficulty = AI_EASY; // Default to easy

// AI Movement
is_cpu = false;          // Set by controller
cpu_difficulty = 1;      // 0=Easy, 1=Medium, 2=Hard
cpu_optimal_range = 100; // Default distance to maintain
cpu_move_timer = 0;      // Decision timing control


// Character-specific movement profiles
cpu_optimal_range = 100;      // Default preferred distance
cpu_aggression = 0.2;         // 0-1, likelihood to approach
cpu_movement_style = 0;       // 0=Ground, 1=Air, 2=Mixed

// Add with other control variables
dash_key_pressed = false;
cpu_dash_pressed = false;
jump_key_pressed = false;
cpu_jump_pressed = false;

// Add this with your other initialization variables:
cpu_hspd = 0;          // Initialize for all players
is_cpu = false;        // Default to human control
cpu_move_timer = 0;    // Decision timer
cpu_optimal_range = 100; // Default distance
cpu_aggression = 0.5;  // Default aggression
cpu_last_attack = -1;
cpu_attack_cooldown = 0;



// Attack System (add with other CPU variables)
cpu_attack_cooldown = 0;
cpu_current_attack = ATK_NONE;

// Character Attack Profiles (9 variations - 3 chars x 3 difficulties)
// [Character][Difficulty][AttackChances]
cpu_attack_profiles = [
    // FIGHTER (0) - existing
    [ 
        [0.7, 0.2, 0.1, 0, 0, 0, 0, 0, 0],    // Easy
        [0.5, 0.3, 0.15, 0.05, 0, 0, 0, 0, 0], // Medium
        [0.3, 0.3, 0.2, 0.1, 0.1, 0, 0, 0, 0]  // Hard
    ],
    // SAMURAI (1) - existing
    [
        [0.6, 0.1, 0.3, 0, 0, 0, 0, 0, 0],     // Easy
        [0.4, 0.2, 0.3, 0.1, 0, 0, 0, 0, 0],    // Medium
        [0.2, 0.2, 0.3, 0.2, 0.1, 0, 0, 0, 0]   // Hard
    ],
    // COOK (2) - existing
    [
        [0.4, 0.4, 0.2, 0, 0, 0, 0, 0, 0],      // Easy
        [0.3, 0.3, 0.2, 0.1, 0.1, 0, 0, 0, 0],   // Medium
        [0.2, 0.2, 0.2, 0.1, 0.1, 0.1, 0.1, 0, 0] // Hard
    ],
    // NINJA (3) - ADD THIS
    [
        [0.5, 0.3, 0.2, 0, 0, 0, 0, 0, 0],      // Easy: 50% ATK_1, 30% ATK_2, 20% ATK_3
        [0.4, 0.3, 0.2, 0.1, 0, 0, 0, 0, 0],     // Medium
        [0.3, 0.3, 0.2, 0.1, 0.1, 0, 0, 0, 0]    // Hard
    ]
];

// Add with other CPU variables
cpu_block_cooldown = 0;
cpu_block_chance = [0.3, 0.5, 0.7]; // Easy/Medium/Hard

if (is_cpu) {
    cpu_block_cooldown--;
}

cpu_min_distance = 40; // Minimum distance between CPUs (adjust as needed)
cpu_push_speed = 0.8; // Multiplier for pushback speed (0.8 = 80% of MOVE_SPD)
cpu_charge_chance = [0.1, 0.2, 0.3]; // Easy/Medium/Hard charge probability
cpu_retreat_speed = 1.2; // Multiplier for retreat speed

animation_start_x = 0;    // Stores x position when animation begins
animation_net_movement = 0; // Tracks total movement during animation
apply_animation_movement = false; // Controls whether to apply the delta

previous_sprite = -1; // Add this with your other variables

// Transformation Timer System
transformation_timer = 60;           // Current timer count (in steps)
transformation_duration = 60;  // 60 seconds converted to steps (60 steps/second)

transformation_meter_subtracted = false;

// Add with other combo flags in Create Event
trans2_atk_1_hit = false; // For ATK_10 combo tracking

atk4_num = 0; 

spawned_this_attack = false;
// For tracking effect spawning
spawned_lightning_this_attack = false;

spawned_trans3_sp2_this_attack = false;

// Combo system
combo_counter = 0;        // Current combo count
combo_timer = 0;          // Time between hits before combo resets
combo_max_gap = 130;       // Max frames between hits before combo ends (adjust as needed)
combo_active = false;     // Whether combo is actively being displayed
combo_display = noone; // Will hold reference to display object
hit_counted_this_frame = false;