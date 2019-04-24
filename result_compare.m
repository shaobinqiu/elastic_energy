clear%%%%compare the result of vasp cal and elastic modulus
E_vasp=importdata('./elastic_E/diamond_005005_vasp.txt');
U_e=load('./elastic_E/diamond_005005_elasticE.txt');
delete=[];
for ii=1:size(E_vasp,1)%%%let the vasp calculate erro inf equal 0; some str vasp refuse to cal   T.T
    if abs(E_vasp(ii,2))~=1
        delete=[delete;ii];
    end
end
U_vasp=E_vasp(:,4)+repmat(0.72743261E+02,size(E_vasp,1),1);  
U_e(delete,:)=[];U_vasp(delete,:)=[];


figure
set(gcf,'color','white');
 plot(U_vasp,U_e,'*')
 hold on
 a=[min(U_vasp) ,max(U_vasp)];
plot(a,a,'r-')






















