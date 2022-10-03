syms Phi
syms Theta
syms Psi

att_mat(Phi,Theta) = [1,        0,           -sin(Theta);
                       0, cos(Phi),  sin(Phi)*cos(Theta);
                       0, -sin(Phi),  cos(Phi)*cos(Theta)]
       
att_mat_inv(Phi,Theta) = simplify(inv(att_mat(Phi,Theta)))

R_Phi = [ 1,        0,         0;
          0, cos(Phi),  sin(Phi);
          0, -sin(Phi), cos(Phi)];

R_Theta = [ cos(Theta), 0, -sin(Theta);
                      0, 1,           0;
             sin(Theta), 0,  cos(Theta)];

R_Psi = [  cos(Psi), sin(Psi), 0;
          -sin(Psi), cos(Psi), 0;
                 0,        0, 1];

DCM(Phi,Theta,Psi) = simplify(R_Phi*R_Theta*R_Psi)
DCM_inv(Phi,Theta,Psi) = simplify(inv(DCM(Phi,Theta,Psi)))