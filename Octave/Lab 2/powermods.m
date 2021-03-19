function result = powermods(base, exponent, m)
  
  base = mod(base, m);
  
  result = 1;
  
  for k = 1: exponent
    result = result * base;
    result = mod(result, m);
    
  endfor
