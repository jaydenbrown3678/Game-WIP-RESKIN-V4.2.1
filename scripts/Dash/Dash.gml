// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Dash() {
    if (is_cpu) {
        // CPU DASH LOGIC
        // -----------------------------------------------------------------
        if (is_dashing && state == STATE_DASH) {
            // Apply dash movement
            x += hspd;

            // Check if dash distance completed (50 pixels)
            if (abs(x - dash_start_x) >= 100) {
                // Clean up dash state
                hspd = 0;
                is_dashing = false;
                state = STATE_FREE;
                
                // Snap to exact target position
                x = dash_target_x;
                
                // Force proper animation transition
                if (landed) {
                    sprite_index = transformation1_active ? sp_trans1_idle : sp_idle;
                } else {
                    sprite_index = (vspd > 0) ? sp_fall : sp_jump;
                }
            }
        }
    }
    else {
        // PLAYER DASH LOGIC (KEEP EXACTLY AS IS)
        // -----------------------------------------------------------------
        if (keyboard_check_pressed(dash_key)) {
            // Allow dash in the air if not already dashed
            if (!landed && has_dashed_in_air) {
                return; // Exit if already dashed in the air
            }

            // Set the dash state
            state = STATE_DASH;

            // Determine dash direction based on current movement (hspd)
            var dash_direction = sign(hspd); // Use the sign of hspd to determine direction
            if (dash_direction == 0) { // If not moving, default to facing direction
                dash_direction = image_xscale;
            }
			
			if(transformation1_active){
				var dash_speed = MOVE_SPD * 4 * dash_direction;
			}
			else {

            // Calculate dash speed (2x movement speed)
            var dash_speed = MOVE_SPD * 2 * dash_direction; // Use dash_direction to determine speed
				
			}
			
            // Set horizontal speed for the dash
            hspd = dash_speed;

            // Record the exact starting position for the dash
            dash_start_x = x; // Initialize dash from the exact character position
            dash_start_y = y; // Record the exact y-position at the start of the dash
            dash_target_x = x + (150 * dash_direction); // Calculate the target position (50 pixels away)

            // Set the correct dash animation based on direction
            if (dash_direction == image_xscale) {
                sprite_index = sp_dashfwd; // Forward dash
            } else {
                sprite_index = sp_dashbwd; // Backward dash
            }

            // Mark dash as used if in the air
            if (!landed) {
                has_dashed_in_air = true;
            }
        }
    }
}