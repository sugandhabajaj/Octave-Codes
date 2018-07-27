clc;
function s=cubic_splines(x,y,l)
x=input('Enter x')
y=input('Enter y')
l=input('Enter l')
n=length(x);
for k=1:n-1 
    h(k)=x(k+1)-x(k);
    t(k)=(y(k+1)-y(k))/h(k);
end
r(1)=0;
r(n)=0;
d(1)=1;
d(n)=1;
for k=2:n-1
    r(k)=3*(t(k)-t(k-1));
    d(k)=2*(h(k-1)+h(k));
end
a(1)=0;
a(n)=0;
b(1)=0;
b(n)=0;
for k=2:n-1
a(k)=h(k);
b(k)=h(k-1);
end
%disp(a);disp(b);disp(d);disp(r);
n=length(d);
a(1)=a(1)/d(1);
r(1)=r(1)/d(1);
 
for i=2:n-1
    a(i)=a(i)/(d(i)-b(i)*a(i-1));
    r(i)=(r(i)-b(i)*r(i-1))/(d(i)-b(i)*a(i-1));
end
r(n)=(r(n)-b(n)*r(n-1))/(d(n)-b(n)*a(n-1));
c(n)=r(n);
for k=n-1:-1:1
    c(k)=r(k)-a(k)*c(k+1);
end 
for k=1:n-1
    f(k)=t(k)-(h(k)*(2*c(k)+c(k+1)))/3;
    g(k)=(c(k+1)-c(k))/(3*h(k));
end
%disp(f);disp(g);
for k=1:n
    e(k)=y(k);
end
f=[f 0];
g=[g 0];
coef=[e;f;c;g]
m=length(l);
for k=1:m
    for j=1:n-1
        if l(k)>=x(j)
            d=j;
        end
    end
    if l(k)>x(n)
        error('l>max value of x')
    elseif l(k)<x(1)
        error('l<min value of x')
    else 
        s(k)=e(d)+f(d)*(l(k)-x(d))+c(d)*(l(k)-x(d))^2+g(d)*(l(k)-x(d))^3;
    end
end
end