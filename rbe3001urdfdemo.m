clear;
clc;

robot = makeRobot('rbe3001arm.urdf');
robot_cfg = homeConfiguration(robot);


    for i = 1:1:10
       robot_cfg = moveRobot(robot_cfg, pi/i, -pi/i, -pi/i);
       dispRobot(robot, robot_cfg);
       pause(0.01);
    end

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
    axis([-0.25, 0.4, -0.2, 0.2, -0.05, 0.4]);
    axis off
end