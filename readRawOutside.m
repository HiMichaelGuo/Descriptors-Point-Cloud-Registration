function [clouds,srcDesp,srcSeed,srcNorm ] = readRawOutside( filepath,filePrefix,scannum ,gridstep,s )
%READROOM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    count=scannum-1; %��0��ʼ
%% ��ȡ����
    clouds=readCloudCsv(filepath,filePrefix,count,0.25,s); %ȥ�������
%     count=count+1��
    for j=1:scannum
%%  ��ȡ����
%         clouds{j}=pointCloud(data{j}(:,1:3)./1000);
        [srcDesp{j},srcSeed{j},srcNorm{j}] = extractEig(clouds{j},gridstep);
    end
end

