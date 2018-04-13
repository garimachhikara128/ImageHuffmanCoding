fileNameData = 'E:\Capstone Project\New for Journal\Integration\5_ReconstructedImages\Benazir.xlsx' ;
compFolderName = 'E:\Capstone Project\New for Journal\Integration\5_ReconstructedImages\bb_dyn\' ;
folderName = 'E:\Capstone Project\New for Journal\Integration\1_Compressed Image Frames\bb_dyn\' ;
folder = dir(folderName);

for file = 3:length(folder)
    fileName = folder(file).name;  
    oiSizeBytes = folder(file).bytes ;

    fullFileName = strcat(folderName, fileName) ;
    Image = imread(fullFileName);    
    [frequency,pixelValue] = imhist(Image());
    %disp([frequency,pixelValue]) ;

    tf = sum(frequency) ;
    probability = frequency ./ tf ;

    dict = huffmandict(pixelValue,probability);
    %disp(dict) ;

    imageOneD = Image(:) ;
    %disp(size(imageOneD) + ", " + size(fi)) ;
    %disp(unique(imageOneD)) ;

    testVal = imageOneD ;
    encodedVal = huffmanenco(testVal,dict);
    %disp(encodedVal);

    %decoding
    %decodedVal = huffmandeco(encodedVal,dict);
    %disp(decodedVal);

    % display the length
    kB = 8 * 1024 ;
    %disp(numel(de2bi(testVal))/kB) ;
    oiSizeBits = numel(de2bi(testVal))/kB ;
    %disp(numel(encodedVal)/kB) ;
    diSizeBits = numel(encodedVal)/kB ;
    %disp(numel(de2bi(decodedVal))/kb) ;

    [rows, columns, numberOfColorChannels] = size(Image);
    oi = reshape(testVal,[rows, columns, numberOfColorChannels]) ;   
    fullFileNameRI = strcat(compFolderName , fileName) ;
    imwrite(oi, fullFileNameRI);

    %ci = reshape(decodedVal,[rows, columns, numberOfColorChannels]) ;
    %imwrite(ci,'E:\comp.png');
    
    diFolder = dir(fullFileNameRI);
    diSizeBytes = diFolder(1).bytes ;
    
    [~,~,input] = xlsread(fileNameData);
    new_data = {fileName, oiSizeBits, diSizeBits , oiSizeBytes, diSizeBytes};
    output = cat(1,input,new_data);
    xlswrite(fileNameData ,output);
    
    disp(strcat('Done ' , fileName)) ;
end
