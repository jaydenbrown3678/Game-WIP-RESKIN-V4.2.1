/// @description Insert description here
// You can write your code in this editor
// Draw GUI Event for obj_character_hud
// Draw GUI Event for obj_character_hud
var player1 = instance_find(obj_player1, 0);

if (player1 != noone) {
    // Position for the UI bar
    var hud_x = 20;
    var hud_y = 20;
    
    // Scale variables - EDIT THESE VALUES
    var normal_scale = 4;
    var timer_scale = 4;
    var ult_scale = 4;  // NEW: Scale for character_ui_bar_ult
    
    // Check display priority:
    // 1. Ultimate meter ready (highest priority)
    // 2. Transformation active
    // 3. Normal state
   
   if (player1.transformation1_active || player1.transformation2_on|| player1.transformation3_active) {
        // Draw transformation timer version
        draw_sprite_ext(character_ui_bar_timer, 0, hud_x, hud_y, 
                       timer_scale, timer_scale, 0, c_white, 1);
    }
     else if (player1.ultimate_move_meter > 0) {
        // Draw ultimate version when charging
        draw_sprite_ext(character_ui_bar_ult, 0, hud_x, hud_y, 
                       ult_scale, ult_scale, 0, c_white, 1);
    }
     else {
        // Draw normal version
        draw_sprite_ext(character_ui_bar_ult, 0, hud_x, hud_y, 
                       normal_scale, normal_scale, 0, c_white, 1);
    }
    
}


