function zigzag_out = zigzag(mat_in)
%----------------------------------------------------------------------
% This function is to do zigzag scan on matrix
% Args:
%   mat_in: input matrix to do zigzag on  
% Returns:
%   zigzag_out: array after zigzag scan
%----------------------------------------------------------------------
h = 1;
v = 1;
vmin = 1;
hmin = 1;
vmax = size(mat_in, 1);
hmax = size(mat_in, 2);
i = 1;
zigzag_out = zeros(1, vmax * hmax);

while ((v <= vmax) && (h <= hmax)) 
    if (mod(h + v, 2) == 0)                
        if (v == vmin)       
            zigzag_out(i) = mat_in(v, h);        
            if (h == hmax)
                v = v + 1;
            else
              h = h + 1;
            end;
            i = i + 1;
        elseif ((h == hmax) && (v < vmax))   
            zigzag_out(i) = mat_in(v, h);
            v = v + 1;
            i = i + 1;
        elseif ((v > vmin) && (h < hmax))    
            zigzag_out(i) = mat_in(v, h);
            v = v - 1;
            h = h + 1;
            i = i + 1;
        end;       
    else                                  
       if ((v == vmax) && (h <= hmax))      
            zigzag_out(i) = mat_in(v, h);
            h = h + 1;
            i = i + 1;        
       elseif (h == hmin)                  
            zigzag_out(i) = mat_in(v, h);
            if (v == vmax)
            h = h + 1;
	    else
            v = v + 1;
        end;
            i = i + 1;
       elseif ((v < vmax) && (h > hmin))   
            zigzag_out(i) = mat_in(v, h);
            v = v + 1;
            h = h - 1;
            i = i + 1;
        end;
    end;
    if ((v == vmax) && (h == hmax))         
        zigzag_out(i) = mat_in(v, h);
        break
    end;
end;