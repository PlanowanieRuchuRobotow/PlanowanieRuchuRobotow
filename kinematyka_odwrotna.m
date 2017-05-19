function [ q ] = kinematyka_odwrotna( p, a )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
q=zeros(2,1);
x=p(1);
y=p(2);
q(2)=acos((x^2+y^2-a(1)^2-a(2)^2)/2*a(1)*a(2))
kat_p=atan(y/x)
kat_1=asin((a(2)*sin(q(2)))/sqrt(x^2+y^2))
q(1)=kat_p+kat_1
if (x<0)
    q(1)=q(1)+pi();
    q(2)=q(2);
end
end