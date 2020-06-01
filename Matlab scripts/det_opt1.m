clear all;
close all;

% Definitions of the objective function, its gradient and its Hessian matrix
syms x1 x2;

% δήλωση αντικειμενικής συνάρτησης
f= x1^4+x2^4-4*x1*x2

% gradient/εύρεση ανάδελτα, αρχικά το αρχικοποιούμε
GradF=sym(zeros(2,1));

%μερική παράγωγος
GradF=[diff(f, x1); diff(f, x2)]

% Αρχικοποιούμε τον εσσιανό και υπολογίζουμε τις δεύτερες μερικές
% παραγώγους
HF=sym(zeros(2,2));
HF=[diff(f, x1, 2), diff(diff(f,x2), x1)
    diff(diff(f,x1), x2), diff(f, x2, 2)]                                                                                

%λύνουμε το σύστημα ανάδελτα της f στα σημεία x που ψάχνουμε = με το
%μηδενικό διάνυσμα
X = solve([diff(f, x1) == 0, diff(f, x2) == 0], [x1, x2])

x1ab=X.x1
x1a=x1ab(1)
x1b=x1ab(2)
x1c=x1ab(3)

x2ab=X.x2
x2a=x2ab(1)
x2b=x2ab(2)
x2c=x1ab(3)

%ενώνω τις συνειστώσες σε ένα διάνυσμα
x_star_a=[x1a; x2a]

x_star_b=[x1b; x2b]

x_star_c=[x1c; x2c]

%έχουμε βρει τις λύσεις του συστήματος, πρέπει να κάνουμε assignment
%numerical values. Στις θέσεις των συμβόλων, βάζουμε τα νούμερα που βρήκαμε
%πιο πάνω
HF_star_a=subs(HF,[x1,x2],[x1a,x2a])

HF_star_b=subs(HF,[x1,x2],[x1b,x2b])

HF_star_c=subs(HF,[x1,x2],[x1c,x2c])

%εδώ πέρνουμε τα Δέλτα, Δ2 είναι η ορίζουσα του εσσιανού πίνακα
D1_star_a=HF_star_a(1,1)
D2_star_a=det(HF_star_a)

D1_star_b=HF_star_b(1,1)
D2_star_b=det(HF_star_b)

D1_star_c=HF_star_c(1,1)
D2_star_c=det(HF_star_c)

%%%%% Με απλές if που συντέθηκαν με βάση το θεώρημα 2.4 ελέγχουμε αν τα
%%%%% κρίσιμα σημεία ειναι τοπικοί βελτιστοποιητές, αν είναι το τυπώνουμε
if (D1_star_a > 0) && (D2_star_a > 0)
    disp('Το x_star_a είναι τοπικός ελαχιστοποιητής')
elseif (D1_star_a < 0) && (D2_star_a > 0)
    disp('Το x_star_a είναι τοπικός μεγιστοποιητης')
end  

if (D1_star_b > 0) && (D2_star_b > 0)
    disp('Το x_star_b είναι τοπικός ελαχιστοποιητής')
elseif (D1_star_b < 0) && (D2_star_b > 0)
    disp('Το x_star_b είναι τοπικός μεγιστοποιητης')
end  

if (D1_star_c > 0) && (D2_star_c > 0)
    disp('Το x_star_c είναι τοπικός ελαχιστοποιητής')
elseif (D1_star_c < 0) && (D2_star_c > 0)
    disp('Το x_star_c είναι τοπικός μεγιστοποιητης')
end  

%ιδιοτιμές
eig_star_a=eig(HF_star_a)

eig_star_b=eig(HF_star_b)

eig_star_c=eig(HF_star_c)


%%%%% Με απλές if που συντέθηκαν με βάση το θεώρημα 2.5 ελέγχουμε αν τα
%%%%% κρίσιμα σημεία ειναι τοπικοί βελτιστοποιητές, αν είναι το τυπώνουμε
    %έλεγχος για το πρώτο κρίσιμο σημείο
if (eig_star_a(1) > 0) && (eig_star_a(2) > 0)
    disp('Το x_star_a είναι τοπικός ελαχιστοποιητής με βάση τις ιδιοτιμές')
elseif (eig_star_a(1) < 0) && (eig_star_a(2) < 0)
    disp('Το x_star_a είναι τοπικός μεγιστοποιητης με βάση τις ιδιοτιμές')
end
   
    %έλεγχος για το δεύτερο κρίσιμο σημείο
if (eig_star_b(1) > 0) && (eig_star_b(2) > 0)
    disp('Το x_star_b είναι τοπικός ελαχιστοποιητής με βάση τις ιδιοτιμές')
elseif (eig_star_b(1) < 0) && (eig_star_b(2) < 0)
    disp('Το x_star_b είναι τοπικός μεγιστοποιητη με βάση τις ιδιοτιμέςς')
end

   %έλεγχος για το τρίτο κρίσιμο σημείο
if (eig_star_c(1) > 0) && (eig_star_c(2) > 0)
    disp('Το x_star_c είναι τοπικός ελαχιστοποιητής με βάση τις ιδιοτιμές')
elseif (eig_star_c(1) < 0) && (eig_star_c(2) < 0)
    disp('Το x_star_c είναι τοπικός μεγιστοποιητης με βάση τις ιδιοτιμές')
end

%%ελέγχουμε αν είναι και ολικό ελαχιστοποιητής θέτωντας την ευθεία x2=0 
fl= x1^4
if (limit(fl, x1, -inf) == inf) && (limit(fl, x1, inf) == inf)
    disp('Ολικός ελαχιστοποιητής')
elseif (limit(fl, x1, -inf) == -inf) && (limit(fl, x1, inf) == -inf)
    disp('Ολικός μεγιστοποιητής')
else
    disp('όχι μεγιστοποιητής')
end

