//  =======================================
//  Teleports Library
//  Created by: sant1g - 23/12/17
//  =======================================
//  Important Notes:
//  Update procedures depending on server.
//  =======================================

unit libTeleport;
interface
implementation

procedure giran;
begin
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('03');
    Delay(700);
    engine.bypasstoserver('09');
end;

procedure schutt;
begin
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('03');
    Delay(700);
    engine.bypasstoserver('011');
end;

procedure hunters;
begin
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('03');
    Delay(700);
    engine.bypasstoserver('0e');
end;

procedure delusion;
begin
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('03');
    Delay(700);
    engine.bypasstoserver('037');
end;

procedure chimeras;
begin
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('03');
    Delay(700);
    engine.bypasstoserver('017');
    Delay(700);
    engine.bypasstoserver('06');
end;

procedure megaliths;
begin
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('03');
    Delay(700);
    engine.bypasstoserver('017');
    Delay(700);
    engine.bypasstoserver('01');
end;

procedure disciples;
begin
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('03');
    Delay(700);
    engine.bypasstoserver('01e');
    Delay(700);
    engine.bypasstoserver('07');
end;

procedure database(Para : string);
begin
    Engine.BypassToServer('_bbshome');
    Delay(700);
    Engine.BypassToServer('0c');
    Delay(700);
    Engine.BypassToServer('01 ' + Para + ' _1');
    Delay(700);
    Engine.BypassToServer('07');
    Delay(700);
    Engine.BypassToServer('0a');
end;

end.