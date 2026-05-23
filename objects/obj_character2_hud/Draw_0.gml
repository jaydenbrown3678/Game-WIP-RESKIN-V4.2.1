/// @description Insert description here
// You can write your code in this editor
// In obj_character_hud Draw Event
// For obj_character2_hud Draw Event
var player2 = instance_find(obj_player1, 1);

if (player2 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Get camera width for right-side positioning
    var cam_width = camera_get_view_width(camera_get_active());
    
    // Default coordinates - POSITIONED ON RIGHT SIDE
    var bar_x_offset = cam_width - 95;  // Right side (80 + 210 = 290 from right)
    var bar_y_offset = 57;
    var bar_width = 213;
    var bar_height = 25;
    
    // Adjust for specific rooms
    switch(room_get_name(room)) {
        case "rm_sunny_stage":
            bar_x_offset = cam_width - 72;  // 60 + 160 = 220 from right
            bar_y_offset = 55;
            bar_width = 159;
            bar_height = 28;
            break;
			
			case "rm_konoha_stage":
            bar_x_offset = cam_width - 72;  // 60 + 160 = 220 from right
            bar_y_offset = 55;
            bar_width = 159;
            bar_height = 28;
            break;
			
        
        // Add more rooms as needed
    }
    
    // Calculate positions
    var bar_x = cam_x + bar_x_offset;
    var bar_y = cam_y + bar_y_offset;
    
    draw_healthbar(bar_x, bar_y, 
                   bar_x - bar_width, bar_y + bar_height, 
                  player2.opp_hp,  // Player 2's HP
                   c_dkgray, c_red, c_lime, 0, true, true);
				   
}

// Special_movebar for Player 2
if (player2 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Get camera width for right-side positioning
    var cam_width = camera_get_view_width(camera_get_active());
    
    // Default meter coordinates - POSITIONED ON RIGHT SIDE
    var meter_x_offset = cam_width - 97;  // Right side (80 + 90 = 170 from right)
    var meter_y_offset = 85;  // Below healthbar
    var meter_width = 176;
    var meter_height = 14;
    
    // Room-specific adjustments
    switch(room_get_name(room)) {
        case "rm_sunny_stage":
            meter_x_offset = cam_width - 72;  // Right side (60 + 67 = 127 from right)
            meter_y_offset = 85;
            meter_width = 132;
            meter_height = 13;
            break;
			
			case "rm_konoha_stage":
            meter_x_offset = cam_width - 72;  // Right side (60 + 67 = 127 from right)
            meter_y_offset = 85;
            meter_width = 132;
            meter_height = 13;
            break;
        
        // Add more rooms as needed
    }
    
    // Calculate positions
    var meter_x = cam_x + meter_x_offset;
    var meter_y = cam_y + meter_y_offset;
    
    // Background bar (gray) - BACKWARD for Player 2
    draw_set_color(c_gray);
    draw_rectangle(meter_x, meter_y, 
                   meter_x - meter_width, meter_y + meter_height, false);  // Note: meter_x - meter_width
    
    // Filled portion (blue) - scale from 0-50 to 0-meter_width pixels, BACKWARD
    draw_set_color(c_blue);
    var fill_width = (player2.special_move_meter / 100) * meter_width;
    fill_width = clamp(fill_width, 0, meter_width);
    
    // Draw filled portion BACKWARD (draining left)
    draw_rectangle(meter_x, meter_y, 
                   meter_x - fill_width, meter_y + meter_height, false);  // Note: meter_x - fill_width
}


// Special_movebar2 for Player 2
if (player2 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Get camera width for right-side positioning
    var cam_width = camera_get_view_width(camera_get_active());
    
    // Default coordinates for meter2 - POSITIONED ON RIGHT SIDE
    var meter2_x_offset = cam_width - 90;  // Right side (75 + 86 = 161 from right)
    var meter2_y_offset = 100;
    var meter2_width = 173;
    var meter2_height = 14;
    
    // Room-specific adjustments
    switch(room_get_name(room)) {
        case "rm_sunny_stage":
            meter2_x_offset = cam_width - 67;  // Right side (55 + 65 = 120 from right)
            meter2_y_offset = 99;
            meter2_width = 132;
            meter2_height = 15;
            break;
			
			case "rm_konoha_stage":
            meter2_x_offset = cam_width - 67;  // Right side (55 + 65 = 120 from right)
            meter2_y_offset = 99;
            meter2_width = 132;
            meter2_height = 15;
            break;
    }
    
    // Calculate positions
    var meter2_x = cam_x + meter2_x_offset;
    var meter2_y = cam_y + meter2_y_offset;
    
    // Background bar (gray) - BACKWARD for Player 2
    draw_set_color(c_gray);
    draw_rectangle(meter2_x, meter2_y, 
                   meter2_x - meter2_width, meter2_y + meter2_height, false);  // Backward
    
    // Filled portion (yellow) - scale from 0-50 to 0-meter2_width pixels, BACKWARD
    draw_set_color(c_yellow);
    var fill_width2 = (player2.special_move_meter2 / 100) * meter2_width;
    fill_width2 = clamp(fill_width2, 0, meter2_width);
    
    // Draw filled portion BACKWARD (draining left)
    draw_rectangle(meter2_x, meter2_y, 
                   meter2_x - fill_width2, meter2_y + meter2_height, false);  // Backward
}



if (player2 != noone && camera_get_active() != -1) {
    // Check if transformation is active for Player 2
    if (player2.transformation1_active || player2.transformation2_active || player2.transformation3_active) {
        // Get camera view
        var cam_x = camera_get_view_x(camera_get_active());
        var cam_y = camera_get_view_y(camera_get_active());
        
        // Get camera width for right-side positioning
        var cam_width = camera_get_view_width(camera_get_active());
        
        // Default timer bar coordinates - POSITIONED ON RIGHT SIDE
        var timer_x = cam_x + (cam_width - 90);  // Right side (75 + 84 = 159 from right)
        var timer_y = cam_y + 40;
        var timer_width = 86;
        var timer_height = 14;
        
        // Room-specific adjustments
        switch(room_get_name(room)) {
            case "rm_sunny_stage":
                timer_x = cam_x + (cam_width - 67);  // Right side (55 + 64 = 119 from right)
                timer_y = cam_y + 40;
                timer_width = 66;
                timer_height = 13;
                break;
            
            case "rm_konoha_stage":
                timer_x = cam_x + (cam_width - 67);  // Right side (55 + 64 = 119 from right)
                timer_y = cam_y + 40;
                timer_width = 66;
                timer_height = 13;
                break;
        }
        
        // Draw timer background (gray) - BACKWARD for Player 2
        draw_set_color(c_gray);
        draw_rectangle(timer_x, timer_y, 
                       timer_x - timer_width, timer_y + timer_height, false);  // Backward
        
        // Draw filled portion (red) - scale transformation_timer, BACKWARD
        draw_set_color(c_red);
        var fill_width = (player2.transformation_timer / player2.transformation_duration) * timer_width;
        fill_width = clamp(fill_width, 0, timer_width);
        
        // Draw filled portion BACKWARD (draining left)
        draw_rectangle(timer_x, timer_y, 
                       timer_x - fill_width, timer_y + timer_height, false);  // Backward
    }
}

if (player2 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Get camera width for right-side positioning
    var cam_width = camera_get_view_width(camera_get_active());
    
    // Default coordinates for ultimate meter - POSITIONED ON RIGHT SIDE
    var ult_x = cam_x + (cam_width - 83.5);  // Right side (68 + 167 = 235 from right)
    var ult_y = cam_y + 118;
    var ult_width = 168;
    var ult_height = 14;
    
    // Room-specific adjustments
    switch(room_get_name(room)) {
        case "rm_sunny_stage":
            ult_x = cam_x + (cam_width - 60);  // Right side (50 + 126 = 176 from right)
            ult_y = cam_y + 115;
            ult_width = 129;
            ult_height = 14;
            break;
			
			case "rm_konoha_stage":
            ult_x = cam_x + (cam_width - 60);  // Right side (50 + 126 = 176 from right)
            ult_y = cam_y + 115;
            ult_width = 129;
            ult_height = 14;
            break;
        
        
    }
    
    // Draw background (gray) - BACKWARD for Player 2
    draw_set_color(c_gray);
    draw_rectangle(ult_x, ult_y, 
                   ult_x - ult_width, ult_y + ult_height, false);  // Backward
    
    // Draw filled portion with color interpolation (horizontal), BACKWARD
    var meter_percent = player2.ultimate_move_meter / 100;
    var interpolated_color = merge_color(c_yellow, c_aqua, meter_percent);
    draw_set_color(interpolated_color);
    
    var bar_width = (player2.ultimate_move_meter / 100) * ult_width;
    bar_width = clamp(bar_width, 0, ult_width);
    
    // Draw filled portion BACKWARD (draining left)
    draw_rectangle(ult_x, ult_y, 
                   ult_x - bar_width, ult_y + ult_height, false);  // Backward
}

if (player2 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Get camera width for right-side positioning
    var cam_width = camera_get_view_width(camera_get_active());
    
    // Initialize variables
    var portrait_x = 0;
    var portrait_y = 0;
    var portrait_scale = 1;
    var portrait_sprite = -1;
    var portrait_elongate = 1.0;
    var position_set = false;
    
    // ROOM-SPECIFIC POSITIONS ONLY - RIGHT SIDE
    var room_name = room_get_name(room);
    
    // room1 positions - RIGHT SIDE
    if (room_name == "Room1") {
        position_set = true;
        switch(player2.character) {
            case CHAR_FIGHTER:
                portrait_x = cam_x + (cam_width - 30);
                portrait_y = cam_y + 39;
                portrait_scale = 1.0;
                portrait_sprite = luffy_port;
                portrait_elongate = 1.2;
                break;
            case CHAR_SAMURAI:
                portrait_x = cam_x + (cam_width - 30);
                portrait_y = cam_y + 39;
                portrait_scale = 1.0;
                portrait_sprite = zoro_port2;
                portrait_elongate = 1.1;
                break;
            case CHAR_COOK:
                portrait_x = cam_x + (cam_width - 30);
                portrait_y = cam_y + 30;
                portrait_scale = 1.0;
                portrait_sprite = sanji_port2;
                portrait_elongate = 1.1;
                break;
            case CHAR_WINDNINJA:
                portrait_x = cam_x + (cam_width - 23);
                portrait_y = cam_y + 38;
                portrait_scale = 1.1;
                portrait_sprite = naruto_port2;
                portrait_elongate = 1.2;
                break;
            case CHAR_LIGHTNINGNINJA:
                portrait_x = cam_x + (cam_width - 24);
                portrait_y = cam_y + 35;
                portrait_scale = 1.1;
                portrait_sprite = sasuke_port2;
                portrait_elongate = 1.25;
                break;
        }
    }
    // rm_sunny_stage positions - RIGHT SIDE
    else if (room_name == "rm_sunny_stage") {
        position_set = true;
        switch(player2.character) {
            case CHAR_FIGHTER:
                portrait_x = cam_x + (cam_width - 20);
                portrait_y = cam_y + 44;
                portrait_scale = .86;
                portrait_sprite = luffy_port;
                portrait_elongate = 1.25;
                break;
            case CHAR_SAMURAI:
                portrait_x = cam_x + (cam_width - 22);
                portrait_y = cam_y + 38;
                portrait_scale = .88;
                portrait_sprite = zoro_port2;
                portrait_elongate = 1.25;
                break;
            case CHAR_COOK:
                portrait_x = cam_x + (cam_width - 15);
                portrait_y = cam_y + 29;
                portrait_scale = .95;
                portrait_sprite = sanji_port2;
                portrait_elongate = 1.1;
                break;
            case CHAR_WINDNINJA:
                portrait_x = cam_x + (cam_width - 13);
                portrait_y = cam_y + 34;
                portrait_scale = .95;
                portrait_sprite = naruto_port;
                portrait_elongate = 1.4;
                break;
            case CHAR_LIGHTNINGNINJA:
                portrait_x = cam_x + (cam_width - 17);
                portrait_y = cam_y + 29;
                portrait_scale = .9;
                portrait_sprite = sasuke_port2;
                portrait_elongate = 1.6;
                break;
        }
    }
	else if (room_name == "rm_konoha_stage") {
        position_set = true;
        switch(player2.character) {
            case CHAR_FIGHTER:
                portrait_x = cam_x + (cam_width - 20);
                portrait_y = cam_y + 44;
                portrait_scale = .86;
                portrait_sprite = luffy_port;
                portrait_elongate = 1.25;
                break;
            case CHAR_SAMURAI:
                portrait_x = cam_x + (cam_width - 22);
                portrait_y = cam_y + 38;
                portrait_scale = .88;
                portrait_sprite = zoro_port2;
                portrait_elongate = 1.25;
                break;
            case CHAR_COOK:
                portrait_x = cam_x + (cam_width - 15);
                portrait_y = cam_y + 29;
                portrait_scale = .95;
                portrait_sprite = sanji_port2;
                portrait_elongate = 1.1;
                break;
            case CHAR_WINDNINJA:
                portrait_x = cam_x + (cam_width - 13);
                portrait_y = cam_y + 34;
                portrait_scale = .95;
                portrait_sprite = naruto_port;
                portrait_elongate = 1.4;
                break;
            case CHAR_LIGHTNINGNINJA:
                portrait_x = cam_x + (cam_width - 17);
                portrait_y = cam_y + 29;
                portrait_scale = .9;
                portrait_sprite = sasuke_port2;
                portrait_elongate = 1.6;
                break;
        }
    }
    
    if (position_set && portrait_sprite != -1 && sprite_exists(portrait_sprite)) {
        // Calculate different X and Y scales for elongation
        var scale_x = portrait_scale;
        var scale_y = portrait_scale * portrait_elongate;
        
        // Draw inverted (facing opposite direction)
        // Negative scale_x flips horizontally, keeps same scale values
        draw_sprite_ext(portrait_sprite, 0, 
                       portrait_x, portrait_y, 
                       -scale_x, scale_y,  // NEGATIVE scale_x for inversion
                       0, c_white, 1);
    }
}