
countries = ['Angola', 'Maldives', 'India', 'United States', 'India', 'Denmark', 'Sweden', 'Ghana'], # ... 777 more countries not displayed]

print(len(countries)) # 785
print(countries[:5]) # ['Angola', 'Maldives', 'India', 'United States', 'India']

# country_set = set(countries)
# print(country_set) = 196

# country_set.add('Italy')



# A set is a data type for mutable unordered collections of unique elements.
#  One application of a set is to quickly remove duplicates from a list.

numbers = [1, 2, 6, 3, 1, 1, 6]
unique_nums = set(numbers)
print(unique_nums)



fruit = {"apple", "banana", "orange", "grapefruit"}  # define a set

print("watermelon" in fruit)  # check for element

fruit.add("watermelon")  # add an element
print(fruit)

print(fruit.pop())  # remove a random element
print(fruit)