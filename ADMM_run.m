clear;
clc;

v = VideoReader('video.mp4')
videof = read(v);
for i = 1:649
frg = rgb2gray(videof(:,:,:,i));
videog(:,i) = frg(:);
end
h = matrix_decomp(videog);

V = reshape(h.X1_admm,[240,320,649]);
S = reshape(h.X2_admm,[240,320,649]);
L = reshape(h.X3_admm,[240,320,649]);
vw = VideoWriter('LowRank.avi');
vwS = VideoWriter('Sparse.avi');
open(vw);

for f = 1:649
frame = L(:,:,f);
writeVideo(vw,mat2gray(frame));
end
close(vw);

open(vwS);
for f = 1:649
frame = S(:,:,f);
writeVideo(vwS,mat2gray(frame));
end
close(vwS);