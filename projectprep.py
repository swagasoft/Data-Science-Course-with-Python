import pandas as pd

df = pd.read_csv("chicago.csv")
# print(df.head()) 
# start by viewing the first few rows of the dataset!
print(df.columns)
Index(['Start Time', 'End Time', 'Trip Duration', 'Start Station',
       'End Station', 'User Type', 'Gender', 'Birth Year'],
      dtype='object')

# print(df.describe())
print(df.info())
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 400 entries, 0 to 399
Data columns (total 8 columns):
Start Time       400 non-null object
End Time         400 non-null object
Trip Duration    400 non-null int64
Start Station    400 non-null object
End Station      400 non-null object
User Type        400 non-null object
Gender           330 non-null object
Birth Year       330 non-null float64
dtypes: float64(1), int64(1), object(6)
memory usage: 25.1+ KB
None


