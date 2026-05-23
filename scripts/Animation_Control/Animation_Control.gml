// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


/*
function Animation_Control(){
	switch (state) {
		case STATE_FREE:
			if landed {
				if !shield {
					if hspd == 0
						SetSprite(sp_idle)
					else
						sprite_index = (sign(hspd) == sign(image_xscale))?sp_run:sp_walk
			} else { //shield animation
				if !SetSprite(sp_shield)
				 FreezeLastFrame()
			}
			} else {// in the air
				if vspd > 0
					SetSprite(sp_fall)
				else
					SetSprite(sp_jump)
			}
	break
	
	case STATE_ATTACK:
		if !can_attack
			exit
		
		if landed {
			if shield
				SetSprite(sp_shield)
			else
				SetSprite(sp_attack[atk_type])
		} else {
			SetSprite(sp_attack[atk_type])
		}
		
		can_attack = false
	break
	
	case STATE_DEATH:
		if (player1.hp = 0 || player2.hp = 0)
		{
			SetSprite(sp_death)
			FreezeLastFrame()
		}
		else
		{
			SetSprite(sp_death)
			FreezeLastFrame()
		}
	break
	
	case STATE_HURT:
		if landed {
			if !shield {
				SetSprite(sp_hurt)
			} else { // in air
				SetSprite(sp_hurt)
			}
	break
		}
				
	}

}
*/

function Animation_Control() {
    switch (state) {
        case STATE_FREE:
    if (landed) {
        if (!shield) {
            // Handle both human and CPU movement animations
            var current_hspd = is_cpu ? cpu_hspd : hspd; // Get appropriate speed value
            
            if (current_hspd == 0) {
    if (is_cpu) {
    SetSprite(transformation1_active ? sp_trans1_idle : (transformation2_active ? sp_trans2_idle : (transformation3_active ? sp_trans3_idle : sp_idle)));
} else {
    SetSprite(transformation1_active ? sp_trans1_idle : (transformation2_active ? sp_trans2_idle : (transformation3_active ? sp_trans3_idle : sp_idle)));
	}
} else {
                // MOVEMENT ANIMATIONS
                var moving_forward = (sign(current_hspd) == sign(image_xscale));
				
                
                // TRANSFORMED MOVEMENT - NEW CODE
                if (transformation1_active) {
				    sprite_index = moving_forward ? sp_trans1_run : sp_trans1_walk;
					
				}
				// TRANSFORMED MOVEMENT - NEW CODE
                else if (transformation2_active) {
				    sprite_index = moving_forward ? sp_trans2_run : sp_trans2_walk;
					
				}
				else if (transformation3_active) {
				    sprite_index = moving_forward ? sp_trans3_run : sp_trans3_walk;
					
				}
				
                // Keep existing Cook handling
                else if (character == CHAR_COOK) {
                    sprite_index = moving_forward ? 
                        (image_xscale == 1 ? cook_walk2 : cook_walk) : 
                        (image_xscale == 1 ? cook_run2 : cook_run);
                } else {
                    // Standard movement animations
                    sprite_index = moving_forward ? sp_run : sp_walk;
                }
            }
        } else {
            // Shield animation (human only, unless you add CPU shielding later)
            if (!SetSprite(sp_shield)) {
                FreezeLastFrame();
            }
        }
    } else {
    // Air animations (same for human and CPU)
    if (vspd > 0) {
        SetSprite(transformation1_active ? sp_trans1_jump : (transformation2_active ? sp_trans2_jump : (transformation3_active ? sp_trans3_jump : sp_fall)));
} else {
    SetSprite(transformation1_active ? sp_trans1_jump : (transformation2_active ? sp_trans2_jump : (transformation3_active ? sp_trans3_jump : sp_jump)));
}
}

    break;

            case STATE_ATTACK:
    if (!can_attack) exit;

var dist = 0;
    if (instance_exists(opponent)) {
        dist = point_distance(x, y, opponent.x, opponent.y);
    }
	
	// Add this safety check at the start:
    if (atk_type < 0 || atk_type >= 15) {
        state = STATE_FREE; // Bail out if invalid attack
        break;
    }
	
		// In your ATK_1 section for Fighter, add this check FIRST:
if (atk_type == ATK_1) {
    if (character == CHAR_FIGHTER && atk_type == ATK_1) {
        if (atk_1_combo2_hit) {
            SetSprite(fighter_attack1_combo2); // Second combo tier
            //atk_1_chain_hit = true; // NEW: Enable chain combo after this
        }
        else if (atk_1_hit) {
            SetSprite(fighter_attack1_combo1); // First combo tier
			combo_1_chain_hit = true;
        }
		// In Animation_Control(), change to:
else if (atk_2_chain_hit) {
    //show_debug_message("atk_2_chain_hit is TRUE, playing fighter_attack2_chain1");
    SetSprite(fighter_attack2_chain1);
    atk_2_hit = false;
}
        else {
            SetSprite(image_xscale == 1 ? fighter_attack_1_reversed : fighter_attack_1);
        }
    }

    
    if (character == CHAR_COOK) {
        SetSprite(atk_1_hit ? cook_attack1_combo1 : 
                (image_xscale == 1 ? cook_attack_1_reversed : cook_attack_1));
    }
    
    if (character == CHAR_SAMURAI && atk_type == ATK_1) {
        if (atk_1_combo2_hit) {
            SetSprite(samurai_attack1_combo2); // Second combo tier
        }
        else if (atk_1_hit) {
            SetSprite(samurai_attack1_combo1); // First combo tier 
        }
        else {
            SetSprite(image_xscale == 1 ? samurai_attack_1_reversed : samurai_attack_1);
        }
    }
	
	if (character == CHAR_WINDNINJA && atk_type == ATK_1) {
		if (atk_1_hit) {
            SetSprite(ninja_attack1_combo1); // First combo tier 
        }
        else {
            SetSprite(Ninja_attack_1); // Basic attack 1
        }
	}
		
	}
	


// ATK_2 Combo Check (separate block) - MODIFIED FOR CHAIN COMBO
else if (atk_type == ATK_2) {
    if (character == CHAR_FIGHTER) {
        // CHAIN COMBO B: ATK_1 → ATK_1 (combo) → ATK_2
        if (atk_1_combo2_hit) {
    SetSprite(fighter_atk1_combo1_chain1);
    atk_1_combo2_hit = false;
}
        // CHAIN COMBO A: ATK_1 → ATK_2
        else if (atk_1_hit) {
            SetSprite(fighter_attack1_chain1);
            atk_1_hit = false;
        }
        // REGULAR ATK_2
        else {
            SetSprite(atk_2_hit ? fighter_attack2_combo1 : fighter_attack_2);
        }
    } 
    
    if (character == CHAR_COOK) {
        SetSprite(atk_2_hit ? cook_attack2_combo1 : 
                (image_xscale == 1 ? cook_attack_2_reversed : cook_attack_2));
    }
    
    if (character == CHAR_SAMURAI) {
		if (atk_1_combo2_hit) {
    SetSprite(samurai_atk1_combo1_chain1);
    atk_1_combo2_hit = false;
}
else if (atk_1_hit) {
            SetSprite(samurai__attack1_chain1);
            atk_1_hit = false;
        }
else {
        SetSprite(atk_2_hit ? samurai_attack2_combo1 : samurai_attack_2);  
}
    }
	if (character == CHAR_WINDNINJA && atk_type == ATK_2) {
		if (atk_2_hit) {
            SetSprite(ninja_attack2_combo1); // First combo tier 
        }
        else {
            SetSprite(Ninja_attack_2); // Basic attack 1
        }
	}
}
 
	// NEW: Add this AFTER the ATK_1 block
else if (atk_type == ATK_6) {  // Transformed ATK_1
    if (character == CHAR_FIGHTER) {
		if(trans1_atk_2_hit){
			SetSprite(fighter_trans1_attk2_chain1);
			
		}
        
        else if (trans1_atk_1_combo1_hit) {
            SetSprite(fighter_trans1_attk1_combo2);
            trans1_atk_1_combo1_hit = false;
        }
        else if (trans1_atk_1_hit) {
            SetSprite(fighter_trans1_attk1_combo1);
            trans1_atk_1_hit = false;
            trans1_atk_1_combo1_hit = true; // Set this flag for next time
        }
        else {
            SetSprite(image_xscale == 1 ? fighter_trans1_attack1 : fighter_trans1_attack1);
        }
    }
	
	
	else if (character == CHAR_SAMURAI) {
        if (trans1_atk_1_hit) {
            SetSprite(samurai_trans1_attck1_combo1);
        }
        else {
            SetSprite(image_xscale == 1 ? samurai_trans1_attack1 : samurai_trans1_attack1);
        }
}

else if (character == CHAR_COOK) {
        // ADD THIS BLOCK FOR COOK:
        if (trans1_atk_1_hit) {
            SetSprite(cook_trans1_attck1_combo1);
        } else {
            SetSprite(cook_trans1_attack1);
        }
    }
	
}

else if (atk_type == ATK_7) {  // Transformed ATK_1
    if (character == CHAR_FIGHTER) {
		if (trans1_atk_1_hit) {
            SetSprite(fighter_trans1_attk1_chain1);
			
        }
        else if (trans1_atk_2_hit) {
            SetSprite(fighter_trans1_attk1_combo1_1);
        }
        else {
            SetSprite(image_xscale == 1 ? fighter_trans1_attack2 : fighter_trans1_attack2);
        }
    }
	
	
	
	else if (character == CHAR_SAMURAI) {
        if (trans1_atk_2_hit) {
            SetSprite(samurai_trans1_attck2_combo1);
        }
        else {
            SetSprite(image_xscale == 1 ? samurai_trans1_attack2 : samurai_trans1_attack2);
        }
}

else if (character == CHAR_COOK) {
        if (trans1_atk_2_hit) {
            SetSprite(cook_trans1_attck2_combo1);
        }
        else {
            SetSprite(image_xscale == 1 ? cook_trans1_attack2 : cook_trans1_attack2);
        }
}
	}
	
	else if (atk_type == ATK_4) {  
    if (character == CHAR_FIGHTER) {
        if (transformation1_active) {
            SetSprite(fighter_trans1_special);
        }
		else if (transformation2_active) {
            SetSprite(fighter_trans2_special1);
        }
		else if (transformation3_active){
			SetSprite(fighter_trans3_special1);
		}
        else {
            SetSprite(image_xscale == 1 ? fighter_special1 : fighter_special1);
        }
    }
	
    else if (character == CHAR_SAMURAI) {
        if (transformation1_active) {
            SetSprite(samurai_trans1_special);
        }
        else if (transformation2_active) {
            SetSprite(samurai_trans2_special1);
        }
        else {
            SetSprite(samurai_special1);
        }
    }
	else if (character == CHAR_COOK) {
        
            SetSprite(cook_special1);
	}
	if (character == CHAR_WINDNINJA) {
    SetSprite(Ninja_special1);
    
    if (image_index == 0) {
        var spawn_distance = 90;
        var base_x = opponent.x + (spawn_distance * sign(x - opponent.x));
        var base_y = opponent.y;
        
        // Clone 1 - medium damage
        var clone1 = instance_create_layer(base_x, base_y, "Effects", obj_speffect_clone1);
        clone1.creator = id;
        clone1.damage_value = 5;  // Custom damage for clone1
        clone1.attack_type = ATK_4;
        clone1.image_xscale = image_xscale;
        
        // Clone 2 - low damage
        var clone2 = instance_create_layer(base_x + 25, base_y - 115, "Effects", obj_speffect_clone2);
        clone2.creator = id;
        clone2.damage_value = 5;  // Lower damage
        clone2.attack_type = ATK_4;
        clone2.image_xscale = image_xscale;
        
        // Clone 3 - high damage, faces opponent
        var clone3 = instance_create_layer(base_x + 165, base_y - 35, "Effects", obj_speffect_clone3);
        clone3.creator = id;
        clone3.damage_value = 5;  // Higher damage
        clone3.attack_type = ATK_4;
        clone3.image_xscale = -opponent.image_xscale;
    }
}
}
else if (atk_type == ATK_9) {  // Assuming ATK_9 is your special2
    if (character == CHAR_FIGHTER) {
        if (transformation1_active) {
            SetSprite(fighter_trans1_special2);
        }
		else if (transformation2_active) {
            SetSprite(fighter_trans2_special2);
        }
		else if (transformation3_active) {
            SetSprite(fighter_trans3_special2);
            
            // CHECK: Is this sprite AND is it frame 16?
            if (sprite_index == fighter_trans3_special2 && round(image_index) == 16) {
                var impact = instance_create_layer(x, y - 30, "Effects", obj_lightning_impact);
                impact.image_xscale = image_xscale;
            }
        }
        else {
            SetSprite(fighter_special2);
        }
    }
    // [Other characters remain unchanged]
	else if (character == CHAR_SAMURAI) {
        if (transformation1_active) {
            SetSprite(samurai_trans1_special2);
        }
         else if (transformation2_active) {
            SetSprite(samurai_trans2_special2);
        }
        else {
			
            SetSprite(samurai_special2);
        }
	}
		
		else if (character == CHAR_COOK) {
        
            SetSprite(cook_special2);
	}
    else if (character == CHAR_WINDNINJA) {
        
           if (dist < 300) {
                SetSprite(Ninja_special2_close);  // Close range sprite
            } else {
                SetSprite(ninja_special2);  // Normal/far range sprite
			}
			
	}
	
	

	
}

else if (atk_type == ATK_10) {
  
    if (character == CHAR_FIGHTER) {
        if (trans2_atk_1_hit) {
            SetSprite(fighter_trans2_attack1_combo1);
        }
		else {
            SetSprite(fighter_trans2_attack1);
        }
        
    }
	
	if (character == CHAR_SAMURAI) {
            SetSprite(samurai_trans2_attack1);
      
       
}

}
	
	else if (atk_type == ATK_11) {
  
    if (character == CHAR_FIGHTER) {
        if (trans2_atk_2_hit) {
            SetSprite(fighter_trans2_attack2_combo1);
        }
		else {
            SetSprite(fighter_trans2_attack2);
        }
        
    }
	if (character == CHAR_SAMURAI) {
            SetSprite(samurai_trans2_attack2);
      
       
}
 
 
}

else if (atk_type == ATK_13) {
  
    if (character == CHAR_FIGHTER) {
        if (trans3_atk_1hit) {
            SetSprite(fighter_trans3_atk1_combo1);
        }
		else {
            SetSprite(fighter_trans3_attck1_1);
        }
        
    }
}
else if (atk_type == ATK_3) {
    if (character == CHAR_FIGHTER) {
        // COMBO_Chain: ATK_1 → ATK_1 (combo) → ATK_3
        if (atk_1_combo2_hit) {
            SetSprite(fighter_atk1_combo1_chain2);
            atk_1_combo2_hit = false;
        }
        // Regular chain: ATK_1 → ATK_3
        else if (atk_1_hit) {
            SetSprite(fighter_attack1_chain2);
            atk_1_hit = false;
        }
        // REGULAR ATK_3
        else {
            SetSprite(atk_3_hit ? fighter_attack_3 : fighter_attack_3);
        }
    }
	
	else if (character == CHAR_COOK) {
        SetSprite(atk_3_hit ? cook_attack_3 : cook_attack_3);
    }
    else if (character == CHAR_SAMURAI) {
		 if (atk_1_hit) {
            SetSprite(samurai__attack1_chain2);
            atk_1_hit = false;
        }
		else {
        SetSprite(atk_3_hit ? samurai_attack_3 : samurai_attack_3);
		}
    }
	else if (character == CHAR_WINDNINJA) {
        SetSprite(atk_3_hit ? Ninja_attack_3 : Ninja_attack_3);
    }
}

    // Default attack handling
    else {
        if (landed) {
            SetSprite(shield ? sp_shield : sp_attack[atk_type]);
        } else {
            SetSprite(sp_attack[atk_type]);
        }
    }
	
    can_attack = false;
    break;

        case STATE_DEATH:
            if (character_hp == 0 || opp_hp == 0) {
                SetSprite(sp_death);
                FreezeLastFrame();
            } else {
                SetSprite(sp_death);
                FreezeLastFrame();
            }
            break;

        case STATE_HURT:
    if (character_hp != 0 || opp_hp != 0) {
        if (landed) {
            if (shield) {
                SetSprite(sp_shield); // Maintain shield behavior
            } else {
                // Use special hurt sprite if hit by special attack
                if (was_hit_by_special) {
                    SetSprite(sp_hurt_special);
                } else {
                    SetSprite(sp_hurt); // Regular hurt
                }
            }
        }
    } else if (character_hp == 0 || opp_hp == 0) {
        SetSprite(sp_death);
        FreezeLastFrame();
    }
    break;

        case STATE_BLOCK:
            if (landed) {
                SetSprite(sp_shield);
            }
            break;

        case STATE_DASH:
            // The dash animation is already set in the Dash function
            break;

        case STATE_EMOTE:
            // Play the emote animation
            if (AnimationEnd()) {
                state = STATE_FREE;
            }
            break;
			
			// In Animation Control (add this case to your existing switch):
case STATE_SPECIAL2:
    if (AnimationEnd()) {
        state = STATE_FREE;
    }
	
    break;
	
	case STATE_SPECIAL4:
    if (AnimationEnd()) {
        state = STATE_FREE;
    }
    break;
	
	case STATE_ULTIMATE:
    if (AnimationEnd()) {
        state = STATE_FREE;
        // Also reset any transformation flags if needed
    }
    break;
	
	case STATE_FROZEN:
    if (sprite_index != frozen_sprite) sprite_index = frozen_sprite;
    image_index = frozen_image_index;
    break;
	
    }
	
	
	
}