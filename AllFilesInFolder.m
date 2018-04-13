folderName = 'E:\Capstone Project\New for Journal\Integration\1_Compressed Image Frames\Adel_dyn\' ;
folder = dir(folderName);
for file = 3:length(folder)
   fileName = folder(file).name;
   disp(fileName);   
   disp(folder(file).bytes) ;
end
