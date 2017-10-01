File = ['credit.txt'];
datasize = 100;
f = fopen(File, 'r');
C = textscan(f, '%f%f%f', 'Delimiter', ',');
input = zeros(datasize,2);
input1 = C{1};
input2 = C{2};
a = ones(datasize , 1);
fiX = horzcat(a,input1,input2);
%[m,n] = size(fiX);
y =( C{3});

plotdata(fiX(:,2:end),y);


mn = mean(fiX);
st = std(fiX);

w = zeros(3,1);
lr = 0.1;
lam = 15;
for i=1:1000
    sig = sigmoid(fiX,w);
    %sig = 1./(1+exp(-fiX*w));
   w = (1-((lr*lam)/datasize))*w -  (lr/datasize)*((transpose(fiX))*(sig-y));
end
wgd = w;

plotDecisionBoundary(wgd, fiX, y, mn , st,1 , fiX);

w = zeros(3,1);

for i=1:10
    fx = sigmoid(fiX,w);
    R = diag(fx.*(1-fx));
    He = transpose(fiX)*R*fiX;
    w = w - inv(He)*((transpose(fiX))*(fx-y) + (lam/datasize)*w) ;
end
wnr = w;

Filetest = ['credittest.txt'];
datatest = 1000;
ft = fopen(Filetest , 'r');
tC = textscan(ft, '%f%f%f', 'Delimiter', ',');
input = zeros(datatest,2);
input1 = tC{1};
input2 = tC{2};
a = ones(datatest , 1);
testx = horzcat(a,input1,input2);
y =( tC{3});

ftxgd = sigmoid(testx , wgd);
ftxnr = sigmoid(testx , wnr);
accgd = 0;
accnr = 0;
for i=1:datatest
   if(ftxgd(i)>=0.5)
       ftxgd(i)=1;
   else
       ftxgd(i)=0;
   end
   
   if(ftxgd(i)==y(i))
       accgd=accgd+1;
   end
   
   if(ftxnr(i)>=0.5)
       ftxnr(i)=1;
   else
       ftxnr(i)=0;
   end
   
   if(ftxnr(i)==y(i))
       accnr=accnr+1;
   end

end

accgd = accgd*100/datatest;
accnr = accnr*100/datatest;
disp('Accuracy of Gradient Decent Approach')
accgd
disp('Accuracy of Newton Raphson Approach')
accnr

%%%%%%%%%%%% Feature transform %%%%%%%%%%%%%%%

deg = 2;
fiX;
newx = featuretransform(fiX , deg);

mn = mean(newx);
st = std(newx);

noc = ((deg+1)*(deg+2))/2;
y =( C{3});

w = zeros(noc,1);

lr = 0.1;
lam = 0.1;
for i=1:10000
    sig = sigmoid(newx,w);
    %sig = 1./(1+exp(-fiX*w));
   w = (1-((lr*lam)/datasize))*w -  (lr/datasize)*((transpose(newx))*(sig-y));
end
wgd = w;

plotDecisionBoundary(wgd,newx,y,mn,st,deg,fiX);

deg=3;
newx = featuretransform(fiX , deg);

mn = mean(newx);
st = std(newx);

noc = ((deg+1)*(deg+2))/2;
y =( C{3});
w = zeros(noc,1);


lam = 0.000000001;

for i=1:5
    fx = sigmoid(newx,w);
    R = diag(fx.*(1-fx));
    He = transpose(newx)*R*newx;
    w = w - inv(He)*((transpose(newx))*(fx-y)+(lam/datasize)*w) ;
end
wnr = w;

%plotDecisionBoundary(wnr,newx,y,mn,st,deg,fiX);

newtsx = featuretransform(testx , deg);

noc = ((deg+1)*(deg+2))/2;
y =( tC{3});

%ftxgd = sigmoid(newtsx , wgd);
ftxnr = sigmoid(newtsx , wnr);
%accgd = 0;
accnr = 0;
for i=1:datatest
   
   if(ftxnr(i)>=0.5)
       ftxnr(i)=1;
   else
       ftxnr(i)=0;
   end
   
   if(ftxnr(i)==y(i))
       accnr=accnr+1;
   end

end

%accgd = accgd*100/datatest;
accnr = accnr*100/datatest;
%disp('Accuracy of Gradient Decent Approach After Feature Extraction')
%accgd
disp('Accuracy of Newton Raphson Approach After Feature Extraction')
accnr
