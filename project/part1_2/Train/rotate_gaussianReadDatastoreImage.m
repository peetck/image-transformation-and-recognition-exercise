function data = rotate_gaussianReadDatastoreImage(filename)
    % code from default function: 
    onState = warning('off', 'backtrace'); 
    c = onCleanup(@() warning(onState)); 
    data = imread(filename); % added lines: 
    data = imresize(data,[227 227]);
    % rotate
    data = imrotate(data, 180);
    % gaussian
    data = imfilter(data,  fspecial('gaussian',9,3),'replicate', 'conv');
    data = data(:,:,min(1:3, end));
end
