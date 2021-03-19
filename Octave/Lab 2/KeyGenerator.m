## Copyright (C) 2021 Bi
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} KeyGenerator (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Bi <Bi@MSI>
## Created: 2021-01-30

function [e, n, d] = KeyGenerator()
  %choosing 2 random distinct primes
  
    p = int32(randseed(randseed, 1, 1, 10, 100));
    q = int32(randseed(randseed, 1, 1, 10, 100));
  
  n = p*q; %compute n 
  phi = (p-1)*(q-1); %compute phi
  
  for e = 2:phi-1
    if gcd(phi, e) == 1; % check d.e mod phi = 1
      break; %break when given the smallest valid e
    endif
  endfor
  
  for d = 1:phi-1
   if mod(e*d,phi) == 1;%checking if exd mod phi =1
     break
   endif
  endfor

endfunction
