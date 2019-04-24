clear 
cell=import_poscar('./files/diamond_scell.vasp');    
M_e=load('./files/moduli_diamond.txt')*10^8;%elastic moduli
D=3;%dimension
 ep=generate_ep(D^2);
 V=abs(det(cell.lattice))*10^(-30);%volumn of cell (m^3)
  U_all=[];
 for kk=1:size(ep,1)
     epsilon=zeros(3,3);
     for ll=1:D
         epsilon(ll,1:D)=ep(kk,(ll-1)*D+1:ll*D)*0.1/2;%0101
     end
    strain=epsilon/cell.lattice;   
    U=calculate_U_elastic(M_e,strain,V);
    U_all=[U_all;U];
    %save ./elastic_E/diamond_005005_elasticE.txt -ascii U_all

    filename=['./POSCAR/POSCAR-',num2str(kk)];
    Lat= cell.lattice+epsilon;
    %write_poscar(filename, 'elatic_test', Lat, cell.symbols, cell.atomcount, cell.coords)
 end