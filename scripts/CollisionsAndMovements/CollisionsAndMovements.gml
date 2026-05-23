// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*
function CollisionsAndMovements(){
	vspd += grv;
	
	if place_meeting(x + hspd, y, obj_solid) {
		while !place_meeting(x+sign(hspd), y, obj_solid) {
			x += sign(hspd);
		}
		hspd = 0;
	}
	
	landed = place_meeting(x, y+vspd, obj_solid)
	if place_meeting(x, y+vspd, obj_solid) {
		while !place_meeting(x, y+sign(vspd), obj_solid) {
			y += sign(hspd);
		}
		vspd = 0;
	}
	
	x += hspd;
	y += vspd;
}
*/


function CollisionsAndMovements() {
    // Apply gravity if not dashing (UNCHANGED)
    if (state != STATE_DASH) {
        vspd += grv;
    }

    // Check for collision with obj_solid (UNCHANGED)
    if (place_meeting(x + hspd, y, obj_solid)) {
        if (state == STATE_DASH) {
            EndDash(); // End the dash if colliding with a solid object
        }
        hspd = 0;
    }

    // IMPROVED: Handle collisions with obj_platform
    if (state != STATE_DASH) {
        
        // Vertical collision with obj_platform - IMPROVED  
        if (vspd != 0) {
            var _steps = abs(vspd);
            var _step = sign(vspd);
            var _hit_platform = false;
            
            for (var i = 0; i < _steps; i++) {
    if (!place_meeting(x, y + _step, obj_platform) && !place_meeting(x, y + _step, obj_platform_2)) {
        y += _step;
    } else {
        _hit_platform = true;
        break;
    }
}

if (_hit_platform) {
    // Gentle push-out from platform
    while (!place_meeting(x, y + sign(_step), obj_platform) && !place_meeting(x, y + sign(_step), obj_platform_2)) {
        y += sign(_step);
    }
    
    // Landing detection
    if (_step > 0) {
        landed = true;
        // Final position adjustment to sit on platform
        while (place_meeting(x, y, obj_platform) || place_meeting(x, y, obj_platform_2)) {
            y -= 1;
        }
    }
    vspd = 0;
} else {
                //landed = false;
            }
        }
    }

    // Apply remaining horizontal movement (UNCHANGED)
    x += hspd;

    // Only update Y position if not dashing (UNCHANGED)
    if (state != STATE_DASH) {
        y += vspd;
    }
}