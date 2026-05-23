// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_sound_manager() {
	
	if (character == CHAR_FIGHTER) {
    if (keyboard_check_pressed(attack_1)&& !transformation1_on) {
    audio_play_sound(punching_effect, 1, false);
	audio_play_sound(luffy_grunt, 1, false);
} else if(keyboard_check_pressed(attack_1) && transformation1_on == true) {
	audio_play_sound(Gear2_Attack1, 1, false);
}

if (keyboard_check_pressed(attack_2) && !transformation1_on) {
    audio_play_sound(luff_attack2, 1, false);
    audio_play_sound(luffy_grunt2, 1, false);
}
else if(keyboard_check_pressed(attack_2) && transformation1_on == true) {
	audio_play_sound(Gear2_Attack2, 1, false);
}

if (keyboard_check_pressed(up)) {
    audio_play_sound(jumping_effect, 2, false);
}

if (keyboard_check_pressed(attack_3)) {
    audio_play_sound(kick_effect, 3, false);
}

if (keyboard_check_pressed(emote_key)) {
    audio_play_sound(luffy_emote, 3, false);
}

if (keyboard_check_pressed(dash_key)) {
	audio_play_sound(Dash_effect, 3, false);
	audio_play_sound(luffy_dash, 3, false);
}
	if (keyboard_check_pressed(attack_4)) {
    audio_play_sound(Luffy_special1, 3, false);
}
if(transformation1_active == true && keyboard_check_pressed(transformation_1_key)){
	audio_play_sound(Luffy_gear2, 3, false);
}

	}

	
	
 if (character == CHAR_SAMURAI) {
if (keyboard_check_pressed(attack_3)) {
    audio_play_sound(sword_effect1, 3, false);
}

if (keyboard_check_pressed(attack_1)) {
    audio_play_sound(sword_strike, 3, false);
    audio_play_sound(zoro_attackgrunt, 3, false);
}

if (keyboard_check_pressed(up)) {
    audio_play_sound(sword_jump, 3, false);
}

if (keyboard_check_pressed(attack_2)) {
    audio_play_sound(Sword_effect2, 3, false);
    audio_play_sound(zoro_grunt, 3, false);
}


if (keyboard_check_pressed(emote_key)) {
    audio_play_sound(zoro_emote1, 1, false);
}


if (keyboard_check_pressed(dash_key)) {
    audio_play_sound(samurai_Dasheffect, 1, false);
	audio_play_sound(zoro_dash, 1, false);
	
}

if (keyboard_check_pressed(attack_4)) {
    audio_play_sound(zoro_special1, 3, false);
	audio_play_sound(Zoro_special1grunt,3,false);
}
}


if (character == CHAR_COOK) {
	if (keyboard_check_pressed(attack_1)) {
    audio_play_sound(Sanji_attack1, 3, false);
    audio_play_sound(Sanji_grunt, 3, false);
}
	if (keyboard_check_pressed(attack_2)) {
    audio_play_sound(Sanji_attack2, 3, false);
    //audio_play_sound(zoro_attackgrunt, 3, false);
}
if (keyboard_check_pressed(attack_3)) {
    audio_play_sound(Sanji_attack3, 3, false);
  
}

if (keyboard_check_pressed(attack_4)) {
    audio_play_sound(Sanji_special1, 3, false);
    
	
}

if (keyboard_check_pressed(dash_key)) {
    audio_play_sound(Sanji_Dash, 1, false);
}

if(keyboard_check_pressed(up)) {
	audio_play_sound(Sanji_grunt, 1, false);
}

if(keyboard_check_pressed(emote_key)){
	audio_play_sound(Sanji_emote1, 1, false);
}
	
}





}