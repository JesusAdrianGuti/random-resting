 Pcut = [0.1 ; 0.24; 0.56; 1.32; 3.12; 7.38];
 s=5;
 for i = 1:s
     %Calculate Cr
     Cr(i) = ( Pcut(i+1) / Pcut(i) ) ^ (1/s);
 end
 
 Cr
 
 for t = 1:5
     t = t+1
 end