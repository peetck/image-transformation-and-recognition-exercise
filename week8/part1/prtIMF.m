function [] = prtIMF( imf,ty )

numOfIMF = size(imf,3);

if ty == 1
    for i = 1:1:numOfIMF
        figure,imshow(imf(:,:,i),[]);
    end
elseif ty == 3
    for i = 1:1:numOfIMF
        figure,surf(imf(:,:,i));
    end
else
    if mod(numOfIMF,2) == 1
        nn = 1;
    else
        nn = 0;
    end
    figure,
    for i = 1:1:numOfIMF
        subplot(2,(numOfIMF+nn)/2,i),imshow(imf(:,:,i),[]);
    end
    
end


end

