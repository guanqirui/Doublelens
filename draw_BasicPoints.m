function draw_BasicPoints(xHo,xHi,xFo,xFi,semi)
%   ����Ļ���
%   �˴���ʾ��ϸ˵��
%   ����������λ�ã��ھ�  

h3 = line('color',[1,0,0],'LineStyle','-','Linewidth',2);hold on;   % ��������﷽����
h4 = line('color',[0,0,1],'LineStyle',':','Linewidth',2);hold on;  % �������������

set(h3,'xdata',[xHo,xHo],'ydata',[-semi,semi]);     % �����﷽����
set(h4,'xdata',[xHi,xHi],'ydata',[-semi,semi]);     % ����������
plot(xFo,0,'r+','markersize',10);     % �����﷽����
plot(xFi,0,'b*','markersize',10);     % �����񷽽���
    
end
