function black_pz(sys,x1,x2,y1,y2)
    P = pzmap(sys);
    P = [real(P), imag(P)];
    
    xy = -100:200:100;
    plot(xy,[0,0],':', 'Color', 'black')
    hold on
    plot([0,0],xy,':', 'Color', 'black')
    
    for m = 1:size(P,1)
        plot(P(m, 1),P(m, 2), 'x','MarkerSize',10, 'Color', 'black');
    end
    
    axis([x1,x2, y1,y2])
    set(gca,'LooseInset',get(gca,'TightInset'));
    set(gcf, 'Position',  [100, 100, 400, 400])
end

