function [merClouds,srcDesp,srcSeed,srcNorm ] = readOutside( filepath,filePrefix,scannum ,gridstep ,s)
%READROOM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    count=scannum*4-1;
%%  Ԥ����

    srcDesp=cell(scannum,1);
    srcSeed=cell(scannum,1);
    srcNorm=cell(scannum,1);
    clouds=readCloudCsv(filepath,filePrefix,count,0.64,s); %0.64Ϊ�����ͷ�߶�
    count=count+1;
    for i =1:scannum
        merClouds{i}=pcmerge(pcmerge(pcmerge(clouds{4*i-3},clouds{4*i-2},0.001),clouds{4*i-1},0.001),clouds{4*i},0.001);
    end
    for j=1:scannum
%%  ��ȡ����
%         clouds{j}=pointCloud(data{j}(:,1:3)./1000);
        [srcDesp{j},srcSeed{j},srcNorm{j}] = extractEig(merClouds{j},gridstep);
    end
end

