img = imread('sample1.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));
% YOUR (TWO LINE) CODE HERE
[idx, ctrs, iter_ctrs] = kmeans(fea,64);
% 将每一个像素替换成其中心点的像素
for i=1:size(fea, 1)
    fea(i,:) = ctrs(idx(i));
end
imshow(uint8(reshape(fea, size(img))));

