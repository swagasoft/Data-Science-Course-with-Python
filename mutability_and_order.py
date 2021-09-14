
# Mutability is about whether or not we can change an object once it has been created. If 
# an object (like a list or string) can be changed (like a list can), then it is called mutable.
#  However, if an object cannot be changed 
# with creating a completely new object (like strings), then the object is considered immutable.

my_lst = [1, 2, 3, 4, 5]
my_lst[0] = 'one'
print(my_lst)

# Are they mutable?
# Are they ordered?
# Order is about whether the position of an element in the object can be used to access the element. 
# Both strings and lists are ordered. We can use the order to access parts of a list and string.

# However, you will see some data types in the next sections that will be unordered. For each of
#  the upcoming data structures you see, it is useful to understand how you index, are they mutable,
#   and are they ordered. Knowing this about the data structure is really useful!

# Additionally, you will see how these each have different methods, so why you would use one data structure vs.
#  another is largely dependent on these properties, and what you can easily do with it!