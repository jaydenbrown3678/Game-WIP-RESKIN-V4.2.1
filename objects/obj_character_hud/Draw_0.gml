/// @description Insert description here
// You can write your code in this editor
// In obj_character_hud Draw Event
var player1 = instance_find(obj_player1, 0);

if (player1 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Default coordinates
    var bar_x_offset = 80;
    var bar_y_offset = 57;
    var bar_width = 210;
    var bar_height = 25;
    
    // Adjust for specific rooms
    switch(room_get_name(room)) {
        case "rm_sunny_stage":
            bar_x_offset = 60;  // Different X for sunny stage
            bar_y_offset = 57;   // Different Y for sunny stage
            bar_width = 160;     // Different width if needed
            bar_height = 28;     // Different height if needed
            break;
			
			case "rm_konoha_stage":
            bar_x_offset = 60;  // Different X for sunny stage
            bar_y_offset = 57;   // Different Y for sunny stage
            bar_width = 160;     // Different width if needed
            bar_height = 28;     // Different height if needed
            break;
        
        // Add more rooms as needed
    }
    
    // Calculate positions
    var bar_x = cam_x + bar_x_offset;
    var bar_y = cam_y + bar_y_offset;
    
    draw_healthbar(bar_x, bar_y, 
                   bar_x + bar_width, bar_y + bar_height, 
                   player1.character_hp, 
                   c_dkgray, c_red, c_lime, 0, true, true);
}


//Special_movebar
if (player1 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Default meter coordinates
    var meter_x_offset = 80;
    var meter_y_offset = 85;  // Below healthbar
    var meter_width = 174;
    var meter_height = 15;
    
    // Room-specific adjustments
    switch(room_get_name(room)) {
        case "rm_sunny_stage":
            meter_x_offset = 60;
            meter_y_offset = 85;  // 70 + 28 + 0 = 98
            meter_width = 131;
            meter_height = 14;
            break;
			
			case "rm_konoha_stage":
            meter_x_offset = 60;
            meter_y_offset = 85;  // 70 + 28 + 0 = 98
            meter_width = 131;
            meter_height = 14;
            break;
        
    
            
        // Add more rooms as needed
    }
    
    // Calculate positions
    var meter_x = cam_x + meter_x_offset;
    var meter_y = cam_y + meter_y_offset;
    
    // Background bar (gray)
    draw_set_color(c_gray);
    draw_rectangle(meter_x, meter_y, 
                   meter_x + meter_width, meter_y + meter_height, false);
    
    // Filled portion (blue) - scale from 0-50 to 0-meter_width pixels
    draw_set_color(c_blue);
    var fill_width = (player1.special_move_meter / 100) * meter_width;
    fill_width = clamp(fill_width, 0, meter_width); // Ensure doesn't exceed max
    
    draw_rectangle(meter_x, meter_y, 
                   meter_x + fill_width, meter_y + meter_height, false);
    
}

//Special_movebar2

if (player1 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Default coordinates for meter2
    var meter2_x_offset = 75;
    var meter2_y_offset = 101;  // Above healthbar (57 - 12 = 45)
    var meter2_width = 172;
    var meter2_height = 14;
    
    // Room-specific adjustments
    switch(room_get_name(room)) {
        case "rm_sunny_stage":
            meter2_x_offset = 55;
            meter2_y_offset = 100;
            meter2_width = 130;
            meter2_height = 15;
            break;
			
			case "rm_konoha_stage":
            meter2_x_offset = 55;
            meter2_y_offset = 100;
            meter2_width = 130;
            meter2_height = 15;
            break;
        
    }
    
    // Calculate positions
    var meter2_x = cam_x + meter2_x_offset;
    var meter2_y = cam_y + meter2_y_offset;
    
    // Background bar (gray)
    draw_set_color(c_gray);
    draw_rectangle(meter2_x, meter2_y, 
                   meter2_x + meter2_width, meter2_y + meter2_height, false);
    
    // Filled portion (yellow) - scale from 0-50 to 0-meter2_width pixels
    draw_set_color(c_yellow);
    var fill_width2 = (player1.special_move_meter2 / 100) * meter2_width;
    fill_width2 = clamp(fill_width2, 0, meter2_width);
    
    draw_rectangle(meter2_x, meter2_y, 
                   meter2_x + fill_width2, meter2_y + meter2_height, false);
}





if (player1 != noone && camera_get_active() != -1) {
    // Check if transformation is active
    if (player1.transformation1_active || player1.transformation2_active || player1.transformation3_active) {
        // Get camera view
        var cam_x = camera_get_view_x(camera_get_active());
        var cam_y = camera_get_view_y(camera_get_active());
        
        // Default timer bar coordinates (adjust as needed)
        var timer_x = cam_x + 75;
        var timer_y = cam_y + 40;  // Below other meters
        var timer_width = 84;
        var timer_height = 14;
        
        // Room-specific adjustments
        switch(room_get_name(room)) {
            case "rm_sunny_stage":
                timer_x = cam_x + 55;
                timer_y = cam_y + 40;  // 132 + 15 = 147
                timer_width = 64;
                timer_height = 13;
                break;
            
            case "rm_konoha_stage":
                timer_x = cam_x + 55;
                timer_y = cam_y + 40;  // 132 + 15 = 147
                timer_width = 64;
                timer_height = 13;
                break;
        }
        
        // Draw timer background (gray)
        draw_set_color(c_gray);
        draw_rectangle(timer_x, timer_y, 
                       timer_x + timer_width, timer_y + timer_height, false);
        
        // Draw filled portion (red) - scale transformation_timer
        draw_set_color(c_red);
        var fill_width = (player1.transformation_timer / player1.transformation_duration) * timer_width;
        fill_width = clamp(fill_width, 0, timer_width);
        
        draw_rectangle(timer_x, timer_y, 
                       timer_x + fill_width, timer_y + timer_height, false);
        
        
    }
}

if (player1 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // Default coordinates for ultimate meter (horizontal)
    var ult_x = cam_x + 68;
    var ult_y = cam_y + 118;  // Below timer bar (adjust as needed)
    var ult_width =167;
    var ult_height = 14;
    
    // Room-specific adjustments
    switch(room_get_name(room)) {
        case "rm_sunny_stage":
            ult_x = cam_x + 50;
            ult_y = cam_y + 115;  // 147 + 14 + 3 = 164
            ult_width = 126;
            ult_height = 14;
            break;
        
        case "rm_konoha_stage":
            ult_x = cam_x + 50;
            ult_y = cam_y + 115;  // 147 + 14 + 3 = 164
            ult_width = 126;
            ult_height = 14;
            break;
    }
    
    // Draw background (gray)
    draw_set_color(c_gray);
    draw_rectangle(ult_x, ult_y, 
                   ult_x + ult_width, ult_y + ult_height, false);
    
    // Draw filled portion with color interpolation (horizontal)
    var meter_percent = player1.ultimate_move_meter / 100;
    var interpolated_color = merge_color(c_yellow, c_aqua, meter_percent);
    draw_set_color(interpolated_color);
    
    var bar_width = (player1.ultimate_move_meter / 100) * ult_width;
    bar_width = clamp(bar_width, 0, ult_width);
    
    draw_rectangle(ult_x, ult_y, 
                   ult_x + bar_width, ult_y + ult_height, false);
    
}



// In obj_character_hud Draw Event

if (player1 != noone && camera_get_active() != -1) {
    // Get camera view
    var cam_x = camera_get_view_x(camera_get_active());
    var cam_y = camera_get_view_y(camera_get_active());
    
    // NO DEFAULTS - Must be set in each room case
    var portrait_x, portrait_y, portrait_scale, portrait_sprite;
    var position_set = false;
	
	// Variables - INITIALIZE ALL
    var portrait_x = 0;
    var portrait_y = 0;
    var portrait_scale = 1;
    var portrait_sprite = -1;
    var portrait_elongate = 1.0;  // INITIALIZE - default normal proportions
    var position_set = false;
    
    // ROOM-SPECIFIC POSITIONS ONLY
    var room_name = room_get_name(room);
    
    // room1 positions
    if (room_name == "Room1") {
        position_set = true;
        switch(player1.character) {
            case CHAR_FIGHTER:
                portrait_x = cam_x + 15;
                portrait_y = cam_y + 39;
                portrait_scale = 1.0;
                portrait_sprite = luffy_port;
				portrait_elongate = 1.2; 
                break;
            case CHAR_SAMURAI:
                portrait_x = cam_x + 18;
                portrait_y = cam_y + 49;
                portrait_scale = 1.01;
                portrait_sprite = zoro_port;
				portrait_elongate = 1.0;
                break;
				case CHAR_COOK:
                portrait_x = cam_x + 18;
                portrait_y = cam_y + 25;
                portrait_scale = 1.25;
                portrait_sprite = sanji_port;
				portrait_elongate = 1.1;
                break;
				case CHAR_WINDNINJA:
                portrait_x = cam_x + 5;
                portrait_y = cam_y + 33.5;
                portrait_scale = 1.15;
                portrait_sprite = naruto_port;
				portrait_elongate = 1.2;
                break;
				case CHAR_LIGHTNINGNINJA:
                portrait_x = cam_x + 10;
                portrait_y = cam_y + 22;
                portrait_scale = 1.10;
                portrait_sprite = sasuke_port;
				portrait_elongate = 1.45;
                break;
        }
    }
    // rm_sunny_stage positions
    else if (room_name == "rm_sunny_stage") {
        position_set = true;
        switch(player1.character) {
            case CHAR_FIGHTER:
                portrait_x = cam_x +10;
                portrait_y = cam_y + 46;
                portrait_scale = .85;
                portrait_sprite = luffy_port;
				portrait_elongate = 1.25;
                break;
            case CHAR_SAMURAI:
                portrait_x = cam_x + 9;
                portrait_y = cam_y + 42;
                portrait_scale = .878;
                portrait_sprite = zoro_port;
				portrait_elongate = 1.25;
                break;
				case CHAR_COOK:
                portrait_x = cam_x + 10;
                portrait_y = cam_y + 35;
                portrait_scale = 1.10;
                portrait_sprite = sanji_port;
				portrait_elongate = 1.1;
                break;
				case CHAR_WINDNINJA:
                portrait_x = cam_x + 2;
                portrait_y = cam_y + 34;
                portrait_scale = .95;
                portrait_sprite = naruto_port;
				portrait_elongate = 1.4;
                break;
				case CHAR_LIGHTNINGNINJA:
                portrait_x = cam_x + 5;
                portrait_y = cam_y + 25;
                portrait_scale = .9;
                portrait_sprite = sasuke_port;
				portrait_elongate = 1.7;
                break;
        }
	}
		 else if (room_name == "rm_konoha_stage") {
        position_set = true;
        switch(player1.character) {
            case CHAR_FIGHTER:
                portrait_x = cam_x +10;
                portrait_y = cam_y + 46;
                portrait_scale = .85;
                portrait_sprite = luffy_port;
				portrait_elongate = 1.25;
                break;
            case CHAR_SAMURAI:
                portrait_x = cam_x + 9;
                portrait_y = cam_y + 42;
                portrait_scale = .878;
                portrait_sprite = zoro_port;
				portrait_elongate = 1.25;
                break;
				case CHAR_COOK:
                portrait_x = cam_x + 10;
                portrait_y = cam_y + 35;
                portrait_scale = 1.10;
                portrait_sprite = sanji_port;
				portrait_elongate = 1.1;
                break;
				case CHAR_WINDNINJA:
                portrait_x = cam_x + 2;
                portrait_y = cam_y + 34;
                portrait_scale = .95;
                portrait_sprite = naruto_port;
				portrait_elongate = 1.4;
                break;
				case CHAR_LIGHTNINGNINJA:
                portrait_x = cam_x + 5;
                portrait_y = cam_y + 25;
                portrait_scale = .9;
                portrait_sprite = sasuke_port;
				portrait_elongate = 1.7;
                break;
        }
    }
    
    if (position_set && portrait_sprite != -1 && sprite_exists(portrait_sprite)) {
        // Calculate different X and Y scales for elongation
        var scale_x = portrait_scale;
        var scale_y = portrait_scale * portrait_elongate;
        
        draw_sprite_ext(portrait_sprite, 0, 
                       portrait_x, portrait_y, 
                       scale_x, scale_y,  // Different X and Y scale
                       0, c_white, 1);
        
        }
}