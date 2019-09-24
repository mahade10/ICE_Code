clear ;
%bits = [1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0];
bits= [0,1,0,0,1,0,0,0,0,0,0,0,0,1,0,1,0,1,0];
cn=0;
cn1=0;
amp=1;
prev=-1;
amp=amp*prev;
for i=1:length(bits)
  if(bits(i)==0)
  cn++;
  else
    cn1++;
    cn=0;
  end
  if(cn>3)
    if (mod(cn1,2)==0)
       
     ampl(i) = -amp;
     amp=ampl(i);
     ampl(i-3) = amp;
     
    
    else
      ampl(i) = amp;
    end
    cn=0;
    cn1=0;
    elseif(bits(i)==0)
      ampl(i)=0;
    else
      ampl(i)=-amp;
      amp=ampl(i);
    end
endfor
T=length(bits);
t=0:0.01:T;
x=1;
for i=1:length(t)
  yvalue(i)=ampl(x);
  if(t(i)>=x)
    x=x+1;
  end
endfor
plot(t,yvalue);
axis([0 T -5 5]);

counter = 0;
lastbit = -1;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + 1;
    if yvalue(i)==lastbit
      result(counter-3:counter) = 0;
    else
      if(yvalue(i)==0)
        result(counter) = 0;
      else
        result(counter) = 1;
        lastbit = -lastbit;
      end
    end
  end
end


bits
result