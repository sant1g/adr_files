//  =====================================
//  Simple Script for Tower of Infinitum
//  Written by: sant1g - 16/12/17
//  =====================================
//  Important Notes:
//  WORK IN PROGRESS
//  Working on every floor of the Tower.
//  =====================================

uses libBuff;

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
    while delay(1000) do begin
        libBuff.customScheme(2);
        delay(700);
        engine.facecontrol(0, true); // Start Bot
        while not isDead do delay(1000); // Wait till u die
    end;
end.