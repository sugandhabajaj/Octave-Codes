clc;
f=inline('x.^3-(3*x^.2)+4/3');
df=inline('3*x.^2-6*x');
x0=0;
e1=abs(x0);
e =1e-5;
while(e1>e)
x1=x0-f(x0)/f1(x0);
e1=abs(x0 -x1);
printf('\n %i \t %.10f \t %.10f \t %.10f \t %.10f \t %.10f \n' ,i-1,x0,f(x0),f1(x0),x1 ,e1);
x0=x1;
printf('The root is %.10f',x0);
end