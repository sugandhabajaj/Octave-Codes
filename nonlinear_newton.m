clc ;
f1=inline('x1+3*log10(x1)-x2^2');
f2=inline('2*x1^2-x1*x2-5*x1+1');
f11=inline('1+3/(log(10)*x1)');
f12=inline('-2*x2');
f21=inline('4*x1-x2-5');
f22=inline('-x1');
x =[3.4;2.2];
printf(' \n x(0)= ');
disp (x);
for i =1:3
fx =[ f1(x(1),x(2));f2(x(1),x(2))];
printf('\n fx(%i)= \n',i);
disp(fx);
A=[f11(x(1),x(2)),f12(x(1),x(2));f21(x(1),x(2)),f22(x(1),x(2)),];
printf(' \n A= ');
disp(A);
A_1 = inv(A);
printf(' \n Inverse of A= ');
disp(A_1);
x=x-A_1*fx;
printf(' \n x(%i)= \n',i);
end
disp(x);