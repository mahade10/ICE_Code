clear;
%Ac = input('amplitude of the carrier signal Ac ');
%Am = input('amplitude of the message signal Am ');
%Fc = input('Frequency of the carrier signal Fc ');
%Fm = input('Frequency of the message signal Fm');
Ac=1,Am=1,Fc=5,Fm=4,T=5;
%T = input('time period T ');
t = 0:0.01:T;
Ym=Am.*sin(2*pi*Fm*t);
subplot(311);
plot(t,Ym);
title('Message signal');

Yc=Ac.*sin(2*pi*Fc*t);
subplot(312);
plot(t,Yc);
title('carrier signal');

Z=Ac.*sin(2*pi*Fc*t+((Am/Ac).*(2*pi*Fm*t)));
subplot(313);
plot(t,Z,'r');
title('modulated signal');