function draw_BasicPoints(xHo,xHi,xFo,xFi,semi)
%   基点的绘制
%   此处显示详细说明
%   参数：基点位置，口径  

h3 = line('color',[1,0,0],'LineStyle','-','Linewidth',2);hold on;   % 定义绘制物方主面
h4 = line('color',[0,0,1],'LineStyle',':','Linewidth',2);hold on;  % 定义绘制像方主面

set(h3,'xdata',[xHo,xHo],'ydata',[-semi,semi]);     % 绘制物方主面
set(h4,'xdata',[xHi,xHi],'ydata',[-semi,semi]);     % 绘制像方主面
plot(xFo,0,'r+','markersize',10);     % 绘制物方焦点
plot(xFi,0,'b*','markersize',10);     % 绘制像方焦点
    
end
