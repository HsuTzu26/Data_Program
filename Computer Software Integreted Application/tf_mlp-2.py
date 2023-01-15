'''
MLP Model
One neural one layer
'''
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mp
from tensorflow.keras import Sequential
from tensorflow.keras.layers import Dense
import time

#start here
tstart = time.perf_counter()
neu = Dense(units=1, input_shape=[1])
model = Sequential([neu])
model.compile(optimizer='sgd', loss='mean_squared_error')

#tensorBoard,a visualization tool;
#TensorBoard class, ref. keras.io
tf.keras.callbacks.TensorBoard(
    log_dir="logs",
    histogram_freq=0,
    write_graph=True,
    write_images=False,
    write_steps_per_second=False,
    update_freq="epoch",
    profile_batch=0,
    embeddings_freq=0,
    embeddings_metadata=None
)
#launch TensorBoard from the command line:
#tensorboard --logdir=path_to_your_logs
#c:>tensorboard --logdir=c:\tf_test\logs\train\       (for example)
#browser to http://localhost:6006/

xs = np.array([-1.0,0.0, 1.0,1.5,2.0,3.0,3.2,4.0,4.6, 5.5], dtype=float)
ys = np.array([-3.0,-1.0,1.0,2.0,3.0,5.0,5.5,7.0,8.8,10.3], dtype=float)

epochsNo = 300                                                  # learning period
tensorboard_callback = tf.keras.callbacks.TensorBoard(log_dir="./logs")
model.fit(xs, ys, epochs = epochsNo,callbacks=[tensorboard_callback])
i = neu.get_weights()
print(f"Weight is {i[0].item()},bias is {i[1].item()}")         # show weights and biases
print("--------------guess 10.0 what ? ")
print(model.predict([10.0]))
print("--------------guess 7.0 what ? ")
print(model.predict([7.0]))
#print(f">> Here is what i learn: {neu.get_weights()}")
#
'''
weights = model.layers[0].get_weights()[0]
biases = model.layers[0].get_weights()[1]
print(weights.item(),biases.item())
'''
y_pred=[]
for i in xs:
    t = model.predict([i])
    y_pred.append(t[0,0])

#plotting
fig, ax = plt.subplots()
ax.plot(xs,ys,color='blue',label='Orginal function')
ax.plot(xs,y_pred,color='red',label='Using deep learning')

ax.set(xlabel='Value of x '+str(len(xs))+' points (x) ', ylabel='Y = f(x)',
       title='training, epochs: '+ str(epochsNo))
ax.grid()
filename = "neural-1_epochs" + str(epochsNo) + ".png"
fig.savefig(filename)
ax.legend()
plt.show(block = False)

tend = time.perf_counter()
print('time elapsed: ' + str(round(tend-tstart,8)) + ' seconds')
print('time elapsed: ' + str((tend-tstart)) + ' seconds without rounding')
