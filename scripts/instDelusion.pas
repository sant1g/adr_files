//  =======================================
//  Delusion Chamber 
//  Written by: iNub - 31/03/15
//  Updated by: sant1g - 07/12/17
//  =======================================
//  Important Notes:
//  Update procedures depending on server:
//      buffPlayer
//  =======================================

uses sysutils, Classes, libConsumables, libTeleport, libBuff;
procedure Delusion;
var
NPCA : TL2Npc;
Item : TL2Item;
moveRoom,sealSelector: Integer;

function checkStatus: Boolean;
begin
Result:=true;
    if User.Dead then 
    begin
        Delay(1000);
        Engine.FaceControl(0,false);
        Engine.GoHome;
        Delay(10000);
    end;
Result:=false;
end;

procedure buffPlayer;
begin
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
end;

function checkBuffs: Boolean;
var buff: TL2Buff;
begin
Result:=true;
if not User.Buffs.ByID(1501, buff) or (buff.EndTime < 1800000) then 
begin
    Result:=true;
    buffPlayer;
    Delay(700);
end;
Result:=false;
end;

function changeRoom: boolean;
begin
    engine.facecontrol(0, false);
    Delay(700);
    engine.settarget('Delusion Manager');
    Delay(700);
    engine.movetotarget;
    Delay(700);
    engine.dlgopen;
    delay(100+random(100));
    engine.dlgsel(1);
    delay(2000);
end;

function exitSeal: boolean;
begin
    engine.facecontrol(0, false);
    Delay(700);
    engine.settarget('Delusion Manager');
    Delay(700);
    engine.movetotarget;
    Delay(700);
    engine.dlgopen;
    delay(100+random(100));
    engine.dlgsel(2);
    delay(2000);
end;
 
Function raidDead: Boolean;
begin
    if (user.target.dead and (user.target.name = ('Aenkinel'))) then 
    begin
        Delay(3000);
        exitSeal;
        Delay(700);
    end;
end; 

begin
    sealSelector := 0;
    engine.loadzone('Eastern Raid.zmap');
    engine.loadconfig('Delusion.xml');
    while Engine.Status = lsOnline do 
    begin
        delay(1700);
        checkStatus;
        Delay(700);
        raidDead;
        npclist.byid(32658,NPCA);
        if user.distto(NPCA) > 200 then 
        begin
            Engine.SetTarget(NPCA);
            Delay(700);
            Engine.MoveTo(NPCA);
            Delay(700);
        end;
        if user.inrange(-114584, -151320, -6704, 200) and (user.DistTo(NPCA) < 300) then 
        begin
            checkBuffs; // Checks Buffs before entering the seal
            libConsumables.repotSafe; // Checks Consumables before entering the seal
            Delay(500);
            Engine.FaceControl(0, false);
            Delay(1200);
            Engine.SetTarget(NPCA);
            Delay(700);
            Engine.DlgOpen;
            Delay(1200);
            Engine.DlgSel('Enter the Eastern Seal.');
            Delay(1700);
        end;
        moveRoom := 1;
        if not (user.inZone) and (moveRoom = 1)  then 
        begin
            Delay(7000);
            changeRoom;
            delay(700);
            moveRoom := 0;
        end;
        if not (user.inZone) and (moveRoom = 0) then 
        begin
            Delay(7000);
            exitSeal;
            delay(700);
            moveRoom := 1;
        end;             
        if user.inZone then 
        begin
            Engine.FaceControl(0, true);
            if Engine.SetTarget('Aenkinel') then
            delay(700);
            if User.Target.HP > 1 then 
            begin
                Delay(4700);
            end;
        end;
    end;
end;
        
begin
Script.NewThread(@Delusion);
end.