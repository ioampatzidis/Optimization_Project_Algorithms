# -*- coding: utf-8 -*-
"""

@author: ioamp
"""
#Τοποθετούμε σε δύο λίστες τους δύο πίνακες της εκφώνησης ροής και απόστασης
W_list = [[0,0,2,0,3],[0,0,0,3,0],[2,0,0,0,0],[0,3,0,0,1],[3,0,0,1,0]]
D_list = [[0,50,50,94,50],[50,0,22,50,36],[50,22,0,44,14],[94,50,44,0,50],[50,36,14,50,0]]

import itertools
#Βρίσκουμε τους 120 συνδιασμόυς
perm = list(itertools.permutations((1,2,3,4,5)))

#κάνουμε αρχικοποίηση λιστών
t=[]
s=[]
solution=[]
plist=[]
# Print the obtained permutations 
for l in range (len(perm)): 
 ##  print (i[0])  #1ο στοιχειο
  #print (i)  
  p=perm[l]
  #print(p)
  mintotal=10000
  
  # τοποθετώ στην λίστα N την τοποθεσία του κάθε στοιχείου-αριθμού 1..5 του p,
  # κάθε φορά το αυξάνω κατα 1 γιατί το index μετρά απο το μηδέν.
  N = [p.index(1)+1,p.index(2)+1,p.index(3)+1,p.index(4)+1,p.index(5)+1]

  totalValue=0
  
  #Στην διπλή επανάληψη ελέγχουμε στον πίνακα ροών, αν η τιμή είναι μηδέν καθώς επίσης παίρνουμε τον μισό πίνακα είτε άνω τριγωνικό είτε κάτω
  #Αν περάσει τους παραπάνω ελέγχους υπολογίζουμε την τιμή που λαμβάνει η f
  # και τοποθετούμε την τιμή της στη λίστα s, και την p{} στην λίστα t.
  for i in range(len(W_list)): 
    for j in range(len(W_list)):     
        if W_list[i][j]==0:
           continue
        if i>j:
         continue      
        else:
           a=N[i]
           b=N[j]
           value = W_list[i][j]* D_list[a-1][b-1]
           totalValue =totalValue + value
  t.append(p)
  s.append(totalValue)
  
#Αφού έχουμε διασχίσει τον πίνακα, έχουμε υπολογίσει τις τιμές και τις αποθηκεύσαμε σε 
# πίνακες , βρίσκουμε την μικρότερη τιμή για την F 
print("best value for f is:",min(s))

#βρίσκουμε όλα τα p τα οποία αντιστοιχούν στην ελάχιστη τιμή της f min(s)
plist=[index for index, value in enumerate(s) if value == min(s)]
for n in range(len(plist)):
    print(t[(plist[n])])
#(2, 4, 5, 3, 1) τα δύο p{} για την ελαχιστοποίηση τις f
#(3, 4, 5, 2, 1)

