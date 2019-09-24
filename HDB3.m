clear;

bits = [1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0];

bit_rate=1;
voltage=1;
tmp = voltage;
sign = -1;
mrk = 1;
voltage = sign*voltage;
cn0=0;
cn1=0;
in = 0;

for i = 1:length(bits)
    
    if bits(i) == 0
        cn0 = cn0+1;
    else
        cn1=cn1+1;
        cn0=0;
    end
    
    if cn0>3
        if mod(cn1,2)==0
            y_level(i) = -voltage;
            voltage = y_level(i);
            y_level(i-3) = voltage;
        else
            y_level(i) = voltage;
        end
        cn0=0;
        cn1=0;
    elseif bits(i)==0
        y_level(i) = 0;
    else 
        y_level(i) = -voltage;
        voltage=y_level(i);
    end
end

voltage=tmp;
Time=length(bits)/bit_rate; 
frequency = 1000;
time = 0:.01:Time;
x = 1;

for i = 1:length(time)
    y_value(i)= y_level(x);
    if time(i)*bit_rate>=x
        x= x+1;
    end
end
     
plot(time,y_value);
axis([0 Time -voltage-2 voltage+2]);
