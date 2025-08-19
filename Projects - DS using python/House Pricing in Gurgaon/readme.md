# 🏠 Housing Prices Prediction – Gurgaon

A machine learning project to predict housing prices in **Gurgaon** using **Scikit-learn pipelines** and regression algorithms.  
This project covers **data preprocessing, feature transformation, and model building** to create a robust price prediction system.

---

## 📌 Project Overview
Real estate prices in **Gurgaon** vary widely depending on multiple factors such as location, area, furnishing, and transaction type.  
This project aims to:
- Analyze the factors influencing property prices.
- Build and evaluate regression models.
- Implement a clean **machine learning pipeline** for reproducibility.

This project focuses on predicting housing prices in Gurgaon using machine learning techniques. The goal was to analyze historical housing data, identify the key factors that influence property prices, and develop a predictive model capable of estimating prices for new listings. The workflow included data preprocessing, exploratory data analysis (EDA), feature engineering, and model building using regression algorithms. A robust pipeline was created using Scikit-learn tools such as StratifiedShuffleSplit, SimpleImputer, OneHotEncoder, StandardScaler, and ColumnTransformer to handle both numerical and categorical variables efficiently. Models like Linear Regression, Decision Tree Regressor, and Random Forest Regressor were trained and evaluated. The final results showed that the model’s predictions were consistently close to actual prices, making it a reliable tool for real estate price estimation in the Gurgaon market.

---

## 📂 Dataset
- **Key Features:**
  - `longitude`
  - `latitude`
  - `housing_median_age`
  - `total_rooms`
  - `total_bedrooms`
  - `households`
  - `median_income`
  - `median_house_value`
  - `ocean_proximity`
  - **Target:** `Price`

---

## 🛠 Tech Stack
- **Programming Language:** Python
- **Libraries & Tools:**
  - Data Processing: `pandas`, `numpy`

  - Machine Learning:  
    - `sklearn.model_selection.StratifiedShuffleSplit`
    - `sklearn.preprocessing.StandardScaler`
    - `sklearn.pipeline.Pipeline`
    - `sklearn.compose.ColumnTransformer`
    - `sklearn.impute.SimpleImputer`
    - `sklearn.preprocessing.OneHotEncoder`

    - Models:
      - `LinearRegression`
      - `DecisionTreeRegressor`
      - `RandomForestRegressor`

---

## 🔍 Methodology
1. **Data Collection** – Imported dataset from _(source)_.
2. **Data Cleaning** – Removed duplicates, handled missing values using `SimpleImputer`.
3. **Data Splitting** – Used `StratifiedShuffleSplit` for train-test split to ensure balanced representation.
4. **Feature Engineering**:
   - Encoded categorical features using `OneHotEncoder`.
   - Scaled numerical features using `StandardScaler`.
5. **Pipeline Construction** – Created a `ColumnTransformer` to process numerical and categorical columns together.
6. **Model Training** – Built and trained:
   - Linear Regression
   - Decision Tree Regressor
   - Random Forest Regressor
7. **Evaluation** – Used:
   - R² Score
   - Mean Absolute Error (MAE)
   - Root Mean Squared Error (RMSE)

---

## 📊 Results (in output.csv)
The model’s predictions were validated by comparing the **predicted prices** (`median_house_value(output)`) with the **actual prices** (`median_house_value(input)`).

| Actual Price (₹) | Predicted Price (₹) |
|------------------|---------------------|
| 500001           | 483020.6            |
| 162500           | 221708.09           |
| 204600           | 205706              |
| 159700           | 170623              |
| 184000           | 212497              |
| 151900           | 164798              |
| 104900           | 114046              |
| 500001           | 434144.28           |
| 337000           | 408649.28           |
| 59200            | 69340               |
| 212500           | 270996              |
| 274600           | 266551              |
| 227100           | 235190              |
| 115800           | 124375              |
| 97600            | 92847               |
| 85500            | 96797               |
| 337400           | 338403.03           |
| 366200           | 374039.09           |
| 219700           | 197371              |
| 279900           | 296512              |
| 203800           | 204461              |
| 59100            | 64569               |

**Observation:**  
The differences between predicted and actual values are relatively small for most entries, 
indicating that the model generalizes well to unseen data.
