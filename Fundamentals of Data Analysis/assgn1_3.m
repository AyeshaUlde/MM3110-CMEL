color = ['b';'g';'r';'y';'m'];
line_style = {'-'; '-'; '--'; '-';':'};
line_width = [1;1.5;1;1.5;1];
for j = 1:5
    x = 2;
    y = randi([2 11]);
    path_x = (x);
    path_y = (y);
    %1 = above, 2 = below, 3 = right, 4 = stay
    while (x ~= 11) %Incorporate 'person doesn't transmit' condition inside
        arr = rand(1,4);
        arr = arr/sum(arr);
        [m,i] = max(arr);
        if i~=4
            if (y==11)
                if i==1
                    y = 2;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x, x);
                elseif i==2
                    y = y - 1;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x,x);
                else
                    x = x + 1;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x,x);
                end
            elseif (y==2)
                if i==2
                    y = 11;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x,x);
                elseif i==1
                    y = y + 1;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x,x);
                else
                    x = x + 1;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x,x);
                end
            else
                if i==2
                    y = y - 1;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x,x);
                elseif i==1
                    y = y + 1;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x,x);
                else
                    x = x + 1;
                    path_y = cat(1,path_y,y);
                    path_x = cat(1,path_x,x);
                end
            end
        end
    end
    %figure
    plot(path_x,path_y, 'Marker', 'o', 'color', color(j), 'linestyle', line_style{j}, 'LineWidth', line_width(j))
    title('Random networks & Information Pathways', 'FontSize', 28, 'FontName', 'Times New Roman')
    xlabel('Bottom edge of the grid', 'FontSize', 24, 'FontName', 'Times New Roman')
    ylabel('Left edge of the grid', 'FontSize', 24, 'FontName', 'Times New Roman')
    %ln.LineWidth = 2;
    %ln.Color = [0 0.5 0.5];
    %ln.Marker = 'o';
    %ln.MarkerEdgeColor = color(j);
    hold on
end
hold off