% Render the Julia set of f(z) = z^2 + c

% Some interesting values of c
c = 0.28 + 0.008*1i;
% c = -0.8 + 0.156*1i;
% c = -0.4 + 0.6*1i;
% c = -0.8 + 0.156*1i;
% c = -0.835 - 0.232*1i;
% c = -0.70176 - 0.3842*1i;
% c = -0.74543 + 0.11301;
% phi = (1 + sqrt(5))/2; c = 1 - phi;
f = @(z) z^2 + c;

increment = 0.005;
xmin = -2; xmax = 2; ymin = -2; ymax = 2; % boundary of region to draw

maxiter = 100; escR = 2; % max number of iterations and escape radius

[X, Y] = meshgrid(xmin:increment:xmax, ymax:-increment:ymin);
Z_0 = X + 1i*Y; % matrix of z_0's
img = zeros(size(X,1), size(Y,1), 3); % blank image

% Trying different colourmaps
% colour = reshape(cat(3, 0.6*ones(1, maxiter), linspace(0, 1, maxiter), ones(1, maxiter)), [100,3]);
colour = [ [0,0,0]; colormap(jet(maxiter)) ];
% colour = reshape(cat(3, linspace(0, 1, maxiter), ones(1, maxiter), ones(1, maxiter)), [100,3]); 

for i = 1:size(Z_0,1)
    for j = 1:size(Z_0,2) % for each z_0
        z_0 = Z_0(i,j);
        % test if z_0 is in the Julia set of f
        [inSet, numiters] = isJulia(f, z_0, escR, maxiter); 
        if ~inSet
            % colour z_0's pixel according to the number of iterations before escape
            img(i,j,:) = reshape(colour(numiters, :), [1,1,3]); 
        end
    end
end

% Code no longer needed
% [inSet, numiters] = arrayfun(@(z) isJulia(f, z, 2, maxiter), Z_0);
% img = reshape(colour(bsxfun(@times, ~inSet, numiters) + 1, :), [size(X,1), size(X,2), 3]);
% img = hsv2rgb(img);

imshow(img);

imwrite(img, 'juliaset.jpg');