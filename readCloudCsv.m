function [ pointClouds ] = readCloudCsv(filepath,filePrefix,readnum ,zlimit,s )
%REACLOUDCSV �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if(readnum>length(dir(filepath))-2) 
    error('OutOfRange!');
end
for i=0:readnum
%     filename=[filepath 'PointCloud' num2str(i) '.csv'];
    filename=[filepath filePrefix num2str(i) '.csv'];
    % Load data
    cloud = importdata(filename);

    
    %% ��������ʱת��,Ӧɾ��
%     load apartmentGrT;
%     localcloud= pctransform( pointCloud(cloud.data(:,2:4)),affine3d(MotionGrt{i+1}'));
    
    %% ȥ������������
%     pointupper= localcloud.Location(:,3)>1.4*s ;   %�컨��
%     pointGroud= localcloud.Location(:,3)<zlimit*s ;% ���ĵ�����������Ĳ����γɴ����
%     pointrobat= localcloud.Location(:,3)>zlimit*s & localcloud.Location(:,3)<0.023*s & localcloud.Location(:,1)<0.06*s & localcloud.Location(:,2)<0.025*s & localcloud.Location(:,2)>-0.025*s;
%     pointBad=pointGroud | pointrobat | pointupper;
%     pointSelect=~pointBad;
%     pointLocation=cloud.data(pointSelect,2:4)./s;
%     
    pointupper= cloud.data(:,4)>0.14*s ;   %�컨��
%     pointGroud= cloud.data(:,4)<zlimit*s ;% ����
%     pointrobat= cloud.data(:,4)>zlimit*s & localcloud.data(:,4)<0.023*s & localcloud.data(:,2)<0.06*s & localcloud.data(:,3)<0.025*s & localcloud.data(:,3)>-0.025*s;
    pointBad=  pointupper;  % pointrobat |pointGroud |
    pointSelect=~pointBad;           


    % Extract coordinates
%     x = cloud.data(:, strcmp('x', cloud.colheaders));
%     y = cloud.data(:, strcmp('y', cloud.colheaders));
%     z = cloud.data(:, strcmp('z', cloud.colheaders));
    %����Ϊ��ݵ�����׳�ı�� Extract coordinates
    
    pointGroud= cloud.data(:,4)<zlimit*s ;% ���ĵ�����������Ĳ����γɴ����
    pointrobat= cloud.data(:,4)>zlimit*s & cloud.data(:,4)<0.023*s & cloud.data(:,2)<0.06*s & cloud.data(:,3)<0.025*s & cloud.data(:,3)>-0.025*s;
    pointBad=pointGroud | pointrobat;
    pointSelect=~pointBad;
%     
%     pointSelect= cloud.data(:,4)>-11 ;
%     pointSelect=xor(pointSelectLoud,pointrobat);
%     pointLocation=cloud.data(:,2:4)./s;

    pointLocation=cloud.data(pointSelect,2:4)./s;

    %% ���޼�
%     pointLocation=cloud.data(:,2:4)./s;
   
    %%
    pointClouds{(i+1)}= pointCloud(pointLocation);
end
end

