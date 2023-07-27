clear all
clc
syms R1 R2 Re hfe Vcc Vee Ib Ic Ie
R1 = 60e3;%tek tip direnç ise bunu ayarla R2 0 yap
R2 = 40e3;
Rc1 = 32e3;
Rc2 = 5e3;
Re1 = 54930;
Re2 = 3000;
%tip = 'npn-npn';
tip = 'npn-pnp';
%tip = 'pnp-npn';
%tip = 'pnp-npn-tekdirenc';
Vcc=15;
Vee=0;
hfe=75;
Vbe=0.6;
Vt=0.025;

[Ib1 Ic1 Ie1 Ib2 Ic2 Ie2] = kaskatbjt(R1,R2,Rc1,Rc2,Re1,Re2,Vcc,Vee,Vbe,hfe,tip)

re1=abs(Vt/Ic1)
re2=abs(Vt/Ic2)
%re1=Vt/0.001015;
%re2=Vt/0.002089;
RB1 = (57142*161350)/(57142+161350);%kaynak varsa kaynağın direncini katma
RE1 =(80e3*4e3);
RC1 =32e3;
RE2 =200;
RY =(5e3*20e3)/(25e3);
Rg=10e3; %kaynak varsa kaynağın önündeki direnç
Ry =20e3; %köprülenmiş ac de olmayan Çıkış direnci
Re2 = 5e3; %DC 2. transistör emetör/kollektör direnci
cikistip = 'kollektor';
%cikistip = 'emetor';

[Kv1 Kv2 Kv ri Kvg ro] = kaskatbjtac(re1, re2, hfe, RB1, RE1, RC1, RE2, RY,Rg,Ry,Re2, cikistip)

Rb = (85e3*13400)/(85e3+13400) ;%Baz direnci
Re = 1980 ;%Emetör direnci
%hfe = 100;
[SIcHfe] = duyarlilik(Rb,Re,hfe)
syms R3
R3 = vpasolve(50000==(100000*(R3*251+27750))/(251*R3+127750),R3)
