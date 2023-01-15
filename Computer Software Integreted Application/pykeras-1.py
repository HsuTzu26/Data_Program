'''
Deep Learning with Keras
Handwritten Digit Recognition (mnist dataset)
'''
#phase 1: importing Libraries
import os
import numpy as np
import matplotlib.pyplot as plt

#phase 1.1: suppressing Warnings (if need)
'''
# silent all warnings 
import os
os.environ['TF_CPP_MIN_LOG_LEVEL']='3' 
import warnings
warnings.filterwarnings('ignore')
from tensorflow.python.util import deprecation 
deprecation._PRINT_DEPRECATION_WARNINGS = False
'''
#phase 1.2: import mnist dataset from Internet
from keras.datasets import mnist

#phase 1.3:
from keras.models import Sequential,load_model
from keras.layers.core import Dense,Dropout,Activation
from keras.utils import np_utils

#phase 2: defining the network architecture
model = Sequential()

'''
relu:
The function returns 0 if it receives any negative input, 
but for any positive value x it returns that value back.
verbose: 
Verbosity mode. 0 = silent, 1 = progress bar, 2 = one line per epoch. 'auto' defaults to 1
softmax:
It is often used as the last activation function of a neural network to normalize 
the output of a network to a probability distribution over predicted output classes. — Wikipedia
The output of a Softmax is a vector (say v) with probabilities of each possible outcome(categorize)

'''
#phase 2.1: input layer 
model.add(Dense(512, input_shape=(784,)))
model.add(Activation("relu"))
model.add(Dropout(0.2))

#phase 2.1: hidden Layer
model.add(Dense(512))
model.add(Activation("relu"))
model.add(Dropout(0.2))

#phase 2.1: output Layer
model.add(Dense(10))
model.add(Activation("softmax"))
print("Model architecture defined!")

#phase 3: compiling the Model
model.compile(loss='categorical_crossentropy', metrics=['accuracy'], 
              optimizer='adam')
print("Model ready to go!")

#phase 4: 2 for 1 choice
print("data loading...")

#loading Data from Internet
(X_train, y_train), (X_test, y_test) = mnist.load_data()

#from local driver
'''
from pathlib import Path
root = Path(__file__).anchor               #set on if read from local driver
path = str(Path(root))[0:2]+("./mnist/mnist.npz")
(X_train, y_train), (X_test, y_test) = mnist.load_data(path)
'''
print("end loading...")
#phase 5: examining Data Points
# printing first 10 images
print("first 10 images follow:")
''' matplotlib version before 3.6
for i in range(10):
    plt.subplot(3,5,i+1)
    plt.tight_layout()
    plt.imshow(x_train[i], cmap='gray', interpolation='none')
    plt.title("Digit: {}".format(y_train[i]))
    plt.xticks([])
    plt.yticks([])
'''
num = 10
images = X_train[:num]
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
input("Press Enter to continue,or Ctrl+c cancel!")   
#phase 6: reshaping Input Vector
X_train = X_train.reshape(60000, 784) 
X_test  = X_test.reshape(10000, 784)

#phase 6.1: normalizing Data
X_train = X_train.astype("float32") 
X_test = X_test.astype("float32") 
X_train /= 255.0
X_test /= 255.0

#phase 6.2: examining Normalized Data
print("examining Normalized Data")
fig = plt.figure()
plt.subplot(5,5,1) 
plt.hist(X_train[0])
plt.title("Digit: {}".format(y_train[0]))
plt.subplot(5,5,2) 
plt.hist(X_train[2])
plt.title("Digit: {}".format(y_train[2]))
plt.show()
input("Press Enter to continue,or Ctrl+c cancel!")

#phase 6.3: examining Data Distribution
print(np.unique(y_train, return_counts=True))
input("Press Enter to continue,or Ctrl+c cancel!")

#phase 6.4 encoding Data 
n_classes = 10
Y_train = np_utils.to_categorical(y_train, n_classes)
for i in range(5):
    print (Y_train[i])
Y_test = np_utils.to_categorical(y_test, n_classes)     # categorize test data too

#phase 7: training the Model
history = model.fit(X_train, Y_train,
batch_size=128, epochs=20, 
verbose=0,
validation_data=(X_test, Y_test))

#phase 8: evaluating Model Performance
loss_and_metrics = model.evaluate(X_test, Y_test, verbose=2)
print("Test Loss", loss_and_metrics[0]) 
print("Test Accuracy", loss_and_metrics[1])

#phase 8.1: plotting Accuracy Metrics
fig = plt.figure()
plt.subplot(2,2,1)      #warning, subplot(row, column, index)
plt.plot(history.history['accuracy'])
plt.plot(history.history['val_accuracy'])
plt.title('model accuracy')
plt.ylabel('accuracy')
plt.xlabel('epoch')
plt.legend(['train', 'test'], loc='lower right')

#phase 8.2: plotting Accuracy Metrics
plt.subplot(2,2,2)
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.title('model loss')
plt.ylabel('loss')
plt.xlabel('epoch')
plt.legend(['train', 'test'], loc='upper right')
plt.show()

#phase 9: Predicting on Test Data
#predictions = model.predict_classes(X_test)
predictions = np.argmax(model.predict(X_test), axis=-1)
correct_predictions = np.nonzero(predictions == y_test)[0] 
incorrect_predictions = np.nonzero(predictions != y_test)[0]
print(len(correct_predictions)," classified correctly") 
print(len(incorrect_predictions)," classified incorrectly")
'''
#phase 9.1: Model saving
directory = "./models/" 		# at current working directory
name = "My_digitrecognition.h5" 
path = os.path.join(directory,name)
model.save(path)
print('Saved trained model at %s ' % path)

#phase 9.2: Loading Model for Predictions
model = load_model("./models/My_digitrecognition.h5")
'''

print("##@@End")
