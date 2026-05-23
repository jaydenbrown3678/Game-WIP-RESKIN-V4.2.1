// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Charge() {
    // Add this check at the very start for both player and CPU
    if (transformation1_active || transformation2_active || transformation3_active) return;
    
    if (is_cpu) {
        // Only handle charging if already in charge state
        if (state == STATE_CHARGE) {
            // Change sprite when meter2 is <= 50
            sprite_index = (special_move_meter2 <= 50) ? sp_charge2 : sp_charge;
            
            // Charge meter 1 first (slower)
            if (special_move_meter < 100) {  // CHANGED: 50 → 100
                special_move_meter = min(special_move_meter + 0.3, 100); // CHANGED: 0.2 → 0.4, 50 → 100
            }
            
            // Charge meter 2 (special move 2) - NOW 0-100 scale
            if (special_move_meter2 < 100) {  // CHANGED: 50 → 100
                special_move_meter2 = min(special_move_meter2 + 0.3, 100); // CHANGED: 0.4 → 0.8, 50 → 100
            }
            
            // CHARGE TRANSFORMATION 3 - REMOVED special_move4_meter check
            if (special_move_meter2 >= 100 && ultimate_move_meter < 100) {  // CHANGED: 50 → 100, removed special_move4_meter
                ultimate_move_meter = min(ultimate_move_meter + 0.4, 100);
                if (ultimate_move_meter > 10) sprite_index = sp_charge3;
            }
            
            if (special_move_meter2 >= 100 && ultimate_move_meter >= 100) {  // CHANGED: 50 → 100, removed special_move4_meter
                sprite_index = sp_charge3;
                state = STATE_FREE;
            }
        }
    }
    else {
        // [Original player code with transformation3 added]
        if (keyboard_check(charge_key)) {
            // Change sprite when meter2 is <= 50
            sprite_index = (special_move_meter2 >= 50) ? sp_charge2 : sp_charge;  // KEEP 50 condition for sprite change
            
            // Charge meter 1 first (slower) - NOW 0-100 scale
            if (special_move_meter < 100) {  // CHANGED: 50 → 100
                special_move_meter += .23; // CHANGED: .18 → .36 for 0-100 scale
                if (special_move_meter > 100) special_move_meter = 100;  // CHANGED: 50 → 100
            }
            
            // Charge meter 2 (special move 2) - NOW 0-100 scale
            if (special_move_meter2 < 100) {  // CHANGED: 50 → 100
                special_move_meter2 += .34;  // CHANGED: .4 → .8 for 0-100 scale
                if (special_move_meter2 > 100) special_move_meter2 = 100;  // CHANGED: 50 → 100
            }
            
            // CHARGE TRANSFORMATION 3 - REMOVED special_move4_meter check
            else if (ultimate_move_meter < 100) {
                ultimate_move_meter += .4;
                if (ultimate_move_meter > 100) ultimate_move_meter = 100;
                if (ultimate_move_meter > 10) sprite_index = sp_charge3;
            }
            else if (ultimate_move_meter >= 100) {
                sprite_index = sp_charge3;
            }
            
            state = STATE_CHARGE;
        } else if (state == STATE_CHARGE) {
            state = STATE_FREE;
        }
    }
    
    // Update ready flags for all meters
    if (special_move_meter >= 50) special_move_ready = true;  // KEEP 50 for ATK_4
    if (special_move_meter >= 100) special_move3_ready = true;  // ADDED: 100 for ATK_9
    if (special_move_meter2 >= 50) special_move2_ready = true;  // KEEP 50 for transformation 1
    if (special_move_meter2 >= 100) special_move4_ready = true;  // CHANGED: Now uses meter2, 100 for transformation 2
    if (ultimate_move_meter >= 100) ultimate_move_ready = true;
}