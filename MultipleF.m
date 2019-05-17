clear;
d=1:0.5:400;
f1=200;f2=-100;
delt=d-(f1+f2);
f = -f1*f2./delt;
xFi=f2*f2./delt;
lFi=f.*(f1-d)/f1;
L = d + lFi;

figure(1);
plot(d,0);hold on;
plot(d,f);hold on;
line(f1+f2,-10000:10000);hold on;
axis([0 400 -10000 10000]);
