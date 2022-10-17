% v = -1
% A = 0:200;
% figure
% hold on
% for i = 1:ceil(15/4):15
%     m(1,i)
%     a_max = 2*T_max/m(1,i)-g
% %     u = (4*v-sqrt(16*v^2-8*(v^2-2*A*a_max)))/6;
%     u = -sqrt(-v^2+2*a_max*A);
%     plot(A,-abs(u))
% end
% hold off

% Plant roll
syms t_S r_S I_x s
A_roll = [-1/t_S, 0; r_S/I_x(1), 0];
b_roll = [1/t_S; 0];
c_roll = [0,1];

Phi_roll=inv(s*eye(2)-A_roll);
G_roll=c_roll*Phi_roll*b_roll;
pretty(simplify(G_roll))

syms t_P m
% Plant climb
A_hev = [-1/t_P,  0, 0;
          1/m, 0, 0;
          0,      1, 0];

b_hev = [1/t_P; 0; 0];
c_climb = [0, 1, 0];
Phi_climb=inv(s*eye(3)-A_hev);
G_climb=c_climb*Phi_climb*b_hev;
pretty(simplify(G_climb))

syms KpC KiC
% Plant alt
A_clm = [A_hev-b_hev*KpC*c_climb, b_hev*KiC;
         -c_climb              , 0];
b_clm = [b_hev*KpC;1];
c_alt = [0,0,1,0];
Phi_alt=inv(s*eye(4)-A_clm);
G_alt=c_alt*Phi_alt*b_clm;
pretty(simplify(G_alt))

syms t_V cm I_yz_lookup T_max
% Plant rate
A_hor = [-1/t_V,  0, 0, 0, 0;
          cm/I_yz_lookup, 0, 0, 0, 0;
          0, 1, 0, 0, 0;
          0, 0, 0, 0, 1;
          0, 0, T_max/m, 0, 0];

b_hor = [1/t_V; 0; 0; 0; 0];
c_rate = [0, 1, 0, 0, 0];
Phi_rate=inv(s*eye(5)-A_hor);
G_rate=c_rate*Phi_rate*b_hor;
pretty(simplify(G_rate))

syms KpRA KiRA
% Plant angle
A_rate = [A_hor-b_hor*KpRA*c_rate, b_hor*KiRA;
         -c_rate              , 0];
b_rate = [b_hor*KpRA;1];
c_ang = [0, 0, 1, 0, 0, 0];
Phi_angle=inv(s*eye(6)-A_rate);
G_angle=c_ang*Phi_angle*b_rate;
pretty(simplify(G_angle))

syms KpAN T_max
% Plant vel
A_ang = A_rate - b_rate*KpAN*c_ang;
b_ang = b_rate*(KpAN/T_max);
c_vel = [0, 0, 0, 0, 1, 0];
Phi_vel=inv(s*eye(6)-A_ang);
G_vel=c_vel*Phi_vel*b_ang;
pretty(simplify(G_vel))

syms KpVE KiVE 
% Plant pos
A_vel = [A_ang-b_ang*KpVE*c_vel, b_ang*KiVE;
         -c_vel              , 0];
b_vel = [b_ang*KpVE;1];
c_pos = [0, 0, 0, 1, 0, 0, 0];
Phi_pos=inv(s*eye(7)-A_vel);
G_pos=c_pos*Phi_pos*b_vel;
pretty(simplify(G_pos))