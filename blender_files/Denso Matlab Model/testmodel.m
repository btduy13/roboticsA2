close all;

figure(1);
L1=Link('alpha',pi/2,'a',0, 'd',0.125, 'offset',0,'qlim',[deg2rad(-160), deg2rad(160)] );
L2=Link('alpha',0,'a',0.308, 'd',0, 'offset',0,'qlim',[deg2rad(-120), deg2rad(120)]);
L3=Link('alpha',-pi/2,'a',0, 'd',0, 'offset',-pi/2,'qlim',[deg2rad(-160), deg2rad(160)]);
L4=Link('alpha',pi/2,'a',0, 'd',0.31, 'offset',0,'qlim',[deg2rad(-160), deg2rad(160)]);
L5=Link('alpha',-pi/2,'a',0, 'd',0, 'offset',0,'qlim',[deg2rad(-360), deg2rad(360)]);
L6=Link('alpha',0,'a',0, 'd',0.07, 'offset',0,'qlim',[deg2rad(360), deg2rad(360)]);


% L1=Link('alpha',-pi/2,'a',0.180, 'd',0.475, 'offset',0, 'qlim',[deg2rad(-170), deg2rad(170)]);
% L2=Link('alpha',0,'a',0.385, 'd',0, 'offset',0, 'qlim',[deg2rad(-90), deg2rad(135)]);
% L3=Link('alpha',pi/2,'a',-0.100, 'd',0, 'offset',0, 'qlim',[deg2rad(-80), deg2rad(165)]);
% L4=Link('alpha',-pi/2,'a',0, 'd',0.329+0.116, 'offset',0, 'qlim',[deg2rad(-185), deg2rad(185)]);
% L5=Link('alpha',pi/2,'a',0, 'd',0, 'offset',0, 'qlim',[deg2rad(-120), deg2rad(120)]);
% L6=Link('alpha',0,'a',0, 'd',0.09, 'offset',0, 'qlim',[deg2rad(-360), deg2rad(360)]);


robot = SerialLink([L1 L2 L3 L4 L5 L6],'name','myRobot');
workspace = [-4 4 -4 4 -4 4];                                     % Set the size of the workspace when drawing the robot        
scale = 0.1;        
q = zeros(1,6);                                                     % Create a vector of initial joint angles        
% robot.plot(q,'workspace',workspace,'scale',scale);                  % Plot the robot
        
% robot.teach;                                                        % Open a menu to move the robot manually
%% 

for linkIndex = 0:robot.n
    [ faceData, vertexData, plyData{linkIndex + 1} ] = plyread(['J',num2str(linkIndex),'.ply'],'tri'); 
     robot.faces{linkIndex + 1} = faceData;
     robot.points{linkIndex + 1} = vertexData;
end
robot.plot3d(zeros(1,robot.n),'noarrow');
% 
if isempty(findobj(get(gca,'Children'),'Type','Light'))
    camlight
end  
%             self.model.delay = 0;



     