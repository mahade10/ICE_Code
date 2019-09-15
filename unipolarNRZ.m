clear;

bits=[0,1,0,1,0,1,0,0,1,0];

for i=1:length(bits)
if(bits(i)==1)
  amp(i)=1;
else
  amp(i)=0;
end
end
  
bitrate =1;
samplingrate = 100;
Time = length(bits)/bitrate;

time = 0:(bitrate/samplingrate):Time
  x = 1;

for i = 1:length(time)
    y_value(i)= amp(x);
    if time(i)>=x
        x= x+1;
    end
end
     

plot(time,y_value);
axis([0  Time -4 10]);
%demodulation
x = 0;

for i = 1:length(time)
    if time(i)>x
        x = x + 1;
        ans_bits(x) = y_value(i);

    end
end

disp('Demodulation : ')
disp(ans_bits)