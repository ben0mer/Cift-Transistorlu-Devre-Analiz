function [Kv1 Kv2 Kv ri Kvg ro] = kaskatbjtac(re1, re2, hfe, RB1, RE1, RC1, RE2, RY,Rg,Ry,Re2, cikistip)
if strcmp(cikistip, 'kollektor')
    syms Ib2
    VO = -RY*hfe;
    V1 = RE2*(hfe+1)+(hfe*re2);
    Kv2 = VO/V1;
    V12=-RC1*(hfe+Ib2);
    Ib2denklem = V12-V1*Ib2;
    Ib2 = vpasolve(Ib2denklem,Ib2);
    V13 = Ib2*V1;
    Vi = RE1*(hfe+1)+hfe*re1;
    Kv1=V13/Vi;
    Kv=Kv1*Kv2;
    ri=(Vi*RB1)/(Vi+RB1);
    Kvg= (ri/(ri+Rg))*Kv;%bunlar doğru olmayabilir
    %roussu = re2+Ry/hfe;
    %ro = (Re2*roussu)/(Re2+roussu);
    ro=Re2;
elseif strcmp(cikistip, 'emetor')
    syms Ib1 Ib2
    vo=((hfe+1)*RE2*Ib2); % Rc2 =0 ise bunu kullan
    V12=(Ib2*hfe*re2)+((hfe+1)*RE2*Ib2);
    Kv2 =vo/V12; 
    Kv2=double(Kv2);
    a=(RC1*hfe)/(hfe*re2+(hfe+1)*RE2+RC1); %% Ib2/Ib1
    V111=V12*(-a)/Ib2;      
    V11=double(V111)*Ib1;
    Vi=(Ib1*hfe*re1)+((hfe+1)*RE1*Ib1);
    Kv11=V11/Vi;        
    Kv1=double(Kv11);
    ri2=Vi/Ib1;
    rii=(ri2*RB1)/(ri2+RB1);
    ri=double(rii);
    Kv=Kv1*Kv2;
    Kvg= (ri/(ri+Rg))*Kv;
    roussu = re2+Ry/hfe;
    ro = (Re2*roussu)/(Re2+roussu);
else
end
end

