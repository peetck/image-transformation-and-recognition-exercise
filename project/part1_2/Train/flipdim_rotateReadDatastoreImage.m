function data = flipdim_rotateReadDatastoreImage(filename)
    % code from default function: 
    onState = warning('off', 'backtrace'); 
    c = onCleanup(@() warning(onState)); 
    data = imread(filename); % added lines: 
    data = imresize(data,[227 227]);
    % flip
    data = flipdim(data,2);
    % rotate
    data = imrotate(data, 180);
    data = data(:,:,min(1:3, end));
end
