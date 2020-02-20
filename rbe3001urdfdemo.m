robot = makeRobot('rbe3001arm.urdf');
robot_cfg = homeConfiguration(robot);

robot_med = makeRobot('rbe3001arm_medres.urdf');
robot_med_cfg = homeConfiguration(robot_med);

tic;
for i = 1:1:10
   dispRobot(robot, moveRobot(robot_cfg, pi/i, -pi/i, -pi/i));
   pause(0.01);
end
disp("Low Res Model Avg Cycle Time: "+ toc/10);

tic;
for i = 1:1:10
   dispRobot(robot_med, moveRobot(robot_med_cfg, pi/i, -pi/i, -pi/i));
   pause(0.01);
end
disp("Med Res Model Avg Cycle Time: "+ toc/10);

function robot=makeRobot(urdf_loc)
    robot = importrobot(urdf_loc);
end

function robot_cfg = moveRobot(config, theta1, theta2, theta3)
    config(1).JointPosition = theta1;
    config(2).JointPosition = theta2;
    config(3).JointPosition = theta3;
    robot_cfg = config;
end

function dispRobot(robot, config)
    show(robot, config);
    %axis([-0.25, 0.4, -0.2, 0.2, -0.05, 0.4]);
    axis off
end