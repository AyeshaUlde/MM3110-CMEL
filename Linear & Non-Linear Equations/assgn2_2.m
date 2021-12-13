prompt = 'Enter a number :';
n = input(prompt);
n1 = n;
cube_root = 1;
nos = 1:100;
cubes = nos.^3;
for i = 1:length(nos)
    if n1 == 0
        break
    else
        if (cubes(i)<=n1) && (cubes(i+1)>n1)
            diff = n1 - cubes(i);
            frac = diff/((nos(i)^2)*3);
            cube_root1 = nos(i) + frac;
            cube_root = cube_root*cube_root1;
            n1 = 0;
        end
    end
end
disp(cube_root)