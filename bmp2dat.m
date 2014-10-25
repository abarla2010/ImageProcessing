close all;
imgIN = imread('bh16.bmp');


xSize = size(imgIN, 2);
ySize = size(imgIN, 1);

fid = fopen('test.dat', 'w');
fwrite(fid, '1651 1 80000000 0 ', 'char*1');
fwrite(fid, uint32_to_hex([(xSize*ySize*4)]), 'char*1');
fwrite(fid, 13, 'uint8');
fwrite(fid, 10, 'uint8');
for y = 1:ySize
    for x = 1:xSize
        fwrite(fid, '0x', 'char*1');
        fwrite(fid, uint8_to_hex([imgIN(y,x,3) imgIN(y,x,2) imgIN(y,x,1)]), 'char*1');
        fwrite(fid, '00', 'char*1');
        fwrite(fid, 13, 'uint8');
        fwrite(fid, 10, 'uint8');
    end
end
fclose(fid);
imagesc(imgIN);