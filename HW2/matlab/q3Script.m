%init
clear ; close all; clc;

%path to each scene folder
scene1 = '../data/q3/scene1';
scene2 = '../data/q3/scene2';

%separate direct and global component for scene1 
[globalImg1, directImg1] = separateGlobalDirect(scene1);
subplot(1,3,1);
imshow(directImg1 + globalImg1);
title("directImg + globalImg for scene1");
subplot(1,3,2);
imshow(directImg1);
title("directImg for scene1");
subplot(1,3,3);
imshow(globalImg1);
title("globalImg for scene1");
pause;

%separate direct and global component for scene2
[globalImg2, directImg2] = separateGlobalDirect(scene2);
subplot(1,3,1);
imshow(directImg2 + globalImg2);
title("directImg + globalImg for scene2");
subplot(1,3,2);
imshow(directImg2);
title("directImg for scene2");
subplot(1,3,3);
imshow(globalImg2);
title("globalImg for scene2");
pause;