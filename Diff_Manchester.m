clear;
bits = [0,1,1,0,1,0,1,0,1,1,1,1];

prev_Vol=-1;
amp=1;
amp=prev_Vol*amp;
tmp=amp;
bit =length(bits);
bit_rate = 2 ;
Time=bit/bit_rate;

sampling_frequency = 100;
in=1;
for i = 1:length(bits)
    if(bits(i)==1) 
        amplitude(in) = amp;
        amplitude(in+1)=-amp;
        amp=-amp;
    else 
        amplitude(in) = -amp;
        amplitude(in+1)=amp;
    end
     in = in + 2;
end

amp=tmp;
bit_rate = bit_rate*2;
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

i=1;
in=1;
st=1;
for j=1:length(time)
  if time(j)*bit_rate>=i
      if mod(in,2)==1
          if y_value(j) ==amp
            ans_bits(st)=1;
            amp=-amp;
          else 
            ans_bits(st)=0;
          end 
          st = st + 1;
      end
      i=i+1;
      in= in+1;
  end
 end
disp(bits);
 disp('Demodulation : ')
 disp(ans_bits)
