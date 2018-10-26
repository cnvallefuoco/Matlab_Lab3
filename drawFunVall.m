close all
x = 0:0.01:2*pi; % increments from 0 to 2pi by 0.01
outfile = 'drawFun.gif'; % the draw fun gif file
for t=1:50    
    plot(x, sin(t+1*x), 'r'); % plots the sin function in red  
    hold on % holds the graph to add on
    plot(x, cos(t+1*x), 'b'); % plots the cos function in blue
    ylim([-1 1]); % sets the y limits
    xlim([0 2*pi]); % sets the x limits
    axis off; % takes the axis off
    grid off; % takes the grid off
    pause(0.02) 
    drawnow; % draws the sin function
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);    
    if t==1
        imwrite(imind,cm,outfile,'gif','DelayTime',0,'loopcount',inf);
    else
        imwrite(imind,cm,outfile,'gif','DelayTime',0,'writemode','append');
    end 
    title('Super Fun Gif')
end
