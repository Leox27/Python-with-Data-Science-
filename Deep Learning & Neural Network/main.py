def step(x):
    return 1 if x>=0 else 0

def perceptron(x1, x2, w1, w2, c):
    y = x1 * w1 + x2 * w2 + c
    return step(y)

print(perceptron(0, 0, 1, 1, -1.5))  # Output: 1
print(perceptron(0, 1, 1, 1, -1.5))  # Output: 2
print(perceptron(1, 0, 1, 1, -1.5))  # Output: 3
print(perceptron(1, 1, 1, 1, -1.5))  # Output: 4