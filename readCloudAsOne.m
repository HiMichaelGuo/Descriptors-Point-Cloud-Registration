function fullPointCloud = readCloudAsOne(filepath,prefix,readNum,mergeGridStep,s,relocoNUm)
%READCLOUDASONE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
readNum=readNum-1;
clouds=readCloudCsv(filepath,prefix,readNum,0,s);
fullPointCloud=clouds{1};
for i=2:length(clouds)
%     if i~=relocoNUm
        fullPointCloud=pcmerge(fullPointCloud,clouds{i},mergeGridStep);
        disp([ 'cloud ' num2str(i) ' merged!'] );
%     end
end
end

