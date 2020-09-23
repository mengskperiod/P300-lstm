# P300-lstm
##中文部分
这个项目主要时华为杯2020年B题的一个参考，有两大部分，一部分时数据的预处理
，另一部分时用LSTM网络去识别
数据来源链接: https://pan.baidu.com/s/19WKdUB9dc8x3BqAqL7wtKA 提取码: 9mkm 
这个文件是原始数据，通过百度网盘下载，然后运行main2与main3进行数据的预处理

在数据预处理部分我们采用的是三部分，第一部分是利用带通滤波器bandsome_filter
这个文件进行滤波，以150个采样点（640ms）进行数据窗的切分，然后利用
Haar小波进行分解

第二个大的部分是利用LSTM网络进行预测，这一部分中我们采用了Single Trial P300 Classification Using
Convolutional LSTM and Deep Learning
Ensembles Method这篇文章类似的思路进行，具体的m文件为LSTM_xiaoguo.m
数据来源为链接: https://pan.baidu.com/s/1XvwtNlf6ovg5NG9sfIAoxw 提取码: mx1a
这是两个不同的训练集与测试集
同样的我们也搭建了lstm.py进行运行，这一部分我们用的是keras搭建的LSTM，没什么本质区别

不过在这一问题中虽然我们是仿照上述论文的做法，但是我们的效果并不理想，识别率仍然不够高
这一问题我们目前也没有什么太好的解决办法

后续期望能做一个GAN做一个强化学习看效果是不是可以更好

如果有相关的疑问或者间接可以联系mengskfenix@hotmail.com

##