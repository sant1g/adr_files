//  =====================================
//  Megaliths Farm Script
//  Written by: sant1g - 23/12/17
//  =====================================
//  Important Notes:
//  Optimized for Doombringer. (Premium)
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
    libBuff.customScheme(2);
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