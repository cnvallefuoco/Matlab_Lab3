close all
unitCircle = 0:40:360; % increments degrees of 40 until it gets to 360
x=5*cosd(unitCircle); % creates x values of a circle with radius 5
y=5*sind(unitCircle); % creates y values of a circle with radius 5
dist=sqrt(((x(2)-x(1))^2)+((y(2)-y(1))^2))/2; % distance formula
hold on % holds on to the graph to add on
axis equal % makes it look like a circle
grid off % takes the grid off
theta=linspace(-pi/2,pi/2,10); % theta values from -pi/2 to pi/2 10 times
rit=dist*[cos(theta);sin(theta)]; % right side of the circle
left=dist*[-cos(theta);sin(theta)]; % left side of circle

figure(1)
filename='newCircle.gif'; % new circle gif filename
for n=1:1:9  % repeats 9 times as it goes acround the polygon
    hold off % takes the hold off 
    plot(x,y,'r'); % plots the polygon in red
    axis off % takes the axis off
    hold on % adds on to the graph
    R=[cosd(-20) sind(-20);-sind(-20) cosd(-20)]*[cosd(-40) sind(-40);-sind(-40) cosd(-40)]^(n-1); % rotation
    for i=1:1:10    % repeats 10 times to create a circle
        transR=(R)*rit+repmat([(x(n)+x(n+1))/2;(y(n)+y(n+1))/2],1,10); % rotates and translates the right side of the circle
        transL=(R)*left+repmat([(x(n)+x(n+1))/2;(y(n)+y(n+1))/2],1,10); % rotates and translates the left side of the circle
        plot([transR(1, i),transL(1,i)],[transR(2,i),transL(2,i)],'b.-') % plots the new circle in blue
        axis equal % makes it look like a circle, visually pleasing
        axis([-7 7 -7 7]) % sets the axis so it doesnt move
        hold on % holds to add to the graph
        pause(.01)    
        drawnow % draws the new circle
        frame=getframe(1);
        im=frame2im(frame);
        [imind,cm]=rgb2ind(im,256);
        if n==1 & i==1
            imwrite(imind,cm,filename,'gif','DelayTime',0, 'Loopcount',inf);
        else
            imwrite(imind,cm,filename,'gif','DelayTime',0, 'WriteMode','append');
        end  
    end
end
