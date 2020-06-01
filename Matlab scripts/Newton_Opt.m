function [x_k] = Newton_Opt1(max_iter,min_tol)

%----------------------------------------------------------------------------------------------------
% An implementation of Newton's method for optimization problems
%----------------------------------------------------------------------------------------------------

close all;

% Initialization
%max_iter=50;    % maximum number of iterations
%min_tol=10^-6;  % tolerance
x_k1= zeros(2,1);
p_k= zeros(2,1);
alpha=1;

%Initial guess for sphere
x_k=[1;1];

%Initial guess for booth
%x_k=[2;2];

%Initial guess for Rosenbrock
%x_k=[7;7];

%Initial guess for Himmelblaus
%x_k=[1;1];

%Initial guess for Matyas
%x_k=[2;2];

%Initial guess for Three-hump-Camel
%x_k=[0.5;0.7];

%Initial guess for Rastrigin
%x_k=[0.5;0.7];

k=0; tol=10;

xvec1(k+1)=x_k(1,1);
xvec2(k+1)=x_k(2,1);

x=x_k(1,1); y=x_k(2,1);
f_k=F(x,y);
fvec(k+1)=f_k;

% Newton's algorithm
while (k<=max_iter) && (tol>=min_tol)
    x=x_k(1,1); y=x_k(2,1);
    p_k=-1*(HF(x,y)\GradF(x,y));
    x_k1=x_k+(alpha*p_k);
    f_k=F(x,y);
    df_k=norm(GradF(x,y),Inf);
    x=x_k1(1,1); y=x_k1(2,1);
    f_k1=F(x,y);
    df_k1=norm(GradF(x,y),Inf);
    tol=abs(df_k1);
% tol=abs(f_k1-f_k);
    fprintf('%3.0f\t %7.4f\t %7.4f\t %7.4f\t %7.4f\n',k, x_k,f_k,df_k);
    x_k=x_k1;
    k=k+1;
    xvec1(k+1)=x_k(1,1);
    xvec2(k+1)=x_k(2,1);
    fvec(k+1)=f_k1;
end

figure;
plot(xvec1,xvec2,'bo-','LineWidth', 1.5)
set(gca, 'fontsize', 14, 'fontname', 'times');
xlabel('x')
ylabel('y')
grid;

figure;
plot3(xvec1,xvec2,fvec,'ro-','LineWidth', 2)
set(gca, 'fontsize', 14, 'fontname', 'times');
xlabel('x')
ylabel('y')
zlabel('f')
grid;


%SPHERE
function f= F(x,y)

f = x^2+y^2;


function g = GradF(x,y)

g= [2*x;
    2*y];


function h = HF(x,y)

h=[2, 0
    0, 2];

%{
%%Booth
function f= F(x,y)

f = (x+(2*y)-7).^2 + ((2*x)+y-5).^2;


function g = GradF(x,y)

g= [(10*x)+(8*y)-34;
    (8*x)+(10*y) - 38];


function h = HF(x,y)

h=[10, 8
    8, 10];
%}


%{
%%Rosenbrock
function f= F(x,y)

f = 100*x^4 - 200*x^2*y+x^2-2*x+100*y^2+1;


function g = GradF(x,y)

g= [400*x^3-400*x*y+2*x-2;
    -200*x^2+200*y];


function h = HF(x,y)

h=[1200*x^2-400*y+2, -400*x
    -400*x, 200];

%}

%{
 %Himmelblau's
function f= F(x,y)

f = x^4+ y^4+2*x^2*y+2*x*y^2-21*x^2-13*y^2-14*x-22*y+170;


function g = GradF(x,y)

g= [4*x^3+4*x*y+2*y^2-42*x-14;
    4*y^3+2*x^2+4*x*y-26*y-22];


function h = HF(x,y)

h=[12*x^2+4*y-42, 4*x+4*y
    4*x+4*y, 12*y^2+4*x-26];
%}

%{
 %Beale
function f= F(x,y)

f = x^2*y^6+x^2*y^4-2*x^2*y^3-x^2*y^2+5.28*x*y^3-2*x^2*y+4.5*x*y^2+3*x^2+3*x*y-12.75*x+14.203125;


function g = GradF(x,y)

g= [2*x*y^6+2*x*y^4-4*x*y^3-2*x*y^2+5.28*y^3-4*x*y+4.5*y^2+6*x+3*y-12.75;
    6*x^2*y^5+4*x^2*y^3-6*x^2*y^2-2*x^2*y+15.84*x*y^2-2*x^2+9*x*y+3*x];


function h = HF(x,y)

h=[2*y^6+2*y^4-4*y^3-2*y^2-4*y+6, 12*x*y^5+8*x*y^3-12*x*y^2-4*x*y+15.84*y^2-4*x+9*y+3
    12*x*y^5+8*x*y^3-12*x*y^2-4*x*y+15.84*y^2-4*x+9*y, 30*x^2*y^4+12*x^2*y^2-12*x^2*y-2*x^2+31.68*x*y+9*x];
%}


%{
 %Matyas
function f= F(x,y)

f = 0.26*x^2+ 0.26*y^2-48*x*y;


function g = GradF(x,y)

g= [0.52*x-48*y
    0.52*y-48*x];


function h = HF(x,y)

h=[0.52, -48
    -48, 0.52];
%}


%{
 %Rastrigin
  function f= F(x,y)
 
 f =20+ x^2 - 10*cos(2*pi*x) + y^2 -10*cos(2*pi*y);
 
 function g = GradF(x,y)
 
 g= [(2*x+10*sin(2*pi*x)*2*pi);
    (2*y+10*sin(2*pi*y)*2*pi)];
 
 function h = HF(x,y)
 
 h=[2+ 10*cos(2*pi*x)*4*pi*pi, 0 ;
    0, 2+10*cos(2*pi*y)*4*pi*pi];


%}










