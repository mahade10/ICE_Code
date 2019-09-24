clear ;

bits= [0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,1,0,1,0];
bitrate=1;
prev=-1;
amp=1;
amp=amp*prev;
c=0;
b=0;
for i=1:length(bits)
  if(bits(i)==0)
    c=c+1;
  else
    c=0;
    
  end
  
  if c>7
    ampl(i-4)=amp;
    ampl(i-3)=-amp;
    ampl(i-1)=-amp;
    ampl(i)=amp;
    c=0;
  elseif(bits(i)==0)
    ampl(i)=0;
  else
    ampl(i)=-amp;
    amp=ampl(i);
    end
end
Time=length(bits)/bitrate; 
frequency = 1000;
time = 0:.01:Time;
x = 1;

for i=1:length(time)
  y_value(i)=ampl(x);
  if(time(i)>=x)
  x++;
  end
end
plot(time,y_value);
axis([0 Time -4 4]);
