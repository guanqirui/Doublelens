clear;
d=0:110;
f1=200;f2=-100;
delt=d-(f1+f2);
f = -f1*f2./delt;
xFi=f2*f2./delt;
lFi=f.*(f1-d)/f1;
% lFi2=xFi+f2;
% xHi=xFi-f; 
lHi=lFi-f;
L = d + lFi;

figure(1);
plot(d,0);hold on;
plot(d,f,'r');hold on;
plot(d,lFi,'b');hold on;
% plot(d,lFi2,'y');hold on;
plot(d,lHi,'g');hold on;
plot(d,L,'k');hold on;
% lagend('d','f','lFi','lHi','L');
grid on
% line(f1+f2,-100:100);hold on;
axis([0 200 -500 500]);
