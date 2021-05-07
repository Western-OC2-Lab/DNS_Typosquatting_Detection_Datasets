clear all
clc
%%%%% Reading the csv file%%%%%%%%
[labeled_domain labeled_class]=textread('domain_dataset_labeled.csv','%s%s','delimiter',','); %read the csv file
labeled_domain(1)=[];%delete first value of cell array which describes the column
labeled_class(1)=[];%delete first value of cell array which describes the column

labeled_domain_string=string(labeled_domain);%transform from cell to string array
labeled_class_string=string(labeled_class);%transform from cell to string array

labeled_legit_domain_index=strmatch('legit',labeled_class);%determine index of legit domains
labeled_dga_domain_index=strmatch('dga',labeled_class);%determine index of dga domains
labeled_domain_class=zeros(length(labeled_domain),1);
labeled_domain_class(labeled_dga_domain_index)=1;%if domain_class=0-->legit, if domain_class=1-->dga

labeled_domain_length=zeros(length(labeled_domain),1);
for i=1:length(labeled_domain)
    labeled_domain_length(i)=strlength(labeled_domain_string(i));%determine length of domain
end
mean_legit_domain_length=mean(labeled_domain_length(labeled_legit_domain_index));
mean_dga_domain_length=mean(labeled_domain_length(labeled_dga_domain_index));
std_legit_domain_length=std(labeled_domain_length(labeled_legit_domain_index));
std_dga_domain_length=std(labeled_domain_length(labeled_dga_domain_index));

labeled_domain_unique_char=zeros(length(labeled_domain),36);
labeled_domain_num_of_unique_char=zeros(length(labeled_domain),1);
labeled_domain_num_of_unique_letters=zeros(length(labeled_domain),1);
labeled_domain_num_of_letters=zeros(length(labeled_domain),1);
labeled_domain_num_of_unique_numbers=zeros(length(labeled_domain),1);
labeled_domain_num_of_numbers=zeros(length(labeled_domain),1);
for h=1:length(labeled_domain)
    [labeled_domain_unique_char(h,:),labeled_domain_num_of_unique_char(h)]=unique_char_counter(labeled_domain_string(h));
    
    labeled_domain_num_of_unique_letters(h)=length(find(labeled_domain_unique_char(h,1:26)));
    labeled_domain_num_of_letters(h)=sum(labeled_domain_unique_char(h,1:26));
    
    labeled_domain_num_of_unique_numbers(h)=length(find(labeled_domain_unique_char(h,27:36)));
    labeled_domain_num_of_numbers(h)=sum(labeled_domain_unique_char(h,27:36));
end

mean_legit_domain_num_of_unique_char=mean(labeled_domain_num_of_unique_char(labeled_legit_domain_index));
mean_dga_domain_num_of_unique_char=mean(labeled_domain_num_of_unique_char(labeled_dga_domain_index));
std_legit_domain_num_of_unique_char=std(labeled_domain_num_of_unique_char(labeled_legit_domain_index));
std_dga_domain_num_of_unique_char=std(labeled_domain_num_of_unique_char(labeled_dga_domain_index));

ratio_of_letters_of_domain_name=labeled_domain_num_of_letters./labeled_domain_length;%ratio of number of letters to domain length
ratio_of_numbers_of_domain_name=labeled_domain_num_of_numbers./labeled_domain_length;%ratio of number of numbers to domain length

ratio_of_unique_letters_to_num_of_unique_characters=labeled_domain_num_of_unique_letters./labeled_domain_num_of_unique_char;%ratio of number of unique letters to number of unique characters
ratio_of_unique_numbers_to_num_of_unique_characters=labeled_domain_num_of_unique_numbers./labeled_domain_num_of_unique_char;%ratio of number of unique numbers to number of unique characters

%%%%%%Desired features%%%%%%%%%%
labeled_domain_features=[labeled_domain_length labeled_domain_num_of_unique_char labeled_domain_num_of_unique_letters labeled_domain_num_of_unique_numbers ratio_of_letters_of_domain_name ratio_of_numbers_of_domain_name ratio_of_unique_letters_to_num_of_unique_characters ratio_of_unique_numbers_to_num_of_unique_characters];%extracted features
labeled_domain_features_with_class=[labeled_domain_features labeled_domain_class];


%%%%%%%%%length of domain pdf%%%%%%%%
% figure()
% subplot(2,1,1);
% histogram(domain_length(legit_domain_index),'Normalization','probability','BinWidth',1)
% xlabel('Length of Domain Name')
% ylabel('Probability')
% title('PDF of Legit Domains Names')
% str1 = {'Mean=14.56','Standard Deviation=3.41'};
% text(37,0.125,str1)
% subplot(2,1,2);
% histogram(domain_length(dga_domain_index),'Normalization','probability','BinWidth',1)
% xlabel('Length of Domain Name')
% ylabel('Probability')
% title('PDF of DGA Domains Names')
% str2 = {'Mean=20.94','Standard Deviation=6.24'};
% text(24,0.17,str2)
% 
% %%%%%Number of unique characters in domain name pdf%%%%
% figure()
% subplot(2,1,1);
% histogram(domain_num_of_unique_char(legit_domain_index),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Characters')
% ylabel('Probability')
% title('PDF of Number of Unique Characters in Legit Domain Names')
% str3 = {'Mean=9.78','Standard Deviation=1.86'};
% text(12,0.19,str3)
% subplot(2,1,2);
% histogram(domain_num_of_unique_char(dga_domain_index),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Characters')
% ylabel('Probability')
% title('PDF of Number of Unique Characters in DGA Domain Names')
% str4 = {'Mean=14.14','Standard Deviation=3.71'};
% text(16,0.17,str4)
% 
% %%%%number of unique letters pdf%%%%%%
% figure()
% subplot(2,1,1);
% histogram(domain_num_of_unique_letters(legit_domain_index),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Letters')
% ylabel('Probability')
% title('PDF of Number of Unique Letters in Legit Domain Names')
% subplot(2,1,2);
% histogram(domain_num_of_unique_letters(dga_domain_index),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Letters')
% ylabel('Probability')
% title('PDF of Number of Unique Letters in DGA Domain Names')
% 
% %%%number of unique numbers pdf%%%%%
% figure()
% subplot(2,1,1);
% histogram(domain_num_of_unique_numbers(legit_domain_index),'Normalization','probability','BinWidth',1)
% xlabel('Number of Unique Numbers')
% ylabel('Probability')
% title('PDF of Number of Unique Numbers in Legit Domain Names')
% subplot(2,1,2);
% histogram(domain_num_of_unique_numbers(dga_domain_index),'Normalization','probability','BinWidth',1)
% ylim([0 0.85])
% xlabel('Number of Unique Numbers')
% ylabel('Probability')
% title('PDF of Number of Unique Numbers in DGA Domain Names')
% 
% %%%ratio of letters to domain name
% figure()
% subplot(2,1,1);
% histogram(ratio_of_letters_of_domain_name(legit_domain_index),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Letters to Domain Name Length')
% ylabel('Probability')
% title('PDF of Ratio of Letters to Domain Name Length in Legit Domain Names')
% subplot(2,1,2);
% histogram(ratio_of_letters_of_domain_name(dga_domain_index),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Letters to Domain Name Length')
% ylabel('Probability')
% title('PDF of Ratio of Letters to Domain Name Length in DGA Domain Names')
%  
% %%ratio of numbers to domain name
% figure()
% subplot(2,1,1);
% histogram(ratio_of_numbers_of_domain_name(legit_domain_index),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Letters to Domain Name Length')
% ylabel('Probability')
% title('PDF of Ratio of Numbers to Domain Name Length in Legit Domain Names')
% subplot(2,1,2);
% histogram(ratio_of_numbers_of_domain_name(dga_domain_index),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Letters to Domain Name Length')
% ylabel('Probability')
% ylim([0 0.85])
% title('PDF of Ratio of Numbers to Domain Name Length in DGA Domain Names')
%  
% %%ratio of unique letters to unique characters in domain name
% figure()
% subplot(2,1,1);
% histogram(ratio_of_unique_letters_to_num_of_unique_characters(legit_domain_index),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Unique Letters to Unique Characters')
% ylabel('Probability')
% title('PDF of Ratio of Unique Letters to Unique Characters in Legit Domain Names')
% subplot(2,1,2);
% histogram(ratio_of_unique_letters_to_num_of_unique_characters(dga_domain_index),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Unique Letters to Unique Characters')
% ylabel('Probability')
% ylim([0 0.85])
% title('PDF of Ratio of Unique Letters to Unique Characters in DGA Domain Names')
%  
% %%ratio of unique numbers to unique characters in domain name
% figure()
% subplot(2,1,1);
% histogram(ratio_of_unique_numbers_to_num_of_unique_characters(legit_domain_index),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Unique Numbers to Unique Characters')
% ylabel('Probability')
% title('PDF of Ratio of Unique Numbers to Unique Characters in Legit Domain Names')
% subplot(2,1,2);
% histogram(ratio_of_unique_numbers_to_num_of_unique_characters(dga_domain_index),'Normalization','probability','BinWidth',0.05)
% xlabel('Ratio of Unique Numbers to Unique Characters')
% ylabel('Probability')
% ylim([0 0.85])
% title('PDF of Ratio of Unique Numbers to Unique Characters in DGA Domain Names')

%%%scatter plot domain length vs unique number of characters%%%%%
%  figure()
%  scatter(domain_length(legit_domain_index),domain_num_of_unique_char(legit_domain_index),'blue')
%  hold on
%  grid on
%  scatter(domain_length(dga_domain_index),domain_num_of_unique_char(dga_domain_index),'red')
%  xlabel('Length of Domain Name')
%  ylabel('Number of Unique Characters')