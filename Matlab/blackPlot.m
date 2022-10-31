function blackPlot(x_data,y_data, x_data_fine, y_data_fine,lables, fontsize,coord_x,coord_y, x_label, y_label, mark, size)
    figure;
    xlabel(x_label)
    ylabel(y_label)
    grid on
    hold on
    for i = 1:length(y_data(1,:))
        if mark == 'o'
            plot(x_data, y_data(:,i),'blacko', 'MarkerSize', size);
        else
            plot(x_data, y_data(:,i),strcat('black',mark(i)), 'MarkerSize', size);    
        end
        plot(x_data_fine,y_data_fine(:,i),'Color','black','LineWidth',1);
    end
    for i = 1:length(lables)
        text(coord_x(i), coord_y(i),lables{i},'FontSize',fontsize)
    end
    box on
    set(gca,'LooseInset',get(gca,'TightInset'));
    set(gcf, 'Position',  [100, 100, 500, 200])    
    hold off
end


