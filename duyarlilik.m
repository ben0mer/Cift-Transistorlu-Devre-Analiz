function [SIcHfe] = duyarlilik(Rb,Re,hfe)
    SIcHfe= (Rb+ Re)/(Rb+Re+(hfe*Re));
end

