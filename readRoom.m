function [clouds,srcDesp,srcSeed,srcNorm ] = readRoom( data ,gridstep )
%READROOM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    scannum=length(data);
%%  Ԥ����
    clouds=cell(scannum,1);
    srcDesp=cell(scannum,1);
    srcSeed=cell(scannum,1);
    srcNorm=cell(scannum,1);
    for j=1:scannum
%%  ��ȡ����
        clouds{j}=pointCloud(data{j}(:,1:3)./1000);
        [srcDesp{j},srcSeed{j},srcNorm{j}] = extractEig(clouds{j},gridstep);
    end
end

