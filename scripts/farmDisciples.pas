//  =====================================
//  Simple Script for Disciple's Necro
//  Written by: sant1g - 16/12/17
//  =====================================
//  Important Notes:
//  Optimized for Soultaker.
//  =====================================

uses libTeleport, libBuff;

function isDead:boolean;
begin
    result:= false;
    if user.dead then begin
        result:= true;
        engine.facecontrol(0, false); // Stop Bot
        delay(500);
        engine.gohome;
        delay(10000); // Wait 10s to rebuff after respawning
        script.replace; // Reset script
    end;
end;

begin
    engine.loadconfig('DisciplesNecropolis.xml'); // Load config
    while delay(1000) do begin
        libBuff.customScheme(1);
        delay(700);
        libTeleport.disciples;
        delay(5000); // 5s delay after teleport
        Engine.MoveTo(175000, -16216, -4880);
        Engine.MoveTo(176296, -15880, -4880); // Goes to the spot
        engine.facecontrol(0, true); // Start Bot
        while not isDead do delay(1000); // Wait till u die
    end;
end.