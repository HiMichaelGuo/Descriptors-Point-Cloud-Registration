function [ pointClouds ] = readCloudCsv(filepath,filePrefix,readnum ,zlimit,s )
%REACLOUDCSV �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if(readnum>30) 
    error('OutOfRange!');
end
for i=0:readnum
%     filename=[filepath 'PointCloud' num2str(i) '.csv'];
    filename=[filepath filePrefix num2str(i) '.csv'];
    % Load data
    cloud = importdata(filename);

    % Extract coordinates
%     x = cloud.data(:, strcmp('x', cloud.colheaders));
%     y = cloud.data(:, strcmp('y', cloud.colheaders));
%     z = cloud.data(:, strcmp('z', cloud.colheaders));
    %����Ϊ��ݵ�����׳�ı�� Extract coordinates
    pointSelect= cloud.data(:,4)>zlimit ;% ���ĵ�����������Ĳ����γɴ����
%     pointSelect= cloud.data(:,4)>-11 ;
    pointLocation=cloud.data(pointSelect,2:4)./s;
    pointClouds{(i+1)}= pointCloud(pointLocation);
end
end

