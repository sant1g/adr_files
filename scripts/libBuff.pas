//  =======================================
//  Buffs Library
//  Created by: sant1g - 23/12/17
//  Last Update: 03/19/2018
//  =======================================
//  Important Notes:
//  Update procedures depending on server.
//  =======================================

unit libBuff;
interface
implementation

var soundEnabled: Integer;
soundEnabled := 1; // Set 0 to disable

Procedure defaultScheme(Para : String);
begin
    if (Para = 'warrior') then
    begin
        Engine.bypasstoserver('_bbshome');
        Delay(700);
        Engine.bypasstoserver('_bbsgetfav');
        Delay(700);
        Engine.bypasstoserver('01');
        Delay(700);
        Engine.bypasstoserver('02');
    end;
    if (Para = 'mage') then
    begin
        Engine.bypasstoserver('_bbshome');
        Delay(700);
        Engine.bypasstoserver('_bbsgetfav');
        Delay(700);
        Engine.bypasstoserver('01');
        Delay(700);
        Engine.bypasstoserver('01');
    end;
end;

Procedure customScheme(Para : Integer);
begin
    Engine.bypasstoserver('_bbshome');
    Delay(700);
    Engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    Engine.bypasstoserver('01');
    Delay(700);
    if (Para = 1) then
    begin
        Engine.bypasstoserver('010');
    end;
    if (Para = 2) then
    begin
        Engine.bypasstoserver('012');
    end;
    if (Para = 3) then
    begin
        Engine.bypasstoserver('014');
    end;
    if (Para = 4) then
    begin
        Engine.bypasstoserver('016');
    end;
    if (Para = 5) then
    begin
        Engine.bypasstoserver('018');
    end;
end;
end.