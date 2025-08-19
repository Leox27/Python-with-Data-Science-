import os
import numpy as np
import pandas as pd
import joblib

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

MODEL_FILE = "model.pkl"
PIPELINE_FILE = "pipeline.pkl"

def build_pipeline(num_attribs, cat_attribs):
    
    # For numerical attributes
    num_pipeline = Pipeline([
        ('imputer', SimpleImputer(strategy="median")),
        ('scaler', StandardScaler())
    ])

    # For categorical attributes
    cat_pipeline = Pipeline([
        ('one_hot_encoder', OneHotEncoder())
    ])

    # 8. Combine numerical and categorical pipelines in full pipeline
    full_pipeline = ColumnTransformer([
        ('num', num_pipeline, num_attribs),
        ('cat', cat_pipeline, cat_attribs)
    ])

    return full_pipeline

if not os.path.exists(MODEL_FILE):
    # 1. Load dataset
    housing = pd.read_csv('housing.csv')

    # 2. Create an income category for stratification
    housing['income_cat'] = pd.cut(housing['median_income'], 
                                   bins=[0, 1.5, 3, 4.5, 6, np.inf], 
                                   labels=[1, 2, 3, 4, 5])

    # 3. Stratified split to ensure representative distribution of income categories
    split = StratifiedShuffleSplit(n_splits=1, test_size=0.2, random_state=42)

    for train_index, test_index in split.split(housing, housing['income_cat']):
        df = housing.loc[test_index].drop('income_cat', axis=1)
        df.to_csv("input.csv", index=False) # Saving test data to a file for later use

        housing = housing.loc[train_index].drop('income_cat', axis=1)
        # strat_test_set = housing.loc[test_index] ## We're not using this test data
    
    housing_labels = housing['median_house_value'].copy()
    housing_features = housing.drop('median_house_value', axis=1)

    num_attribs = housing_features.drop("ocean_proximity", axis=1).columns.tolist() # List of numerical attributes
    cat_attribs = ["ocean_proximity"]

    full_pipeline = build_pipeline(num_attribs, cat_attribs)
    housing_prepared = full_pipeline.fit_transform(housing_features)

    # print("Pipeline created and fitted.", housing_prepared)
    model = RandomForestRegressor(n_estimators=100, random_state=42)
    model.fit(housing_prepared, housing_labels)
    joblib.dump(model, MODEL_FILE)
    joblib.dump(full_pipeline, PIPELINE_FILE)

    print("Model and pipeline saved.")

else:
    
    model = joblib.load(MODEL_FILE)
    full_pipeline = joblib.load(PIPELINE_FILE)

    # Prepare the input data
    input_data = pd.read_csv('input.csv')
    input_features = full_pipeline.transform(input_data)

    # Make predictions
    predictions = model.predict(input_features)
    input_data["median_house_value"] = predictions
 
    input_data.to_csv("output.csv", index=False)
    print("Predictions saved to output.csv")
