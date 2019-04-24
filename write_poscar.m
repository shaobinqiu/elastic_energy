function  write_poscar(filename, comment, lattice, symbols, atomcount, coords,C)
% last modify 2019-04-24
if nargin<7
    C=0;
end
fid=fopen(filename,'w+');
fprintf(fid,  '%s \n', comment);
fprintf(fid,'%g\n',1);
fprintf(fid,'%-4.6f     %-4.6f     %-4.6f\n',lattice');

for ii=1:size(symbols,2)
    fprintf(fid,'%s   ', symbols{1,ii});
end
fprintf(fid,'\n ');

for ii=1:size(atomcount,1)
    fprintf(fid,'%g   ',atomcount(ii,1));
end
fprintf(fid,'\n ');

if C==1
    fprintf(fid, 'Cartesian\n');
else
    fprintf(fid,'Direct\n');
end
for vv=1:size(coords,1)
    fprintf(fid,'%-4.6f     %-4.6f     %-4.6f      \n',coords(vv,:)');
end
fclose(fid);
end