function back = Decoding(hcode,dict,m,n)
    %Huffman Decoding
    dhsig1 = huffmandeco(hcode,dict);
    %convertign dhsig1 double to dhsig uint8
    dhsig = uint8(dhsig1);
    %vector to array conversion
    dec_row=sqrt(length(dhsig));
    dec_col=dec_row;
    %variables using to convert vector 2 array
    arr_row = 1;
    arr_col = 1;
    vec_si = 1;
    for x = 1:m
        for y = 1:n
            back(x,y)=dhsig(vec_si);
            arr_col = arr_col+1;
            vec_si = vec_si + 1;
        end
        arr_row = arr_row+1;
    end
    %converting image from grayscale to rgb
    [deco, map] = gray2ind(back,256);
    RGB = ind2rgb(deco,map);
    size(RGB);
    figure(4);
    imshow(RGB);
    RGB = rgb2gray(RGB);
    %end of the huffman coding
end