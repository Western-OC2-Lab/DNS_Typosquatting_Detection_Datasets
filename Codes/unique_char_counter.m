function [unique_characters,num_unique_characters]=unique_char_counter(x)

unique_characters=zeros(1,36);

unique_characters(1,1)=length(strfind(x,'a'))+length(strfind(x,'A'));
unique_characters(1,2)=length(strfind(x,'b'))+length(strfind(x,'B'));
unique_characters(1,3)=length(strfind(x,'c'))+length(strfind(x,'C'));
unique_characters(1,4)=length(strfind(x,'d'))+length(strfind(x,'D'));
unique_characters(1,5)=length(strfind(x,'e'))+length(strfind(x,'E'));
unique_characters(1,6)=length(strfind(x,'f'))+length(strfind(x,'F'));
unique_characters(1,7)=length(strfind(x,'g'))+length(strfind(x,'G'));
unique_characters(1,8)=length(strfind(x,'h'))+length(strfind(x,'H'));
unique_characters(1,9)=length(strfind(x,'i'))+length(strfind(x,'I'));
unique_characters(1,10)=length(strfind(x,'j'))+length(strfind(x,'J'));
unique_characters(1,11)=length(strfind(x,'k'))+length(strfind(x,'K'));
unique_characters(1,12)=length(strfind(x,'l'))+length(strfind(x,'L'));
unique_characters(1,13)=length(strfind(x,'m'))+length(strfind(x,'M'));
unique_characters(1,14)=length(strfind(x,'n'))+length(strfind(x,'N'));
unique_characters(1,15)=length(strfind(x,'o'))+length(strfind(x,'O'));
unique_characters(1,16)=length(strfind(x,'p'))+length(strfind(x,'P'));
unique_characters(1,17)=length(strfind(x,'q'))+length(strfind(x,'Q'));
unique_characters(1,18)=length(strfind(x,'r'))+length(strfind(x,'R'));
unique_characters(1,19)=length(strfind(x,'s'))+length(strfind(x,'S'));
unique_characters(1,20)=length(strfind(x,'t'))+length(strfind(x,'T'));
unique_characters(1,21)=length(strfind(x,'u'))+length(strfind(x,'U'));
unique_characters(1,22)=length(strfind(x,'v'))+length(strfind(x,'V'));
unique_characters(1,23)=length(strfind(x,'w'))+length(strfind(x,'W'));
unique_characters(1,24)=length(strfind(x,'x'))+length(strfind(x,'X'));
unique_characters(1,25)=length(strfind(x,'y'))+length(strfind(x,'Y'));
unique_characters(1,26)=length(strfind(x,'z'))+length(strfind(x,'Z'));
unique_characters(1,27)=length(strfind(x,'0'));
unique_characters(1,28)=length(strfind(x,'1'));
unique_characters(1,29)=length(strfind(x,'2'));
unique_characters(1,30)=length(strfind(x,'3'));
unique_characters(1,31)=length(strfind(x,'4'));
unique_characters(1,32)=length(strfind(x,'5'));
unique_characters(1,33)=length(strfind(x,'6'));
unique_characters(1,34)=length(strfind(x,'7'));
unique_characters(1,35)=length(strfind(x,'8'));
unique_characters(1,36)=length(strfind(x,'9'));

num_unique_characters=length(find(unique_characters));