function [inSet, i] = isMandelbrot(c, iters)
% Tests whether a number is in the Mandelbrot set
% Inputs:
% c, the number which we would like to check;
% iters, the number of iterations after which we will assume c is in the 
% Mandelbrot set.
% Outputs:
% inSet, a Boolean variable which is true if c is in the Mandelbrot set and
% false if it is not;
% i, the number of iterations after which z escapes the circle of radius 2
% (which is only relevant if c is not in the Mandelbrot set).

inSet = true;

z = 0; % initial value of z
for i = 1:iters
    z = z^2 + c; % iterate this function
    if abs(z) > 2 % if z is outside the circle with radius 2
        inSet = false; % then we can be sure that z is not in the Mandelbrot set
        break;
    end
end

end