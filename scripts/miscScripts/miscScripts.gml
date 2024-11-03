//Concatenate a series of arguments into a string
function Concat() 
{
    var _string = "";
    for(var i = 0; i < argument_count; i++) _string += string(argument[i]);
    return _string;
}
 
//Show debug message enhanced with string concatenation
function DebugMessage()
{
    var _string = "";
    for(var i = 0; i < argument_count; i++) _string += string(argument[i]);
    show_debug_message(_string);
}
 
 
 
//Move value towards another value by a given amount
function Approach(_a, _b, _amount) 
{
    if (_a < _b)
    {
        _a += _amount;
        if (_a > _b)
            return _b;
    }
    else
    {
        _a -= _amount;
        if (_a < _b)
            return _b;
    }
    return _a;
}
 
//Sine waves a value between two values over a given time. 
function Wave(_from, _to, _duration, _offset) 
{
    var a4 = (_to - _from) * 0.5;
    return _from + a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4; 
}
 
//Wraps a value between a minimum and a given wrap point
function Wrap(_value, _minimum, _wrapAt) 
{
 
    var _mod = ( _value - _minimum ) mod ( _wrapAt - _minimum );
    if ( _mod < 0 ) return _mod + _wrapAt else return _mod + _minimum;
}

//swap position of two items in list
function Swap(_list,_o1,_o2) {
	var i1 = ds_list_find_index(_list,_o1)
	var i2 = ds_list_find_index(_list,_o2)
	if (i1 != -1 && i2 != -1 && (i2 != i1)) {
		ds_list_replace(_list,i1,_o2)
		ds_list_replace(_list,i2,_o1)
		return true;
	}
	else {
		DebugMessage("Improper swap")
		return false;
	}
}

function SwapPos(_o1,_o2, pX, pY, sig) {
	var temp = _o1.pos;
	_o1.pos = _o2.pos;
	_o2.pos = temp;
	
	
	//var pX = 264;
	//var pY = 256;
	
	with _o1 {
		x = pX + sig*(68*pos);
		y = pY;
		baseX = pX + sig*(68*pos);
		baseY = pY;
	}
	
	with _o2 {
		x = pX + sig*(68*pos);
		y = pY; 
		baseX = pX + sig*(68*pos);
		baseY = pY;
	}
}