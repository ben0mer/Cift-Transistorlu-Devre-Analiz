%kollektör çıkışlı
RB= 11540;
RE = 0;
RC = 4800; %en sagdaki
Vt = 0.025;
Ic = 0.001;
Ry = 12000; %kapasitörle kollektöre bağlı direnç
Rc = 8e3;%kollektöre dogrudan baglı direnç
hfe = 100;

re = Vt/Ic;
Vo = -RC*hfe;
Vi = hfe*re;
Kv = Vo/Vi
riussu = hfe*re;
ri = (RB*riussu)/(RB+riussu)
ro = Rc