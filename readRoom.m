function [clouds,srcDesp,srcSeed,srcNorm,colorful_clouds ] = readRoom( data ,gridstep,s )
%READROOM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    scannum=length(data);

    for j=1:scannum
%%  ��ȡ����
        clouds{j}=pointCloud(data{j}(:,1:3)./s);
        blackdots=data{j}(:,4)==0;
        colordots=~blackdots;
        colorful_clouds{j}=pointCloud(data{j}(colordots,1:3)./s,'color',uint8(data{j}(colordots,4:6)));
        [srcDesp{j},srcSeed{j},srcNorm{j}] = extractEig(clouds{j},gridstep);
    end
end

