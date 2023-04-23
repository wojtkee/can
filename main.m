clear all
imstruct.oriori=imread("obrazy2\test2.bmp");
size1=size(imstruct.oriori,3);
if size1==3
 imstruct.ori=rgb2gray(imstruct.oriori);
else
    imstruct.ori=imstruct.oriori;
end

% imshow(imstruct.img)




imstruct.img=imbinarize(imstruct.ori,'global');
imshow(imstruct.img)

se = strel('disk',20);
imstruct.closeBW = imclose(imstruct.img,se);
figure, imshow(imstruct.closeBW)

[imstruct.label , imstruct.nb_of_ob]=bwlabel(imstruct.closeBW);
imstruct.stats=regionprops("table",imstruct.closeBW,"Perimeter","Area","Centroid","EulerNumber");
imstruct.eulernb=uint8((imstruct.stats.EulerNumber-1)*(-1))


imshow(imstruct.oriori)

zamkniete=0;
otwarte=0;

for i=1:imstruct.nb_of_ob

if imstruct.eulernb(i)==0

viscircles(imstruct.stats.Centroid(i,:),20,'color','b');
zamkniete=zamkniete+1;
else
viscircles(imstruct.stats.Centroid(i,:),20,'color','r'); 
otwarte=otwarte+1;
end
title(['otwarte=' , num2str(otwarte) , '  zamkniete=' , num2str(zamkniete)])
end