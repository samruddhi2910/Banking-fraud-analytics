from pathlib import Path
import pandas as pd


# Project root directory
PROJECT_ROOT = Path(__file__).resolve().parents[1]

# Dataset path
DATA_PATH = PROJECT_ROOT / "data" / "PaySim.csv"

# Load dataset
df = pd.read_csv(DATA_PATH)

# Basic exploration
print("Dataset shape:", df.shape)
print("\nFirst 5 rows:")
print(df.head())

print("\nColumn names:")
print(df.columns.tolist())

print("\nData types:")
print(df.dtypes)

print("\nMissing values:")
print(df.isnull().sum())

print("\nDuplicate rows:", df.duplicated().sum())

print("\nTransaction types:")
print(df["type"].value_counts())

print("\nFraud transactions:")
print(df["isFraud"].value_counts())