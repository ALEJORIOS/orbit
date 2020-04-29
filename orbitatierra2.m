clear
clc

const = -39.4887;
IP = 1.016714;
IV = 6.1798;
teta = 18.61;
sim("simOrbit.slx")
plot3(Xposition,Yposition,Zposition);
grid on
[a1,e1,r1] = cart2sph(Xposition,Yposition,Zposition);       %Convierto la original a esf�ricas
[x2,y2,z2] = sph2cart(a1,e1,r1);                                  %Desconvierto a cartesianas, ya tengo azimuth y radio

[a2,e2,r2] = cart2sph(x2,y2,sin(a1)*tan(teta));              %Convierto a esf�ricas con inclinaci�n
[x3,y3,z3] = sph2cart(a2,e2,r1);                                  %Desconvierto de esf�ricas

[a3,e3,r3] = cart2sph(x2,y2,sin(a1)*tan(2*teta));
[x4,y4,z4] = sph2cart(a3,e3,r1);



plot3(Xposition,Yposition,Zposition,x3,y3,z3,x4,y4,z4);
xlabel("Eje x")
ylabel("Eje y")
zlabel("Eje z")
title("Precesi�n del planeta tierra cada 100 millones de a�os")
axis([-1.1 1.1 -1.1 1.1 -1.1 1.1])
grid on