clear;
bits = [0,1,1,0,1,0,1,0,1,1,1,1];

prev_Vol=-1;
amp=1;
amp=amp*prev_Vol;
tmp=amp;
bit =length(bits);
bit_rate = 2;
Time=bit/bit_rate;

sampling_frequency = 100;
in=1;
for i = 1:length(bits)
    if(bits(i)==0) 
        amplitude(i) = 0;
    else 
        amplitude(i) = -amp;
        amp=amplitude(i)
    end
end

amp=tmp;
time = 0:.01:Time;
x = 1;

for i = 1:length(time)
    y_value(i)= amplitude(x);
    if time(i)*bit_rate>=x
        x= x+1;
    end
end

plot(time,y_value );
axis([0 Time -3 3]);

% demodulation
x = 1;
tmp=prev_Vol;
for i = 1:length(time)
    if time(i)*bit_rate>x
        x = x + 1;
        if y_value(i)== 0
          ans_bits(x) = 0;
         else
          ans_bits(x) = 1;
          
        end
    end
end

disp('Demodulation : ')
disp(ans_bits)


