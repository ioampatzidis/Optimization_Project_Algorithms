clear all;
close all;

% Definitions of the objective function, its gradient and its Hessian matrix
syms x1 x2;

% ������ �������������� ����������
f= x1^4+x2^4-4*x1*x2

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
x1b=x1ab(2)
x1c=x1ab(3)

x2ab=X.x2
x2a=x2ab(1)
x2b=x2ab(2)
x2c=x1ab(3)

%����� ��� ����������� �� ��� ��������
x_star_a=[x1a; x2a]

x_star_b=[x1b; x2b]

x_star_c=[x1c; x2c]

%������ ���� ��� ������ ��� ����������, ������ �� ������� assignment
%numerical values. ���� ������ ��� ��������, ������� �� ������� ��� �������
%��� ����
HF_star_a=subs(HF,[x1,x2],[x1a,x2a])

HF_star_b=subs(HF,[x1,x2],[x1b,x2b])

HF_star_c=subs(HF,[x1,x2],[x1c,x2c])

%��� �������� �� �����, �2 ����� � �������� ��� �������� ������
D1_star_a=HF_star_a(1,1)
D2_star_a=det(HF_star_a)

D1_star_b=HF_star_b(1,1)
D2_star_b=det(HF_star_b)

D1_star_c=HF_star_c(1,1)
D2_star_c=det(HF_star_c)

%%%%% �� ����� if ��� ���������� �� ���� �� ������� 2.4 ��������� �� ��
%%%%% ������� ������ ����� ������� ���������������, �� ����� �� ���������
if (D1_star_a > 0) && (D2_star_a > 0)
    disp('�� x_star_a ����� ������� ���������������')
elseif (D1_star_a < 0) && (D2_star_a > 0)
    disp('�� x_star_a ����� ������� ��������������')
end  

if (D1_star_b > 0) && (D2_star_b > 0)
    disp('�� x_star_b ����� ������� ���������������')
elseif (D1_star_b < 0) && (D2_star_b > 0)
    disp('�� x_star_b ����� ������� ��������������')
end  

if (D1_star_c > 0) && (D2_star_c > 0)
    disp('�� x_star_c ����� ������� ���������������')
elseif (D1_star_c < 0) && (D2_star_c > 0)
    disp('�� x_star_c ����� ������� ��������������')
end  

%���������
eig_star_a=eig(HF_star_a)

eig_star_b=eig(HF_star_b)

eig_star_c=eig(HF_star_c)


%%%%% �� ����� if ��� ���������� �� ���� �� ������� 2.5 ��������� �� ��
%%%%% ������� ������ ����� ������� ���������������, �� ����� �� ���������
    %������� ��� �� ����� ������� ������
if (eig_star_a(1) > 0) && (eig_star_a(2) > 0)
    disp('�� x_star_a ����� ������� ��������������� �� ���� ��� ���������')
elseif (eig_star_a(1) < 0) && (eig_star_a(2) < 0)
    disp('�� x_star_a ����� ������� �������������� �� ���� ��� ���������')
end
   
    %������� ��� �� ������� ������� ������
if (eig_star_b(1) > 0) && (eig_star_b(2) > 0)
    disp('�� x_star_b ����� ������� ��������������� �� ���� ��� ���������')
elseif (eig_star_b(1) < 0) && (eig_star_b(2) < 0)
    disp('�� x_star_b ����� ������� ������������� �� ���� ��� ����������')
end

   %������� ��� �� ����� ������� ������
if (eig_star_c(1) > 0) && (eig_star_c(2) > 0)
    disp('�� x_star_c ����� ������� ��������������� �� ���� ��� ���������')
elseif (eig_star_c(1) < 0) && (eig_star_c(2) < 0)
    disp('�� x_star_c ����� ������� �������������� �� ���� ��� ���������')
end

%%��������� �� ����� ��� ����� ��������������� �������� ��� ������ x2=0 
fl= x1^4
if (limit(fl, x1, -inf) == inf) && (limit(fl, x1, inf) == inf)
    disp('������ ���������������')
elseif (limit(fl, x1, -inf) == -inf) && (limit(fl, x1, inf) == -inf)
    disp('������ ��������������')
else
    disp('��� ��������������')
end

