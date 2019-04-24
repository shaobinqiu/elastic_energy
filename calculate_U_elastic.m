function U_e= calculate_U_elastic(M_e,strain,V)
     d=[strain(1,1);  strain(2,2); strain(3,3); strain(3,2)+strain(2,3); strain(1,3)+strain(3,1); strain(1,2)+strain(2,1)];% XX         YY         ZZ    XY    YZ        ZX 
     U=0;
    for ii=1:size(d,1)
        for jj=1:size(d,1)
            U=U+0.5*M_e(ii,jj)*d(ii,1)*d(jj,1);
        end
    end
    U_e=U*V/(1.6*10^(-19));% to eV
end