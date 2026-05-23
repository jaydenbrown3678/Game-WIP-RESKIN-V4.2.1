 // @description Insert description here
// You can write your code in this editor

var down = (controller==CONT_P1)?ord("S"):vk_down;


#region exit
if last_hit_id == other._id
	exit
#endregion


//block?
if k_check(down) and landed and state = STATE_FREE {
	//block
	if other.shield {
		if shield {
			state = STATE_BLOCK;
			exit
		}
	} else {
		
		state = STATE_BLOCK;
		exit
	}
	
}



//take damage
last_hit_id = other._id
//damage the player

character_hp -= other.dmg
opp_hp -= other.dmg
if landed {
	state = STATE_HURT
	image_index = 0
}
if !landed {
	vspd = JUMP_FORCE
	//hspd = -MOVE_SPD/2*sign(image_xscale)
}

if (character_hp == 0 || opp_hp == 0) {
	state = STATE_DEATH
	FreezeLastFrame();
}

if (collision_circle(x,y,2,obj_player1, false, true))
{
	obj_player1.opp_hp -= 4;
	obj_player1.character -=4;
}

with other
	instance_destroy()




	

	