function [ newx ] = featuretransform( X , deg )

x1 = X(:,2);
x2 = X(:,3);
s = ((deg+1)*(deg+2))/2;
[m,n] = size(X);
newx = zeros(m,s);

k=1;
for i=0:deg
    for j=0:deg-i
        newx(:,k) = (x1.^(i)).*(x2.^(j));
        k=k+1;
    end
end

end
