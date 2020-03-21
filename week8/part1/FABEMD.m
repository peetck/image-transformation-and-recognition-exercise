function [ imf ] = FABEMD(I,TT,max_num_imf,MMAI)

Ig = double(I)/255;
Ig = I;
imf = [];
residue = [];
for id_imf = 1:1:max_num_imf-1

    if id_imf == 1
        g = Ig;
    else
        g = residue;
    end
    iter = 1;
    gt = g;
    ht_old = [];
    while(1)        
        me = createIMF(gt);
        ht = gt - me;

        if iter == MMAI
            if id_imf == 1
                imf = ht;
                residue = g - imf;
            else
                imf = cat(3,imf,ht);
                residue = g - ht;%imf(:,:,id_imf);
            end
            break;
        elseif iter > 1
            if isIMF( ht,ht_old,TT ) || iter == MMAI
                if id_imf == 1
                    imf = ht;
                    residue = g - imf;
                else
                    imf = cat(3,imf,ht);
                    residue = g - ht;%imf(:,:,id_imf);
                end
                break;
            else
                gt = ht;
            end
            
        end
        ht_old = ht;
        iter = iter + 1;
    end
end

imf = cat(3,imf,residue);

end

function me = createIMF(g)


% to find local maxima and minima point
[max_point min_point] = definedTypePoint(g);
[maxX maxY] = find(max_point == 1);
Vmax = [maxX maxY];

for i = 1:1:size(maxX,1)
    temp = Vmax;
    temp(i,:) = [];
    tempD = min(pdist2(Vmax(i,:),temp,'euclidean'));
    if i == 1
        Dmax = tempD;
    else
        Dmax = [Dmax;tempD];
    end
end

[minX minY] = find(min_point == 1);
Vmin = [minX minY];
for i = 1:1:size(minX,1)
    temp = Vmin;
    temp(i,:) = [];
    tempD = min(pdist2(Vmin(i,:),temp,'euclidean'));
    if i == 1
        Dmin = tempD;
    else
        Dmin = [Dmin;tempD];
    end
end

% to create width's LD and HD

wLD = ceil(min([min(Dmax) min(Dmin)]));
wHD = ceil(max([max(Dmax) max(Dmin)]));

if mod(wLD,2) == 0
    wLD = wLD+1;
end
if wLD == 1
    wLD = 3;
end
if mod(wHD,2) == 0
    wHD = wHD+1;
end

wD = wLD;

% to create upper and lower envelop

le = ordfilt2(g,1,ones(wD,wD),'symmetric');
ue = ordfilt2(g,wD*wD,ones(wD,wD),'symmetric');

% averaging size
le = padarray(le,[((wD-1)/2) ((wD-1)/2)],'replicate','both');
ue = padarray(ue,[((wD-1)/2) ((wD-1)/2)],'replicate','both');

le = conv2(le, ones(wD)/(wD.^2),'valid');
ue = conv2(ue, ones(wD)/(wD.^2),'valid');

me = (le+ue)/2;

end

function [ out ] = isIMF( ht,g,T )

    eps = 0.00000001;
    num = sum(sum((ht-g).^2));
    den = sum(sum((g).^2)) + eps;
    rr = (num/den);
    %['>>>> ' num2str(num) ' : ' num2str(den) ' : ' num2str(rr)]
    if rr < T
        out = 1;
    else
        out = 0;
    end

end

function [max_point min_point] = definedTypePoint(A)

[m n] = size(A);
max_point = zeros(m,n);
min_point = zeros(m,n);
width = 3;

%PREALLOCATE THE OUTPUT MATRIX
B=zeros(m,n);
w = (width-1)/2;
%PAD THE MATRIX A WITH ZEROS
modifyA = padarray(A,[w w],'symmetric');

x = [1:width]';
y = [1:width]';

for i= 1:size(modifyA,1)-(width-1)
    for j=1:size(modifyA,2)-(width-1)
        %VECTORIZED METHOD
        window=reshape(modifyA(i+x-1,j+y-1),[],1);
        
        %FIND THE MINIMUM VALUE IN THE SELECTED WINDOW
        if max(window) == A(i,j)
            B(i,j)= 1;
        elseif min(window) == A(i,j)
            B(i,j)= -1;
        end
    end
end
max_point(find(B == 1)) = 1;
min_point(find(B == -1)) = 1;
end

