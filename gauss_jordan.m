clc
A=input(" Enter the square matrix");
B=input(" Enter the matrix");
[n,n1]=size(A);
[m1,p]=size(B);
C= [A B];
for i=1:n-1
[pivot,k]=max(abs(C(i:n,i)));
if k>1
temp1= C(i,:);
C(i,:)=C(i+k-1,:);
C(i+k-1,:)=temp1;
end
m(i+1:n,i)= -C(i+1:n,i)/C(i,i);
C(i+1:n,:)= C(i+1:n,:) + m(i+1:n,i)* C(i,:);
end
for i= n:-1:2
  for k= i-1:-1:1
  m= -C(k,i)/C(i,i);
  C(k,i) = C(k,i)+ m* C(i,i);
  C(i, n+1:n+p)= C(k,n+1:n+p) +m*C(i,n+1:n+p);
  end
end
for i=1:n
C(i, n+1:n+p)= C(i,n+1:n+p)/ C(i,i);
C(i,i)=1;
end
X= C(:, n+1:n+p);
disp(X);