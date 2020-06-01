function [xopt,fopt,niter,gnorm,dx] = grad_descent(varargin)

if nargin==0
    % ������ ������
    x0 = [-1 0 0]';
elseif nargin==1
    x0 = varargin{1};
else
    error('Incorrect number of input arguments.')
end
% termination tolerance/ ��������
tol = 1e-5;

% maximum number of allowed iterations
maxiter = 1000;

% �� ��� �� ��� ��+1 � ������� ����� ��������� ��� dxmin -> �������
dxmin = 1e-6;

alpha = 0.05;

% ������������� gradient norm, optimization vector, iteration counter, perturbation
gnorm = inf; x = x0; niter = 0; dx = inf;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������� 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Q = zeros(3,3);
Q = [1,0,0
     0,5,0
     0,0,25];
b = zeros(3,1);
b = [-1
     -1
     -1];
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������� 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������� 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
Q = zeros(3,3);
Q = [-1,0,0
     0,5,0
     0,0,25];
b = zeros(3,1);
b = [-1
     -1
     -1];
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%������� 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms x1 x2;
syms x3
x_k = [x1
       x2
       x3];
   
f_fig=1/2*x_k'*Q*x_k - b'*x_k ;

% plot objective function contours for visualization:
%������� ������������ ��� �������� � ������� ��� ������ ���� ����


% gradient descent algorithm:
while and(gnorm>=tol, and(niter <= maxiter, dx >= dxmin))
    % calculate gradient:
    g = Q*x - b;
    gnorm = norm(g);
   
    % take step:
    xnew = x - alpha*g;
    % check step
    if ~isfinite(xnew)
        display(['Number of iterations: ' num2str(niter)])
        error('x is inf or NaN')
    end
    % ������������ �� �����, ������� ��� ������ ���� �+1 ���������, ���
    % ������� ��� �� �����
    grid;   
    plot3([x(1) xnew(1)],[x(2) xnew(2)],[x(3) xnew(3)],'ko-')
    hold on;
    refresh;
    % update termination metrics
    niter = niter + 1;
    dx = norm(xnew-x);
    f=1/2*xnew'*Q*xnew - b'*xnew; %the quadratic form of f
    fprintf('%3.0f\t %7.4f\t %7.4f\t %7.4f\t %7.4f\t %7.4f\t %7.4f\n',niter, xnew,f,gnorm);
    sprintf('\n')
    x = xnew;
    
end
xopt = x;
fopt = f;
niter = niter - 1;