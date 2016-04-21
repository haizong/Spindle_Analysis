
tic;
Dapi_peak_range=zeros(length(list_good),5);

for i = 1:length(list_good);
    idx = spindle_mat_find_ID(spd_data, list_good{i});
    Dapi_peak_range(idx,1)=idx;
    for j = 2: size (spd_data{idx}.data_box, 1);
        if spd_data{idx}.data_box(j, 3)-spd_data{idx}.data_box(j-1, 3)>=5;
           Dapi_peak_range(idx,2)=j;
           break; 
        end;
    end;
        
        for k = size (spd_data{idx}.data_box, 1):-1:2;
            if spd_data{idx}.data_box(k, 3)-spd_data{idx}.data_box(k-1, 3)<=-5;
                Dapi_peak_range(idx,3)=k-1;
            break; 
            end;
        end;
    Dapi_peak_range(idx,4)=Dapi_peak_range(idx,3)-Dapi_peak_range(idx,2);
    Dapi_peak_range(idx,5)=(Dapi_peak_range(idx,3)-Dapi_peak_range(idx,2))/size (spd_data{idx}.data_box, 1);
end;

Cl_Dapi_peak_range=Dapi_peak_range(Dapi_peak_range(:,2)~=0, :);
ave_peak =mean (Cl_Dapi_peak_range(:,5));
std_peak = std (Cl_Dapi_peak_range(:,5), 0, 1);
clear ('i', 'idx', 'j', 'k'); 
save ('DAPI_peak.mat');
toc; 