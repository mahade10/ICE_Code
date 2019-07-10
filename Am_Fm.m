clc
clear all
close all
m=1;
am=5;
fa=2000;
ta=1/fa;
t=0:ta/999:6*ta;
ym=am*sin(2*pi*fa*t);
figure(1)
subplot(3,1,1)
plot(t,ym)
title('modulation signal');

ac=am/m;
fc=fa*10;
tc=1/fc;
yc=ac*sin(2*pi*fc*t);
subplot(3,1,2)
plot(t,yc)
grid on;
title('carrier signal');

y=ac+(1+m*sin(2*pi*fa*t)).*sin(2*pi*fc*t);
subplot(3,1,3)
plot(t,y)
title('Amplitude modulation');
grid on;


