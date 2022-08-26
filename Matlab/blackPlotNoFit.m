function blackPlotNoFit(x_data,y_data,lables, fontsize,coord_x,coord_y, x_label, y_label,size)
    figure;
    xlabel(x_label)
    ylabel(y_label)
    grid on
    hold on
    for i = 1:length(y_data(1,:))
        plot(x_data(1), y_data(1,i),strcat('black','o'), 'MarkerSize', size); 
        plot(x_data(end), y_data(end,i),strcat('black','o'), 'MarkerSize', size); 
        plot(x_data,y_data(:,i),'Color','black','LineWidth',1);
    end
    for i = 1:length(lables)
        text(coord_x(i), coord_y(i),lables{i},'FontSize',fontsize)
    end
    hold off
end
