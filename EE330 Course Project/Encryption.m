function x2 = Encryption(x)
%Key used for encrypting; first 4 numbers are used for Affine Transform;
%last 4 numbers are used for XOR operation
K = [54,19,16,11,240,170,15,85];
r = size(x,1);
c = size(x,2); 
x2 = zeros(r,c);
x3 = zeros(r,c);
% Affine Transform row-wise
for i = 1:r
   x3(mod(K(1,1)+K(1,2)*(i-1),r)+1,1:end) = x(i,1:end);   
end
% Affine Transform column-wise
for j = 1:c
    x2(1:end,1+mod(K(1,3)+K(1,4)*(j-1),c)) = x3(1:end,j);   
end

% XOR operation for each 2x2 blocks of 128x128 compressed image
for i = 1:2:r
    for j = 1:2:c
        x2(i,j) = bitxor(x2(i,j),K(1,5));
        x2(i+1,j) = bitxor(x2(i+1,j),K(1,6));
        x2(i,j+1) = bitxor(x2(i,j+1),K(1,7));
        x2(i+1,j+1) = bitxor(x2(i+1,j+1),K(1,8));
    end
end
%display
pic= mat2gray(x2,[0,255]);
figure(3);
imshow(pic);
end