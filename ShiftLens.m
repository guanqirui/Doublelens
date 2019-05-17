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
% axis([-2000 2000 -50 50]);                       %����������
line(LL,0,'color',[0,0,0],'LineStyle','-.','Linewidth',2);hold on;%���ƹ���
h1 = line('color',[0,0,1],'LineStyle','-','Linewidth',2);hold on;% �������͸��1
h2 = line('color',[1,0,0],'LineStyle','-','Linewidth',2);hold on;% �������͸��2
h3 = line('color',[0,0,1],'LineStyle','-','Linewidth',2);hold on;% ��������﷽����
h4 = line('color',[1,0,0],'LineStyle','-','Linewidth',2);hold on;% �������������
h5 = line('color',[0,0,1],'LineStyle','-','Linewidth',2);hold on;% ��������﷽����
h6 = line('color',[1,0,0],'LineStyle','-','Linewidth',2);hold on;% ��������񷽽���

% ʹ͸���˶�
n = length(d);
i = 1;
for i = 1:n
    set(h1,'xdata',x0.*ones(1,length(L1)),'ydata',L1);
    set(h2,'xdata',(x0+d(i)).*ones(1,length(L2)),'ydata',L2);
    set(h3,'xdata',(x0+lHo(i)).*ones(1,length(L3)),'ydata',L3);
    set(h4,'xdata',(x0+d(i)+lHi(i)).*ones(1,length(L4)),'ydata',L4);
    set(h5,'xdata',(x0+lFo(i)).*ones(1,length(L5)),'ydata',L5);
    set(h6,'xdata',(x0+d(i)+lFi(i)).*ones(1,length(L6)),'ydata',L6);
    drawnow;                  %ˢ����Ļ
    pause(0.2)               %��������
    i = i+1;
    if d(i) == (f1i+f2i) %�� ʱ��������Ƭ
        ff1 = getframe(gcf);      %������Ƭ
    end
    if d(i) == (f1i) %�� ʱ��������Ƭ
        ff2 = getframe(gcf);      %������Ƭ
    end
end
