% Drawing the Mandelbrot set

increment = 0.025; % increment between points on the complex plane
xmin = -2, xmax = 2; ymin = -2; ymax = 2; % render all of the Mandelbrot set
xmin = -3; xmax = 1; ymin = -2; ymax = 2; % customise boundary of region to be rendered

maxiter = 100; % maximum number of iterations to be performed

[X, Y] = meshgrid(xmin:increment:xmax, ymax:-increment:ymin); % create grid of x and y coordinates
C = X + 1i*Y; % create matrix of points on the complex plane
img = zeros(size(X,1), size(X,2), 3); % blank HSV image

for i = 1:size(C,1) 
    for j = 1:size(C,2) % for each point in C
        c = C(i,j); 
        [inSet, numiters] = isMandelbrot(c, maxiter); % check if c is in the Mandelbrot set
        if ~inSet % if c is not in the Mandelbrot set
            img(i,j,:) = reshape([numiters/maxiter, 1, 1], [1,1,3]); 
            % colour c's pixel according to the number of iterations to escape
            % use H = numiters/maxiter (which is between 0 and 1), S = V = 1 
        end
    end
end

img = hsv2rgb(img); % convert HSV image to RGB for displaying
imshow(img);

