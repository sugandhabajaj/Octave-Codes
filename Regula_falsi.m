clc
f=inline('5*(x^3)-5*x+1');
x1=input('first'); 
x2=input('second');
e =0.00001;
i=0;
e1=abs(x2-x1);
printf ( '\n iter \t x1 \t f(x1) \t x2 \t f(x2) \t x3 \t f(x3)\t err \n');
while(e1>e)
x3= x2- f(x2)*(x2-x1)/(f(x2)-f(x1));
e1=abs(x2-x3);
printf('\n %i  %f  %f  %f  %f  %f  %f',i,x1,f(x1),x2,f(x2),x3,f(x3),e1);
if f(x1)*f(x3)>0 
x1=x3;
else
x2=x3;
end
i++;
end
printf('\n The solution is',x3);