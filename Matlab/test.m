v = -1
A = 0:200;
figure
hold on
for i = 1:ceil(15/4):15
    m(1,i)
    a_max = 2*T_max/m(1,i)-g
%     u = (4*v-sqrt(16*v^2-8*(v^2-2*A*a_max)))/6;
    u = -sqrt(-v^2+2*a_max*A);
    plot(A,-abs(u))
end
hold off

