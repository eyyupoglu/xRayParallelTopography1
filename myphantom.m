function X = myphantom(N)
%MYPHANTOM creates the modified Shepp-Logan phantom
%   X = myphantom(N)
% 
% This function create the modifed Shepp-Logan phantom with the
% discretization N x N, and returns it as a vector.
%
% Input:
%   N    Scalar denoting the nubmer of discretization intervals in each
%        dimesion, such that the phantom head consists of N^2 cells.
% 
% Output:
%   X    The modified phantom head reshaped as a vector

% This head phantom is the same as the Shepp-Logan except the intensities
% are changed to yield higher contrast in the image.
%
% Peter Toft, "The Radon Transform - Theory and Implementation", PhD
% thesis, DTU Informatics, Technical University of Denmark, June 1996.

%         A    a     b    x0    y0    phi
%        ---------------------------------
e =    [  1   .69   .92    0     0     0   
        -.8  .6624 .8740   0  -.0184   0
        -.2  .1100 .3100  .22    0    -18
        -.2  .1600 .4100 -.22    0     18
         .1  .2100 .2500   0    .35    0
         .1  .0460 .0460   0    .1     0
         .1  .0460 .0460   0   -.1     0
         .1  .0460 .0230 -.08  -.605   0 
         .1  .0230 .0230   0   -.606   0
         .1  .0230 .0460  .06  -.605   0   ];

xn = ((0:N-1)-(N-1)/2)/((N-1)/2);
Xn = repmat(xn,N,1);
Yn = rot90(Xn);
X = zeros(N);
     
% For each ellipse to be added     
for i = 1:size(e,1)
    a2 = e(i,2)^2;
    b2 = e(i,3)^2;
    x0 = e(i,4);
    y0 = e(i,5);
    phi = e(i,6)*pi/180;
    A = e(i,1);
    
    x = Xn-x0;
    y = Yn-y0;
    
    index = find(((x.*cos(phi) + y.*sin(phi)).^2)./a2 + ...
        ((y.*cos(phi) - x.*sin(phi))).^2./b2 <= 1);

    % Add the amplitude of the ellipse
    X(index) = X(index) + A;

end

% Return as vector and ensure nonnegative elements.
X = X(:); X(X<0) = 0;