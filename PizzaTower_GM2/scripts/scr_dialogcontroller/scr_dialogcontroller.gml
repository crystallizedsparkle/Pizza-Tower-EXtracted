function scr_get_tutorial_key(_input)
{
	var spr = noone;
	var ix = 0;
	var txt = noone;
	switch (_input)
	{
		case ev_joystick2_button2:
			spr = global.spr_gamepadbuttons;
			ix = 16;
			break;
		case ev_joystick2_button4:
			spr = global.spr_gamepadbuttons;
			ix = 17;
			break;
		case ev_joystick2_button3:
			spr = global.spr_gamepadbuttons;
			ix = 4;
			break;
		case ev_joystick2_button5:
			spr = global.spr_gamepadbuttons;
			ix = 5;
			break;
		case vk_shift:
		case vk_lshift:
			spr = spr_tutorialkeyspecial;
			ix = 0;
			break;
		case vk_control:
		case vk_lcontrol:
			spr = spr_tutorialkeyspecial;
			ix = 1;
			break;
		case vk_space:
			spr = spr_tutorialkeyspecial;
			ix = 2;
			break;
		default:
			spr = spr_tutorialkey;
			ix = 0;
			txt = chr(_input);
			break;
	}
	return [spr, ix, txt];
}

function scr_string_width(_str)
{
	var pos = 0;
	var w = 0;
	var originalstr = _str;
	var str_arr = array_create(0);
	while (pos < string_length(originalstr))
	{
		if (string_copy(originalstr, pos, 2) == "\n")
		{
			array_push(str_arr, string_copy(originalstr, 1, pos));
			string_delete(originalstr, 1, pos);
			pos = 0;
			if (originalstr == "")
			{
				break;
			}
		}
		else
		{
			pos++;
		}
	}
	if (array_length(str_arr) == 0)
	{
		w = string_width(_str);
	}
	for (var i = 0; i < array_length(str_arr); i++)
	{
		var b = str_arr[i];
		if (string_width(b) > w)
		{
			w = string_width(b);
		}
	}
	return w;
}

function scr_separate_text(_str, _font, _targetwidth)
{
	if (_font != noone)
	{
		draw_set_font(_font);
	}
	var separation = lang_get_value("separation_map");
	separation = string_split(separation, ",");
	var _start_pos = 0;
	while (scr_string_width(_str) > (_targetwidth - string_width("a")))
	{
		var _pos = _start_pos;
		var _sep_pos = _pos;
		var len = string_length(_str);
		var found = false;
		while (_pos < len)
		{
			if (scr_is_separation(string_char_at(_str, _pos), separation))
			{
				var _prev_sep_pos = _sep_pos;
				_sep_pos = _pos;
				if (scr_string_width(string_copy(_str, _start_pos, _pos - _start_pos)) > (_targetwidth - string_width("a")))
				{
					_sep_pos = _prev_sep_pos;
					_start_pos = _sep_pos;
					_pos = _start_pos;
					found = true;
					break;
				}
			}
			_pos++;
		}
		if (string_char_at(_str, _sep_pos) == " ")
		{
			_str = string_delete(_str, _sep_pos, 1);
			_str = string_insert("\n", _str, _sep_pos);
		}
		else
		{
			_str = string_insert("\n", _str, _sep_pos + 1);
		}
	}
	return _str;
}

function scr_is_separation(_seperator, _seperation)
{
	for (var i = 0; i < array_length(_seperation); i++)
	{
		if (_seperator == _seperation[i])
		{
			return true;
		}
	}
	return false;
}

function scr_calculate_text(_str)
{
	draw_set_font(font2);
	var pos = 0;
	var str2 = "";
	while (pos <= string_length(_str))
	{
		pos++;
		str2 = string_insert(string_char_at(_str, pos), str2, string_length(str2) + 1);
		str2 = scr_separate_text(str2);
	}
	return str2;
}

function scr_calculate_height(_str)
{
	var str2 = scr_calculate_text(_str);
	return string_height(str2);
}
