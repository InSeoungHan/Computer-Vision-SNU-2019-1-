function [Im, Io] = mySobelFilter(Ig)
    sobel_fw = [-1 0 1; -2 0 2; -1 0 1];
    sobel_fh = [1 2 1 ; 0 0 0; -1 -2 -1];
    Iw = myImageFilter(Ig, sobel_fw);
    Ih = myImageFilter(Ig, sobel_fh);
    Im = sqrt(Iw.^2 + Ih.^2);
    Io = atand(Ih./Iw);
end