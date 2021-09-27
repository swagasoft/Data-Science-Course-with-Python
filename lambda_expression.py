
def multiply(x, y):
    return x * y

can be reduced to:

multiply = lambda x, y: x * y


Both of these functions are used in the same way. In either case, we can call multiply like this:

multiply(4, 7)



# solution 1
numbers = [
              [34, 63, 88, 71, 29],
              [90, 78, 51, 27, 45],
              [63, 37, 85, 46, 22],
              [51, 22, 34, 11, 18]
           ]

averages = list(map(lambda x: sum(x) / len(x), numbers))
print(averages)


# solution 2
cities = ["New York City", "Los Angeles", "Chicago", "Mountain View", "Denver", "Boston"]

short_cities = list(filter(lambda x: len(x) < 10, cities))
print(short_cities)