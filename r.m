function R = romberg(f,a,b,q)
% ROMBERG Integration using Romberg's method
% Usage: R = ROMBERG(FNAME,A,B,Q)
% R is the Romberg table with Q+2 rows (default Q=2)
% for the integral of F=FNAME(X) from A to B
if nargin<4, q = 2; end 
R = NaN(q+2,q+2);
h = b-a; m = 1;
R(1,1) = h*(feval(f,a)+feval(f,b))/2;
for i = 2:q+2
    h = h/2; m = 2*m;
    R(i,1) = R(i-1,1)/2 + h*sum(feval(f,a+h*(1:2:m)));
    for j = 1:i-1
        R(i,j+1) = R(i,j) + (R(i,j) - R(i-1,j))/(2^(2*j)-1);
    end
end