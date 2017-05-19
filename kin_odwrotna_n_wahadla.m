function [ q ] = n_kin_odw( p,q0,a,n)

q=zeros(n,1);
J=zeros(2,n);
while(max(abs(p-nkinematyka(q0,a,n)))>0.0001)
    for (i=1:n)
        for(j=i:n)
            kat=0;
            if i>1
                for(k=1:i-1)
                    kat=kat+q0(k);
                end
            end
            for(k=j:n)
                kat=kat+q0(k);
                J(1,i)=J(1,i)-sin(kat)*a(j);
                J(2,i)=J(2,i)+cos(kat)*a(j);
            end
        end
    end
    J_hash=J'*(J*J')^(-1);
    ksi=1;
    q0=q0+ksi*J_hash*(p-nkinematyka(q0,a,n));
end
q=q0
end
