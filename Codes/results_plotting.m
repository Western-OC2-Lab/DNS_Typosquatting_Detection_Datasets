%%Labeled Dataset results
%%%%%%%%%length of domain pdf%%%%%%%%
figure()
subplot(2,1,1);
histogram(domain_length(legit_domain_index),'Normalization','probability','BinWidth',1)
xlabel('Length of Domain Name')
ylabel('Probability')
title('PDF of Legit Domains Names')
str1 = {'Mean=14.56','Standard Deviation=3.41'};
text(37,0.125,str1)
subplot(2,1,2);
histogram(domain_length(dga_domain_index),'Normalization','probability','BinWidth',1)
xlabel('Length of Domain Name')
ylabel('Probability')
title('PDF of DGA Domains Names')
str2 = {'Mean=20.94','Standard Deviation=6.24'};
text(24,0.17,str2)
 
%%%%%Number of unique characters in domain name pdf%%%%
figure()
subplot(2,1,1);
histogram(domain_num_of_unique_char(legit_domain_index),'Normalization','probability','BinWidth',1)
xlabel('Number of Unique Characters')
ylabel('Probability')
title('PDF of Number of Unique Characters in Legit Domain Names')
str3 = {'Mean=9.78','Standard Deviation=1.86'};
text(12,0.19,str3)
subplot(2,1,2);
histogram(domain_num_of_unique_char(dga_domain_index),'Normalization','probability','BinWidth',1)
xlabel('Number of Unique Characters')
ylabel('Probability')
title('PDF of Number of Unique Characters in DGA Domain Names')
str4 = {'Mean=14.14','Standard Deviation=3.71'};
text(16,0.17,str4)

%%Unlabeled Dataset
%%%%%%Number of unique characters in domain name pdf using clustering%%%%
figure()
subplot(2,1,1);
histogram(unlabeled_unique_domain_num_of_unique_char(clustering_kmeans==1),'Normalization','probability','BinWidth',1)
xlabel('Number of Unique Characters')
ylabel('Probability')
title('PDF of Number of Unique Characters in Cluster 1 Domain Names')
str3 = {'Mean=8.11','Standard Deviation=1.48'};
text(10.5,0.25,str3)
subplot(2,1,2);
histogram(unlabeled_unique_domain_num_of_unique_char(clustering_kmeans==2),'Normalization','probability','BinWidth',1)
xlabel('Number of Unique Characters')
ylabel('Probability')
title('PDF of Number of Unique Characters in Cluster 2 Domain Names')
str4 = {'Mean=12.02','Standard Deviation=1.60'};
%xlim([5 25])
text(14,0.25,str4)

%%%%%%Number of unique characters in domain name pdf using ensemble learner%%%%
figure()
subplot(2,1,1);
histogram(unlabeled_unique_domain_num_of_unique_char(ensemble_learner_unlabeled_dataset==0),'Normalization','probability','BinWidth',1)
xlabel('Number of Unique Characters')
ylabel('Probability')
title('PDF of Number of Unique Characters in Domain Names Classified as Legit')
str3 = {'Mean=9.69','Standard Deviation=2.48'};
text(10.5,0.17,str3)
subplot(2,1,2);
histogram(unlabeled_unique_domain_num_of_unique_char(ensemble_learner_unlabeled_dataset==1),'Normalization','probability','BinWidth',1)
xlabel('Number of Unique Characters')
ylabel('Probability')
title('PDF of Number of Unique Characters in Domain Names Classified as DGA')
str4 = {'Mean=11.67','Standard Deviation=1.54'};
%xlim([5 25])
text(14,0.35,str4)