
# coding: utf-8

# In[2]:


from keras.engine import Input, Model
from keras.layers import Convolution2D, Activation, Permute, LSTM, Dense, Flatten
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis as LDA


# In[3]:


def get_only_P300_model_LSTM_CNN(eeg_sample_shape, number_of_hidden=30):
    digit_input = Input(shape=eeg_sample_shape)
    from keras.layers.core import Reshape
    x = Reshape(( eeg_sample_shape[0], eeg_sample_shape[1],1))(digit_input)
    x = Convolution2D(filters=10,
                      kernel_size=(1, eeg_sample_shape[1]),
                      padding='valid',
                      kernel_initializer='glorot_uniform')(x)
    x = Activation('tanh')(x)
    x = Permute((3, 2, 1))(x)
    x = Reshape((eeg_sample_shape[0], 10))(x)
    x = LSTM(number_of_hidden, return_sequences=False, implementation=1)(x)
    x = Dense(1)(x)
    out = Activation(activation='sigmoid')(x)

    model = Model(digit_input, out)
    model.summary()
    from keras.optimizers import RMSprop
    model.compile(optimizer=RMSprop(), loss='binary_crossentropy', metrics=['accuracy'], )
    return model


# In[4]:


import scipy.io as io
import numpy as np
train_data=io.loadmat('../shumo/train_data.mat')


# In[5]:


train_data=train_data['train_data']
y=np.array([train_data[i][1][0] for i in range(len(train_data))])
x=np.array([train_data[i][0].T for i in range(len(train_data))])


# In[6]:


y_train=y[0:3000]
x_train=x[0:3000]


# In[7]:



model = get_only_P300_model_LSTM_CNN((160,20),number_of_hidden=100)


# In[8]:


model.fit(x_train, y_train,
          verbose=1, epochs=500, batch_size=128, shuffle=True)
x_test=x[3000:3600]
x_test1=model.predict(x_test)
x_test1=[round(x_test1[i][0]) for i in range(len(x_test1))]
y_test=[y[i][0] for i in range(3000,3600)]
tt=([x_test1[i]-y_test[i] for i in range(600)])
zz=0
for i in range(600):
    if tt[i]>0:
        zz+=1
    


# In[18]:


x_test=x[3000:3600]
x_test1=model.predict(x_test)
x_test1=[round(x_test1[i][0]) for i in range(len(x_test1))]
y_test=[y[i][0] for i in range(3000,3600)]
tt=([x_test1[i]-y_test[i] for i in range(600)])


# In[114]:


x_test1=model.predict(x_test)


# In[119]:


import pandas as pd
result=pd.DataFrame(x_test1)


# In[122]:


result.to_csv('result.csv')

