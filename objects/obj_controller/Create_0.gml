
// ==============================================
// MATCH CONTROL
// ==============================================
//match_time = 60 * 99; // Match duration in seconds
//match_timer_active = true; // Timer control flag

// ==============================================
// PLAYER CREATION
// ==============================================
p1 = instance_create_layer(room_width/2-290, 420, "Instances", obj_player1);
p2 = instance_create_layer(room_width/2+100, 420, "Instances", obj_player1);

// Player configuration
p2.image_xscale = -1;
p2.controller = CONT_P2;
p1.opponent = p2;
p2.opponent = p1;

// ==============================================
// CREATE COMBO DISPLAYS
//var combo1 = instance_create_layer(0,0,"Effects", obj_combo_display_p1);
//combo1.player = p1;

//var combo2 = instance_create_layer(0,0,"Effects", obj_combo_display_p2);
//combo2.player = p2;
// ==============================================
// GAME MODE SETUP
// ==============================================
if (!variable_global_exists("game_mode")) {
    global.game_mode = GAME_MODE.PVP;
}

if (!variable_global_exists("cpu_difficulty")) {
    global.cpu_difficulty = 1; // Medium difficulty
}

// Initialize CPU players if needed
switch (global.game_mode) {
    case GAME_MODE.PVC: // Player vs CPU
        p2.is_cpu = true;
        p2.cpu_difficulty = global.cpu_difficulty;
        with (p2) get_attack_range();
        break;
        
    case GAME_MODE.CVC: // CPU vs CPU
        p1.is_cpu = true;
        p2.is_cpu = true;
        p1.cpu_difficulty = global.cpu_difficulty;
        p2.cpu_difficulty = global.cpu_difficulty;
        with (p1) get_attack_range();
        with (p2) get_attack_range();
        break;
}

// ==============================================
// CHARACTER SETUP - UPDATED TO USE GLOBAL VARIABLES
// ==============================================
// Use character selections from obj_char_select if they exist
p1.character = variable_global_exists("p1_char") ? global.p1_char : CHAR_FIGHTER;
p2.character = variable_global_exists("p2_char") ? global.p2_char : CHAR_SAMURAI;

// Set facing directions
p1.image_xscale = 1; // Player 1 faces right
p2.image_xscale = -1; // Player 2 faces left

// Initialize character sprites
with (p1) HandleSprites(character);
with (p2) HandleSprites(character);

// ==============================================

// Create the camera target
var cam_target = instance_create_layer(0, 0, "Instances", obj_camera_target);

// Create the zoom controller
//var zoom_controller = instance_create_layer(0, 0, "Instances", obj_camera_zoom);

// Set up camera to follow the midpoint
if (view_enabled) {
    view_object[0] = cam_target; // Makes camera follow the midpoint
    view_hborder[0] = 200; // Horizontal deadzone (adjust as needed)
    view_vborder[0] = 250; // Vertical deadzone (adjust as needed)
}