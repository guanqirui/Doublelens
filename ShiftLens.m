clear;
LL = -2000:2000;
x0=100;
L1 = -20:20;
L2 = -20:20;
L3 = -30:30;
L4 = -30:30;
L5 = -40:40;
L6 = -40:40;
d0=150;f1i=200;f2i=-50;
d =500:600;
[fi,lFo,lFi,lHo,lHi,L] = multiLens(f1i,f2i,d);

figure();
axis off
% axis([-2000 2000 -50 50]);                       %不画坐标轴
line(LL,0,'color',[0,0,0],'LineStyle','-.','Linewidth',2);hold on;%绘制光轴
h1 = line('color',[0,0,1],'LineStyle','-','Linewidth',2);hold on;% 定义绘制透镜1
h2 = line('color',[1,0,0],'LineStyle','-','Linewidth',2);hold on;% 定义绘制透镜2
h3 = line('color',[0,0,1],'LineStyle','-','Linewidth',2);hold on;% 定义绘制物方主面
h4 = line('color',[1,0,0],'LineStyle','-','Linewidth',2);hold on;% 定义绘制像方主面
h5 = line('color',[0,0,1],'LineStyle','-','Linewidth',2);hold on;% 定义绘制物方焦面
h6 = line('color',[1,0,0],'LineStyle','-','Linewidth',2);hold on;% 定义绘制像方焦面

% 使透镜运动
n = length(d);
i = 1;
for i = 1:n
    set(h1,'xdata',x0.*ones(1,length(L1)),'ydata',L1);
    set(h2,'xdata',(x0+d(i)).*ones(1,length(L2)),'ydata',L2);
    set(h3,'xdata',(x0+lHo(i)).*ones(1,length(L3)),'ydata',L3);
    set(h4,'xdata',(x0+d(i)+lHi(i)).*ones(1,length(L4)),'ydata',L4);
    set(h5,'xdata',(x0+lFo(i)).*ones(1,length(L5)),'ydata',L5);
    set(h6,'xdata',(x0+d(i)+lFi(i)).*ones(1,length(L6)),'ydata',L6);
    drawnow;                  %刷新屏幕
    pause(0.2)               %控制球速
    i = i+1;
    if d(i) == (f1i+f2i) %当 时才拍摄照片
        ff1 = getframe(gcf);      %拍摄照片
    end
    if d(i) == (f1i) %当 时才拍摄照片
        ff2 = getframe(gcf);      %拍摄照片
    end
end
