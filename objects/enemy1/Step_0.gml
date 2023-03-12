/// @description Insert description here
// You can write your code in this editor
if(cooldown < 0){
ds_list_clear(hitbyattack);
var hitByAttackNow = ds_list_create();
var hits = instance_place_list(x,y,MainCharacter,hitByAttackNow,false);
if(hits > 0){
	for(var i = 0; i < hits; i++){
		var hitID = hitByAttackNow[| i];
		if (ds_list_find_index(hitbyattack,hitID) == -1){
			ds_list_add(hitbyattack,hitID);
			with(hitID){
				EnemyHit(1);
			}
		}
	}
}
cooldown = 50;
}
cooldown -=1;