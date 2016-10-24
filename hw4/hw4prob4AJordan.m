Amat1 = [3 -4;1 -1];
[V,J] = jordan(Amat1)

%verify decomposition
AmatOther = V*J*inv(V); diff = AmatOther-Amat1; error = sum(diff(:).^2)
%{ 
Result:
V =

     2     1
     1     0


J =

     1     1
     0     1

error =

     0
%}

