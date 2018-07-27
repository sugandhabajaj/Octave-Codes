clc
A=input(" Enter a square matrix");
B=input(" Enter the row vector");
[n,m]=size(A);
C=[A B];
for i=1:n-1
    for k=i+1:n
    m(k,i)= -C(k,i)/C(i,i);
    C(k,:)=C(k,:) +m(k,i)*C(i,i);
    end
 end
x(n,1)= C(n,n+1)/ C(n,n);
for i=n-1:-1:1
     x(i,1)=(C(i,n+1)-C(i,i+1:n)* x(i+1:n,1))/ C(i,i);
  end
 disp(" The solution is ");
 disp(x);