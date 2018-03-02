
% read the image
readOriginalImage = 'E:\image.png' ;
X=imread(readOriginalImage);

% get the dimeansions of 3D matrix
[rows, columns, numberOfColorChannels] = size(X);
disp([rows, columns, numberOfColorChannels]);

% get the pixels in 1D array
oneD = X(:) ;

% reconstruct your image from 1D array
B = reshape(oneD,[rows, columns, numberOfColorChannels]) ;

% x = double(B);
% x = uint8(x);

% store your reconstructed image
imwrite(B,'E:\reconstructed.png')
