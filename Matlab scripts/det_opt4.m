
clear all;
close all;

% Definitions of the objective function, its gradient and its Hessian matrix
syms x1 x2 x3;

% δήλωση αντικειμενικής συνάρτησης
f= 2*x1^2+x1*x2+x2^2+x2*x3+x3^2-6*x1-7*x2-8*x3+9


% gradient/εύρεση ανάδελτα, αρχικά το αρχικοποιούμε
GradF=sym(zeros(3,1));

%μερική παράγωγος
GradF=[diff(f, x1); diff(f, x2); diff(f, x3)]

% Αρχικοποιούμε τον εσσιανό και υπολογίζουμε τις δεύτερες μερικές
% παραγώγους
HF=sym(zeros(3,3));
HF=[diff(f, x1, 2), diff(diff(f,x2), x1), diff(diff(f,x3), x1);
    diff(diff(f,x1), x2), diff(f, x2, 2), diff(diff(f,x3), x2);
    diff(diff(f,x1), x3), diff(diff(f,x2), x3), diff(f, x3, 2)]                                                                                

%λύνουμε το σύστημα ανάδελτα της f στα σημεία x που ψάχνουμε = με το
%μηδενικό διάνυσμα
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

%ενώνω τις συνειστώσες σε ένα διάνυσμα
x_star_a=[x1a; x2a; x3a]

%x_star_b=[x1b; x2b; x3b]

%έχουμε βρει τις λύσεις του συστήματος, πρέπει να κάνουμε assignment
%numerical values. Στις θέσεις των συμβόλων, βάζουμε τα νούμερα που βρήκαμε
%πιο πάνω
HF_star_a=double(subs(HF,[x1,x2,x3],[x1a,x2a,x3a]))

%HF_star_b=subs(HF,[x1,x2,x3],[x1b,x2b,x3b])

%εδώ πέρνουμε τα Δέλτα
D1_star_a=HF_star_a(1,1)
D2_star_a=det(HF_star_a(1:2,1:2))
D3_star_a=det(HF_star_a)

%ιδιοτιμές
eig_star_a=eig(HF_star_a)

%eig_star_b=eig(HF_star_b)

eig_star_a(1)

%%%%% Με απλές if που συντέθηκαν με βάση το θεώρημα 2.5 ελέγχουμε αν τα
%%%%% κρίσιμα σημεία ειναι τοπικοί βελτιστοποιητές, αν όχι ελέγχουμε χειροκίνητα, αν είναι το τυπώνουμε
    %έλεγχος για το πρώτο κρίσιμο σημείο
if (eig_star_a(1) > 0) && (eig_star_a(2) > 0)
    disp('Το x_star_a είναι τοπικός ελαχιστοποιητής με βάση τις ιδιοτιμές')
elseif (eig_star_a(1) < 0) && (eig_star_a(2) < 0)
    disp('Το x_star_a είναι τοπικός μεγιστοποιητης με βάση τις ιδιοτιμές')
end 

%%ελέγχουμε αν είναι και ολικό ελαχιστοποιητής θέτωντας τις ευθείες x2=0,
%%x3=0
fl= 2*x1^2- 6*x1+9
if (limit(fl, x1, -inf) == inf) && (limit(fl, x1, inf) == inf)
    disp('Ολικός ελαχιστοποιητής')
elseif (limit(fl, x1, -inf) == -inf) && (limit(fl, x1, inf) == -inf)
    disp('Ολικός μεγιστοποιητής')
else
    disp('όχι μεγιστοποιητής')
end

