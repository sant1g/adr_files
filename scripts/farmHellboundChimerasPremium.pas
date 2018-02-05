//  =====================================
//  Chimeras Farm Script
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

procedure goSpot;
begin
	Engine.MoveTo(5672, 242648, -1888);
	Engine.MoveTo(5816, 241464, -1936); // Upper Spot (Iron Castle)
end;

procedure goSpot2;
begin
  Engine.MoveTo(2536, 241816, -2432);
  Engine.MoveTo(2424, 241224, -2608); // Lower Spot (Battered Land's)
end;

procedure farm;
var buff: TL2Buff;
begin 
	delay(150);        
  engine.loadzone('Hellbound Chimeras.zmap');
  buffCheck;
  if User.Buffs.ByID(1388, buff) then
    begin
      libConsumables.repot;
      libTeleport.chimeras;
      Delay(5000);
      goSpot; // Moves character to desired spot
      Engine.FaceControl(0, true); // Toggle bot
      while not User.Dead do
      delay(1000);
      Engine.FaceControl(0, false); // Toggle bot
      Engine.GoHome;
      Delay(7000);
  end;
end;

begin
  while true do begin
    farm(); // ( ͡° ͜ʖ ͡°)
    delay(300);
	end;
end.