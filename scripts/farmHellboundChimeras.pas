//  =====================================
//  Chimeras Farm Script
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
    Engine.MoveTo(84008, 148200, -3384); // Mueve el PJ hasta el buffer Offline
    Delay(300);
    libBuff.customScheme(2);
    Delay(300);
    Engine.SetTarget('CC');
    Delay(700);
    Engine.Attack;
    Delay(700);
    engine.bypasstoserver('10'); // Se tira CC del buffer offline
    Delay(500); // Buff Finalizados
  end;
  Result:=false;
end;

procedure goSpot;
begin
	Engine.MoveTo(5672, 242648, -1888);
	Engine.MoveTo(5816, 241464, -1936); // Mueve el PJ al spot superior
end;

procedure goSpot2;
begin
  Engine.MoveTo(2536, 241816, -2432);
  Engine.MoveTo(2424, 241224, -2608); // Mueve el PJ al spot inferior
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