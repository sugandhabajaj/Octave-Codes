clc
A=[8 , -3 ,2;4 ,11 , -1;6 ,3 ,12];
B =[20;33;36];
for i =0:10
X(i+1 ,1)=i;
end
for i =2:4
X(1,i)=0;
end
for r =1:10
for i =1:3
k1 =0;
for j=1:i -1
k1=k1 -A(i,j)*X(r+1,j +1) ;
end
k2 =0;
for j=i +1:3
k2=k2 -A(i,j)*X(r,j +1) ;
end
X(r+1,i +1) =( k1+k2+B(i ,1) )/A(i,i);
end
end
disp (X)
