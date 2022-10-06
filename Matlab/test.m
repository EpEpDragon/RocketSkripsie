v = -0.2
A = 0:10000;
hold on
for i = 1:ceil(15/4):15
    m(1,i)
    a_max = T_max/m(1,i)-g
    u = (3*v-sqrt(9*v^2-8*(v^2-A*a_max)))/4;
    plot(A,u)
end
hold off

