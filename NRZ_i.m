clear all;

bits = [1,1,1,0,0,0,1,0,1,1,1,0];
prev=1
amp=1;
amp=amp*prev;
tmp=amp;

for i = 1:length(bits)
    if(bits(i)==0) 
        amplitude(i) = amp;
        amp=amplitude(i);
    else 
        amplitude(i) = -amp;
        amp=amplitude(i);
    end
    
end
amp=tmp;


bit=length(bits);
bit_rate=2;
Time=bit/bit_rate; 

sampling_frequency = 100;
time = 0:.01:Time;

x = 1;

for i = 1:length(time)
    y(i)=0;
    y_value(i)= amplitude(x);
    if time(i)*bit_rate>=x
        x= x+1;
    end
end
     

plot(time,y_value ,time,y,':');
axis([0 Time -3 3]);


% demodulation

i=1;
in=1;
tmp=1;
for j=1:length(time)
  dm(i) = y_value(j)/amp;
  if time(j)*bit_rate>=i 
      if dm(i)==tmp
        ans_bits(in)=0;
      else 
        ans_bits(in)=1;
      end 
      disp(tmp);
      tmp=dm(i);
      i=i+1;
      in= in+1;
  end
 end


disp('Demodulation : ')
disp(bits);
disp(ans_bits)
