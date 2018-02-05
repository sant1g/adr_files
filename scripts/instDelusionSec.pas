//  =======================================
//  Delusion Chamber Secondary Char
//  Written by: sant1g - 07/12/17
//  =======================================
//  Important Notes:
//  Update CB ID's depending on server.
//  =======================================

uses libTeleport, libBuff;

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
    libTeleport.giran;
    Delay(3000);
    Engine.MoveTo(83592, 147976, -3384);
    Engine.MoveTo(83768, 148184, -3376);
    Engine.MoveTo(84008, 148200, -3384); // Moves character to offline buffers
    Delay(700);
    Engine.SetTarget('CC');
    Delay(700);
    Engine.Attack;
    Delay(700);
    engine.bypasstoserver('10'); // Gets CC from offline buffer
    Delay(700);
    libBuff.customScheme(2);
    Delay(700);
    libTeleport.delusion;
    delay(2000);
    Engine.MoveTo(-114600, -151240, -6704); // Moves character to eastern seal
    Engine.FaceControl(0, true); // Toggle Bot
while not isDead do delay(1000); // Waits till u die
end;
end.