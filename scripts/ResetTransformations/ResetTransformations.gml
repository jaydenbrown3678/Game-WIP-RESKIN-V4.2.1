// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResetTransformations(exclude = -1) {
    // Reset all transformation flags
    transformation1_active = false;
    transformation1_on = false;
    transformation2_active = false;
    transformation2_on = false;
    transformation3_active = false;
    transformation3_on = false;
    
    // Optional: Reset timers too
    // transformation_timer = 0;
    
    // If you want to keep one specific transformation
    switch(exclude) {
        case 1:
            transformation1_active = true;
            transformation1_on = true;
            break;
        case 2:
            transformation2_active = true;
            transformation2_on = true;
            break;
        case 3:
            transformation3_active = true;
            transformation3_on = true;
            break;
    }
}