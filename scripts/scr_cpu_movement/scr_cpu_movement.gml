// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @description Returns attack type based on situation
/// @return attack_type (ATK_1 through ATK_9)
/// @description Chooses attack based on weighted probabilities

function scr_cpu_movement() {
    
    
    // Calculate distance here so it's available everywhere
    var _dist = point_distance(x, y, opponent.x, opponent.y);
    var _xdir = sign(opponent.x - x);
    
    // 2. Movement Decision - KEEP COMMENT
    cpu_move_timer--;
    if (cpu_move_timer <= 0) {
        // Make sure this exists to control movement:
        right = (_xdir > 0); // Simulate right key
        left = (_xdir < 0);  // Simulate left key

        // LONG RANGE BEHAVIOR (>3x optimal range) - KEEP COMMENT
        if (_dist > cpu_optimal_range * 3.0) {
            if (random(1) < cpu_aggression) {
                cpu_hspd = MOVE_SPD * _xdir;
            }
        } 
        
        // CLOSE RANGE BEHAVIOR (<1x optimal range) - KEEP COMMENT
        else if (_dist < cpu_optimal_range * 1.0) {
            if (random(1) < 0.7) cpu_hspd = MOVE_SPD * -_xdir;
        }
        
        if (is_cpu && opponent.is_cpu) {
            if (_dist < 40) {
                var _push_dir = sign(x - opponent.x);
                cpu_hspd = (MOVE_SPD * 0.8) * _push_dir;
                x += cpu_hspd;
                return;
            }
        }

        // MID RANGE FOOTSIES (1x-3x optimal range) - KEEP COMMENT
        else if (random(1) < 0.4) {
            cpu_hspd = MOVE_SPD * choose(-1, 0, 1);
        }
        
        // Reset decision timer with random duration - KEEP COMMENT
        cpu_move_timer = irandom_range(10, 20);
    }

    // NORMAL JUMP LOGIC (restored) - KEEP COMMENT
    if (landed) {
        var _is_moving = (abs(cpu_hspd) > 0);
        if (_is_moving && random(1) < (0.01 + (cpu_movement_style * 0.15))) {
            vspd = JUMP_FORCE;
            landed = false;
            has_double_jumped = false;
            cpu_move_timer = irandom_range(60, 90);
        }
    }
    
    // Dash initiation (forward only) - KEEP COMMENT
    if (_dist >= 100 && landed && random(1) < (0.01 + (cpu_difficulty * 0.05))) {
        var dash_dir = sign(opponent.x - x);
        if (dash_dir != 0) {
            is_dashing = true;
            dash_start_x = x;
            dash_start_y = y;
            dash_target_x = x + (100 * dash_dir);
            hspd = DASH_SPD * dash_dir;
            state = STATE_DASH;
            sprite_index = sp_dashfwd;
            if (debug_mode) instance_create_layer(x, y-50, "Debug", obj_debug_text).text = "DASH INIT";
            return;
        }
    }
    
    // 4. Apply Movement - KEEP COMMENT
    x += cpu_hspd;
    cpu_attack_cooldown--;
}