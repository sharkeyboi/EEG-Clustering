idx1 = idx;
idx1(idx1 ~= 1) = 0;
idx2 = idx;
idx2(idx2 ~= 2) = 0;
idx2(idx2 == 2) = 1;
idx3 = idx;
idx3(idx3 ~= 3) = 0;
idx3(idx3 == 3) = 1;
idx4 = idx;
idx4(idx4 ~= 4) = 0;
idx4(idx4 == 4) = 1;
idx5 = idx;
idx5(idx5 ~= 5) = 0;
idx5(idx5 == 5) = 1;
idx6 = idx;
idx6(idx6 ~= 6) = 0;
idx6(idx6 == 6) = 1;
idx7 = idx;
idx7(idx7 ~= 7) = 0;
idx7(idx7 == 7) = 1;

clear clusters

% for i = 1:7
%     newidx = idx;
%     newidx(newidx ~= i) = 0;
%     clusters(:,i) = newidx;
% end
% 
% clusters = clusters';

clusteredData1 = data;
clusteredData2 = data;
clusteredData3 = data;
clusteredData4 = data;
clusteredData5 = data;
clusteredData6 = data;
clusteredData7 = data;

for i = 1:5207
    clusteredData1(:,i) = clusteredData1(:,i) * idx1(i);
    clusteredData2(:,i) = clusteredData2(:,i) * idx2(i);
    clusteredData3(:,i) = clusteredData3(:,i) * idx3(i);
    clusteredData4(:,i) = clusteredData4(:,i) * idx4(i);
    clusteredData5(:,i) = clusteredData5(:,i) * idx5(i);
    clusteredData6(:,i) = clusteredData6(:,i) * idx6(i);
    clusteredData7(:,i) = clusteredData7(:,i) * idx7(i);
end

clusterwaves1 = reshape(clusteredData1, [totallength, 1]);
clusterwaves2 = reshape(clusteredData2, [totallength, 1]);
clusterwaves3 = reshape(clusteredData3, [totallength, 1]);
clusterwaves4 = reshape(clusteredData4, [totallength, 1]);
clusterwaves5 = reshape(clusteredData5, [totallength, 1]);
clusterwaves6 = reshape(clusteredData6, [totallength, 1]);
clusterwaves7 = reshape(clusteredData7, [totallength, 1]);
