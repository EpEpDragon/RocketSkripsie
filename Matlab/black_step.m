function black_step(sys)
    figure
    [Y,T] = step(sys);
    plot(T,Y,'LineWidth',1,'Color','black')
    grid on
    set(gca,'LooseInset',get(gca,'TightInset'));
    set(gcf, 'Position',  [100, 100, 500, 200])
end

