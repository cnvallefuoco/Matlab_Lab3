close all
theta = linspace(pi/2,-pi/2,25); %25 values from -pi/2 to pi/2
rit = [cos(theta);sin(theta)]; %right arc of the circle
left = [-cos(theta);sin(theta)]; %left arc of the circle
clc
close all
saveAxis = zeros(25,4); %save the axis
figure(1) 
filename = 'circle.gif'; % gif file
for n = 1:1:25    % repeats 25 times 
    plot([rit(1, n),left(1,n)],[rit(2,n),left(2,n)],'r.-') % draws the lines between the right and left points
    axis equal % makes it look like a circle
    axis off % takes the axis off
    hold on % holds the graph to add on
    pause(.02) 
    drawnow % draws the gif
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if n == 1
        imwrite(imind,cm,filename,'gif','DelayTime',0, 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','DelayTime',0, 'WriteMode','append');
    end   
    ax=axis;
    saveAxis(n,:)=ax; %saves the axis
end
figure(1)
filename = 'circle.gif'; % gif file name
for n = 25:-1:1    % repeats 25 times to go backwards
    plot([rit(1, n),left(1,n)],[rit(2,n),left(2,n)],'w.-') % draws over in white
    hold on % holds to add onto the graph
    pause(.02)
    drawnow % draws the graph
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);    
    imwrite(imind,cm,filename,'gif','DelayTime',0, 'WriteMode','append');
    axis(saveAxis(n,:)); %saves the axis
end
