function [ep]=generate_ep(n)
%%%%%%%%%%%%%generate the strain epsion
 ep=zeros(2^n,n);
 e=num2str(dec2bin(0:2^n-1));
 for ii=1:size(e,1)
     for jj=1:n
         ep(ii,jj)= str2num(e(ii,jj))*2-1;
     end
 end
end