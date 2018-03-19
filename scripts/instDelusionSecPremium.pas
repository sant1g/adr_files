//  =======================================
//  Delusion Chamber Secondary Char
//  Written by: sant1g - 07/12/17
//  =======================================
//  Important Notes:
//  For Premium Accounts
//  Update CB ID's depending on server.
//  =======================================

uses libBuff;

function isDead:boolean;
begin
    result:= false;
    if user.dead then begin
        result:= true;
        engine.facecontrol(0, false);
        delay(700);
        engine.gohome;
        delay(5000); // Five seconds timeout to GK
        script.replace; // reload script
    end;
end;

begin
while delay(1000) do begin
    libBuff.customScheme(2);
    Engine.FaceControl(0, true); // Toggle Bot
while not isDead do delay(1000); // Waits till u die
end;
end.