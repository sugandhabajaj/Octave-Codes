clc ;
f=inline( 'exp(x)-3*x-sin(x)');
f1=( 'exp(x)-3-cos(x)' );
x0=input('First value');
x1=input('Second value');
printf ( '\n iter \t x0 \t f(x0) \t x1 \t f(x1) \t x2 \t error \n');
e =0.0001;
e1=abs(x0-x1);
i=0;
while(e1>e)
x2=x1-f(x1)*(x1 -x0)/(f(x1)-f(x0));
e1=abs(x0 -x2);
printf('\n %d %f %f %f %f %f %f ',i,x0,f(x0),x1,f(x1),x2 ,e1);
x0=x1;
x1=x2;
i++;
end
printf ( '\n The root is %.10f',x2);