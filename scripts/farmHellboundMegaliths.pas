//  =====================================
//  Megaliths Farm Script
//  Written by: sant1g - 23/12/17
//  =====================================
//  Important Notes:
//  Optimized for Doombringer.
//  =====================================

uses libConsumables, libTeleport, libBuff;
function SetForegroundWindow(hwnd: integer) : Boolean; stdcall;
external 'user32.dll';

var
item: TL2Item;

function buffCheck: Boolean;                         
var buff: TL2Buff;
begin
  if not User.Buffs.ByID(1388, buff) or (buff.EndTime < 1800000) then begin          
    Result:=true;
    libTeleport.giran;
    Delay(1000);
    Engine.MoveTo(83592, 147976, -3384);
    Engine.MoveTo(83768, 148184, -3376);
    Engine.MoveTo(84008, 148200, -3384); // Moves character to offline buffers
    Delay(300);
    libBuff.customScheme(2);
    Delay(300);
    Engine.SetTarget('CC');
    Delay(700);
    Engine.Attack;
    Delay(700);
    engine.bypasstoserver('10'); // Gets CC from offline buffer
    Delay(500);
  end;
  Result:=false;
end;

procedure farm;
var buff: TL2Buff;
begin    
  delay(150);        
  buffCheck;
  if User.Buffs.ByID(1388, buff) then begin
    libConsumables.repot;
    libTeleport.megaliths;
    Delay(7000);
    Engine.FaceControl(0, true);
    while not User.Dead do
    delay(1000);
    Engine.FaceControl(0, false);
    Engine.GoHome;
    Delay(7000);
  end; 
end;

begin
  while true do begin
    farm;
    delay(300);
	end;
end.