load('may12Runs.mat');
disp('------------------Starting analyses-------------------');
disp('------------------Wishartiness-Bayes-NN dist analyses-------------------');
meanBDists = mean(mean(bestBDists,3),2);
meanTDists = mean(bestTDists,2);
bNNCorPearson = corr(meanBDists, lpWishs);
bNNCorSpearman = corr(meanBDists,lpWishs, 'type', 'Spearman');
bNNCorKendall = corr(meanBDists,lpWishs, 'type', 'Kendall');

disp(['Pearson correlation between best Bayes-NN Distance and Wishartiness: ' num2str(bNNCorPearson)]);
disp(['Spearman correlation between best Bayes-NN Distance and Wishartiness: ' num2str(bNNCorSpearman)]);
disp(['Kendall correlation between best Bayes-NN Distance and Wishartiness: ' num2str(bNNCorKendall)]);

disp('---------------------------------------------------------------------');
close all;
f = figure();
scatter(lpWishs, meanBDists, [], linspace(1,10,length(meanBDists)));
labels = {'Part','Chain','Tree','Grid','erdosPs1','erdosPs2','erdosPs3','Wishart'}; dx = -0.4; dy = -0.4;
text(lpWishs+dx,meanBDists+dy, labels)
xlabel('Log Wishart marginal likelihood');
ylabel('Bayes-NN distance');
title('Average distance YY^T from Bayesian estimators with different priors');
gitinfo = getGitInfo();
savefig(strcat(gitinfo.branch,'-plot.fig'));
exit();
