clc;
f=inline('x *e^x');
a=input('First value');
b=input('Second value');
e=0.0001;
i=0;
e1=abs(b-a);
printf('\n iter \t a \t b \t c \t f(c), err \n');
while e1>e
c=(a+b)/2;
e1=abs(b-c);
printf ('%i %f %f %f %f %f \n',i,a,b,c,f(c),e1);
if f(c)*f(a) >0
a=c
else
b=c
end
i=i+1;
end
printf ( ' The solution is %g after %i iterations ' ,c,i -1);