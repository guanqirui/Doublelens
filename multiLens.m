function [fi,lFo,lFi,lHo,lHi,L] = multiLens(f1i,f2i,d)
%   组合透镜的光学参数
%   此处显示详细说明
delt=d-(f1i+f2i);
fi = -f1i*f2i./delt;
xFo = -f1i*f1i./delt;
xFi = f2i*f2i./delt;
lFo = -f1i+xFo;
lFi = fi.*(f1i-d)/f1i;
% lFi = xFi+f2i;
% xHi=xFi-fi; 
lHo = lFo +fi;
lHi = lFi -fi;
L = d + lFi;

end

