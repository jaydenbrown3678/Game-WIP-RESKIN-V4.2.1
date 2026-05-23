/// @description Insert description here
// You can write your code in this editor
names = ["Luffy", "Zoro", "Sanji", "Naruto - Part I", "Sasuke - Part I"]
icons = [luffy_icon_1, zoro_icon, sanji_icon, naruto_icon, sasuke_icon]
ports = [spr_luffy_port, spr_zoro_port, spr_sanji_port, spr_naruto_port, spr_sasuke_port]

p1_index = 0
p2_index = 1
com_index = 0

p1_ready = false;
p2_ready = false;
com_ready = false; 

// Animation control variables
p1_frame = 0;
p2_frame = 0;
animation_timer = 0;
animation_speed = 0.2; // Adjust this to control playback speed

global.p1_char = CHAR_FIGHTER
global.p2_char = CHAR_SAMURAI
global.ai_char = CHAR_FIGHTER


