function Shift_multiLens(f1i,f2i,dmin,di,dmax)
%   移动的组合透镜的基点绘制
%   此处显示详细说明
% [fi,lFo,lFi,lHo,lHi,L] = multiLens(f1i,f2i,d);  

%% 求取合适的坐标范围
%% d = (f1i + f2i) 时，焦点位于无穷远，是物方基点与像方基点翻转的情况
    d = (f1i + f2i)*0.9;
    x0 = 0;
    [fi,lFo,lFi,lHo,lHi,L] = multiLens(f1i,f2i,d);
    xmax = round(max([x0,x0+lHo,x0+d+lHi,x0+lFo,x0+d+lFi])/1000)*1000;
    
%% 调用绘图函数
for d = dmin:di:dmax
    [fi,lFo,lFi,lHo,lHi,L] = multiLens(f1i,f2i,d);
    cla reset;
    %%
    axis([-xmax xmax -50 50]);    
    draw_multiLens(f1i,f2i,d,lFo,lFi,lHo,lHi);
    if (d>(f1i + f2i)*0.8)&(d<(f1i + f2i)*1.2)
        pause(0.2);
    else
        pause(0.02);
    end
end