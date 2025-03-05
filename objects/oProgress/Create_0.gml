/// @description 

var leveldlc=0
var levelsecret=0

total_level = 0;
total_pombos = 0;
//total_secrets = 0;
total_special = 0;
perfect_levels = 0;

for (var i = 0; i < 40; i++)
{ //normal levels

	var key = "r" + string(i);
    if(oSaveManager.struct_main[$ key] != "0.0")
	{
		total_level += 1;
	}
	
	if(i == 0 or i == 5  or i == 6  or i == 10  or i == 11  or i == 19 or i == 21 or i == 24 or i == 35)
	{
		if  (oSaveManager.struct_main[$ key] >= 1)
		{
			total_pombos += 1;
		}
	}
}

for (var i = 60; i < 65; i++){ //final levels
	var key = "r" + string(i);
    if(oSaveManager.struct_main[$ key] != "0.0"){
		total_level += 1;
	}
}
	
for (var i = 40; i < 50; i++){ //DLC
	var key = "r" + string(i);
    if(oSaveManager.struct_main[$ key] != "0.0"){
		total_level += 1;
		leveldlc += 1;
	}
	
	if(i == 42 or i == 45){
		if(oSaveManager.struct_main[$ key] >= 1){
			total_pombos += 1;
		}
	}
}

for (var i = 50; i < 60; i++){ //secret levels
	var key = "r" + string(i);
    if(oSaveManager.struct_main[$ key] != "0.0"){
		levelsecret += 1;
		total_level += 1;
	}
}


if(oSaveManager.struct_main[$ "r58"] == 1){ //única fase secreta com pombo
	total_pombos += 1;
}


//specials (skins)
for (var i = 0; i < 6; i++){
	var key = "s" + string(i);
    if(oSaveManager.struct_main[$ key] != "0.0"){
		total_special += 1;
	/////////////////////////////////////////// check for achievements
	switch(i){
	case 1: if(!steam_get_achievement("MN_SECRET_1")){steam_set_achievement("MN_SECRET_1")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQDA");
	break;
	case 2: if(!steam_get_achievement("MN_SECRET_2")){steam_set_achievement("MN_SECRET_2")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQDQ");
	break;
	case 3: if(!steam_get_achievement("MN_SECRET_3")){steam_set_achievement("MN_SECRET_3")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQDg");
	break;
	case 4: if(!steam_get_achievement("MN_SECRET_4")){steam_set_achievement("MN_SECRET_4")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQDw");
	break;
	case 5: if(!steam_get_achievement("MN_SECRET_5")){steam_set_achievement("MN_SECRET_5")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQFA");
	break;
}
	///////////////////////////////////////////
	}
}



//checks for PERFECT levels
for (var i = 0; i < 64; i++) //check every level
{ 
	//get scr
	var myloadvalue= variable_struct_get(oSaveManager.struct_main,"r" + string(i))
	var lvstring=string_format(myloadvalue,1,3)
	var lvlen=string_length(lvstring)
	
	var scr= real(string_copy(lvstring,lvlen-1,lvlen))
	
	//get perfectscore
	var perfectscr=oSaveManager.score_struct[$ "Room" + string(i)]
    if scr <= perfectscr and scr!=0 { perfect_levels += 1 } else {show_debug_message("scr: "+string(scr)+"  perfectscr:"+string(perfectscr) +"  room:"+string(i))}
	
}

total_deaths = global.settings.deaths;

//esses aqui só servem pra contar a porcentagem (e propostialmente dar mais no total)
levels_existentes = 52; //não conto a DLC na porcentagem (porém conto os 4 leveis finais novos)
secrets_existentes = 8 //não entendi o porque disso
specials_existentes = 4;//não conto especial da dlc
pombos_existentes = 12;

porcentagem = ((total_level+total_pombos+total_special) / (levels_existentes + specials_existentes + pombos_existentes)) * 100;
if porcentagem>=119
{
	porcentagem=120
	if perfect_levels>=64
	{porcentagem=1000}
}


//esses são verdadeiros. representam a verdade
levels_existentes = 64;
secrets_existentes = 10 
specials_existentes = 5;
pombos_existentes = 12; //checar

cores[0] = c_preto1;
cores[1] = c_preto2;
cores[2] = c_preto3;
cores[3] = c_branco1;
cores[4] = c_branco2;
c=3
cor_progresso_atual = 0;
cor_total_atual = 0;

cor_progresso = cores[cor_progresso_atual];
cor_total = cores[cor_total_atual];

cor_progresso_maximo = 4;
cor_total_maximo = 2;

timer_atual = 0;
timer_transicao = 15;


//alarm[0] = game_get_speed(gamespeed_fps) * 10;

go = false;
sure = false;
scr_inputcreate();

if(porcentagem >= 120){
	if(!steam_get_achievement("MN_FULLMOON")){steam_set_achievement("MN_FULLMOON")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQCw");
}

if porcentagem=1000
{	
	if(!steam_get_achievement("MN_FULLMOON_1000")){steam_set_achievement("MN_FULLMOON_1000")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQCQ");
}

if levelsecret>=10
{
	if(!steam_get_achievement("MN_ALL_SECRETS")){steam_set_achievement("MN_ALL_SECRETS")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQEQ");
}

if total_pombos>=pombos_existentes
{
	if(!steam_get_achievement("MN_PIGEON_ALL")){steam_set_achievement("MN_PIGEON_ALL")}
	GooglePlayServices_Achievements_Unlock("CgkIo9m7npseEAIQCA");
}
