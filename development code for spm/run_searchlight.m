function run_searchlight
% this function is a wrapper to run decoding_seachlight.m

% participant_list = {'AM52','CL90','DC95','EM21','HB85','KK100','KM79',...
%         'KR104','LYY65','MC105','MH99','MS09','MV40','MV106','RN31','SO81'}; 
participant_list = {'MV40'}; 
%mask='gray_mask.nii';
mask=[];
CORorANT='COR';
%results_dir='result_searchlight_gray_mask_COR';
results_dir='result_searchlight_inplane_COR';
sphere_rad=4.5; %radius in mm
decoding_searchlight(participant_list, mask, CORorANT,results_dir,sphere_rad)

end

