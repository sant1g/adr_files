//  =======================================
//  Consumables Library
//  Created by: sant1g - 07/12/17
//  =======================================
//  Important Notes:
//  Update procedures depending on server.
//  =======================================

unit libConsumables;
interface
implementation

procedure buySoulshots;
var cantSoulshots: Integer;
begin
    cantSoulshots := 5000; // Replace quantity
    engine.bypasstoserver('_bbshome');
    Delay(700); 
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);  
    engine.bypasstoserver('05');
    Delay(700);
    engine.bypasstoserver('016');
    Delay(700);   
    engine.NpcExchange(1467,cantSoulshots);
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
end;

procedure buyBlesseds;
var cantBlesseds: Integer;
begin
    cantBlesseds := 5000; // Replace quantity
    engine.bypasstoserver('_bbshome');
    Delay(700); 
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);  
    engine.bypasstoserver('05');
    Delay(700);
    engine.bypasstoserver('016');
    Delay(700);   
    engine.NpcExchange(3952,cantBlesseds);
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
end;

procedure buyManaPot;
var cantManaPot: Integer;
begin
    cantManaPot := 500; // Replace quantity
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('05');
    Delay(700);
    engine.bypasstoserver('015');
    Delay(700);
    engine.NpcExchange(728,cantManaPot);
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
end;

procedure buySpiritOre;
var cantSpiritOre: Integer;
begin
    cantSpiritOre := 5000; // Replace quantity
    engine.bypasstoserver('_bbshome');
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);
    engine.bypasstoserver('05');
    Delay(700);
    engine.bypasstoserver('015');
    Delay(700);
    engine.NpcExchange(3031,cantSpiritOre);
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
end;

procedure buyScrollRecovery;
var cantRecovery: Integer;
begin
    cantRecovery := 20; // Replace quantity
    engine.bypasstoserver('_bbshome');
    Delay(700); 
    engine.bypasstoserver('_bbsgetfav');
    Delay(700);  
    engine.bypasstoserver('05');
    Delay(700);
    engine.bypasstoserver('015');
    Delay(700);   
    engine.NpcExchange(8599,cantRecovery);
    Delay(700);
    engine.bypasstoserver('_bbsgetfav');
end;

procedure repot;
var 
soulshot,blessed,manapot,spiritore,scrollrecovery: TL2Item;
begin
    Inventory.User.ByID(1467, soulshot);
    Inventory.User.ByID(3952, blessed);
    Inventory.User.ByID(728, manapot);
    Inventory.User.ByID(8599, scrollrecovery);
    Inventory.User.ByID(3031, spiritore);
    Delay(1000);
    if (soulshot.count<5000) or (blessed.count<5000) or (manapot.count<300) or (spiritore.count<5000) or (scrollrecovery.count<2) then
    begin
        engine.bypasstoserver('_bbshome');
        Delay(700);
        engine.bypasstoserver('_bbsgetfav');
        Delay(700);
        engine.bypasstoserver('03');
        Delay(700);
        engine.bypasstoserver('011'); // GK Schutt
        Delay(5000);
        if soulshot.count<5000 then 
        begin
            buySoulshots;
        end; // Check and buy SS
        Delay(700);
        if blessed.count<5000 then 
        begin
            buyBlesseds;
        end; // Check and buy BSS
        Delay(700);
        if manapot.count<300 then 
        begin
            buyManaPot;
        end; // Check and buy Mana Potions
        Delay(700);
        if spiritore.count<5000 then 
        begin
            buySpiritOre;
        end; // Check and buy Spirit Ore
        Delay(700);
        if scrollrecovery.count<2 then 
        begin
            buyScrollRecovery;
        end; // Check and buy Scroll Recovery
    end;
end;

procedure repotSafe;
var 
soulshot,blessed,manapot,spiritore,scrollrecovery: TL2Item;
begin
    Inventory.User.ByID(1467, soulshot);
    Inventory.User.ByID(3952, blessed);
    Inventory.User.ByID(728, manapot);
    Inventory.User.ByID(8599, scrollrecovery);
    Inventory.User.ByID(3031, spiritore);
    Delay(1000);
    if (soulshot.count<5000) or (blessed.count<5000) or (manapot.count<300) or (spiritore.count<5000) or (scrollrecovery.count<2) then
    begin
        if soulshot.count<5000 then 
        begin
            buySoulshots;
        end; // Check and buy SS
        Delay(700);
        if blessed.count<5000 then 
        begin
            buyBlesseds;
        end; // Check and buy BSS
        Delay(700);
        if manapot.count<300 then 
        begin
            buyManaPot;
        end; // Check and buy Mana Potions
        Delay(700);
        if spiritore.count<5000 then 
        begin
            buySpiritOre;
        end; // Check and buy Spirit Ore
        Delay(700);
        if scrollrecovery.count<2 then 
        begin
            buyScrollRecovery;
        end; // Check and buy Scroll Recovery
    end;
end;

end.