import tensorflow as tf

# 定義輸入形狀和輸出形狀
input_shape = (None, 28, 28, 1)
output_shape = (None, 10)

# 創建脈衝神經網路
model = tf.keras.Sequential([
    tf.keras.layers.InputLayer(input_shape=input_shape),
    tf.keras.layers.Conv2D(32, (3, 3), activation='relu'),
    tf.keras.layers.MaxPooling2D((2, 2)),
    tf.keras.layers.Flatten(),
    tf.keras.layers.SpikeReLU(),
    tf.keras.layers.Dense(128),
    tf.keras.layers.SpikeReLU(), # 實現 SNN的激活函數
    tf.keras.layers.Dense(output_shape[1], activation='softmax')
])

# 定義模型的損失函數、優化器和指標
model.compile(
    loss=tf.keras.losses.CategoricalCrossentropy(),
    optimizer=tf.keras.optimizers.Adam(),
    metrics=[tf.keras.metrics.CategoricalAccuracy()])

# 訓練模型
model.fit(train_dataset, epochs=10, validation_data=val_dataset)
