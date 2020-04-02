function decoding_success_spm(resultFile)
% working with spm, this function will load the
% res_accuracy_minus_chance.mat file located in resultFile (absolute path)
% and proceed for calculating the nb of "good voxels"

%load result file
load(resultFile)
all_voxels=results.accuracy_minus_chance.output;
size(all_voxels)
%V=spm_vol(resultFile);
%[all_voxels,~] = spm_read_vols(V);

if numel(size(all_voxels))>2
    all_voxels=all_voxels(:);
end

dispi('Median % decoding: ', median(all_voxels), '%')
dispi('% of good voxels (with % decoding >10): ', 100*sum(all_voxels>10)./numel(all_voxels), '%')
dispi('Nb of good voxels (with % decoding >10): ', sum(all_voxels>10))
dispi('Average % decoding for the best half of the voxels: ', mean(all_voxels(all_voxels>median(all_voxels))),'%')
bestVoxPerc=5;
limit = quantile(all_voxels,1-bestVoxPerc/100);
dispi('Average % decoding for the best ',bestVoxPerc,'% of the voxels: ', mean(all_voxels(all_voxels>limit)),'%')

figure()
subplot(2,2,1)
hist(all_voxels)
titleAxis('All voxels','% decoding','n',15)
axis square

subplot(2,2,2)
boxplot(all_voxels)
titleAxis('All voxels','boxplot','% decoding',15)
axis square

bestVox=nan(100,1);
for i=1:100
    limitX = quantile(all_voxels,1-i/100);
    bestVox(i)=median(all_voxels(all_voxels>limitX));    
end
subplot(2,2,3)
plot(1:100,bestVox)
titleAxis('% best voxels','%','Median % decoding',15)
axis square

subplot(2,2,4)
hist((all_voxels(all_voxels>limit)),4)
%axis([limit max(all_voxels) 0 numel(all_voxels)/30])
titleAxis('5% best voxels','% decoding','n',15)
axis square
