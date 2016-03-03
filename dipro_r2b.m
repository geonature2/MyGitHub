function J = dipro_r2b(m)
%   Colormap for compatiblilty to DIPRO for Windows
%   DIPRO_B2RJ(M), is an M-by-3 matrix containing
%   the default colormap used by CONTOUR, SURF and PCOLOR.
%   The colors begin with dark blue, range through shades of
%   blue, green, yellow and red, and end with purple.
%   DIPRO_B2RJ, with no arguments, is the same length as the current colormap.
%   Use COLORMAP(JET).
%
%   See also HSV, HOT, PINK, FLAG, COLORMAP, RGBPLOT.

%   Copyright 2003 Seong Kon Lee
%   $Revision: 1.0 $  $Date: 2003/11/04 17:27:04 $

if nargin < 1
   m = size(get(gcf,'colormap'),1);
end

n = ceil(m/4);

r = [zeros(1,n) (1:1:n)/n ones(1,n) (n-(1:1:n)/2)/n]';
g = [(1:1:n)/n  ones(1,n) (n-(1:1:n))/n zeros(1,n) ]';
b = [(n-(1:1:n))/n zeros(1,n) zeros(1,n) (1:1:n)/2/n ]';

J = zeros(m,3);
J(1:m,1) = r(m:-1:1);
J(1:m,2) = g(m:-1:1);
J(1:m,3) = b(m:-1:1);
