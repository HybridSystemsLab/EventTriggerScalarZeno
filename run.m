%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file   Project: CDC17 paper Example for Zeno from Tabuada.07.TAC  
%                 @ Hybrid Systems Lab https://hybrid.soe.ucsc.edu/software
%
% Filename: run
%
% Author: J. Chai 09192017 (Revised from PCasau)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear

%% useful constants 
global a b sigma mu

a = 1/2; % parameter for disturbance (unused in CDC17)
b = 1/2; % parameter for disturbance
sigma = 1/2; % parameter for event functions
mu = rand*10e-5; % arbitray noise

% initial conditions
x0    = 1;
du0 = - x0 * abs(x0)^(b - 1);
z0 = [x0; x0]; %du0]; % z = [x_p \ \hat x_p]

% solver settings
TSPAN = [0 5];
JSPAN = [0 50];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

% solver tolerances
% paramNameValStruct.RelTol = '1e-10';
% paramNameValStruct.MaxStep = '1e-7';
options = odeset('RelTol',1e-6);%,'MaxStep',1e-4);

%% simulate
[t,j,xi] = HyEQsolver(@f,@G,@C,@D,z0,TSPAN,JSPAN,rule,options);

%% post processing

% compute Zeno point
tf =  1.225; %(1-a)*sum(1./(1+a.^((0:1:30)*(b-1))*x0^(b-1))); % wrong
tlim = tf;
close all

figure %('units','centimeters','position',[0 0 10 10])
h = create_axis([1 0.1 0.05 0.1],[2 0.1 0.05 0.1]);
axes(h(1))
modificatorF{1} = 'b';
modificatorF{2} = 'LineWidth';
modificatorF{3} = 2;
modificatorJ{1} = '-.';
modificatorJ{2} = 'LineWidth';
modificatorJ{3} = 2;
modificatorJ{4} = 'Marker';
modificatorJ{5} = 'o';
modificatorJ{6} = 'MarkerEdgeColor';
modificatorJ{7} = 'r';
modificatorJ{8} = 'MarkerFaceColor';
modificatorJ{9} = 'r';
modificatorJ{10} = 'MarkerSize';
modificatorJ{11} = 5;
plotarc(t,j,xi(:,1),[],[],modificatorF,modificatorJ)
set(gca,'xlim',[0 tlim])
set(gca,'ytick',[0, 0.5, 1],'fontsize',20);

grid on
axes(h(2));
plotarc(t,j,j,[],[],modificatorF,modificatorJ)
ylim = get(gca,'ylim');
set(gca,'xlim',[0 tlim])
set(gca,'ytick',[0, 25, 50],'fontsize',20);
grid on

% % du = -xi(:,2)/(sqrt(abs(xi(:,2))));
% axes(h(3));
% plotarc(t,j,xi(:,3),[],[],modificatorF,modificatorJ)
% set(gca,'xlim',[0 tlim])