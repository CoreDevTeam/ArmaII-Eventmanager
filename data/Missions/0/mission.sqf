// Mission 0// IED beseitigen// Timer :// Mission startenmission_complete = false;publicVariable "mission_complete";fnc_timer = compile preprocessFile "data\Missions\timer.sqf";timeup = false;publicVariable "timeup";// create Timer[2600] call fnc_timer;// Setup Mission stuff// Task aufstellen// Zufall der Location auswählen. Siehe debug\Locations.txt// Position der Location = Pos der IED vielleciht x und y der Pos_arr verändern ? +10/-10// IED dort erstellen// Start Mission Loopwhile ( !timeup && !mission_complete ) do {	// Check ob IED als Vehicle noch alive ist	// wenn nicht dann timeup = true;	// loop wird abgebrochen};//Task Beendensleep 10;// Mission stoppen/neue Mission startenmission_complete = true;publicVariable "mission_complete";