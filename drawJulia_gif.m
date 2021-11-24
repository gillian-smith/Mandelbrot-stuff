% Render an animated gif of the Julia set of f(z) = z^2 + k*exp(1i*a),
% cycling through values of a, where k is fixed

filename = 'julia.gif';

increment = 0.01;
xmin = -2; xmax = 2; ymin = -2; ymax = 2;
maxiter = 100;
[X, Y] = meshgrid(xmin:increment:xmax, ymax:-increment:ymin);
Z_0 = X + 1i*Y; 
colour = [ [0,0,0]; colormap(jet(maxiter)) ];

k = 0.8151;
% k = 0.1898;
for a = linspace(0, 2*pi, 60) % each frame of the gif corresponds to a value of a
    
    img = zeros(size(X,1), size(Y,1), 3); % blank image
    f = @(z) z^2 + k*exp(1i*a); % set up function f

    for i = 1:size(Z_0,1)
        for j = 1:size(Z_0,2) % for each z_0
            z_0 = Z_0(i,j);
            [inSet, numiters] = isJulia(f, z_0, 2, maxiter); % is z_0 in the Julia set?
            if ~inSet 
                img(i,j,:) = reshape(colour(numiters+1, :), [1,1,3]); % colour z_0's pixel
            end
        end
    end
    
%     [inSet, numiters] = arrayfun(@(z) isJulia(f, z, 2, maxiter), Z_0);
%     
%     img = reshape(colour(bsxfun(@times, ~inSet, numiters) + 1, :), [size(X,1), size(X,2), 3]);

    % Write to .gif file
    [A, map] = rgb2ind(img, 256);
    if a == 0
        imwrite(A, map, filename, 'gif', 'LoopCount', Inf, 'DelayTime', 0.1);
    else
        imwrite(A, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
    end
    
end

close all;