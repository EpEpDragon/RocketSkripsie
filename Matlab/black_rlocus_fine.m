function black_rlocus_fine(sys, P_cl)
    k = 0:0.01:500;
    R = rlocus(sys,k);
    P = pole(sys);
    P = [real(P), imag(P)];
    Z = zero(sys);
    Z = [real(Z), imag(Z)];
    
    P_cl = [real(P_cl), imag(P_cl)];
    figure
    
    xy = -10:20:10;
    plot(xy,[0,0],':', 'Color', 'black')
    hold on
    plot([0,0],xy,':', 'Color', 'black')
    
    th = 0:pi/100:2*pi;
    f = 1 * exp(1j*th);
    plot(real(f), imag(f),':', 'Color', 'black');
    
    
    for m = 1:numel(R)/length(R)
        plot(real(R(m, :)),imag(R(m, :)), 'Color', 'black');
    end
    for m = 1:size(P,1)
        plot(P(m, 1),P(m, 2), 'x','MarkerSize',10, 'Color', 'black');
    end
    for m = 1:size(Z,1)
        plot(Z(m, 1),Z(m, 2), 'o','MarkerSize',10, 'Color', 'black');
    end
    for m = 1:size(P_cl,1)
        plot(P_cl(m, 1),P_cl(m, 2), 'square','MarkerFaceColor','black','MarkerSize',10, 'Color', 'black');
    end
    axis equal
    axis([-3.5,1.5, -2.5,2.5])
    box on
    set(gca,'LooseInset',get(gca,'TightInset'));
    set(gcf, 'Position',  [100, 100, 500, 500])
    hold off
end

