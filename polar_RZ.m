clear;
bits = [0,1,1,0,1,0,1,0,1,1,1,1];


amp=5;
bit =length(bits);
bit_rate = 1;
%Time=bit/bit_rate;
Time=12;

sampling_frequency = 100;
in=1;
for i = 1:length(bits)
    if(bits(i)==0) 
        amplitude(in) = -amp;
        amplitude(in+1)=0;
    else 
        amplitude(in) = amp;
        amplitude(in+1)=0;
    end
     in = in + 2;
end


bit_rate = bit_rate*2;
time = 0:.01:Time

x = 1;

for i = 1:length(time)
    y_value(i)= amplitude(x);
    if ((time(i)*bit_rate)>=x)
        x= x+1;
    end
end

plot(time,y_value );
axis([0 Time -10 10]);

x=0;
for i=1:length(time)
    if(time(i)>x)
    x=x+1;
    if(y_value(i)>0)
      ans(x)=1;
    else
      ans(x)=0;
     end
 end
end
bits
 disp('Demodulation : ')
 
 disp(ans);