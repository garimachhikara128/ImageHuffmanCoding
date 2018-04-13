fileName = 'E:\Adel.xlsx' ;

% % Check if you have created an Excel file previously or not 
% checkforfile=exist(strcat('E:','\','ExcelFile.xls'),'file');
% if checkforfile==0; % if not create new one
%     header = {'name', 'Age' 'Rollnum' , 'GPA'};
%     xlswrite('ExcelFile',header,'Sheetname','A1');
%     N=0;
% else % if yes, count the number of previous inputs
%     N=size(xlsread('ExcelFile','Sheetname'),1);
% end

% add the new values (your input) to the end of Excel file
[~,~,input] = xlsread(fileName);
N='Adnan'; a=22; roll=22; gpa=3.55;
new_data = {N, a,roll , gpa};
output = cat(1,input,new_data);
xlswrite(fileName ,output);
