function [ p ] = nkinematyka( q,a,n )

p=zeros(2,1);
for (i=1:n)
    kat=0;
    for(j=1:i)
        kat=kat+q(j);
    end
p(1)=p(1)+cos(kat)*a(i);
p(2)=p(2)+sin(kat)*a(i);
end

end

