

%Sphere function
sphere = @(x)((x(1))^2)+((x(2))^2);
x0=[1,1];
[x,fval,exitflag,output]=fminunc(sphere,x0);
fprintf('Sphere: ')
fprintf('Αποτέλεσμα:')
disp(x)
fprintf('Αριθμός επαναλήψεων:')
disp(output.iterations)

%{
%himmelblaus
himmelblaus = @(x)x(1)^4+x(2)^4+2*x(1)^2*x(2)+2*x(1)*x(2)^2-21*x(1)^2-13*x(2)^2-14*x(1)-22*x(2)+170;
%x0=[1,1];
%x0=[2,2];
%x0=[3,3];
x0=[-3,3];
[x,fval,exitflag,output]=fminunc(himmelblaus,x0);
fprintf('Himmelblaus: ')
fprintf('Αποτέλεσμα:')
disp(x)
fprintf('Αριθμός επαναλήψεων:')
disp(output.iterations)
%}

%{
%rosenbrock
rosenbrock = @(x)(100*x(1)^4)-(200*x(1)^2)*x(2)+(x(1)^2)-(2*x(1))+(100*x(2)^2)+1;
x0=[7,7];
[x,fval,exitflag,output]=fminunc(rosenbrock,x0);
fprintf('rosenbrock: ')
fprintf('Αποτέλεσμα:')
disp(x)
fprintf('Αριθμός επαναλήψεων:')
disp(output.iterations)
%}

%{
%rastrigin
rastrigin = @(x)(20+x(1)^2-10*cos(2*pi*x(1)) + x(2)^2 -10*cos(2*pi*x(2)));
x0=[0.5,0.7];
[x,fval,exitflag,output]=fminunc(rastrigin,x0);
fprintf('Rastrigin: ')
fprintf('Αποτέλεσμα:')
disp(x)
fprintf('Αριθμός επαναλήψεων:')
disp(output.iterations)
%}

%{
%booth
booth = @(x)((x(1)+2*x(2)-7)^2)+((2*x(1)+x(2)-5)^2);
x0=[2,2];
[x,fval,exitflag,output]=fminunc(booth,x0);
fprintf('Booth: ')
fprintf('Αποτέλεσμα:')
disp(x)
fprintf('Αριθμός επαναλήψεων:')
disp(output.iterations)
%}

