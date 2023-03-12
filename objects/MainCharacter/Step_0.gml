//// @description
hitBox = IdleRighthb;
switch(state){
	case (PLAYERSTATE.FREE):
		if(keyboard_check(ord("D"))){
			if(keyboard_check(ord("W"))){
				x+=3.54;
				y-=3.54;
				sprite_index = MainRight;
				idle = IdleRight;
				hitBox = IdleRighthb;
			}else if (keyboard_check(ord("S"))){
					x+=3.54;
					y+=3.54;
					sprite_index = MainRight;
					idle = IdleRight;
					hitBox = IdleRighthb;
			}else{
				x+=5;
				sprite_index = MainRight;
				idle = IdleRight;
				hitBox = IdleRighthb;
			}
			global.side = "right";
			dash = "right";
		}
		else if(keyboard_check(ord("A"))){
			if(keyboard_check(ord("W"))){
				x-=3.54;
				y-=3.54;
				sprite_index = MainLeft;
				idle = IdleLeft;
				hitBox = IdleLefthb;
			}else if(keyboard_check(ord("S"))){
				x-=3.54;
				y+=3.54;
				sprite_index = MainLeft;
				idle = IdleLeft;
				hitBox = IdleLefthb;
			}else{
				x-=5;
				sprite_index = MainLeft;
				idle = IdleLeft;
				hitBox = IdleLefthb;
			}
			global.side = "left";
			dash = "left";
		}
		else if(keyboard_check(ord("W"))){
			y-=5;
			sprite_index = MainUp;
			idle = IdleUp;
			hitBox = IdleUphb;
			dash = "up";
		}
		else if(keyboard_check(ord("S"))){
			y+=5;
			sprite_index = MainDown;
			idle = IdleDown;
			hitBox = IdleDownhb;
			dash = "down";
		}
		else{	
			sprite_index = idle;
			mask_index = hitBox
			
		}
		if(keyboard_check(ord("Q")) and (punchCounter <0)){
			state = PLAYERSTATE.ATTACK_PUNCH;
		}
		else if(keyboard_check(vk_space)){
			state = PLAYERSTATE.DASH;
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
			ds_list_clear(hitbyattack);
			var hitByAttackNow = ds_list_create();
			var hits = instance_place_list(x,y,enemy1,hitByAttackNow,false);
			if(hits > 0){
				for(var i = 0; i < hits; i++){
					var hitID = hitByAttackNow[| i];
					if (ds_list_find_index(hitbyattack,hitID) == -1){
						ds_list_add(hitbyattack,hitID);
						with(hitID){
							EnemyHit(2);
						}
					}
				}
			}
			ds_list_clear(hitbyattack);
			var hitByAttackNow = ds_list_create();
			var hits = instance_place_list(x,y,enemy2,hitByAttackNow,false);
			if(hits > 0){
				for(var i = 0; i < hits; i++){
					var hitID = hitByAttackNow[| i];
					if (ds_list_find_index(hitbyattack,hitID) == -1){
						ds_list_add(hitbyattack,hitID);
						with(hitID){
							EnemyHit(2);
						}
					}
				}
			}
			
			punchCounter = 25;
		}
		if(animation_end()){
			state = PLAYERSTATE.FREE;
		}
		break;
	case (PLAYERSTATE.DASH):
		if ((sprite_index != DashLeft)and (sprite_index!=DashRight) and (sprite_index!=DashDown) and (sprite_index!=DashUp)and (dashCounter <0)){
			ds_list_clear(hitbyattack);
			var hitByAttackNow = ds_list_create();
			var hits = instance_place_list(x,y,enemy1,hitByAttackNow,false);
			if(hits > 0){
				for(var i = 0; i < hits; i++){
					var hitID = hitByAttackNow[| i];
					if (ds_list_find_index(hitbyattack,hitID) == -1){
						ds_list_add(hitbyattack,hitID);
						with(hitID){
							EnemyHit(2);
						}
					}
				}
			}
			ds_list_clear(hitbyattack);
			var hitByAttackNow = ds_list_create();
			var hits = instance_place_list(x,y,enemy2,hitByAttackNow,false);
			if(hits > 0){
				for(var i = 0; i < hits; i++){
					var hitID = hitByAttackNow[| i];
					if (ds_list_find_index(hitbyattack,hitID) == -1){
						ds_list_add(hitbyattack,hitID);
						with(hitID){
							EnemyHit(2);
						}
					}
				}
			}
			if (dash=="right"){
				sprite_index = DashRight;
				mask_index = DashRighthb;
				x+=40;
			}
			else if (dash =="left"){
				sprite_index = DashLeft;
				mask_index = DashLefthb;
				x-=40;
			}
			else if(dash == "down"){
				sprite_index = DashDown;
				mask_index = DashDownhb;
				y+=40;
			}
			else if(dash == "up"){
				sprite_index = DashUp;
				mask_index = DashUphb;
				y-=40;
			}
			ds_list_clear(hitbyattack);
			var hitByAttackNow = ds_list_create();
			var hits = instance_place_list(x,y,enemy1,hitByAttackNow,false);
			if(hits > 0){
				for(var i = 0; i < hits; i++){
					var hitID = hitByAttackNow[| i];
					if (ds_list_find_index(hitbyattack,hitID) == -1){
						ds_list_add(hitbyattack,hitID);
						with(hitID){
							EnemyHit(2);
						}
					}
				}
			}
			ds_list_clear(hitbyattack);
			var hitByAttackNow = ds_list_create();
			var hits = instance_place_list(x,y,enemy2,hitByAttackNow,false);
			if(hits > 0){
				for(var i = 0; i < hits; i++){
					var hitID = hitByAttackNow[| i];
					if (ds_list_find_index(hitbyattack,hitID) == -1){
						ds_list_add(hitbyattack,hitID);
						with(hitID){
							EnemyHit(2);
						}
					}
				}
			}
			dashCounter = 25;
		}
		//var hitByAttackNow = ds_list_create();
		if(animation_end()){
			state = PLAYERSTATE.FREE;
		}
		break;
			
}
punchCounter -=1;
dashCounter -=1;
