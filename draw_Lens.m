function draw_Lens(fi,x,semi)
%   ��͸���Ļ���
%   �˴���ʾ��ϸ˵��
%   ���������࣬λ�ã��ھ�  

dx = 0.05*1000; 
h = line('color',[0,0,0],'LineStyle','-','Linewidth',2);hold on;% �������͸����ʽ
set(h,'xdata',[x,x],'ydata',[-semi,semi]);

if fi > 0
    % ������͸����ͷ:��ɫ
    patch([x,x-dx,x+dx],[semi,0.8*semi,0.8*semi],[1,0,0]);hold on;
    patch([x,x-dx,x+dx],[-semi,-0.8*semi,-0.8*semi],[1,0,0]);hold on;
else
    % ���Ƹ�͸����ͷ:��ɫ
    patch([x,x-dx,x+dx],[semi,1.2*semi,1.2*semi],[0,0,1]);hold on;
    patch([x,x-dx,x+dx],[-semi,-1.2*semi,-1.2*semi],[0,0,1]);hold on;
    
end
    
end
