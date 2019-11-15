close all;
im1 = imread('test_image2.png'); 
im1=rgb2gray(im1);
im1 =im1(1:512,1:512);
figure(1);
imshow(im1);

%size of original image in kilobits
size_original_image = (size(im1,1)*size(im1,2))*8/1024

compressed_image = Compression(im1);
%size of compressed image in kilobits
size_compressed_image = (size(compressed_image,1)*size(compressed_image,2))*8/1024

encrypted_image = Encryption (compressed_image);
%size of encrypted image in kilobits
size_encrypted_image = (size(encrypted_image,1)*size(encrypted_image,2))*8/1024 

[encoded_vector,dict,m,n] = Encoding(encrypted_image);
%size of encoded image which is transmitted over the channel in kilobits
size_encoded_vector = (size(encoded_vector,1)*size(encoded_vector,2))/1024

decoded_image = Decoding(encoded_vector,dict,m,n);
%size of decoded image in kilobits
size_decoded_image = (size(decoded_image,1)*size(decoded_image,2))*8/1024

decrypted_image = Decryption(decoded_image);
decompressed_image = Decompression(decrypted_image);

