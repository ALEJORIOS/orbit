clear
clc

const = -39.4887;
IP = 1.016714;
IV = 6.1798;
teta = 18.61;
sim("simOrbit.slx")
plot3(Xposition,Yposition,Zposition);
grid on
[a1,e1,r1] = cart2sph(Xposition,Yposition,Zposition);       %Convierto la original a esféricas
[x2,y2,z2] = sph2cart(a1,e1,r1);                                  %Desconvierto a cartesianas, ya tengo azimuth y radio

[a2,e2,r2] = cart2sph(x2,y2,sin(a1)*tan(teta));              %Convierto a esféricas con inclinación
[x3,y3,z3] = sph2cart(a2,e2,r1);                                  %Desconvierto de esféricas

[a3,e3,r3] = cart2sph(x2,y2,sin(a1)*tan(2*teta));
[x4,y4,z4] = sph2cart(a3,e3,r1);



plot3(Xposition,Yposition,Zposition,x3,y3,z3,x4,y4,z4);
xlabel("Eje x")
ylabel("Eje y")
zlabel("Eje z")
title("Precesión del planeta tierra cada 100 millones de años")
axis([-1.1 1.1 -1.1 1.1 -1.1 1.1])
grid on