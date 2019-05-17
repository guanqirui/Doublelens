function draw_Lens(fi,x,semi)
%   单透镜的绘制
%   此处显示详细说明
%   参数：焦距，位置，口径  

dx = 0.05*1000; 
h = line('color',[0,0,0],'LineStyle','-','Linewidth',2);hold on;% 定义绘制透镜格式
set(h,'xdata',[x,x],'ydata',[-semi,semi]);

if fi > 0
    % 绘制正透镜箭头:红色
    patch([x,x-dx,x+dx],[semi,0.8*semi,0.8*semi],[1,0,0]);hold on;
    patch([x,x-dx,x+dx],[-semi,-0.8*semi,-0.8*semi],[1,0,0]);hold on;
else
    % 绘制负透镜箭头:蓝色
    patch([x,x-dx,x+dx],[semi,1.2*semi,1.2*semi],[0,0,1]);hold on;
    patch([x,x-dx,x+dx],[-semi,-1.2*semi,-1.2*semi],[0,0,1]);hold on;
    
end
    
end
