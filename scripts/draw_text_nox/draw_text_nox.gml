enum TextEffect
{
	None,	//line_distance		  |
	Bold,	//Bold			*text*
	Wave,	//Wavey			~text~
	Shake,	//shake			$text$
			//AnotherColor	#text#
			//Rainbow		@text@
}


/// @desc initializes nox text. Use this at least once before using draw_text_nox()!!!
function nox_text_init()
{
	global.nox_text_parameters = {
		
		break_line_char : undefined,
		
		outline : {
			activated : undefined,
			color : undefined,
			width : undefined
		},
		
		wave : {
			char : undefined,
			height : undefined,
			time : undefined,
			length : undefined
		},
		
		rainbow : {
			char : undefined,
			color_speed : undefined,
			color_difference : undefined,
			shader : undefined
		},
		
		shake : {
			char : undefined,
			strength : undefined
		},
		
		bold : {
			char : undefined,
			strength : undefined
		},
		
		alt_color : {
			char : undefined,
			color : undefined
		}
	}
	
	nox_set_outline();
	nox_set_rainbow();
	nox_set_shake();
	nox_set_bold();
	nox_set_wave();
	nox_set_alternative_color();
	nox_set_break_line();
}

/// @arg activated whether the outline is on (true) or off (false).
/// @arg color defines the outline color.
/// @arg width defines the outline width.
/// @desc  Sets up the outline for the draw_text_nox() function.
function nox_set_outline(outline_activated=false, outline_color=c_black, outline_width=1)
{
	global.nox_text_parameters.outline= {
		activated : outline_activated,
		color : outline_color,
		width : outline_width
	};
}

/// @arg height defines the wave height.
/// @arg time defines the time in seconds for a wave cicle to be completed.
/// @arg length defines the wave length.
/// @arg trigger_char  the new character that will trigger the wavey text effect (it must be one single char, not a string)
/// @desc  Sets up the wave effect for the draw_text_nox() function.
function nox_set_wave(wave_height=2.25, wave_time=0.75, wave_length=1, trigger_char="~")
{
	global.nox_text_parameters.wave = {
		char : trigger_char,
		height : wave_height,
		time : wave_time,
		length : ((1*80)/wave_length)
	};
}

/// @arg speed defines the speed of the color changing.
/// @arg color_diff defines the difference in color from letter to letter (write 0 so that all the rainbow letters will have the same color).
/// @arg trigger_char  the new character that will trigger the rainbow text effect (it must be one single char, not a string)
/// @desc  Sets up the rainbow effect for the draw_text_nox() function.
function nox_set_rainbow(rainbow_speed=0.2, color_diff=16/*1.5/*, use_shader=false*/, trigger_char="@")
{
	global.nox_text_parameters.rainbow= {
		char : trigger_char,
		color_speed : rainbow_speed,
		color_difference : color_diff,
		shader : false
	};
}

/// @arg strength  defines the strength for the shake text effect.
/// @arg trigger_char  the new character that will trigger the shake effect (it must be one single char, not a string)
/// @desc  Sets up the shake effect for the draw_text_nox() function.
function nox_set_shake(shake_strength=0.75,trigger_char="$")
{
	global.nox_text_parameters.shake = {
		char : trigger_char,
		strength : shake_strength
	};
}

/// @arg strength  defines the strength for the bold effect.
/// @arg trigger_char  the new character that will trigger the bold text effect (it must be one single char, not a string)
/// @desc  Sets up the bold effect for the draw_text_nox() function.
function nox_set_bold(bold_strength=2,trigger_char="*")
{
	/*
	global.nox_text_parameters.bold = {
		char : trigger_char,
		strength : bold_strength
	};
	*/
}

/// @arg alternative_color  defines the color for the alternative color effect.
/// @arg trigger_char  the new character that will trigger the alternative color effect (it must be one single char, not a string)
/// @desc  Sets up the alternative color effect for the draw_text_nox() function.
function nox_set_alternative_color(alternative_color=$FFFFAA55,trigger_char="#")
{
	global.nox_text_parameters.alt_color = {
		char : trigger_char,
		color : alternative_color
	};
}

/// @arg trigger_char  the new character that will trigger the line break (it must be one single char, not a string)
/// @desc  Defines the character that wil trigger line breaks when using draw_text_nox().
function nox_set_break_line(character="\n")
{
	global.nox_text_parameters.break_line_char = character;
}


function _nox_text_wave(from, to, duration, real_offset, timer) 
{
	a4 = (to - from) * 0.5;
	return from + a4 + sin(((((current_time+real_offset) * 0.001) + duration) / duration) * (pi*2)) * a4;
}

function _nox_text_outlined(xx, yy, outline_color, string_color, string, outline_width) 
{
	/*
	//Outline  
	draw_set_color(outline_color);  
	
	for (var i = 0; i < outline_width; i++)
	{
		draw_text(xx+i, yy+i, string);  
		draw_text(xx-i, yy-i, string);  
		draw_text(xx,   yy+i, string);  
		draw_text(xx+i,   yy, string);  
		draw_text(xx,   yy-i, string);
		draw_text(xx-i,   yy, string);  
		draw_text(xx-i, yy+i, string);  
		draw_text(xx+i, yy-i, string);  
	}
	
	//Text  
	draw_set_color(string_color);
	draw_text(xx, yy, string);
	draw_set_alpha(1)
	*/
}

function _nox_text_is_special(character)
{
	//if (character == "~") || (character == "@") || (character == "$") || (character == "#") || (character == "*") || (character == "|")
	if (character == global.nox_text_parameters.bold.char) ||
	(character == global.nox_text_parameters.rainbow.char) ||
	(character == global.nox_text_parameters.shake.char) ||
	(character == global.nox_text_parameters.wave.char) ||
	(character == global.nox_text_parameters.alt_color.char) ||
	(character == global.nox_text_parameters.break_line_char)
	{
		return true;
	}
	return false;
}

function _nox_get_data(text, max_width, sep, line_distance, break_space) 
{
	var this_line_width = -1;
	var total_width = -1;
	var total_height = string_height("M");
	
	var last_space_index=-1;
	var last_space_x = max_width;
	var line_break = ds_list_create();
	
	var line_index = 0, line_width = [];
	
	
	var xx = 0;
	
	
	for (var i = 1; i <= string_length(text);i++)
	{
		var letter = string_char_at(text, i); //gets the letter at I index
		if (!_nox_text_is_special(letter))
		{
			if (letter == " ") 
			{
				last_space_index = i;
				last_space_x = xx;
			}
			
			xx += string_width(letter)+sep;
			this_line_width = max(this_line_width, xx);
			
			if (xx >= max_width)
			{
				if (break_space)
				{
					if (last_space_index!=-1) i = last_space_index;
					
					ds_list_add(line_break,i);
					
					xx = 0;
					total_height += line_distance;
					total_width = max(total_width, last_space_x);
					
					line_width[line_index] = last_space_x;
					line_index++;
					
					last_space_index=-1;
					last_space_index = max_width;
				}
				else
				{
					var next_letter = string_char_at(text, i+1);
					if (next_letter!=" ") && (next_letter!=".") && (next_letter!=",") && (next_letter!=";")
					{
						xx += string_width("-")+sep;
						total_width = max(total_width, xx);
					}
					
					line_width[line_index] = xx;
					line_index++;
					
					xx = 0;
					total_height += line_distance;
				}
			}
		}
		else if (letter == global.nox_text_parameters.break_line_char)
		{
			total_width = max(total_width, xx);
			
			line_width[line_index] = xx;
			line_index++;
			
			xx = 0;
			total_height += line_distance;
		}
	}
	
	line_width[line_index] = xx;
	line_index++;
			
	total_width = max(total_width, xx);
	
	var output = { 
		ww: total_width,
		hh : total_height,
		line_index_break : ds_list_create(),
		line_size : line_width
		}
	ds_list_copy(output.line_index_break,line_break);
	
	return output;
}

/// @arg x  The text's x position.
/// @arg y  The text's y position.
/// @arg text  The text you want to draw.
/// @arg letters_dist  The distance in pixels between the letters.
/// @arg line_dist  The distance between lines.
/// @arg line_width  The line maximum width.
/// @arg break_on_space  Whether the text should or not break line on spaces.
/// @arg alpha  The text's alpha.
/// @arg font  The text's font.
/// @arg color  The text's color.
/// @arg timer  The timer this function will be using, use this is you want to pause the effects.
/// @desc Use this function to draw text with some nice visual effects! :D You can use draw_set_halign() and draw_set_valign() to change the text's alignment. Use nox_set functions to change the effects values to your desire.
function draw_text_nox(xx, yy, text, letters_dist, line_distance, line_width, break_on_space=true, alpha = 1, font=draw_get_font(), text_color = draw_get_color(), timer = current_time)
{
	//fixxes alignment
	var halign = ((draw_get_halign()==fa_right)-(draw_get_halign()==fa_left)+1);
	var valign = ((draw_get_valign()==fa_bottom)-(draw_get_valign()==fa_top)+1);
	
	draw_set_font(font);
	var data = _nox_get_data(text,line_width,letters_dist,line_distance,break_on_space);
	
	if (halign!=0) || (valign!=0)
	{	
		xx-=halign* (data.ww/2);
		yy-=valign* (data.hh/2);
	}
	
	#region //setting everything up
	
	//set draw settings up
	draw_set_font(font);
	draw_set_color(text_color);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(alpha);
	
	//position local variables
	var letter_initial_x = xx;
	var letter_y = yy;
	
	var line_x = 0;
	
	var effect_being_aplied = TextEffect.None; //current effect for effects that cant be applied at the same time (like rainbow and alt color)
	
	//set up all effect_active booleans
	var rainbow = false;
	var shake_text = false;
	var alternative_color = false;
	var wave_text = false;
	
	//variables we are going to use in the effects
	var text_col = text_color;
	var out_col = global.nox_text_parameters.outline.color;
	
	var original_text_col = text_color;
	var original_out_col = global.nox_text_parameters.outline.color;
	
	var wave_struc = global.nox_text_parameters.wave;
	var shake_struc = global.nox_text_parameters.shake;
	var rainbow_struc = global.nox_text_parameters.rainbow;
	var out_struc = global.nox_text_parameters.outline;
	var bold_struc = global.nox_text_parameters.bold;
	var alt_struc = global.nox_text_parameters.alt_color;
	
	
	var line_index = 0;
	//sets up first line x offset for horizontal alignment
	var line_align_offset = (data.ww-data.line_size[line_index]) * (halign/2);
	
	#endregion
	
	for (var i = 1; i <= string_length(text);i++)
	{
		var letter = string_char_at(text, i); //gets the letter at I index
		var letter_x = letter_initial_x + line_x;
		
		letter_x+=line_align_offset;
		
		switch (letter)
		{
			case global.nox_text_parameters.bold.char:
			{
				#region //bold
				
				if (effect_being_aplied == TextEffect.None)
				{
					effect_being_aplied = TextEffect.Bold;
				}
				else
				{
					effect_being_aplied = TextEffect.None;
				}
				
				#endregion
			}
			break;
			case global.nox_text_parameters.shake.char:
			{
				shake_text = !shake_text;
			}
			break;
			case global.nox_text_parameters.wave.char:
			{
				wave_text = !wave_text;
			}
			break;
			case global.nox_text_parameters.rainbow.char:
			{
				rainbow = !rainbow;
			}
			break;
			case global.nox_text_parameters.alt_color.char:
			{
				alternative_color = !alternative_color;
			}
			break;
			case " ":
			{
				#region //space
				
				//break a line wheen needed if "break_on_space" is on
				if (ds_list_find_index(data.line_index_break,i)!=-1)
				{
					line_index ++;
					line_align_offset = (data.ww-data.line_size[line_index]) * (halign/2);
						
					line_x = 0;
					letter_y += line_distance;
					continue;
				}
				
				//increments the line size
				line_x += string_width(letter)+letters_dist;
				
				if (line_x != 0) && (!break_on_space)
				{

					if (line_x >= line_width)
					{
						line_x = 0;
						letter_y += line_distance;
						
						line_index ++;
						line_align_offset = (data.ww-data.line_size[line_index]) * (halign/2);
					}
					
				}
				#endregion
			}
			break;
			case global.nox_text_parameters.break_line_char:
			{
				#region //line_distance
				
				line_index ++;
				line_align_offset = (data.ww-data.line_size[line_index]) * (halign/2);
						
				line_x = 0;
				letter_y += line_distance;
				
				#endregion
			}
			break;
			default:
			{
				var draw_letter_x = letter_x;
				var draw_letter_y = letter_y;
				
				text_col = original_text_col;
				out_col = original_out_col;
				
				if (shake_text)
				{
					draw_letter_x += random_range(-shake_struc.strength,shake_struc.strength);
					draw_letter_y += random_range(-shake_struc.strength,shake_struc.strength);
				}
				
				if (alternative_color)
				{
					if (round(timer/60) mod 2 != 0) {text_col = alt_struc.color;}//TESTE
					//text_col = alt_struc.color;
					//out_col = alt_color;
				}
				
				if (rainbow)
				{
					var time_value = (timer*rainbow_struc.color_speed) + i*rainbow_struc.color_difference;
					var rainbow_col = make_color_hsv(time_value%255,255,255);
					text_col = rainbow_col;
				}
				
				if (wave_text)
				{
					var str = wave_struc;
					var wave_value = + _nox_text_wave(-str.height/2,str.height/2,str.time,i*str.length,timer);
					draw_letter_y+=wave_value;
				}
				
				draw_letter_x=floor(draw_letter_x)
				draw_letter_y=round(draw_letter_y)
				
				switch (effect_being_aplied)
				{
					case TextEffect.Bold:
					{
						#region //Bold letters
						
						draw_set_color(out_col);
						
						for (var j = 1; j < bold_struc.strength+out_struc.width; j++)
						{
							if (!out_struc.activated) break;
							
							draw_text(draw_letter_x+j, draw_letter_y+j, letter);  
							draw_text(draw_letter_x-j, draw_letter_y-j, letter);  
							draw_text(draw_letter_x,   draw_letter_y+j, letter);  
							draw_text(draw_letter_x+j,   draw_letter_y, letter);  
							draw_text(draw_letter_x,   draw_letter_y-j, letter);  
							draw_text(draw_letter_x-j,   draw_letter_y, letter);  
							draw_text(draw_letter_x-j, draw_letter_y+j, letter);  
							draw_text(draw_letter_x+j, draw_letter_y-j, letter);  
						}
						
						draw_set_color(text_col);
						
						for (var j = 1; j < bold_struc.strength; j++)
						{
							draw_text(draw_letter_x+j, draw_letter_y+j, letter);  
							draw_text(draw_letter_x-j, draw_letter_y-j, letter);  
							draw_text(draw_letter_x,   draw_letter_y+j, letter);  
							draw_text(draw_letter_x+j,   draw_letter_y, letter);  
							draw_text(draw_letter_x,   draw_letter_y-j, letter);  
							draw_text(draw_letter_x-j,   draw_letter_y, letter);  
							draw_text(draw_letter_x-j, draw_letter_y+j, letter);  
							draw_text(draw_letter_x+j, draw_letter_y-j, letter);  
						}
						
						draw_text(draw_letter_x, draw_letter_y, letter);
		
						#endregion
					}
					break;
					default:
					{
						#region //normal letters
				
						if (out_struc.activated)
						{
							_nox_text_outlined(draw_letter_x, draw_letter_y, out_col, text_col, letter, out_struc.width);
						}
						else
						{
							draw_set_color(text_col);
							draw_text(draw_letter_x,draw_letter_y,letter);
						}
		
						#endregion
					}
				}
				
				
				#region //next line and spacement betwen letters
						
				line_x += string_width(letter) + letters_dist;
				
				
				var next_letter=string_char_at(text, i+1); //adds letter  width and sep_letter separation between characters to x
				
				if (line_x >= line_width) && (!break_on_space) /*verifies if the next letter is a dot*/ && (next_letter!=" ") && (next_letter!=".") && (next_letter!=",") && (next_letter!=";")
				{	
					#region //colocando o traco
					if (out_struc.activated)
					{
						_nox_text_outlined(letter_x+string_width(letter) + letters_dist,letter_y, out_struc.color, text_col, "-", out_struc.width);
					}
					else
					{
						draw_text(letter_x+string_width(letter) + letters_dist,letter_y,"-");
					}
					#endregion
					
					line_x = 0;
					letter_y += line_distance;
					
					line_index ++;
					line_align_offset = (data.ww-data.line_size[line_index]) * (halign/2);
				}
				
				#endregion
				
			}
			break;
		}
	}
		
	
	#region //reseting everything up
	
	draw_set_color(text_color);
	draw_set_alpha(1.0);
	draw_set_halign(halign);
	draw_set_valign(valign);
	
	#endregion
	
	var output = {
		my_width : data.ww,
		my_height : data.hh
	}
	
	return output;
}
