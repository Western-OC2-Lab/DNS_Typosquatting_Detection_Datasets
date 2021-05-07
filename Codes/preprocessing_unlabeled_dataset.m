%%%%% Reading the csv file%%%%%%%%
[unlabeled_domain]=textread('domain_dataset_unlabeled.csv','%s','delimiter',','); %read the csv file
unlabeled_domain(1)=[];%delete first value of cell array which describes the column
unlabeled_unique_domain=unique(unlabeled_domain);%extract list of unique domains

unlabeled_domain_string=string(unlabeled_domain);%transform from cell to string array
unlabeled_unique_domain_string=string(unlabeled_unique_domain);%transform from cell to string array

unlabaled_unique_domain_length=zeros(length(unlabeled_unique_domain_string),1);
for i=1:length(unlabaled_unique_domain_length)
    unlabaled_unique_domain_length(i)=strlength(unlabeled_unique_domain_string(i));%determine length of domain
end

unlabeled_unique_domain_unique_char=zeros(length(unlabeled_unique_domain_string),36);
unlabeled_unique_domain_num_of_unique_char=zeros(length(unlabeled_unique_domain_string),1);
unlabeled_unique_domain_num_of_unique_letters=zeros(length(unlabeled_unique_domain_string),1);
unlabeled_unique_domain_num_of_letters=zeros(length(unlabeled_unique_domain_string),1);
unlabeled_unique_domain_num_of_unique_numbers=zeros(length(unlabeled_unique_domain_string),1);
unlabeled_unique_domain_num_of_numbers=zeros(length(unlabeled_unique_domain_string),1);
for h=1:length(unlabeled_unique_domain_string)
    [unlabeled_unique_domain_unique_char(h,:),unlabeled_unique_domain_num_of_unique_char(h)]=unique_char_counter(unlabeled_unique_domain_string(h));
    
    unlabeled_unique_domain_num_of_unique_letters(h)=length(find(unlabeled_unique_domain_unique_char(h,1:26)));
    unlabeled_unique_domain_num_of_letters(h)=sum(unlabeled_unique_domain_unique_char(h,1:26));
    
    unlabeled_unique_domain_num_of_unique_numbers(h)=length(find(unlabeled_unique_domain_unique_char(h,27:36)));
    unlabeled_unique_domain_num_of_numbers(h)=sum(unlabeled_unique_domain_unique_char(h,27:36));
end

unlabeled_ratio_of_letters_of_domain_name=unlabeled_unique_domain_num_of_letters./unlabaled_unique_domain_length;%ratio of number of letters to domain length
unlabeled_ratio_of_numbers_of_domain_name=unlabeled_unique_domain_num_of_numbers./unlabaled_unique_domain_length;%ratio of number of numbers to domain length

unlabeled_ratio_of_unique_letters_to_num_of_unique_characters=unlabeled_unique_domain_num_of_unique_letters./unlabeled_unique_domain_num_of_unique_char;%ratio of number of unique letters to number of unique characters
unlabeled_ratio_of_unique_numbers_to_num_of_unique_characters=unlabeled_unique_domain_num_of_unique_numbers./unlabeled_unique_domain_num_of_unique_char;%ratio of number of unique numbers to number of unique characters

%extracted features
unlabeled_domain_features=[unlabaled_unique_domain_length unlabeled_unique_domain_num_of_unique_char unlabeled_unique_domain_num_of_unique_letters unlabeled_unique_domain_num_of_unique_numbers unlabeled_ratio_of_letters_of_domain_name unlabeled_ratio_of_numbers_of_domain_name unlabeled_ratio_of_unique_letters_to_num_of_unique_characters unlabeled_ratio_of_unique_numbers_to_num_of_unique_characters];%extracted features

%perform k-means clustering
clustering_kmeans=kmeans(unlabeled_domain_features,2);
cluster1_index=find(clustering_kmeans==1);
cluster2_index=find(clustering_kmeans==2);

cluster1_domain_length_avg=mean(unlabaled_unique_domain_length(clustering_kmeans==1));
cluster2_domain_length_avg=mean(unlabaled_unique_domain_length(clustering_kmeans==2));
cluster1_num_of_unique_char_avg=mean(unlabeled_unique_domain_num_of_unique_char(clustering_kmeans==1));
cluster2_num_of_unique_char_avg=mean(unlabeled_unique_domain_num_of_unique_char(clustering_kmeans==2));
%%%%%%%%%length of domain pdf%%%%%%%%
% figure()
% subplot(2,1,1);
% histogram(unique_domain_length(clustering_kmeans==1),'Normalization','probability','BinWidth',1)
% xlabel('Length of Domain Name')
% ylabel('Probability')
% title('PDF of Cluster 1 Domains Names')
% %str1 = {'Mean=14.56','Standard Deviation=3.41'};
% %text(37,0.125,str1)
% subplot(2,1,2);
% histogram(unique_domain_length(clustering_kmeans==2),'Normalization','probability','BinWidth',1)
% xlabel('Length of Domain Name')
% ylabel('Probability')
% title('PDF of Cluster 2 Domains Names')
% %str2 = {'Mean=20.94','Standard Deviation=6.24'};
% %text(24,0.17,str2)
% 
% %%%%%%Number of unique characters in domain name pdf%%%%
% figure()
% subplot(2,1,1);
% histogram(unique_domain_num_of_unique_char(clustering_kmeans==1),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Characters')
% ylabel('Probability')
% title('PDF of Number of Unique Characters in Cluster 1 Domain Names')
% %str3 = {'Mean=9.78','Standard Deviation=1.86'};
% %text(12,0.19,str3)
% subplot(2,1,2);
% histogram(unique_domain_num_of_unique_char(clustering_kmeans==2),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Characters')
% ylabel('Probability')
% title('PDF of Number of Unique Characters in Cluster 2 Domain Names')
% %str4 = {'Mean=14.14','Standard Deviation=3.71'};
% %text(16,0.17,str4)
% 
% %%%%%number of unique letters pdf%%%%%%
% figure()
% subplot(2,1,1);
% histogram(unique_domain_num_of_unique_letters(clustering_kmeans==1),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Letters')
% ylabel('Probability')
% title('PDF of Number of Unique Letters in Cluster 1 Domain Names')
% subplot(2,1,2);
% histogram(unique_domain_num_of_unique_letters(clustering_kmeans==2),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Letters')
% ylabel('Probability')
% title('PDF of Number of Unique Letters in Cluster 2 Domain Names')
% 
% %%%%number of unique numbers pdf%%%%%
% figure()
% subplot(2,1,1);
% histogram(unique_domain_num_of_unique_numbers(clustering_kmeans==1),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Numbers')
% ylabel('Probability')
% title('PDF of Number of Unique Numbers in Cluster 1 Domain Names')
% subplot(2,1,2);
% histogram(unique_domain_num_of_unique_numbers(clustering_kmeans==2),'Normalization','probability','BinWidth',1)
% %ylim([0 0.85])
% xlabel('Number of Unique Numbers')
% ylabel('Probability')
% title('PDF of Number of Unique Numbers in Cluster 2 Domain Names')
% 
% %%%%ratio of letters to domain name
% figure()
% subplot(2,1,1);
% histogram(ratio_of_letters_of_domain_name(clustering_kmeans==1),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Letters to Domain Name Length')
% ylabel('Probability')
% ylim([0 0.5])
% title('PDF of Ratio of Letters to Domain Name Length in Cluster 1 Domain Names')
% subplot(2,1,2);
% histogram(ratio_of_letters_of_domain_name(clustering_kmeans==2),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Letters to Domain Name Length')
% ylabel('Probability')
% ylim([0 0.5])
% title('PDF of Ratio of Letters to Domain Name Length in Cluster 2 Domain Names')
%  
% %%%ratio of numbers to domain name
% figure()
% subplot(2,1,1);
% histogram(ratio_of_numbers_of_domain_name(clustering_kmeans==1),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Letters to Domain Name Length')
% ylabel('Probability')
% title('PDF of Ratio of Numbers to Domain Name Length in Cluster 1 Domain Names')
% subplot(2,1,2);
% histogram(ratio_of_numbers_of_domain_name(clustering_kmeans==2),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Letters to Domain Name Length')
% ylabel('Probability')
% %ylim([0 0.85])
% title('PDF of Ratio of Numbers to Domain Name Length in Cluster 2 Domain Names')
%  
% %%%ratio of unique letters to unique characters in domain name
% figure()
% subplot(2,1,1);
% histogram(ratio_of_unique_letters_to_num_of_unique_characters(clustering_kmeans==1),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Unique Letters to Unique Characters')
% ylabel('Probability')
% title('PDF of Ratio of Unique Letters to Unique Characters in Cluster 1 Domain Names')
% subplot(2,1,2);
% histogram(ratio_of_unique_letters_to_num_of_unique_characters(clustering_kmeans==2),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Unique Letters to Unique Characters')
% ylabel('Probability')
% %ylim([0 0.85])
% title('PDF of Ratio of Unique Letters to Unique Characters in Cluster 2 Domain Names')
%  
% %%%ratio of unique numbers to unique characters in domain name
% figure()
% subplot(2,1,1);
% histogram(ratio_of_unique_numbers_to_num_of_unique_characters(clustering_kmeans==1),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Unique Numbers to Unique Characters')
% ylabel('Probability')
% title('PDF of Ratio of Unique Numbers to Unique Characters in Cluster 1 Domain Names')
% subplot(2,1,2);
% histogram(ratio_of_unique_numbers_to_num_of_unique_characters(clustering_kmeans==2),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Unique Numbers to Unique Characters')
% ylabel('Probability')
% %ylim([0 0.85])
% title('PDF of Ratio of Unique Numbers to Unique Characters in Cluster 2 Domain Names')


% %%%scatter plot domain length vs unique number of characters%%%%%
% figure()
% scatter(unique_domain_length(clustering_kmeans==1),unique_domain_num_of_unique_char(clustering_kmeans==1),'blue')
% hold on
% grid on
% scatter(unique_domain_length(clustering_kmeans==2),unique_domain_num_of_unique_char(clustering_kmeans==2),'red')
% xlabel('Length of Domain Name')
% ylabel('Number of Unique Characters')
% title('Domains Clustering')