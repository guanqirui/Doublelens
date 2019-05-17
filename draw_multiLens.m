function draw_multiLens(f1i,f2i,d,lFo,lFi,lHo,lHi)
%   组合透镜的基点绘制
%   此处显示详细说明
% [fi,lFo,lFi,lHo,lHi,L] = multiLens(f1i,f2i,d);  

LL = -1000:1000;
x0 = 0;

%绘制光轴
h0 = line('color',[0,0,0],'LineStyle','-.','Linewidth',1);hold on;
set(h0,'xdata',LL,'ydata',zeros(1,length(LL)));

%绘制透镜和基点
draw_Lens(f1i,x0,20);
draw_Lens(f2i,x0+d,20);
draw_BasicPoints(x0+lHo,x0+d+lHi,x0+lFo,x0+d+lFi,40)  

grid on;
drawnow;                  %刷新屏幕

end

