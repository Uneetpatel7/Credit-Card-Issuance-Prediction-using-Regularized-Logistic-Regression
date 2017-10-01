function [ tmp ] = combination(x , y , deg)

k=1;
for i=0:deg
    for j=0:deg-i
        tmp(k) = (x^(i)) * (y^(j));
        k=k+1;
    end
end

end

