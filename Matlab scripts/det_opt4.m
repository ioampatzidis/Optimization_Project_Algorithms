
clear all;
close all;

% Definitions of the objective function, its gradient and its Hessian matrix
syms x1 x2 x3;

% ������ �������������� ����������
f= 2*x1^2+x1*x2+x2^2+x2*x3+x3^2-6*x1-7*x2-8*x3+9


% gradient/������ ��������, ������ �� �������������
GradF=sym(zeros(3,1));

%������ ���������
GradF=[diff(f, x1); diff(f, x2); diff(f, x3)]

% ������������� ��� ������� ��� ������������ ��� �������� �������
% ����������
HF=sym(zeros(3,3));
HF=[diff(f, x1, 2), diff(diff(f,x2), x1), diff(diff(f,x3), x1);
    diff(diff(f,x1), x2), diff(f, x2, 2), diff(diff(f,x3), x2);
    diff(diff(f,x1), x3), diff(diff(f,x2), x3), diff(f, x3, 2)]                                                                                

%������� �� ������� �������� ��� f ��� ������ x ��� �������� = �� ��
%�������� ��������
X = solve([diff(f, x1) == 0, diff(f, x2) == 0, diff(f, x3) == 0], [x1, x2, x3])

x1ab=X.x1
x1a=x1ab(1)
%x1b=x1ab(2)

x2ab=X.x2
x2a=x2ab(1)
%x2b=x2ab(2)

x3ab=X.x3
x3a=x3ab(1)
%x3b=x3ab(2)

%����� ��� ����������� �� ��� ��������
x_star_a=[x1a; x2a; x3a]

%x_star_b=[x1b; x2b; x3b]

%������ ���� ��� ������ ��� ����������, ������ �� ������� assignment
%numerical values. ���� ������ ��� ��������, ������� �� ������� ��� �������
%��� ����
HF_star_a=double(subs(HF,[x1,x2,x3],[x1a,x2a,x3a]))

%HF_star_b=subs(HF,[x1,x2,x3],[x1b,x2b,x3b])

%��� �������� �� �����
D1_star_a=HF_star_a(1,1)
D2_star_a=det(HF_star_a(1:2,1:2))
D3_star_a=det(HF_star_a)

%���������
eig_star_a=eig(HF_star_a)

%eig_star_b=eig(HF_star_b)

eig_star_a(1)

%%%%% �� ����� if ��� ���������� �� ���� �� ������� 2.5 ��������� �� ��
%%%%% ������� ������ ����� ������� ���������������, �� ��� ��������� �����������, �� ����� �� ���������
    %������� ��� �� ����� ������� ������
if (eig_star_a(1) > 0) && (eig_star_a(2) > 0)
    disp('�� x_star_a ����� ������� ��������������� �� ���� ��� ���������')
elseif (eig_star_a(1) < 0) && (eig_star_a(2) < 0)
    disp('�� x_star_a ����� ������� �������������� �� ���� ��� ���������')
end 

%%��������� �� ����� ��� ����� ��������������� �������� ��� ������� x2=0,
%%x3=0
fl= 2*x1^2- 6*x1+9
if (limit(fl, x1, -inf) == inf) && (limit(fl, x1, inf) == inf)
    disp('������ ���������������')
elseif (limit(fl, x1, -inf) == -inf) && (limit(fl, x1, inf) == -inf)
    disp('������ ��������������')
else
    disp('��� ��������������')
end

