# -*- coding: utf-8 -*-
"""
Created on Mon May 25 21:44:29 2020

@author: ioamp
"""

import matplotlib.pyplot as plt

###################################
#1η μέθοδος η λιγότερο αποδοτική
#Υπολογισμός Ν-οστού όρου συνάρτησης fib, 0.1.1.2.3.5.8.13.21,34
#έχει εκθετικό χρόνο αύξησης, σαν αναγωγική ακολουθία που υλοποιείται με τέτοιο τρόπο
#ένα αρνητικό, θα υπολογίσει για το 8 , το 6,7 και για το 9 θα υπολογίσει το 7,8
# οπότε κάνει αχρείαστους υπολογισμούς
def fib(n):
 if n==0:return 0
 elif n==1:return 1
 else:
  #καλεί την συνάρτηση για n-2 συν για n-1   
  return fib(n-2)+fib(n-1)

def time_fib(n):
    import time
    start=time.time()
    fib(n)
    return (time.time()-start)
###################################
#2η μέθοδος 
#Λύνει το πρόβλημα των υπολογισμών δύο φορών των ίδιων πραγμάτων
memo = {0:0 , 1:1} #δομή dictionary , to 
def fib1(n):
 a=0
 if n in memo:
  return memo[n] # αν υπάρχει στο λεξικό επέστρεψε μου τη τιμή που είναι στο μηδέν
 else:
  if n==0:return 0
  elif n==1:return 1
  else: #διαφορετικά, υπολόγισε τη διαφορά (όπως πριν), με τη διαφορά οτι αν έχουμε υπολογίσει
      #μια τιμή δεν χρειάζεται να την ξαναυπολογίσουμε
   a=fib1(n-1)+fib1(n-2)
   memo.update({n:a})
   return a

def time_fib1(n):
    import time
    start=time.time()
    fib1(n)
    return (time.time()-start)
###################################
#3η μέθοδος
# bottom up variant
# optimize space complexity
# time O(n), space O(1)
def fib2(n):
 a = 1
 b = 0
 #δεν αποθηκεύει τίποτα
 for i in range(2,n+1):
  a,b = a+b,a # βαζει στην α το a+b και στο b την a
  # το a είναι η επόμενη τιμή και το b είναι η προηγούμενη
 return a


def time_fib2(n):
    import time
    start=time.time()
    fib2(n)
    return (time.time()-start)
###################################
#L = [[time_fib(i)] for i in range (5,35)]
#L1 = [[time_fib1(i)] for i in range (5,1000)]
L2 = [[time_fib2(j)] for j in range (5,15000)]


plt.xlabel("Values of n")
plt.ylabel("Time")
plt.title("DP")
plt.plot(L2,'bs',label='L2')


