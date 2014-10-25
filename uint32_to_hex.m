function h = uint32_to_hex(x)
%UINT32_TO_HEX Convert uint32 number to hexadecimal string.
%
%   UINT32_TO_HEX(X) converts each uint32 value in X to a 1-by-8 array of
%   hexadecimal values.
%
%   The input array must be a numerical array, but not necessarily of class
%   uint32, with integers N in the range 0 <= N <= 4294967295.
%
%   For example,
%
%      uint32_to_hex([         0
%                              1
%                              2
%                     2147483646
%                     2147483647
%                     2147483648
%                     2147483649
%                     4294967293
%                     4294967294
%                     4294967295])
%
%   returns
%
%      ['00000000'
%       '00000001'
%       '00000002'
%       '7ffffffe'
%       '7fffffff'
%       '80000000'
%       '80000001'
%       'fffffffd'
%       'fffffffe'
%       'ffffffff']
%
%   See also FORMAT HEX.

%   Author:      Peter John Acklam
%   Time-stamp:  2004-04-10 15:48:26 +0200
%   E-mail:      pjacklam@online.no
%   URL:         http://home.online.no/~pjacklam


  
   % Get size of input array.
   sx = size(x);
   dx = ndims(x);

   % Compute size of output array.
   hs = sx;
   hs(2) = hs(2) * 8;

   % Dimension permutation vector.
   dpv = [2, 1, 3:dx];

   x = permute(x, dpv);

   h = sprintf('%.8x', double(x));

   h = reshape(h, hs(dpv));
   h = permute(h, dpv);
