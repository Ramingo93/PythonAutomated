import os

targets = []

for _, _, file_ in os.walk('targets'):
    targets.append(file_)

print(targets)
input()
