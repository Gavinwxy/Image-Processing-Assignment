> **JPEG** stands for "Joint Photographic Expert Group" 

# Feasibility of Compression in Spectrum

> Lower entropy in data means higher efficiency in compression.

In some compression methods, the first step is to do **DCT** on image and then compress the spectrum.  The reasons for doing so are 

- It can be noticed that the **coefficients in the transformed domain** are much more **unbalanced**. 
- In the transformed domain **few coefficients concentrate most of the signal energy**  therefore can be more efficiently compressed    
-  This property holds for most frequency transforms, if the image has **low pass characteristics** (smooth areas)      

Note that most images contains more lower frequency components as a result of high proportion of smooth area. Therefore, we just try to find a way to reduce dataset to decrease the entropy. 
# Quantization 

This is the first step to do **JPEG** compression. The quantization operation is mainly to reduce the redundancy in DCT coefficients. As mentioned before, high frequency components are not so important in most image so they are treated as redundancy. We hope to set them all to zeros by using the quantization table as shown in Mat. 1. The values in this table are increasing when row and column numbers are increasing. It means the higher frequency components will be quantized with larger value.  This will lead to some result as shown in Mat. 2. where there are only nonzero numbers on the left up corner. 



$$
Q_{Mat} = \left[\begin{matrix}
16	&11 &10	&16	&24	&40	&51	&61 \\
12	&12	&14	&19	&26	&58	&60	&55 \\
14	&13	&16	&24	&40	&57	&69	&56 \\
14	&17	&22	&29	&51	&87	&80	&62 \\
18	&22	&37	&56	&68	&109	&103	&77\\
24	&35	&55	&64	&81	&104	&113	&92\\
49	&64	&78	&87	&103	&121	&120	&101\\
72	&92	&95	&98	&112	&100	&103	&99\\
\end{matrix}\right] \tag{1}
$$


$$
Q_{Mat} = \left[\begin{matrix}
14 &6	&0	&\cdots	&0\\
15 &-3	&0	&\cdots	&0\\
-2  &0	&0	&\cdots &0\\
\vdots &\vdots &\vdots &\ddots &\vdots         \\
0	&0	&0	&0	&0	\\
\end{matrix}\right] \tag{2}
$$

## Derivation of Quantization Matrix 

**Q**: quality factor

**S**: rescale factor (step length)

$T_B$: base quantization matrix

$T_S$: output quantization matrix (used in compression)

Their relations are like:

​										**Q**--> **S** ----> $T_B$ ----> $T_S$

The general logic is that we firstly apply quality factor Q to determine scale factor S. Then, use S to scale base quantization matrix to get final matrix for compression.  Code below illustrate one way to generate a quantization matrix. Note that the last two line of code is to prevent the presents of 0s on the denominator of quantization equation. 

```matlab
Q = 80; %// Define Q factor

%// Define base quantization matrix
Tb = [16 11 10 16 24 40 51 61; 12 12 14 19 26 58 60 55; ...
     14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; ...
     18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; ...
     49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];

%// Determine S          % This part is set by user, you can
if (Q < 50)              % use different functions to get S from Q
    S = 5000/Q;           
else
    S = 200 - 2*Q;
end

Ts = floor((S*Tb + 50) / 100);
Ts(Ts == 0) = 1; % // Prevent divide by 0 error
```

## How quantization step effect quality ?

Note that  S can be seen as **step length** which means **there will be fewer levels with larger step length** indicating lower compression quality . For a quantization step of 4, we can regard this as a rule of mapping every 4 consecutive levels in original image to 1 new level in quantization result. Then, with a larger step of 16,  every 16 levels will be mapped to 1 new level. It means that less details can be seen compared to step of 4. Therefore, the increasing steps leads to decreasing image quality.

```matlab
% Suppose we have a matrix to quantize 
Mat = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16];

% We firstly quantize it with small step S1=4
S1 = 4;
Mat1 = floor(Mat/S1);

% We then quantize it with large step S2=8
S2 = 8;
Mat2 = floor(Mat/S2);
```

 ```matlab
Mat1 =

     0     0     0     1
     1     1     1     2
     2     2     2     3             % This result have more levels which means it have more
     3     3     3     4             % details so the image quality is high
 
 Mat2 =

     0     0     0     0
     0     0     0     1
     1     1     1     1             % This result have fewer levels which means it have less
     1     1     1     2             % details so quality is low
 ```

# JPEG Encoding

- **DC values** 

  Quantized DC values are coded by **DPCM** from block to block to remove the residual correlation    

- **AC coefficients**

  1.  **Zig-zag** reordering is performed to achieve large runs of zeros
  2. Encoding of zero-runs    
  3. Entropy coding (Huffman)    
## Why Zigzag Reordering ?

After the quantization step, most of the coefficients towards the lower right corner are zero. The Zigzag ordering rearranges the coefficients in one dimensional order, in result **most of the zeroes will be placed at the end of the stream**. This is more efficient for encoding.



![zigzag](http://imagecloud.nos-eastchina1.126.net/Image%20Processing/zigzag_reorder_1.JPG)

 

![](http://imagecloud.nos-eastchina1.126.net/Image%20Processing/zigzag_reorder_2.JPG)

![Result](http://imagecloud.nos-eastchina1.126.net/Image%20Processing/zigzag_reorder_result.JPG)

# References

1. [Zigzag reordering in JPEG encoding](https://www.quora.com/Why-is-zigzag-scanning-used-in-JPEG-images)
2. [Entropy coding](http://www.pcs-ip.eu/index.php/main/edu/8)