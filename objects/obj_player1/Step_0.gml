// @description Character Control
/*
#region Keys
right = (controller==CONT_P1)?ord("D"):vk_right;
left = (controller==CONT_P1)?ord("A"):vk_left;
up = (controller==CONT_P1)?ord("W"):vk_up;
down = (controller==CONT_P1)?ord("S"):vk_down;
attack_1 = (controller==CONT_P1)?ord("E"):ord("K");
attack_2 = (controller==CONT_P1)?ord("R"):ord("L");
attack_3 = (controller==CONT_P1)?ord("F"):ord("M");

#endregion

//Character Control
Character_Control()

//Animation Control
Animation_Control()

//Hit Manager
HitManager()

//Collision
CollisionsAndMovements()

if (keyboard_check_pressed(ord("E"))){
    audio_play_sound(punching_effect, 1, false); // Play the sound once
}

if (keyboard_check_pressed(ord("R"))) {
    audio_play_sound(punching_effect, 1, false); // Play the sound once
}

if (keyboard_check_pressed(ord("W")) ){
    audio_play_sound(jumping_effect, 2, false); // Play the sound once
}

if (keyboard_check_pressed(ord("F")) ){
    audio_play_sound(kick_effect, 3, false); // Play the sound once
}

if (keyboard_check_pressed(ord("M")) ){
    audio_play_sound(sword_effect1, 3, false); // Play the sound once
}

if (keyboard_check_pressed(ord("K")) ){
    audio_play_sound(sword_strike, 3, false); // Play the sound once
}
if (keyboard_check_pressed(vk_up) ){
    audio_play_sound(sword_jump, 3, false); // Play the sound once
}
if (keyboard_check_pressed(ord("L")) ){
    audio_play_sound(Sword_effect2, 3, false); // Play the sound once
}

if (obj_player.character_hp == 0) {
    show_message("Player 2 Wins!");
} else if (obj_player.opp_hp == 0) {
    show_message("Player 1 Wins!");
}


if (!obj_controller.match_timer_active)
{
		exit;
}
*/

// @description Character Control

// obj_player1 Step Event
// Add this at the VERY TOP:

if (is_cpu) {
    right = false;
    left = false;
    up = false;
    down = false;
    attack_1 = false;
    attack_2 = false;
    attack_3 = false;
    dash_key = false;
    jump_key_pressed = false;
    charge_key = false;
    transformation_1_key = false;

    scr_ai_character_control();
} else {

    #region // Keys
    right = (controller == CONT_P1) ? ord("D") : vk_right;
    left = (controller == CONT_P1) ? ord("A") : vk_left;
    up = (controller == CONT_P1) ? ord("W") : vk_up;
    down = (controller == CONT_P1) ? ord("S") : vk_down;
    attack_1 = (controller == CONT_P1) ? ord("E") : ord("K");
    attack_2 = (controller == CONT_P1) ? ord("R") : ord("L");
    attack_3 = (controller == CONT_P1) ? ord("F") : ord("M");
    attack_4 = (controller == CONT_P1) ? ord("1") : ord("O"); 
    emote_key = (controller == CONT_P1) ? ord("Q") : vk_shift;
    jump_attack = (controller == CONT_P1) ? ord("E") : ord("K");
    dash_key = (controller == CONT_P1) ? ord("X") : vk_space;
    charge_key = (controller == CONT_P1) ? ord("Z") : ord("P");
    transformation_1_key = (controller == CONT_P1) ? ord("3") : ord("0");
    attack_5 = (controller == CONT_P1) ? ord("2") : ord("U");
    #endregion
}

if (state != STATE_DASH) {
    if (hspd == 0) {
        if (opponent.x > x) image_xscale = 1;
        else image_xscale = -1;
    }
}

if (special_move_meter2 >= 50) special_move2_ready = true;

if (special_move_meter2 >= 100) special_move4_ready = true;

if (ultimate_move_meter >= 100) ultimate_move_ready = true;



// ===============================
// TRANSFORMATION 1 ACTIVATION
// ===============================
var key_t1 = (controller == CONT_P1) ? ord("3") : ord("0");

if (special_move_meter2 >= 50 &&
    keyboard_check_pressed(key_t1) &&
    !transformation1_active &&
    !transformation2_active &&
    !transformation3_active)
{
    special_move_meter2 -= 50;

    sprite_index = sp_transform1;
    state = STATE_SPECIAL2;

    transformation1_active = true;
    transformation1_on = true;

    transformation2_active = false;
    transformation2_on = false;

    transformation3_active = false;
    transformation3_on = false;

    transformation_timer = transformation_duration;
}



// ===============================
// TRANSFORMATION 2 ACTIVATION
// ===============================
var key_t2 = (controller == CONT_P1) ? ord("4") : ord("I");

if (special_move_meter2 >= 100 &&
    keyboard_check_pressed(key_t2) &&
    !transformation2_active &&
    !transformation3_active)
{
    special_move_meter2 -= 100;

    sprite_index = sp_transform2;
    state = STATE_SPECIAL4;

    transformation1_active = false;
    transformation1_on = false;

    transformation2_active = true;
    transformation2_on = true;

    transformation3_active = false;
    transformation3_on = false;

    transformation_timer = transformation_duration;
}



// ===============================
// TRANSFORMATION 3 ACTIVATION (ULTIMATE)
// ===============================
var key_t3 = (controller == CONT_P1) ? ord("5") : ord("J");

if (ultimate_move_meter >= 100 &&
    keyboard_check_pressed(key_t3) &&
    !transformation3_active)
{
    ultimate_move_meter = 0;

    sprite_index = sp_transform3;
    state = STATE_ULTIMATE;

    transformation1_active = false;
    transformation1_on = false;

    transformation2_active = false;
    transformation2_on = false;

    transformation3_active = true;
    transformation3_on = true;

    transformation_timer = transformation_duration;
}



// ===============================
// TRANSFORMATION TIMERS
// ===============================

if (transformation1_active) {

    transformation_timer -= .03;

    if (transformation_timer <= 0) {

        transformation_timer = 0;

        transformation1_active = false;
        transformation1_on = false;

        if (state == STATE_FREE && hspd == 0)
            sprite_index = sp_idle;
    }
}



if (transformation2_active) {

    transformation_timer -= .06;

    if (transformation_timer <= 0) {

        transformation_timer = 0;

        transformation2_active = false;
        transformation2_on = false;

        if (state == STATE_FREE && hspd == 0)
            sprite_index = sp_idle;
    }
}



if (transformation3_active) {

    transformation_timer -= .03;

    if (transformation_timer <= 0) {

        transformation_timer = 0;

        transformation3_active = false;
        transformation3_on = false;

        if (state == STATE_FREE && hspd == 0)
            sprite_index = sp_idle;
    }
}



if (state == STATE_FROZEN) {
    hspd = 0;
    vspd = 0;
}



if (state == STATE_ATTACK && 
    sprite_index == fighter_trans3_special2 && 
    round(image_index) == 16) {

    if (!spawned_lightning_this_attack) {
        var impact = instance_create_layer(opponent.x, opponent.y - 30, "Effects", obj_lightning_impact);
        impact.image_xscale = image_xscale;
        spawned_lightning_this_attack = true;
    }

} else {
    spawned_lightning_this_attack = false;
}



if (state == STATE_ATTACK && 
    sprite_index == fighter_trans3_special2 && 
    round(image_index) == 10) {

    if (!spawned_trans3_sp2_this_attack) {
        var effect = instance_create_layer(opponent.x, opponent.y - 220, "Effects", obj_trans3_sp2);
        effect.image_xscale = image_xscale;
        spawned_trans3_sp2_this_attack = true;
    }

} else {
    spawned_trans3_sp2_this_attack = false;
}

// ========== COMBO TIMER DECAY ==========
if (combo_active && combo_counter > 0) {
    combo_timer--;
    if (combo_timer <= 0) {
        combo_counter = 0;
        combo_active = false;
    }
}
// ======================================

// Create combo display for this player
if (!instance_exists(combo_display) && controller == CONT_P1) { // Or CONT_P2
    combo_display = instance_create_layer(0, 0, "Effects", obj_combo_display_p1);
    combo_display.player = id;
}



Character_Control();
CheckAttackCollision();
if (state != STATE_DASH) Dash();
Animation_Control();
HitManager();
CollisionsAndMovements();
HandleLives();
FreezeHandler();
UpdateHearts();
Charge();
scr_reset_combo_flags();



 //Check for Winner Based on Health
//if (character_hp <= 0 || character_hp < opp_hp) {
    // Current player is defeated
   // show_message("Player 2 Wins!");
   // room_restart(); // Restart the game (optional)
//} else if (opp_hp <= 0 || opp_hp < character_hp) {
    // Opponent is defeated
  //  show_message("Player 1 Wins!");
  //  room_restart(); // Restart the game (optional)
//}

 //Exit Step Logic If Timer is Inactive
//if (!obj_controller.match_timer_active) {
  //  exit;
//}


