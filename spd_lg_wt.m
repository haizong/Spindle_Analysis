function [ ave_lg, std_lg, ave_wt, std_wt] = spd_lg_wt(dir_name)
% This function calculates the length and width of spindles.
%   Extract good spindles from 'spd_data'.
%   The length and width are stored under 'spd_data{i}.img_box'.

load([dir_name,'/save.mat'],  'spd_data');
tic;

all_spd_lg_wt=zeros(length(spd_data),2);

for i=1:length(spd_data);
    lg(i)=size(spd_data{i}.img_box, 1);
    wt(i)=size(spd_data{i}.img_box, 2);
    
    all_spd_lg_wt(i,1)=lg(i);
    all_spd_lg_wt(i,2)=wt(i);
end

clspd_lg_wt = all_spd_lg_wt(all_spd_lg_wt(:,1)~=0,:);

ave_lg=mean (clspd_lg_wt(:,1));
std_lg=std (clspd_lg_wt(:,1),0,1);

ave_wt=mean (clspd_lg_wt(:,2));
std_wt=std (clspd_lg_wt(:,2),0,1);
clear ('ans', 'i'); 

save ([dir_name,'/lg_wt.mat']);
fprintf ('Average length:%.2f, SD: %.2f \n', ave_lg, std_lg);
fprintf ('Average width: %.2f, SD: %.2f \n', ave_wt, std_wt);

toc;

end

