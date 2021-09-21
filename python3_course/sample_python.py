import math

def binarySearch(arr_list, target):
    min_value = 0
    max_value = len(arr_list) - 1
    
    while min_value <= max_value:
        average = math.floor((min_value + max_value) / 2)
        print('avg ', average)

        if arr_list[average] == target:
            return average
        elif arr_list[average] < min_value:
            min_value = average + 1
        else:
            max_value = average - 1

    return -1

my_list = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 
		41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

print(binarySearch(my_list, 3) )           