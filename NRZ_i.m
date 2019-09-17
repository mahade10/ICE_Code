clear all;

bits = [1,1,1,0,0,0,1,0,1,1,1,0]
prev=1
amp=1;
amp=amp*prev;

for i = 1:length(bits)
    if(bits(i)==0) 
        amplitude(i) = amp;
        amp=amplitude(i);
    else 
        amplitude(i) = -amp;
        amp=amplitude(i);
    end
    
end


bit=length(bits);
bit_rate=1;
Time=bit/bit_rate; 

sampling_frequency = 100;
time = 0:.01:Time;

x = 1;

for i = 1:length(time)
    y(i)=0;
    y_value(i)= amplitude(x);
    if time(i)>=x
        x= x+1;
    end
end
     

plot(time,y_value ,time,y,':');
axis([0 Time -3 3]);


% demodulation
x=0;
count=0;
lastbit=1;
for i=1:length(time)
  if(time(i)>count)
   % x=x+1;
    count=count+1;
     if(y_value(i))!=lastbit
     ansbit(count)=1;
     lastbit=-lastbit;
  else
    ansbit(count)=0;
    end
  end
end
disp('Demodulation : ')
disp(ansbit);
