clear all, close all, clc

% ทําการอ่านรูปภาพทั้งหมดที่จะนํามาใช้จาก Folder Tr 
% โดยนําไปผ่านการ resize และ HOG เพื่อสกัด feature มาเก็บไว้ใน ตัวแปร
feature = [];
for c =1:1:6
    for i =1:1:20
        I = imread(['Tr/' num2str(c) '/text (' num2str(i) ').bmp']); 
        IResize = imresize(I, [32 32]); % ปรับขนาดให้เป็น 32x32
        [hog_feature, visualization] = extractHOGFeatures(IResize); % HOG function
        feature = [feature;hog_feature c]; % เก็บไว้ในตัวแปร (เอา feature ต่อด้วย group (class))
    end
end

% แสดงผล (เลือกมาแค่ 3 class แรก {1, 2, 3})
a = find(feature(:,end) == 1);
b = find(feature(:,end) == 2);
c = find(feature(:,end) == 3);

figure,scatter3(feature(a,1),feature(a,5),feature(a,45),'r*');
hold on,scatter3(feature(b,1),feature(b,5),feature(b,45),'bo');
hold on,scatter3(feature(c,1),feature(c,5),feature(c,45),'g^');
xlabel('HOG Feature 1');
ylabel('HOG Feature 5');
zlabel('HOG Feature 45');
grid on;

% เลือก training จาก feature ทุกแถวและเอาทุกคอลัมน์ยกเว้นตัวสุดท้ายที่เป็นคลาส (group)
training = feature(:,1:end-1);
% เลือก group จาก feature ทุกแถวเฉพาะคอลัมน์สุดท้าย
group = feature(:,end);

% กําหนด score = 0(รูปที่ทายถูก)
score = 0;
for c =1:1:6
    for i =1:1:20
        I = imread(['Tr/' num2str(c) '/text (' num2str(i) ').bmp']);
        IResize = imresize(I, [32 32]); % ปรับขนาดให้เป็น 32x32
        [hog_feature, visualization] = extractHOGFeatures(IResize); % HOG function
        testing = hog_feature;
        class = knnclassify(testing, training, group, 1); % KNN
        if class == c % ถ้าถูกต้อง (class ตรงกัน)
            score = score + 1;
        end
    end
end

percent = score/120 * 100 % คํานวนเป็น percent ออกมา
