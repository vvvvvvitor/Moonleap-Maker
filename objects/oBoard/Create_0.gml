/// @description Insert description here
// You can write your code in this editor
text=" "
number=0

if image_index=0
{
	for (var i = 0; i < 9; i += 1)

	{
	var key = "r" + string(i);
	if(oSaveManager.struct_main[$ key] != "0.0") {number+=1}
	}
	
	if number>=8 {instance_destroy()}//this will apear only for new players

	switch(lang_get())
	{
	case "PT-BR":
	    text = "o portal se abrirá para quem completar pelo menos ~8 fases~.";
	    break;
	case "EN":
	    text = "the portal will open for those who complete at least ~8 levels~.";
	    break;
	case "ES":
	    text = "el portal se abrirá para aquellos que completen al menos ~8 niveles~.";
	    break;
	case "JA":
	    text = "ポータルは、少なくとも 8つのレベルをクリアした人に開かれます。";
	    break;
	case "IT":
	    text = "il portale si aprirà per coloro che completeranno almeno ~8 livelli~.";
	    break;
	case "ZH":
	    text = "只有完成至少 ~8~个关卡的玩家才能打开传送门。";
	    break;
	}
	
}

if image_index=1
{
	if os_type=os_switch
	{
		switch(lang_get())
		{
	case "PT-BR": text = "pressione o ~botão -~ para resetar o nível"; break;
	case "EN": text = "press ~- button~ to reset the level"; break;
	case "ES": text = "presiona el ~botón -~ para reiniciar el nivel"; break;
	case "JA": text = "レベルをリセットするにはボタン ~-~ を押してください。"; break;
	case "IT": text = "premi il ~pulsante -~ per ripristinare il livello"; break;
	case "ZH": text = "按 ~-~ 按钮重置级别"; break;
		}
	}
	else if os_type=os_windows
	{
		switch(lang_get())
		{
    case "PT-BR":
        text = "pressione a tecla ~R~ para resetar o nível";
        break;
    case "EN":
        text = "press ~R~ to reset the level";
        break;
    case "ES":
        text = "presiona ~R~ para reiniciar el nivel";
        break;
    case "JA":
        text = "レベルをリセットするには ~R~ を押してください。";
        break;
    case "IT":
        text = "premere ~R~ per resettare il livello";
        break;
    case "ZH":
        text = "按 ~R~ 重置级别";
        break;


		}
	}
	else
	{instance_destroy()}
}

if image_index=2
{
	switch(lang_get())
		{
		case "PT-BR": text = "nenhum segredo por aqui"; break;
	    case "EN":    text = "no secrets here"; break;
	    case "ES":    text = "no hay secretos por aquí"; break;
	    case "JA":    text = "ここには秘密はありません。"; break;
	    case "IT":    text = "nessun segreto qui"; break;
	    case "ZH":    text = "这里没有秘密"; break;
		}
}

if image_index=3
{
	switch(lang_get())
	{
	  case "PT-BR":
	    text = "o seu rank é determinado pelo número de vezes que você ~muda~";
	    break;
	  case "EN":
	    text = "your rank is determined by the number of times you ~change~";
	    break;
	  case "ES":
	    text = "tu rango se determina por la cantidad de veces que ~cambias~";
	    break;
	  case "JA":
	    text = "あなたのランクは、 あなたが変更する回数によって決まります。";
	    break;
	  case "IT":
	    text = "il tuo rango è determinato dal numero di volte che ~cambi~";
	    break;
	  case "ZH":
	    text = "你的排名由你改变的次数决定";
	    break;
	}
}
//
if image_index=4
{
	switch(lang_get())
	{
	 case "PT-BR":
        text = "terminar uma fase sem capturar o ~corvo~ resultará em um rank D";
        break;
    case "EN":
        text = "completing a stage without capturing the ~crow~ will result in a rank D";
        break;
    case "ES":
        text = "terminar una fase sin capturar al ~cuervo~ resultará en un rango D";
        break;
    case "JA":
        text = "カラスを捕まえずにステージを完了すると、 ランクDになります。";
        break;
    case "IT":
        text = "terminare una fase senza catturare il ~corvo~ risultará in un rango D";
        break;
    case "ZH":
        text = "在不捕捉乌鸦的情况下完成一个阶段将导致D级别";
        break;
	}
}
if image_index=5
{
	switch(lang_get())
	{
	 case "PT-BR":
        text = "That's All Folks";
        break;
    case "EN":
        text = "That's All Folks";
        break;
    case "ES":
        text = "That's All Folks";
        break;
    case "JA":
        text = "残念だけど行き止まりよ。";
        break;
    case "IT":
        text = "That's All Folks";
        break;
    case "ZH":
        text = "That's All Folks";
        break;
	}
}

wait=0
drawinfo=false
open=false
opensprite=false
open_index=0
overlay_index=0
vthislevel=noone
vloadvalue=noone
endgame=true
debug=oCamera.debug
open_number=sprite_get_number(sPortalopen)

bright=0
rank=0