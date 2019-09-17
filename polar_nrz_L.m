clear


bits = [0,1,1,0,1,0,1,0,1,1,1,0];

promt =('Enter the input ');
z=input(promt);

for i = 1:length(bits)
    if(bits(i)==0) 
        amplitude(i) = z;
    else 
        amplitude(i) = -z;
    end
    
end




Time=12;  
%length(bits)/bitrate;

sampling_frequency = 100;
%mn=1/(sampling_frequency*bitrate)
time = 0:(1/sampling_frequency):Time;

x = 1;

for i = 1:length(time)
    y_value(i)= amplitude(x);
    if time(i)>=x
        x= x+1;
    end
end
     

plot(time,y_value);
axis([0 Time -3 3]);


% demodulation
x = 0;

for i = 1:length(time)
    if time(i)>x
        x = x + 1;
        if y_value(i)<0
          ans_bits(x) = 1;
         else
          ans_bits(x) = 0;
        end
    end
end

disp('Demodulation : ')
disp(ans_bits)


