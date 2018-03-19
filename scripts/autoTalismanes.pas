//  =====================================
//  Simple Sript for Obtaining Talismans
//  Written by: sant1g - 23/06/16
//  =====================================
//  Gludio		35648   Bayou		35863
//  Dion		35649   White Sands	35900
//  Giran		35650   Borderland	35932
//  Oren		35651   Swamp		35970
//  Aden		35652   Archaic		36007
//  Heine		35653   Floran		36039
//  Goddard		35654   C Mountain	36077
//  Rune		35655   Tanor		36114
//  Schuttgart	35656   Dragonspine	36145
//  Shanty		35662   Antharas	36177
//  Southern	35694   Western		36215
//  Hive		35731   Hunter		36253
//  Valley		35763   Aaru		36290
//  Ivory		35800   Demon		36322
//  Narsell		35831   Monastic	36360
//  =====================================

procedure obtainTalisman;
begin
    engine.settarget(35655); // Reemplazar por el ID del NPC correspondiente.
    engine.dlgopen;
    engine.dlgsel('Obtain Talisman');
    delay(300);
    engine.dlgsel(1);
    delay(300);
    engine.dlgsel(1);
    delay(300);
end;
begin
    Engine.loadconfig('talismanes.xml');
    while (1) do 
    begin
        obtainTalisman;
    end;
end.
