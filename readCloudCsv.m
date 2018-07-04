function [ pointClouds ] = readCloudCsv(filepath,filePrefix,readnum ,zlimit,s )
%REACLOUDCSV �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if(readnum>length(dir(filepath))-2) 
    error('OutOfRange!');
end
 for i=0:readnum

    filename=[filepath filePrefix num2str(i) '.csv'];
    % Load data
    cloud = importdata(filename);
    sky=0.14;
    %% ȥ������������
    if i==41
        sky=0.12;
    end
    pointupper= cloud.data(:,4)>sky*s ;   %�컨��
    pointGroud= cloud.data(:,4)<zlimit*s ;% ����
    pointrobat= cloud.data(:,4)>zlimit*s & cloud.data(:,4)<0.05*s & cloud.data(:,2)<0.06*s & cloud.data(:,3)<0.025*s & cloud.data(:,3)>-0.025*s;
    pointBad=  pointrobat |pointGroud |pointupper;  % 
    pointSelect=~pointBad;           

    pointLocation=cloud.data(pointSelect,2:4)./s;

    %% ���޼�
%     pointLocation=cloud.data(:,2:4)./s;
   
    %%
    pointClouds{(i+1)}= pointCloud(pointLocation);
    

    
end
end

