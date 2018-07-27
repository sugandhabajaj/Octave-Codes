clc;
A=[8 -3 2;4 11 -1;6 3 12];
b =[20;33;36];
x0=input('initial solution');
e=0.00001;
[n,m]=size(A);
x=x0;
C=-A;
err=abs(x);
max=15;
   for i=1:n
    C(i,i)=0;
   end
  for i=1:n
    C(i,1:n)= C(i,1:n)/A(i,i);
   end
    for i=1:n
    r(i,1)= b(i)/ A(i,i);
    end
i=1;
printf(' \n i \t x1 \t x2 \t x3 \n');
while(i<= max)
  xold=x;
   for j=1:n
     x(j)= C(j,:)* x + r(j);
    end
    if norm(xold-x) <=e
    disp(' Gauss- Seidel method converged');
    return;
    end
    disp([i     x'])
    i=i+1;
    end
    disp('Gauss-Seidel method did not converge');