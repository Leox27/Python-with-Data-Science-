import numpy as np
import pandas as pd

from sklearn.model_selection import StratifiedShuffleSplit
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.compose import ColumnTransformer
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import OneHotEncoder

from sklearn.linear_model import LinearRegression
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor

from sklearn.metrics import root_mean_squared_error
from sklearn.model_selection import cross_val_score

import joblib

# 1. Load dataset
housing = pd.read_csv('housing.csv')

# if 'median_house_value' not in housing.columns:
#     raise ValueError("Column 'median_house_value' not found in dataset!")

# 2. Create an income category for stratification
housing['income_cat'] = pd.cut(housing['median_income'], 
                          bins=[0, 1.5, 3, 4.5, 6, np.inf], 
                          labels=[1, 2, 3, 4, 5])

# 3. Stratified split to ensure representative distribution of income categories
split = StratifiedShuffleSplit(n_splits=1, test_size=0.2, random_state=42)

for train_index, test_index in split.split(housing, housing['income_cat']):
    strat_train_set = housing.loc[train_index] # Set aside the training set for training the model
    strat_test_set = housing.loc[test_index] # Set aside the test set for testing the model

# 4. Drop the income_cat column
for set_ in (strat_train_set, strat_test_set):
    set_.drop('income_cat', axis=1, inplace=True)   

housing = strat_train_set.copy() # get a copy of the training set

# 5. List features and labels 
housing_labels = housing['median_house_value'].copy()
housing = housing.drop('median_house_value', axis=1)

print(housing, housing_labels)

# 6. Separate numerical and categorical columns
num_attribs = housing.drop("ocean_proximity", axis=1).columns.tolist() # List of numerical attributes
cat_attribs = ["ocean_proximity"]

# 7. Create a preprocessing pipeline (it takes lists of columns)
num_pipeline = Pipeline([
    ('imputer', SimpleImputer(strategy="median")),
    ('scaler', StandardScaler())
])

cat_pipeline = Pipeline([
    ('one_hot_encoder', OneHotEncoder())
])

# 8. Combine numerical and categorical pipelines in full pipeline
full_pipeline = ColumnTransformer([
    ('num', num_pipeline, num_attribs),
    ('cat', cat_pipeline, cat_attribs)
])

# print(housing, housing_labels)

# 8. Fit and transform the data using the full pipeline
housing_prepared = full_pipeline.fit_transform(housing)
print("Prepared housing data shape:", housing_prepared.shape)
print("Prepared housing data:", housing_prepared)

# 9. Train the model
# For example, we can train a model like this:

## Linear Regression Model -
lin_reg = LinearRegression() # Create a linear regression model
lin_reg.fit(housing_prepared, housing_labels) # Fit the model
lin_predict = lin_reg.predict(housing_prepared) # Predict using the model

lin_rmse = root_mean_squared_error(housing_labels, lin_predict) # Calculate RMSE
lin_rmses = -cross_val_score(lin_reg, housing_prepared, housing_labels, scoring="neg_root_mean_squared_error", cv=10) # Cross-validation RMSE
print(pd.Series(lin_rmses).describe()) # Print the statistics of RMSEs
# print(f"Linear Regression RMSE: {round(lin_rmse, 2)}")

## Decision Tree Regressor model -
tree_reg = DecisionTreeRegressor(random_state=42) # Create a decision tree regressor
tree_reg.fit(housing_prepared, housing_labels) # Fit the model
tree_predict = tree_reg.predict(housing_prepared) # Predict using the model

tree_rmse = root_mean_squared_error(housing_labels, tree_predict) # Calculate RMSE
dec_rmses = -cross_val_score(tree_reg, housing_prepared, housing_labels, scoring="neg_root_mean_squared_error", cv=10) # Cross-validation RMSE
print(pd.Series(dec_rmses).describe()) # Print the statistics of RMSEs
# print(f"Decision Tree RMSE: {round(tree_rmse, 2)}")

## Random Forest Regressor model -
forest_reg = RandomForestRegressor(random_state=42) # Create a random forest regressor
forest_reg.fit(housing_prepared, housing_labels) # Fit the model
forest_predict = forest_reg.predict(housing_prepared) # Predict using the model

forest_rmse = root_mean_squared_error(housing_labels, forest_predict) # Calculate RMSE
forest_rmses = -cross_val_score(forest_reg, housing_prepared, housing_labels, scoring="neg_root_mean_squared_error", cv=10) # Cross-validation RMSE
print(pd.Series(forest_rmses).describe()) # Print the statistics of RMSEs
# print(f"Random Forest RMSE: {round(forest_rmse, 2)}")

# 10. Print the RMSEs of all models
print(f"Linear Regression RMSE: {round(lin_rmse, 2)}")
print(f"Decision Tree RMSE: {round(tree_rmse, 2)}")
print(f"Random Forest RMSE: {round(forest_rmse, 2)}")
# 11. Save the models if needed
# import joblib