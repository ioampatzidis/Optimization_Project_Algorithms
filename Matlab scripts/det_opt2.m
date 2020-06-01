
clear all;
close all;

% Definitions of the objective function, its gradient and its Hessian matrix
syms x1 x2;

% ������ �������������� ����������
f= (x1-2*x2)^2+x1^4


% gradient/������ ��������, ������ �� �������������
GradF=sym(zeros(2,1));

%������ ���������
GradF=[diff(f, x1); diff(f, x2)]

% ������������� ��� ������� ��� ������������ ��� �������� �������
% ����������
HF=sym(zeros(2,2));
HF=[diff(f, x1, 2), diff(diff(f,x2), x1)
    diff(diff(f,x1), x2), diff(f, x2, 2)]                                                                                

%������� �� ������� �������� ��� f ��� ������ x ��� �������� = �� ��
%�������� ��������
X = solve([diff(f, x1) == 0, diff(f, x2) == 0], [x1, x2])

x1ab=X.x1
x1a=x1ab(1)
%x1b=x1ab(2)

x2ab=X.x2
x2a=x2ab(1)
%x2b=x2ab(2)

%����� ��� ����������� �� ��� ��������
x_star_a=[x1a; x2a]

%x_star_b=[x1b; x2b]

%������ ���� ��� ������ ��� ����������, ������ �� ������� assignment
%numerical values. ���� ������ ��� ��������, ������� �� ������� ��� �������
%��� ����
HF_star_a=subs(HF,[x1,x2],[x1a,x2a])

%HF_star_b=subs(HF,[x1,x2],[x1b,x2b])

%��� �������� �� �����, �2 ����� � �������� ��� �������� ������
D1_star_a=HF_star_a(1,1)
D2_star_a=det(HF_star_a)

%D1_star_b=HF_star_b(1,1)
%D2_star_b=det(HF_star_b)

%%%%% �� ����� if ��� ���������� �� ���� �� ������� 2.4 ��������� �� ��
%%%%% ������� ������ ����� ������� ���������������,�� ��� ��������� �����������, �� ����� �� ���������
if (D1_star_a > 0) && (D2_star_a > 0)
    disp('�� x_star_a ����� ������� ���������������')
elseif (D1_star_a < 0) && (D2_star_a > 0)
    disp('�� x_star_a ����� ������� ��������������')
end  

%���������
eig_star_a=eig(HF_star_a)


%%%%% �� ����� if ��� ���������� �� ���� �� ������� 2.5 ��������� �� ��
%%%%% ������� ������ ����� ������� ���������������,�� ��� ��������� �����������, �� ����� �� ���������
    %������� ��� �� ����� ������� ������
if (eig_star_a(1) > 0) && (eig_star_a(2) > 0)
    disp('�� x_star_a ����� ������� ��������������� �� ���� ��� ���������')
elseif (eig_star_a(1) < 0) && (eig_star_a(2) < 0)
    disp('�� x_star_a ����� ������� �������������� �� ���� ��� ���������')
end
