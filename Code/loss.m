function [ err ] = loss( y,x )


err = sum(-(y.*(log(x)) + (1.0-y).*(log(1.0-x))));


end

