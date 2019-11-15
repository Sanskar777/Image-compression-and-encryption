function x2 = Decryption(x)
%Key used for decrypting; first 4 numbers are used for inverse Affine Transform;
%last 4 numbers are used for inverse XOR operation
K = [54,19,16,11,240,170,15,85];
r = size(x,1);
c = size(x,2); 
x2 = zeros(r,c);
x5 = zeros(r,c);
x3 = (0:K(1,2)-1).*r;
x4 = (0:K(1,4)-1).*c;
%Inverse XOR operation
for i = 1:2:r
    for j = 1:2:c
        x(i,j) = bitxor(x(i,j),K(1,5));
        x(i+1,j) = bitxor(x(i+1,j),K(1,6));
        x(i,j+1) = bitxor(x(i,j+1),K(1,7));
        x(i+1,j+1) = bitxor(x(i+1,j+1),K(1,8));
    end
end
%Inverse Affine Transform row-wise
for i = 1:r
    A = (x3+(i-1)-K(1,1))/K(1,2);
    i1 = mod(A*(floor(A)==A)',r);
    x5(i1+1,1:end) = x(i,1:end); 
end
%Inverse Affine Transform column-wise
for i = 1:c
    A = (x4+(i-1)-K(1,3))/K(1,4);
    i1 = mod(A*(floor(A)==A)',c);
    x2(1:end,i1+1) = x5(1:end,i); 
end
%display
pic= mat2gray(x2,[0,255]);
figure(6);
imshow(pic);
end