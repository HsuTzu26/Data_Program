"""
Goal(by Deep learning)
1.Build a neural network model to classifies digit images.
2.Training neural network model(by supervised learning).
3.Evaluateing model accuracy.

Mnist set(mnist.npz) Example.
 MNIST dataset is a handwritten digit (0 through 9) of 60,000 28x28 grayscale images of the 10 digits,
 along with a test set of 10,000 images.
 which was published by Yann LeCun in 1998, consists of 60,000 training set
 and 10,000 test set images that are size-normalized and centered.
 reference site http://yann.lecun.com/exdb/mnist/
 also ref. https://numpy.org/
 
Returns:
Tuple of Numpy arrays: (x_train, y_train), (x_test, y_test).
x_train, x_test: uint8 arrays of grayscale image data with shapes (num_samples, 28, 28).
y_train, y_test: uint8 arrays of digit labels(answers) (integers in range 0-9) with shapes (num_samples,).
"""
##Exception GPU 2020/12/20 handing...
import os
os.environ["CUDA_DEVICE_ORDER"] = "PCI_BUS_ID"
os.environ["CUDA_VISIBLE_DEVICES"]="0,1"

#-------------------------------------------------------------------------
#Phase 0 Processor examining and setting
import tensorflow as tf			#loading tensorflow package(API)
import numpy
from pathlib import Path                #get local driver letter
print("tensorfow version: ",tf.__version__,"and Hardware checking...")

#""" get GPU,CPU info.
gpus = tf.config.experimental.list_physical_devices(device_type='GPU')
cpus = tf.config.experimental.list_physical_devices(device_type='CPU')
is_cuda_gpu_available = tf.config.list_physical_devices('GPU')
print(gpus,'\n',cpus)
print("cuda testing:",is_cuda_gpu_available)
input("Press Enter to continue,or Ctrl+c cancel!")
#"""
"""Error handing
1.Uninstall your old tensorflow
2.Install tensorflow-gpu,pip install tensorflow-gpu
3.Install Nvidia Graphics Card & Drivers (you probably already have)
4.Download & Install CUDA
5.Download & Install cuDNN
6.Verify by simple program
"""
print("Eager execution ?",tf.executing_eagerly())

input("Press Enter to continue,or Ctrl+c cancel!")

#------------------------------------------------------------------------
#Phase 1 Pre-processing
print("Phase 1 Pre-processing, input and transform.")

#Module provide a few toy datasets (already-vectorized,in Numpy format)
#Ref. site https://keras.io/api/datasets/
mnist = tf.keras.datasets.mnist         
#root = Path(__file__).anchor               #set on if read from local driver
#data set from Internet real time(Too long!)
(x_train, y_train), (x_test, y_test) = mnist.load_data()
'''
#data set from local(suggest)
#download site https://storage.googleapis.com/tensorflow/tf-keras-datasets/mnist.npz
#path = "c:/mnist.npz"       # path where to cache the dataset locally
path = str(Path(root))[0:2]+("./mnist/mnist.npz")
(x_train, y_train), (x_test, y_test) = mnist.load_data(path)
'''
#Convert the samples from integers to floating-point numbers
x_train, x_test = x_train / 255.0, x_test / 255.0       
#-----------------------------------------------------------------------
#Phase 2 plot digit for viewing data
print("Phase 2 Viewing digit")
import matplotlib.pyplot as plt

# pick a sample to plot
print("Show one digit")
sample = 1
image = x_train[sample]     # plot the sample
fig = plt.figure
plt.imshow(image, cmap='gray')      #gray_r for white background and black digit
plt.show()
# multiple digits
print("Show multiple digits")
num = 10
images = x_train[:num]
labels = y_train[:num]
num_row = 2
num_col = 5       # plot images
fig, axes = plt.subplots(num_row, num_col, figsize=(1.5*num_col,2*num_row))
for i in range(num):
    ax = axes[i//num_col, i%num_col]
    ax.imshow(images[i], cmap='gray')
    ax.set_title('Label: {}'.format(labels[i]))
plt.tight_layout()
plt.show()
#---------------------------------------------------------------------------
#Phase 3 Sequential model building by stacking layers
print("Start modeling...")
model = tf.keras.models.Sequential([
  tf.keras.layers.Flatten(input_shape=(28, 28)),
  tf.keras.layers.Dense(128, activation='relu'),
  tf.keras.layers.Dropout(0.2),
  tf.keras.layers.Dense(10)
])
#----------------------------------------------------------------------------
#Phase 4 prediction
#For each example the model returns a vector of "logits" or "log-odds" scores, one for each class.
print("Start prediction...")
predictions = model(x_train[:1]).numpy()
print(predictions)

#converts these logits to "probabilities" for each class
prob = tf.nn.softmax(predictions).numpy()
print(prob)
#loss fun declare
loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
loss_value = loss_fn(y_train[:1], predictions).numpy()
print(loss_value)
#------------------------------------------------------------------------------
#Phase 5 compile
#Model compiling
model.compile(optimizer='adam',
              loss=loss_fn,
              metrics=['accuracy'])

#Method adjusts the model parameters to minimize the loss
model.fit(x_train, y_train, epochs=200)

#method checks the models performance, usually on a "Validation-set" or "Test-set"
model.evaluate(x_test,  y_test, verbose=2)
###The image classifier is now trained to ~??% accuracy on this dataset
#vary on epochs number!!
#-------------------------------------------------------------------------------
#Phase 5-1 probability_model return
probability_model = tf.keras.Sequential([
  model,
  tf.keras.layers.Softmax()
])
probability_model(x_test[:5])

#end for now,what your next ?



