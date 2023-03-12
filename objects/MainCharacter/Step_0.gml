//// @description
switch(state){
	case (PLAYERSTATE.FREE):
		if(keyboard_check(vk_right)){
			if(keyboard_check(vk_up)){
				x+=3.54;
				y-=3.54;
				sprite_index = MainRight;
				idle = IdleRight;
			}else if (keyboard_check(vk_down)){
					x+=3.54;
					y+=3.54;
					sprite_index = MainRight;
					idle = IdleRight;
			}else{
				x+=5;
				sprite_index = MainRight;
				idle = IdleRight;
			}
			global.side = "right";
		}
		else if(keyboard_check(vk_left)){
			if(keyboard_check(vk_up)){
				x-=3.54;
				y-=3.54;
				sprite_index = MainLeft;
				idle = IdleLeft;
			}else if(keyboard_check(vk_down)){
				x-=3.54;
				y+=3.54;
				sprite_index = MainLeft;
				idle = IdleLeft;
			}else{
				x-=5;
				sprite_index = MainLeft;
				idle = IdleLeft;
			}
			global.side = "left";
		}
		else if(keyboard_check(vk_up)){
			y-=5;
			sprite_index = MainUp;
			idle = IdleUp;
		}
		else if(keyboard_check(vk_down)){
			y+=5;
			sprite_index = MainDown;
			idle = IdleDown;
		}
		else{	
			sprite_index = idle;
		}
		if(keyboard_check(ord("Q"))){
			state = PLAYERSTATE.ATTACK_PUNCH;
		}
		break;
	case (PLAYERSTATE.ATTACK_PUNCH):
		if ((sprite_index != rightPunch)and (sprite_index!=leftPunch) and (punchCounter <0)){
			if (global.side=="right"){
				sprite_index = rightPunch;
				mask_index = rightPunchhb;
			}
			else{
				sprite_index = leftPunch;
				mask_index = leftPunchhb;
			}
			punchCounter = 50;
		}
		//var hitByAttackNow = ds_list_create();
		if(animation_end()){
			state = PLAYERSTATE.FREE;
		}
		break;
			
}
punchCounter -=1;
