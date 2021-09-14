
months = ['January', 'February', 'Match', 'April', 'May','June','Jully','August', 'September','Octomber',
'November','December']

print(months[0]) # January
print(months[1]) # February
print(months[7]) # August
print(months[-1]) # December

list_of_random_things = [1, 3.4, 'a string', True]
print(list_of_random_things[0])
print(list_of_random_things[len(list_of_random_things) - 1])

# print first of of the year
first_half = months[:6]
print("first half " , first_half)


greeting = "Hello there"
print(len(greeting)) # 11

# print index 1 and 2
print(list_of_random_things[1:2])


# check in 
print('this' in 'this is a string')

print('isa' in 'this is a string')

print(5 in [1, 2, 3, 4, 6])

print(5 not in [1, 2, 3, 4, 6])