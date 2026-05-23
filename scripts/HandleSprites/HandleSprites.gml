
function HandleSprites() {
    switch (argument0) {
        case CHAR_FIGHTER:
            // Movement
            sp_idle = fighter_idle;
            sp_walk = fighter_walk;
            sp_run = fighter_run;
            sp_jump = fighter_jump;
            sp_fall = fighter_fall;
            sp_shield = fighter_shield;
            sp_dashfwd = fighter_dash;
            sp_dashbwd = fighter_dashbwd;
			sp_charge = fighter_charge1;
			sp_charge2 = fighter_charge2;
			sp_charge3 = fighter_charge3;
			sp_transform1 = fighter_transformation1;
			sp_trans1_idle = fighter_transformation1_idle;
			sp_trans1_run = fighter_trans1_run;
			sp_trans1_walk = fighter_trans1_walk; 
			sp_trans1_jump = fighter_trans1_jump;
			sp_transform2 = fighter_transformation2
			sp_trans2_idle = fighter_transformation2_idle
			sp_trans2_run = fighter_trans2_run
			sp_trans2_walk = fighter_trans2_walk
			sp_trans2_jump = fighter_trans2_jump
			sp_transform3 = fighter_transformation3
			sp_trans3_idle = fighter_transformation3_idle;
			sp_trans3_run = fighter_trans3_run;
			sp_trans3_walk = fighter_trans3_walk;
			sp_trans3_jump = fighter_trans3_jump;

            // Emote
            sp_emote1 = fighter_emote1;

            // Hurt animation
            sp_hurt = fighter_hurt;
			sp_hurt_special = fighter_hurt2;

            // Death animation
            sp_death = fighter_death;

            // Fighter
sp_attack = [
    (image_xscale == 1) ? fighter_attack_1 : fighter_attack_1,  // ATK_1 (0)
    fighter_attack_2,                                           // ATK_2 (1) 
    fighter_attack_3,                                           // ATK_3 (2)
    fighter_special1,                                           // ATK_4 (3)
    fighter_jumpattack1,                                        // ATK_5 (4)
    fighter_trans1_attack1,                                     // ATK_6 (5)
    fighter_trans1_attack2,                                     // ATK_7 (6)
    fighter_trans1_attack3,                                     // ATK_8 (7)
    fighter_special2,                                           // ATK_9 (8)
    fighter_trans2_attack1,                                     // ATK_10 (9)
	fighter_trans2_attack2,
	fighter_trans2_attack3,
	fighter_trans3_attck1_1,
	fighter_trans3_attack2,
	fighter_trans3_attack3
];
    attack_indexes = [[2], [1], [2], [3], [4], [2], [1], [2],[3], [2],[5], [2],[6],[5],[5],[5], [5],[5]];
			
            break;

        case CHAR_SAMURAI:
            // Movement
            sp_idle = (image_xscale == 1) ? samurai_idle : samurai_idle_reversed;
            sp_walk = samurai_walk;
            sp_run = samurai_run;
            sp_jump = samurai_jump;
            sp_fall = samurai_fall;
            sp_shield = samurai_shield;
            sp_dashfwd = samurai_dash;
            sp_dashbwd = samurai_dashbwd;
			sp_charge = samurai_charge1;
			sp_charge2 = samurai_charge2;
			sp_charge3 = samurai_charge3;
			sp_transform1 = samurai_transformation1;
			sp_trans1_idle = samurai_transformation1_idle;
			sp_trans1_run = samurai_trans1_run;
			sp_trans1_walk = samurai_trans1_walk;
			sp_trans1_jump = samurai_trans1_jump;
			sp_transform2 = samurai_transformation2;
			sp_trans2_idle = samurai_transformation2_idle;
			sp_trans2_run = samurai_trans2_run;
			sp_trans2_walk = samurai_trans2_walk; 
			sp_trans2_jump = samurai_trans2_jump;
			sp_transform3 = samurai_transformation3
			sp_trans3_idle = samurai_transformation3_idle;
			sp_trans3_run = samurai_trans3_run;
			sp_trans3_walk = samurai_trans3_walk;
			
			

            // Emote
            sp_emote1 = samurai_emote1;

            // Hurt animation
            sp_hurt = samurai_hurt;
			sp_hurt_special = samurai_hurt2;

            // Death animation
            sp_death = samurai_death;

            // Attacks
            sp_attack = [(image_xscale == 1) ? samurai_attack_1_reversed : samurai_attack_1, samurai_attack_2, samurai_attack_3,
			samurai_special1, samurai_jumpattack1,samurai_trans1_attack1, samurai_trans1_attack2, samurai_trans1_attack3, samurai_special2, samurai_trans2_attack1, samurai_trans2_attack2, samurai_trans2_attack3 ];
            attack_indexes = [[4], [2], [1], [3], [4], [4],[5],[5], [5]];
			
			
	
            break;

        case CHAR_COOK:
    // Movement - using position-specific sprites
    sp_idle = (image_xscale == 1) ? cook_idle : cook_idle2;
    sp_walk = (image_xscale == 1) ? cook_run : cook_run2;
    sp_run = (image_xscale == 1) ? cook_walk : cook_walk2;
    sp_jump = cook_jump;
    sp_shield = cook_shield;
    sp_fall = cook_fall;
    sp_dashfwd = cook_dash;
	sp_dashbwd = cook_dashbwd;
	sp_charge = cook_charge1;
	sp_charge2 = cook_charge2;
	sp_transform1 = cook_transformation1;
	sp_trans1_idle = cook_transformation1_idle;
	sp_trans1_run = cook_trans1_run;
	sp_trans1_walk = cook_trans1_walk;
	sp_trans1_jump = cook_trans1_jump;
	sp_transform2 = cook_transformation2;
	sp_trans2_idle = cook_transformation2_idle
	
	
	sp_hurt = cook_hurt;
	sp_hurt_special = cook_hurt2;
	
	sp_emote1 = cook_emote1;

    // Attacks - using position-specific sprites where applicable
    sp_attack = [
        (image_xscale == 1) ? cook_attack_1_reversed : cook_attack_1_reversed,
        (image_xscale == 1) ? cook_attack_2 : cook_attack_2_reversed,
        cook_attack_3, // No reversed version for this attack
		cook_special1,
		cook_Jumpattack1,
		cook_trans1_attack1,
		cook_trans1_attack2, 
		cook_trans1_attack3, 
		cook_special2
    ];
	
	
    attack_indexes = [[3], [3], [3],[3],[3],[5],[4],[4],[4]];  // Hitframes for each attack (adjust as needed)
    break;
	        
			case CHAR_WINDNINJA:
            // Movement - BASIC MOVEMENTS ONLY (as requested)
            sp_idle = Ninja_idle_2;
            sp_walk = Ninja_walk;
            sp_run = Ninja_run;
            sp_jump = Ninja_jump;
            sp_fall = Ninja_fall;
            sp_shield = noone; // Placeholder - add Ninja_shield sprite later
            sp_dashfwd = noone; // Placeholder - add Ninja_dash sprite later
            sp_dashbwd = noone; // Placeholder - add Ninja_dashbwd sprite later
            
            // Charge sprites (placeholders for now)
            sp_charge = ninja_charge1;
            sp_charge2 = ninja_charge1;
            sp_charge3 = ninja_charge1;
            
            // Transformation sprites (placeholders for now)
            sp_transform1 = noone;
            sp_trans1_idle = noone;
            sp_trans1_run = noone;
            sp_trans1_walk = noone;
            sp_trans1_jump = noone;
            sp_transform2 = noone;
            sp_trans2_idle = noone;
            sp_trans2_run = noone;
            sp_trans2_walk = noone;
            sp_trans2_jump = noone;
            sp_transform3 = noone;
            sp_trans3_idle = noone;
            sp_trans3_run = noone;
            sp_trans3_walk = noone;
            sp_trans3_jump = noone;

            // Emote
            sp_emote1 = noone; // Placeholder - add Ninja_emote1 sprite later

            // Hurt animation
            sp_hurt = ninja_hurt; // Placeholder - add Ninja_hurt sprite later
            sp_hurt_special = noone; // Placeholder - add Ninja_hurt2 sprite later

            // Death animation
            sp_death = noone; // Placeholder - add Ninja_death sprite later

            // Attacks array (placeholders for now - we'll fill these later)
            sp_attack = [
                Ninja_attack_1, // ATK_1 (0)
                Ninja_attack_2, // ATK_2 (1) 
                Ninja_attack_3, // ATK_3 (2)
                Ninja_special1, // ATK_4 (3)
                noone, // ATK_5 (4)
                noone, // ATK_6 (5)
                noone, // ATK_7 (6)
                noone, // ATK_8 (7)
                ninja_special2, // ATK_9 (8)
                noone, // ATK_10 (9)
                noone, // ATK_11
                noone, // ATK_12
                noone, // ATK_13
                noone, // ATK_14
                noone  // ATK_15
            ];
            
            attack_indexes = [[4],[4],[5]]; // Placeholder - we'll fill hitframes later
            
            break;
			
			case CHAR_LIGHTNINGNINJA:
            // Movement - BASIC MOVEMENTS ONLY (as requested)
            sp_idle = LNinja_idle;
            sp_walk = LNinja_walk;
            sp_run = LNinja_run;
            sp_jump = Ninja_jump;
            sp_fall = Ninja_fall;
            sp_shield = noone; // Placeholder - add Ninja_shield sprite later
            sp_dashfwd = noone; // Placeholder - add Ninja_dash sprite later
            sp_dashbwd = noone; // Placeholder - add Ninja_dashbwd sprite later
            
            // Charge sprites (placeholders for now)
            sp_charge = noone;
            sp_charge2 = noone;
            sp_charge3 = noone;
            
            // Transformation sprites (placeholders for now)
            sp_transform1 = noone;
            sp_trans1_idle = noone;
            sp_trans1_run = noone;
            sp_trans1_walk = noone;
            sp_trans1_jump = noone;
            sp_transform2 = noone;
            sp_trans2_idle = noone;
            sp_trans2_run = noone;
            sp_trans2_walk = noone;
            sp_trans2_jump = noone;
            sp_transform3 = noone;
            sp_trans3_idle = noone;
            sp_trans3_run = noone;
            sp_trans3_walk = noone;
            sp_trans3_jump = noone;

            // Emote
            sp_emote1 = noone; // Placeholder - add Ninja_emote1 sprite later

            // Hurt animation
            sp_hurt = noone; // Placeholder - add Ninja_hurt sprite later
            sp_hurt_special = noone; // Placeholder - add Ninja_hurt2 sprite later

            // Death animation
            sp_death = noone; // Placeholder - add Ninja_death sprite later

            // Attacks array (placeholders for now - we'll fill these later)
            sp_attack = [
                Ninja_attack_1, // ATK_1 (0)
                noone, // ATK_2 (1) 
                noone, // ATK_3 (2)
                noone, // ATK_4 (3)
                noone, // ATK_5 (4)
                noone, // ATK_6 (5)
                noone, // ATK_7 (6)
                noone, // ATK_8 (7)
                noone, // ATK_9 (8)
                noone, // ATK_10 (9)
                noone, // ATK_11
                noone, // ATK_12
                noone, // ATK_13
                noone, // ATK_14
                noone  // ATK_15
            ];
            
            attack_indexes = [[4]]; // Placeholder - we'll fill hitframes later
            
            break;

    sprite_index = sp_idle;
}
}