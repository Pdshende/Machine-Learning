import numpy as np
import sklearn
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression as lr
def cost(x,y,theta1,theta2):
    y1 = theta1+theta2(x)
    m = len(y)
    j = (1/(2*m))*sum((y1-y)^2)
    return j
a = pd.read_csv("ex1data1.txt")
x = a['x']
y = a['y']
x = transpose(x)
#a.plot(x= 'x',y='y',kind = 'scatter')
#plt.show()
print(x.shape)
