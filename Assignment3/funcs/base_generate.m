function [bases] = base_generate(MtxSize,plot)
% This functio is used to generate DCT basis of size MtxSize
% Only SUQARE images are surpported.
% Args: 
%   MtxSize: function will return MtxSize*MtxSize basis
%   (n,m) are the spacial coordination 
%   (k,l) are base coordination 
%   if plot=1, basis will be ploted

if nargin<2
    plot = 1;
end

N = MtxSize;
baseCnt = 1;
bases = zeros([N,N,N,N]);
bases_norm = zeros([N,N,N,N]);
for k=0:1:N-1
    for l=0:1:N-1
        for m=0:1:N-1
            for n=0:1:N-1
                if(k==0)
                    a_k = sqrt(1/N);
                end
                if(l==0)
                    a_l = sqrt(1/N);
                else
                    a_k = sqrt(2/N);
                    a_l = sqrt(2/N);
                end
                bases(m+1,n+1,k+1,l+1) = a_k*a_l*cos((2*n+1)*k*pi/(2*N))*cos((2*m+1)*l*pi/(2*N));
            end
        end
        bases_norm(:,:,k+1,l+1) = mat2gray(bases(:,:,k+1,l+1));
    end
end

if plot==1
    figure;
    for k = 1:1:N
        for l = 1:1:N
            subplot(N,N,baseCnt);
            imshow(bases_norm(:,:,l,k));
            baseCnt = baseCnt + 1;
        end
    end
end

end
        