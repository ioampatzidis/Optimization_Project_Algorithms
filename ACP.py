# -*- coding: utf-8 -*-
"""
Created on Fri Jun 12 21:04:15 2020

@author: ioamp
"""
a=2
num_of_ants=100

probS=[]
probL=[]

def antsInNode1(num_of_ants,t):
    if t==0:
        return num_of_ants/2.;
    elif t==1:
        return probability_to_choose_short_branch(num_of_ants,t-1)*antsInNode1(num_of_ants,t-1);
    else:
        return probability_to_choose_short_branch(num_of_ants,t-1)*antsInNode1(num_of_ants,t-1) + probability_to_choose_long_branch(num_of_ants,t-2)*antsInNode1(num_of_ants,t-2);

def pher_in_short_branch(num_of_ants,t):
    if t==0: #είναι αρχική τιμή
        return 0.5;
    else: 
        return pher_in_short_branch(num_of_ants,t-1)+probability_to_choose_short_branch(num_of_ants,t-1)*antsInNode1(num_of_ants,t-1)+probability_to_choose_short_branch(num_of_ants,t-1)*antsInNode1(num_of_ants,t-1)
    
def pher_in_long_branch(num_of_ants,t):
    if t==0:
        return 0.5;
    elif t==1:
        return pher_in_long_branch(num_of_ants,t-1)+probability_to_choose_long_branch(num_of_ants,t-1)*antsInNode1(num_of_ants,t-1)
      
    else:
        return pher_in_long_branch(num_of_ants,t-1)+probability_to_choose_long_branch(num_of_ants,t-1)*antsInNode1(num_of_ants,t-1)+probability_to_choose_long_branch(num_of_ants,t-2)*antsInNode1(num_of_ants,t-2)
      

def probability_to_choose_short_branch(num_of_ants,t):
    if t==0:
        return 0.5
    else:
        return (pher_in_short_branch(num_of_ants,t)**2)/(pher_in_short_branch(num_of_ants,t)**2+pher_in_long_branch(num_of_ants,t)**2)

def probability_to_choose_long_branch(num_of_ants,t):
    if t==0:
        return 0.5
    else:
        return 1-probability_to_choose_short_branch(num_of_ants,t)
    
for g in range(0, 9):
   
    probS.append(probability_to_choose_short_branch(num_of_ants,g)) 
    probL.append(probability_to_choose_long_branch(num_of_ants,g)) 
    print("Επανάληψη",g)
    print("πιθανότητα για το μικρό μονοπάτι")
    print(probS)
    print(" ")
    print("πιθανότητα για το μεγάλο μονοπάτι")
    print(probL)
    print(" ")

    
import matplotlib.pyplot as plt 

plt.plot(probS,'-o', label='short path',color="blue")
plt.plot(probL,'-o', label='long path',color="red")
plt.xlabel('iteration')
plt.ylabel('probability')
plt.title('Ant Colony Simulation')
plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0.)
plt.show()
