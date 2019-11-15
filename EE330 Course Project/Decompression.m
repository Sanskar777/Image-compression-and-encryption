function pic = Decompression(image4)
image5 = zeros(256,256);
for i=1:256
    for j =1:256
        if (mod(i,2)~=0) && (mod(j,2) ~=0)
            image5(i,j)=min(255,image4((i+1)/2,(j+1)/2));    %upsampling the image
        elseif j>1 && i>1
            image5(i,j) = min(255,round(1.25*(image4(round(i/2),round((j)/2)))));  % if not even entries, take the rounded integer values 
        elseif i~=1
            image5(i,j) = min(255,image4(round((i-1)/2),1));    % boundary conditions adjustment
        else
            image5(i,j)=min(255,image4(1,1));       %boundary adjustment
        end
    end
end

image7 = zeros(512,512);
for i=1:512
    for j =1:512
        if (mod(i,2)~=0) && (mod(j,2) ~=0)
            image7(i,j)=min(255,image5((i+1)/2,(j+1)/2));       % further upsampling the image in the same way
        elseif j>1 && i>1
            image7(i,j) = min(255,round(1.25*(image5(round(i/2),round(j/2)))));
        elseif i~=1
            image7(i,j) =min(255,image5(round((i-1)/2),1));
        else
            image7(i,j)=min(255,image5(1,1));
        end
    end
end
pic = mat2gray(image7,[0,255]);
figure(7);
imshow(pic);
end