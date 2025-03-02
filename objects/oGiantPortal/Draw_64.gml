/// @description Insert description here
// You can write your code in this editor

	if debug
		{
			switch rank
			{
				case 0: var rankletter="IDK"  break;
				case 1:	var rankletter="D"	break;
				case 2:	var rankletter="C"	break;
				case 3:	var rankletter="B"	break;
				case 4:	var rankletter="A"	break;
				case 5:	var rankletter="S"	break;
			}
				draw_text_nox(320/2,16,"~"+string(scor1)+" / "+string(perfectscore)+"   rank: "+rankletter+"~",0,12,320,false,1)
		}

