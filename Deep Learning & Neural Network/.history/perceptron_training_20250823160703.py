from sklearn.linear_model import Perceptron
from sklearn.dataset import make_classification
from sklearn.model_selection import test_train_split

X, y = make_classification(n_samples=100, n_features=20, n_classes=2, n_redundant=10, random_state=42)