function [J] = FunObj(X)
%FUNCIÓN OBJETIVO
Jx=0.6224*X(1)*X(3)*X(4) + 1.7781*X(2)*X(3)^2 + 3.1661*X(1)^2*X(4) + 19.84*X(1)^2*X(3);
%RESTRICCIONES
g(1)=-X(1)+0.0193*X(3);
g(2)=-X(2)+0.00954*X(3);
g(3)=-pi*X(3)^2*X(4)-(4*pi*X(3)^3)/3+1296000;
g(4)=X(4)-240;

%PENALIZACIÓN
penalty = zeros(1,size(g,2));
for i=1:size(g,2)
    if g(i)>0
        penalty(i)=1e9;
    else
        penalty(i)=0;
    end
end
penal=sum(penalty);
J=Jx+penal;
end