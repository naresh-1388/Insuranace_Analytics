

import pandas as pd

df = pd.read_excel("C:\CodeHub\Projects\Insurance_Analytics\Data\Insurance DM.xlsx")

df["Transaction_Date"] = pd.to_datetime(df["Transaction_Date"]).dt.strftime("%d-%m-%y")
df["DOB"] = pd.to_datetime(df["DOB"]).dt.strftime("%d-%m-%y")

print(df.columns.tolist())   # All column names
print(df.dtypes)           # Datatypes
print(df.head())        # First 5 records

df.to_parquet("insurance_data.parquet", index=False)