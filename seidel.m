clc
A=input("Matrix");
b=input("Matrix1");
x0=input("initial solution mat");
tol=0.0001;
max_it=10;
[n,m]=size(A);
x=x0;
C=-A;

for i=1:n
   C(i,i)=0;
  end
for i=1:n
  C(i,1:n)= C(i,1:n)/A(i,i);
  end
for i=1:n
 r(i,1)= b(i)/A(i,i);
 end
i=1;
while(i<max_it)
xold=x;
for j=1:n
 x(j)=C(j,:)*x+r(j);
 end
 if norm(xold-x)<=tol
   disp('converged');
  return;
  end
 printf(" %d      %f",i,x);
 i=i+1;
 end