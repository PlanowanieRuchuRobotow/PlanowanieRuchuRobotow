function [ p ] = kinematyka( q, a )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
p=zeros(1,2);
p(1)=cos(q(1))*a(1)+cos(q(1)-q(2))*a(2);
p(2)=sin(q(1))*a(1)+sin(q(1)-q(2))*a(2);

end