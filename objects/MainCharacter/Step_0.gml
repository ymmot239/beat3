//// @description
switch(state){
	case(PLAYERSTATE.FREE):
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
		break;
	case(PLAYERSTATE.ATTACK_PUNCH):
		
}