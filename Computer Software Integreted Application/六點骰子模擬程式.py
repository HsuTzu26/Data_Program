import random
import numpy as np

def fiveHundred():
    col, row = 6, 2
    sum = np.zeros((col, row), dtype=int)

    for i in range(0,6):
        sum[i][0]= i+1

    for j in range(1, 501):
        result = random.choice([1,2,3,4,5,6])
        if      (result==1): sum[result-1][1] +=1
        elif (result==2): sum[result-1][1]+=1
        elif (result==3): sum[result-1][1]+=1
        elif (result==4): sum[result-1][1]+=1
        elif (result==5): sum[result-1][1]+=1
        elif (result==6): sum[result-1][1]+=1
        
    print('點數\t概率')
    for i in range(0,6):
       print(f'{i+1}\t{sum[i][1]/500}', end='\n')

def twoThousand():
  col, row = 6, 2
  sum = np.zeros((col, row), dtype=int)

  for i in range(0,6):
    sum[i][0] = i+1

  for j in range(1, 2001):
    result = random.choice([1,2,3,4,5,6])
    if  (result==1): sum[result-1][1]+=1
    elif (result==2): sum[result-1][1]+=1
    elif (result==3): sum[result-1][1]+=1
    elif (result==4): sum[result-1][1]+=1
    elif (result==5): sum[result-1][1]+=1
    elif (result==6): sum[result-1][1]+=1

  print('點數\t概率')
  for i in range(0,6):
    print(f'{i+1}\t{sum[i][1]/2000}', end='\n')

print('骰500次')
fiveHundred()
print()

sum = 0 #初始化sum, 歸零

print('骰2000次')
twoThousand()
