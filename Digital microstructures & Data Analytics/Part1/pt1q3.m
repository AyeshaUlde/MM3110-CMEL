prompt = 'This script generates a 2-D microstructure by Voronoi tessellation. Enter the number of grains.';
ng = input(prompt);
%creating two vectors containing the coordinates of ng 2-D points
x = rand([1 ng]);
y = rand([1 ng]);
%plot the Voronoi diagram
voronoi(x,y)
pbaspect([1 1 1])