/// @description Insert description here
// You can write your code in this editor
// Draw GUI Event for obj_character2_hud
var player2 = instance_find(obj_player1, 1);  // Changed to get Player 2

if (player2 != noone) {
    // Position for the UI bar - EDIT THESE VALUES
    var hud_x = display_get_gui_width() - 100;  // Right side (100px from right edge)
    var hud_y = 20;                             // Same Y as Player 1
    
    // Scale variables - EDIT THESE VALUES
    var normal_scale = 4;
    var timer_scale = 4;
    var ult_scale = 4;
    
    // Check display priority for Player 2:
	if (player2.transformation1_active || player2.transformation2_active || player2.transformation3_active) {
        // Draw transformation timer version
        draw_sprite_ext(character_ui_bar2_timer, 0, hud_x, hud_y, 
                       timer_scale, timer_scale, 0, c_white, 1);
    }
    else if (player2.ultimate_move_meter > 0) {
        // Draw ultimate version when charging
        draw_sprite_ext(character_ui_bar2_ult, 0, hud_x, hud_y, 
                       ult_scale, ult_scale, 0, c_white, 1);
    }
      else {
        // Draw normal version
        draw_sprite_ext(chatacter_ui_bar2, 0, hud_x, hud_y, 
                       normal_scale, normal_scale, 0, c_white, 1);
    }
}
