// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @description Handles all CPU movement/attack decisions in FREE state
function scr_cpu_free_state() {
    // Cooldown management (UNCHANGED)
    cpu_attack_cooldown--;
    if (cpu_attack_cooldown > 0) {
        scr_cpu_movement(); // Default movement
        return;
    }

    // BLOCK CHECK - Put this before attack decisions (UNCHANGED)
    if (opponent.state == STATE_ATTACK && 
        opponent.sprite_index != sp_idle && 
        random(1) < (0.3 + (cpu_difficulty * 0.2))) {
        
        state = STATE_BLOCK;
        sprite_index = sp_shield;
        cpu_attack_cooldown = 45 - (cpu_difficulty * 15);
        return;
    }

    // NEW: Transformation movement override
    if (transformation1_active && random(1) < 0.5) {
        var _xdir = sign(opponent.x - x);
        cpu_hspd = MOVE_SPD * 1.5 * _xdir;
        x += cpu_hspd;
    }

    // Original attack decision (UNCHANGED)
    if (random(1) < (0.15 + (cpu_difficulty * 0.2))) {
        var _dist = point_distance(x, y, opponent.x, opponent.y);
        var _probs = cpu_attack_profiles[character][cpu_difficulty];
        var _roll = random(1);
        var _cumulative = 0;
        
        for (var i = 0; i < 9; i++) {
            if ((i == ATK_4 && !special_move_ready) || (i == ATK_9 && !special_move3_ready)) continue;
            if (i == ATK_4 && special_move_ready && random(1) < 0.7) continue;
            if (i == ATK_9 && special_move3_ready && random(1) < 0.6) continue;
            
            _cumulative += _probs[i];
            if (_roll <= _cumulative) {
                cpu_current_attack = i;
                break;
            }
        }

        if (_dist < get_attack_range(cpu_current_attack)) {
            atk_type = cpu_current_attack;
            state = STATE_ATTACK;
            can_attack = true;
            cpu_attack_cooldown = irandom_range(30, 60);
        } else {
            var _xdir = sign(opponent.x - x);
            cpu_hspd = (transformation1_active ? MOVE_SPD * 1.5 : MOVE_SPD) * _xdir;
            x += cpu_hspd;
        }
    } 

    // CHARGE BEHAVIOR (UNCHANGED)
    if (special_move_meter2 < 50 && 
        state != STATE_CHARGE && 
        random(1) < (0.0009 + (cpu_difficulty * 0.01))) {
        
        state = STATE_CHARGE;
        cpu_charge_timer = room_speed * (1 + cpu_difficulty);
        return;
    }

    // TRANSFORMATION HANDLING (UNCHANGED)
    if (special_move2_ready && !transformation1_active) {
        sprite_index = sp_transform1;
        state = STATE_SPECIAL2;
        special_move2_ready = false;
        transformation1_active = true;
        transformation1_on = true;
        trans_1_timer = 0;
    }

    // METER DRAIN (UNCHANGED)
    if (transformation1_active) {
        trans_1_timer++;
        if (trans_1_timer >= 60) {
            trans_1_timer = 0;
            special_move_meter2 -= 2;
           
            if (special_move_meter2 <= 0) {
                special_move_meter2 = 0;
                transformation1_active = false;
                transformation1_on = false;
                if (state == STATE_FREE && hspd == 0) {
                    sprite_index = sp_idle;
                }
                else {
                    sprite_index = (vspd > 0) ? sp_fall : sp_jump;
                }
            }
        }
    }
	
// JUMP LOGIC - Add this right before the default movement call
    if (landed && !opponent.landed) {
        var jump_chance = 0.01 + (cpu_movement_style * 0.15);
        
        // Increased jump chance during transformation
        if (transformation1_active) {
            jump_chance *= 1.5; // 50% more likely to jump when transformed
        }
        
        if (random(1) < jump_chance) {
            vspd = JUMP_FORCE;
            landed = false;
            has_double_jumped = false;
            
            // Higher jumps during transformation
            if (transformation1_active) {
                vspd *= 1.2; // 20% higher jumps
            }
            
            cpu_move_timer = irandom_range(60, 90);
        }
    }
    
    // Default movement (UNCHANGED)
    scr_cpu_movement();
}