function Qmat = base_mat_generation(N)
%----------------------------------------------------------------------
% This function is to generate quantization matirx according to 
% provided ruls
% Args:
%   N: size of suqare quantization matrix (N*N)
% Returns:
%   Qmat: generated qunatization matrix
%-----------------------------------------------------------------------
Qmat = zeros([N,N]);
n = 0;
L = 0;
while L<N
    L = L+2^n;
    n = n+1;
end
n = n-1;
for i = 0:1:n
    low = 2^i;
    up = 2^(i+1)-1;
    if low > N
        low = N;
    end
    if up > N;
        up = N;
    end
    Qmat(low:up,:) = 2^i;
    Qmat(:,low:up) = 2^i;
end
