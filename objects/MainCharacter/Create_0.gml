/// @description Insert description here
// You can write your code in this editor

state = PLAYERSTATE.FREE;
hitbyattack = ds_list_create();


punchCounter = 0;


enum PLAYERSTATE{
	FREE,
	ATTACK_PUNCH,
	ATTACK_COMBO
}