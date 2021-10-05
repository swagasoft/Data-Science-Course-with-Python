Example 1. Load the data from a .csv file.
# We load Google stock data in a DataFrame
Google_stock = pd.read_csv('./GOOG.csv')

# We print some information about Google_stock
print('Google_stock is of type:', type(Google_stock))
print('Google_stock has shape:', Google_stock.shape)


Example 7. See the descriptive statistics of one of the columns of the DataFrame
# We get descriptive statistics on a single column of our DataFrame
Google_stock['Adj Close'].describe()


Example 8. Statistical operations - Min, Max, and Mean
# We print information about our DataFrame  
print()
print('Maximum values of each column:\n', Google_stock.max())
print()
print('Minimum Close value:', Google_stock['Close'].min())
print()
print('Average value of each column:\n', Google_stock.mean())


Example 9. Statistical operation - Correlation
# We display the correlation between columns
Google_stock.corr()


# We load fake Company data in a DataFrame
data = pd.read_csv('./fake_company.csv')

data




Example 10. Demonstrate groupby() and sum() method
Let's calculate how much money the company spent on salaries each year. To do this,
 we will group the data by Year using the .groupby() method and then we will add up the
  salaries of all the employees by using the .sum() method.

# We display the total amount of money spent in salaries each year
data.groupby(['Year'])['Salary'].sum()



Example 11. Demonstrate groupby() and mean() method
Now, let's suppose I want to know what was the average salary for each year. In this case, we will 
group the data by Year using the .groupby() method, just as we did before, and then we use the .mean()
 method to get the average salary. Let's see how this works

# We display the average salary per year
data.groupby(['Year'])['Salary'].mean()




Example 12. Demonstrate groupby() on single column
Now let's see how much did each employee gets paid in those three years. In this case, we will group the 
data by Name using the .groupby() method and then we will add up the salaries for each year. Let's see the result

# We display the total salary each employee received in all the years they worked for the company
data.groupby(['Name'])['Salary'].sum()



Example 13. Demonstrate groupby() on two columns
Now let's see what was the salary distribution per department per year. In this case, we will group 
the data by Year and by Department using the .groupby() method and then we will add up the salaries for
 each department. Let's see the result

# We display the salary distribution per department per year.
data.groupby(['Year', 'Department'])['Salary'].sum()