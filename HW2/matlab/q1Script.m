% part 1

%load bunny.mat file
load("../data/bunny.mat");
[x, y, z] = size(N);
%generate grid for describing xy value of the normal N
[Y, X] = meshgrid(1:y, x:-1:1);
Nx = N(:,:,1); Ny = N(:,:,2); Nz = N(:,:,3);
%draw xy value of the normal on each point.
quiver(Y, X, Ny, Nx);
pause;

% display the radiance emitted from each point
% assumption : Lambertian reflectance & constant albedo = 1
% with a distant point light source in direction s = (0, 0, 1).
albedo = 1;
RI = pi; %radiant intensity
S = [0;0;1];
I = (Nx .* S(1) + Ny .* S(2) + Nz .* S(3)) * (albedo / pi * RI);
imshow(I);