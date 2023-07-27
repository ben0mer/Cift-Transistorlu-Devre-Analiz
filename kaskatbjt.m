function [Ib1 Ic1 Ie1 Ib2 Ic2 Ie2]= kaskatbjt(R1,R2,Rc1,Rc2,Re1,Re2,Vcc,Vee,Vbe,hfe,tip)
if strcmp(tip, 'npn-pnp')
    syms Ib1 Ib2
    Rb1 = (R1*R2)/(R1+R2);
    Vbb = (Vcc-Vee)*R2/(R1+R2);
    Ib1denklem = -Vbb+(Rb1*Ib1)+Vbe+Re1*(hfe+1)*Ib1;
    Ib1 = vpasolve(Ib1denklem,Ib1);
    Ic1 = hfe*Ib1;
    Ie1 = Ic1+Ib1;
    Ib2denklem = Rc1*(Ic1+Ib2)-Vbe +Re2*(hfe+1)*Ib2;
    Ib2 = vpasolve(Ib2denklem,Ib2);
    Ic2 = hfe*Ib2;
    Ie2 = Ib2+Ic2;
elseif strcmp(tip, 'npn-npn')
    syms Ib1 Ib2
    Rb1 = (R1*R2)/(R1+R2);
    Vbb = (Vcc-Vee)*R2/(R1+R2);
    Ib1denklem = -Vbb+(Rb1*Ib1)+Vbe+Re1*(hfe+1)*Ib1;
    Ib1 = vpasolve(Ib1denklem,Ib1);
    Ic1 = hfe*Ib1;
    Ie1 = Ic1+Ib1;
    Ib2denklem = Rc1*(Ic1+Ib2)+Vbe +Re2*(hfe)*Ib2+Vee-Vcc;
    Ib2 = vpasolve(Ib2denklem,Ib2);
    Ic2 = hfe*Ib2;
    Ie2 = Ib2+Ic2;
elseif strcmp(tip, 'pnp-npn')
    syms Ib1 Ib2
    Rb1 = (R1*R2)/(R1+R2);
    Vbb = (Vcc-Vee)*R1/(R1+R2);
    Ic1 = -hfe*(Vbb-Vbe)/(Rb1+(hfe+1)*(Re1));
    Ib1 = Ic1/hfe;
    Ie1 = Ic1+Ib1;
    Ic2 = -hfe*(Rc1*Ic1+Vbe)/(Rc1+(hfe+1)*Re2);
    Ib2 = Ic2/hfe;
    Ie2 = Ic2+Ib2;
elseif strcmp(tip, 'pnp-npn-tekdirenc')
    syms Ib1 Ib2
    Rb1 = (R1*R2)/(R1+R2);
    Vbb = (Vcc-Vee)*R1/(R1+R2);
    Ic1 = -hfe*(Vcc-Vbe)/(R1+(hfe+1)*(Re1));
    Ib1 = Ic1/hfe;
    Ie1 = Ic1+Ib1;
    Ic2 = -hfe*(Rc1*Ic1+Vbe)/(Rc1+(hfe+1)*(Re2));
    Ib2 = Ic2/hfe;
    Ie2 = Ic2+Ib2;
else
    disp('Geçersiz Tip')
end
end

