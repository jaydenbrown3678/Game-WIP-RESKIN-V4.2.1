// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FreezeHandler() {
    if (!instance_exists(opponent)) return;

    // Handle unfreezing when attacker returns to idle (for all characters)
    if (state == STATE_FREE && opponent.state == STATE_FROZEN) {
        with (opponent) state = STATE_FREE;
        return;
    }

    if (state != STATE_ATTACK && sprite_index != sp_transform1) return;

    // FIGHTER CHARACTER FREEZE LOGIC
    if (character == CHAR_FIGHTER) {
        // Transform freeze (frames 1-15)
        if (sprite_index == sp_transform1) {
            if (round(image_index) == 2 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 15 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
        // ATK_4: Freeze on frame 3, unfreeze on frame 10
        else if (atk_type == ATK_4) {
            if (round(image_index) == 2 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 10 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
        // ATK_9: Freeze on frame 5, unfreeze on frame 12
        else if (atk_type == ATK_9) {
            if (round(image_index) == 2 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 12 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
    }

    // SAMURAI CHARACTER FREEZE LOGIC
    else if (character == CHAR_SAMURAI) {
        // Transform freeze (frames 1-3)
        if (sprite_index == sp_transform1) {
            if (round(image_index) == 1 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 1 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
        // ATK_4: Freeze on frame 3, unfreeze on frame 10
        else if (atk_type == ATK_4) {
            if (round(image_index) == 1 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 4 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
        // ATK_9: Freeze on frame 5, unfreeze on frame 12
        else if (atk_type == ATK_9) {
            if (round(image_index) == 1 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 8 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
    }
    
    // COOK CHARACTER FREEZE LOGIC
    else if (character == CHAR_COOK) {
        // Transform freeze (frames 1-13)
        if (sprite_index == sp_transform1) {
            if (round(image_index) == 1 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 13 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
        // ATK_4: Freeze on frame 3, unfreeze on frame 10
        else if (atk_type == ATK_4) {
            if (round(image_index) == 1 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 10 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
        // ATK_9: Freeze on frame 5, unfreeze on frame 12
        else if (atk_type == ATK_9) {
            if (round(image_index) == 1 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 5 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
    }
    
    // WINDNINJA CHARACTER FREEZE LOGIC
    else if (character == CHAR_WINDNINJA) {
        // ATK_4: Freeze on frame X, unfreeze on frame Y
        // Adjust these frame numbers based on your Ninja's ATK_4 animation
        if (atk_type == ATK_4) {
            if (round(image_index) == 3 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 12 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
        // Note: Add WINDNINJA transformation freeze logic here when you add transformations
		if (atk_type == ATK_9) {
            if (round(image_index) == 1 && opponent.state != STATE_FROZEN) {
                with (opponent) {
                    frozen_sprite = sprite_index;
                    frozen_image_index = image_index;
                    state = STATE_FROZEN;
                }
            }
            else if (round(image_index) >= 14 && opponent.state == STATE_FROZEN) {
                with (opponent) state = STATE_FREE;
            }
        }
    }
	
}