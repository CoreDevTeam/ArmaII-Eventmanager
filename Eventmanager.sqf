//Recive settings from init :
// - Max/Min Time Between Mission 
// mission_complete = false;

//TODO
// Anti Bug System, ABS
// Eigenes Ai system entwicklen oder DAC ?
// -> DAC Zonen erstellbar per Code ? Individuell löschbar ? 
//ABS::Note : Bei den Missionen einen Timer einbauen.
//Nach dessen ablauf wird die Mission gelöscht und auf nicht erfüllt getellt.Soweit es geht, alles Missions objekte/ai löschen.
// Code cleanup

//////////////////////////////////////////////Var///////////////////////////////////////////////
private ["_last_mission"];

//Int : speichert die an der Missionsauswahlt zuletzt zufalls ausgewählte Zahl.Verhindert zwei mal die gleiche Mission hintereinander
//Mit 0 init.Mission mit der assozierten Zahl 0 kommt nie als erstes dran
_last_mission = 0;
//Int : const Nummer für die switch schleife zur zufälligen Missions auswahl
// siehe Debug\Tasks.txt
_mission_count = 7;
//
//
////////////////////////////////////////////////////////////////////////////////////////////////

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
	// Parameter [int,int]
	private["_param_min","_param_max","_return","_var_temp_int","_var_temp_int_ran"];
	
	_param_min = _this select 0;
	_param_max = _this select 1;
	// fnc
	_var_temp_int = _param_max - _param_min;
	
	//Desc
	// Maximaler Wert 240
	// Zufall =< 240
	// Zufall + 30;
	// = ( Zufall => 30 && Zufall =< (_temp_int + 30) ) -> nicht kleiner als 30(min) nicht größer als 270(max)
	_var_temp_int_ran = floor(random _var_temp_int);
	
	_return = _var_temp_int_ran + _param_min ;
	
	// return = int
	_return
};

//////////////////////////////////////////Eventmanager//////////////////////////////////////////

private["_TBM","_ran_mission_num"];

_TBM = [min_TBM,max_TBM] call fnc_random;

sleep _TBM;

//0,1,...,7 : index of 8
_ran_mission_num = floor(random _mission_count);

switch ( _ran_mission_num ) do 
{
	case 0 : { execVM "data\Missions\0\mission.sqf"; };
	case 1 : { execVM "data\Missions\1\mission.sqf"; };
	case 2 : { execVM "data\Missions\2\mission.sqf"; };
	case 3 : { execVM "data\Missions\3\mission.sqf"; };
	case 4 : { execVM "data\Missions\4\mission.sqf"; };
	case 5 : { execVM "data\Missions\5\mission.sqf"; };
	case 6 : { execVM "data\Missions\6\mission.sqf"; };
	case 7 : { execVM "data\Missions\7\mission.sqf"; };
};



// Warten bis die Mission die var mission_complete von false auf True setzt
// sleep um CPU performance zu sparen, prüfung der var im 5 sec Takt, 
// später vielleicht niedrigere Frequenz bei performance einbrüchen

waitUntil { sleep 5; mission_complete == true; };

// Eventmanager neu ausführen um eine Neue Mission zu starten
execVM "Eventmanager.sqf";