function image4 = Compression(im1)
f3 = [[1, -2, 1]; [-2, 3, 2]; [1, 2,- 1]];  % using a combination of HPF and LPF along the lines of DWT
image = zeros(512,512);
for i =1:510
    for j =1:510
          image(i,j) = round(1/8*sum(sum(double(im1(i:i+2, j:j+2)).*f3))); % convolving the original image with f3     
    end
end
image3= zeros(256,256);
for i= 1:256
    for j=1:256
        image3(i,j) = image(2*i, 2*j);  %downsampling the convolved image
    end
end
image4 = zeros(128,128);
for i = 1:128
    for j=1:128
        image4(i,j)=max(0,image3(2*i,2*j));     % further downsampling the convolved image
    end
end
picture_1 = mat2gray(image4,[0,255]);
figure(2);
imshow(picture_1);
end