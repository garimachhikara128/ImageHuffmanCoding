symbols = [2,3,7,1,8,0];
p = [.5 .125 .125 .125 .0625 .0625];

% dictionary
dict = huffmandict(symbols,p);
disp(dict);

% test
testVal = symbols ;
encodedVal = huffmanenco(testVal,dict);
disp(encodedVal);

% decoding
decodedVal = huffmandeco(encodedVal,dict);
disp(decodedVal);

% display the length
disp(numel(de2bi(testVal))) ;
disp(numel(encodedVal)) ;
disp(numel(de2bi(decodedVal))) ;
