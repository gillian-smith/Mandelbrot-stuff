function [inSet, i] = isJulia(f, z_0, escR, iters)
% Tests whether z_0 is in the Julia set of f by checking whether it escapes
% a circle of a given radius under iteration of f
% Inputs:
% f, the function to be iterated;
% z_0, the initial value of z;
% escR, the escape radius;
% iters, the number of iterations after which we will assume z_0 is in the
% Julia set.
% Outputs:
% inSet, a Boolean variable which is true if c is in the Julia set and
% false if it is not;
% i, the number of iterations after which z escapes the circle of radius
% escR (which is only relevant if z_0 is not in the Julia set).

inSet = true;

z = z_0; 
for i = 1:iters
    z = f(z);
    if abs(z) > escR
        inSet = false;
        break;
    end
end

end