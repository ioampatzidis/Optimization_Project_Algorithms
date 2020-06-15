# -*- coding: utf-8 -*-
"""
Created on Mon May 25 01:39:02 2020

@author: ioamp
"""
#  Δυναμική επίλυση για εξεύρευση της καλύτερης λύσης στο Knapsack problem 
  
# Θέτουμε τις παραμέτρους των αντικειμένων και του σάκου και με αυτές της άσκησης
val = [30,12,14,16,9,7,1,20,1,10,19,8 ] 
wt = [ 6,4,3,4,2,2,10,14,30,41,2,12 ] 
Cap = 60
n = len(val) 
      
# Αυτή η μέθοδος παίρνει τις παραμέτρους απο τον χρήστη και τυπώνει την λύση

def printknapSack(Cap, wt, val, n): 
    K = [[0 for w in range(Cap + 1)] 
            for i in range(n + 1)] 
              
    # Δημιουργία πίνακα K[][] in bottom up manner 
    for i in range(n + 1): 
        for w in range(Cap + 1): 
            if i == 0 or w == 0: 
                K[i][w] = 0
            elif wt[i - 1] <= w: 
                K[i][w] = max(val[i - 1]+ K[i - 1][w - wt[i - 1]], K[i - 1][w]) 
               # print(K[i][w])
            else: 
                K[i][w] = K[i - 1][w] 
  
    # Αποθηκέυουμε στη μεταβλητή result το αποτέλεσμα της αξίας και το τυπώνουμε
    result = K[n][Cap] 
    print("Η αξία είναι", result) 
    print(" ")
    print("Tα αντικείμενα που πρέπει να πάρει ο ληστής είναι:")
      
    w = Cap
    for i in range(n, 0, -1): 
        if result <= 0: 
            break
        if result == K[i - 1][w]: 
            continue
        else: 
  
            # Σε αυτή τη περίπτωση το αντικείμενο περιλαμβάνεταi

            print("Αντικείμενο",val.index(val[i - 1])+1,",με αξία",val[i - 1],",βάρος" , wt[i - 1]) 
              
            # Απο τη στιγμή που αυτό το βάρος υπάρχει
            # η τιμή του αφαιρείται
            result = result - val[i - 1] 
            w = w - wt[i - 1] 
            
printknapSack(Cap, wt, val, n) 
  
