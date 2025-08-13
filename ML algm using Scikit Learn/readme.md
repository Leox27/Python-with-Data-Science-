# 📚 Machine Learning Practice – Scikit-learn

This repository contains my practice work while learning **Machine Learning algorithms** using **Scikit-learn**.  
It includes hands-on experiments with popular datasets like the **Iris dataset** as well as custom data preprocessing and model training exercises.

---

## 📌 Project Overview
The purpose of this repository is to:
- Learn and understand the fundamentals of machine learning.
- Explore data preprocessing techniques using **Scikit-learn pipelines**.
- Apply regression and classification algorithms to real datasets.
- Evaluate and compare model performances.

---

## 📖 Theory of Machine Learning
Machine Learning (ML) is a branch of artificial intelligence (AI) that focuses on building systems that can learn from data and improve their performance without being explicitly programmed.  
ML models identify patterns, relationships, and trends within data, enabling them to make predictions or decisions.

### **Types of Machine Learning**
1. **Supervised Learning**
   - The model is trained on labeled data (input-output pairs).
   - Examples:
     - **Regression:** Predict continuous values (e.g., housing prices).
     - **Classification:** Predict categories (e.g., iris flower species).
2. **Unsupervised Learning**
   - The model works with unlabeled data to find hidden patterns or groupings.
   - Examples: Clustering, dimensionality reduction.
3. **Reinforcement Learning**
   - An agent learns to make decisions by interacting with an environment and receiving feedback in the form of rewards or penalties.

### **Core Concepts**
- **Features:** Input variables used for predictions.
- **Target:** Output variable to be predicted.
- **Training & Testing:** Splitting the dataset to build and evaluate the model.
- **Overfitting:** When a model learns noise instead of patterns.
- **Underfitting:** When a model is too simple to capture underlying trends.

---

## 🛠 Technologies Used
- **Programming Language:** Python
- **Libraries & Tools:**
  - `pandas` – Data manipulation
  - `numpy` – Numerical operations
  - `matplotlib`, `seaborn` – Data visualization
  - `scikit-learn` – ML models, preprocessing, and evaluation

---

## 📂 Contents

### **Learning ML Algorithms
- Implemented multiple regression algorithms:
  - **Linear Regression**
  - **Decision Tree Regressor**
  - **Random Forest Regressor**
- Built **preprocessing pipelines** with:
  - `SimpleImputer` for missing values
  - `OneHotEncoder` for categorical features
  - `StandardScaler` for feature scaling
  - `ColumnTransformer` for combined preprocessing

### **Iris Dataset Classification
- **Dataset:** The classic Iris dataset with 150 samples and 4 features.
- **Goal:** Predict the species of iris flowers based on their petal and sepal dimensions.
- **Algorithms Used:**
  - Decision Tree Classifier
  - Random Forest Classifier
- **Steps:**
  1. Loaded dataset using `sklearn.datasets.load_iris`.
  2. Split into training and testing sets.
  3. Trained classifiers and evaluated accuracy.
- **Result:** Achieved high accuracy in predicting iris flower species.

---
