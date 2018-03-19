//  =====================================
//  Activate SOS using a Pet.
//  Written by: sant1g - 03/19/2018
//  =====================================

const
SOS_ID = 789; // Spirit of Shilen
POS_ID = 788; // Pain of Shilen
TRIGGER_ID = 5564; // Pain of Shilen trigger

var
sosSkill,posSkill: TL2skill;
sosBuff,triggerBuff: TL2buff;

begin
    while true do begin
    if not user.buffs.byid(SOS_ID,sosBuff) then begin
        if (skilllist.byid(SOS_ID,sosSkill) and (sosSkill.endtime = 0)) and (skilllist.byid(POS_ID,posSkill) and (posSkill.endtime = 0)) then begin
            engine.useskill(posSkill);
            delay(500);
            print('Charging SOS');
            while user.buffs.byid(TRIGGER_ID,triggerBuff) and not (triggerBuff.level >= 3) do begin
                if petlist.count > 0 then begin
                    if (user.target.name = '') then 
                    engine.settarget(petlist.items(0)); // Targetea el perro
                    engine.attack(true); // Le pega al perro :(
                end;
                else begin
                    print('No Pet Found x[');
                end;
                delay(150);
            end;
            if (triggerBuff.level >= 3) then begin
                print('Using '+sosSkill.name);
                engine.useskill(sosSkill);
            end;
        end;
    end;
    delay(500);
    end;
end.