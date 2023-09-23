import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader
import torchvision
import torchvision.transforms as transforms
from tqdm import tqdm

# 加載 MNIST 數據集
trainset = torchvision.datasets.MNIST(root='./data', train=True, download=True, transform=transforms.ToTensor())
trainloader = DataLoader(trainset, batch_size=32, shuffle=True)

# 定義脈衝神經網路模型
class SpikingModel(nn.Module):
    def __init__(self):
        super(SpikingModel, self).__init__()
        self.conv1 = nn.Conv2d(1, 32, 3)
        self.pool = nn.MaxPool2d(2, 2)
        self.fc1 = nn.Linear(32 * 13 * 13, 128)
        self.spike = nn.ReLU()
        self.fc2 = nn.Linear(128, 10)

    def forward(self, x):
        out = self.pool(self.conv1(x))
        out = out.view(out.size(0), -1)
        out = self.fc1(out)
        out = self.spike(out)
        out = self.fc2(out)
        return out

# 創建脈衝神經網路模型實例、損失函數和優化器
model = SpikingModel()
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters())

# 訓練模型
epochs = 10
for epoch in range(epochs):
    running_loss = 0.0
    pbar = tqdm(trainloader)
    for i, data in enumerate(pbar, 0):
        inputs, labels = data

        # 將輸入張量轉換為脈衝張量
        inputs = torch.bernoulli(inputs)

        optimizer.zero_grad()

        # 前向傳遞
        outputs = model(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()

        running_loss += loss.item()
        pbar.set_description('Epoch: %d | Loss: %.3f' % (epoch+1, running_loss / (i+1)))

    print('Epoch %d loss: %.3f' % (epoch + 1, running_loss / len(trainloader)))

    # 隨機選取一個數字圖片進行預測
    with torch.no_grad():
        images, labels = next(iter(trainset))
        image = images.unsqueeze(0)
        output = model(torch.bernoulli(image))

        # 獲取預測結果和真實標籤
        _, predicted = torch.max(output.data, 1)
        label = int(labels)
        prediction = int(predicted)

        # 在控制台上印出真實標籤和預測結果
        print('Label:', label)
        print('Prediction:', prediction)

        # 將數字圖片顯示出來

        import matplotlib.pyplot as plt
        plt.imshow(images.squeeze(), cmap='gray')
        plt.show()
