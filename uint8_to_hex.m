function h = uint8_to_hex(x)
%UINT8_TO_HEX Convert uint8 number to hexadecimal string.
%
%   UINT8_TO_HEX(X) converts each uint8 value in X to a 1-by-2 array of
%   hexadecimal values.
%
%   The input array must be a numerical array, but not necessarily of class
%   uint8, with integers N in the range 0 <= N <= 255.
%
%   For example,
%
%      uint8_to_hex([  0
%                      1
%                      2
%                    126
%                    127
%                    128
%                    129
%                    253
%                    254
%                    255])
%
%   returns
%
%      ['00'
%       '01'
%       '02'
%       '7e'
%       '7f'
%       '80'
%       '81'
%       'fd'
%       'fe'
%       'ff']
%
%   See also FORMAT HEX.

%   Author:      Peter John Acklam
%   Time-stamp:  2004-04-10 15:48:26 +0200
%   E-mail:      pjacklam@online.no
%   URL:         http://home.online.no/~pjacklam

   % Check number of input arguments.

   % Get size of input array.
   sx = size(x);
   dx = ndims(x);

   % Compute size of output array.
   hs = sx;
   hs(2) = hs(2) * 2;

   % Dimension permutation vector.
   dpv = [2, 1, 3:dx];

   x = permute(x, dpv);

   h = sprintf('%.2x', double(x));

   h = reshape(h, hs(dpv));
   h = permute(h, dpv);
