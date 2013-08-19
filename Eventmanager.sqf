//Recive settings from init :
// - Max/Min Time Between Mission 

// Testing if Param's are set
if ( max_TBM == 0 && min_TBM == 0 ) then 
{ 
	textLog "#ArmaII 7xCore Eventmanager #001Warning: Parameter max_TBM and min_TBM are not set.Defaulting both values";
	max_TBM = 270;
	min_TBM = 30;
	
	publicVariable "max_TBM";
	publicVariable "min_TBM";
};

fnc_random = 
{
	// [int,int]
	
	private["_param_min","_param_max","_return","_var_temp_int","_var_temp_int_ran"];
	
	_temp_int = _param_max - _param_min;
	
	// Maximaler Wert 240
	// Zufall =< 240
	// Zufall + 30;
	// = ( Zufall => 30 && Zufall =< (_temp_int + 30) ) -> nich kleiner als 30(min) nicht größer als 270(max)
	_var_temp_int_ran = floor(random _temp_int);
	
	_return = _var_temp_int_ran + _param_min ;
	
	// return = int
	_return
};


