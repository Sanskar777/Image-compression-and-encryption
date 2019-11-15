%% Huffman coding is used here. This encoding reduces #bit_per_pixel from 8 to 6.5

function [hcode,dict,m,n] = Encoding(encrypted_var)
    I=encrypted_var;
    [m,n]=size(I);
    Totalcount=m*n;
    %variables using to find the probability
    cnt=1;
    sigma=0;
    %computing the cumulative probability(cumpro) and probability vector(pro).
    for i=0:255
        k=I==i;
        count(cnt)=sum(k(:));
        %pro array is having the probabilities
        pro(cnt)=count(cnt)/Totalcount;
        sigma=sigma+pro(cnt);
        cumpro(cnt)=sigma;
        cnt=cnt+1;
    end
    %Symbols for an image
    symbols = [0:255];
    %Huffman code Dictionary
    dict = huffmandict(symbols,pro);
    %function which converts array to vector
    vec_size = 1;
    for p = 1:m
        for q = 1:n
            newvec(vec_size) = I(p,q);
            vec_size = vec_size+1;
        end
    end
    %Huffman Encodig
    hcode = huffmanenco(newvec,dict);
end