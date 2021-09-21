
capitalized_cities = []
for city in cities:
    capitalized_cities.append(city.title())

    capitalized_cities = [city.title() for city in cities]

    squares = [x**2 for x in range(9) if x % 2 == 0]


    squares = [x**2 for x in range(9) if x % 2 == 0 else x + 3]
    squares = [x**2 if x % 2 == 0 else x + 3 for x in range(9)]


    scores = {
             "Rick Sanchez": 70,
             "Morty Smith": 35,
             "Summer Smith": 82,
             "Jerry Smith": 23,
             "Beth Smith": 98
          }

passed = [name for name, score in scores.items() if score >= 65]
print(passed)



#  solution 1
nom_count_dict = {}
for year, list_dir in nominated.items():
    for director in list_dir:
        if director not in nom_count_dict:
            nom_count_dict[director] = 1
        else:
            nom_count_dict[director] += 1

print(nom_count_dict)


# 1B
win_count_dict = {}
for year, winnerlist in winners.items():
    for winner in winnerlist:
        win_count_dict[winner] = win_count_dict.get(winner, 0) + 1


        # 2
#FIRST PART OF SOLUTION
win_count_dict = {}
for year, winnerlist in winners.items():
    for winner in winnerlist:
        win_count_dict[winner] = win_count_dict.get(winner, 0) + 1


        #SECOND PART OF SOLUTION
highest_count = 0
most_win_director = []

for key, value in win_count_dict.items():
    if value > highest_count:
        highest_count = value
        most_win_director.clear()
        most_win_director.append(key)
    elif value == highest_count:
        most_win_director.append(key)
    else:
        continue



#ALTERNATIVE SECOND PART OF SOLUTION
highest_count = max(win_count_dict.values())

most_win_director = [key for key, value in win_count_dict.items() if value == highest_count]

