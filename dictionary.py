

#   Key     |   Value
# Shanghai  |   17.8
# Istanbul  |   13.3
# Karachi   |   13.0
# Mumbai    |   12.5

population = {"Shanghai": 17.8, "Istanbul": 13.3, "Karachi": 13.0, "Mumbai": 12.5}

print(population)

print(population["Shanghai"])
print(population.get('dilithium'))


VINIX =  {'C': 0.74, 'MA': 0.78, 'BA': 0.79, 'PG': 0.85, 'CSCO': 0.88, 'VZ': 0.9, 'PFE': 0.92, 'HD': 0.97, 'INTC': 1.0, 'T': 1.01, 'V': 1.02, 'UNH': 1.02, 'WFC': 1.05, 'CVX': 1.05, 'BAC': 1.15, 'JNJ': 1.41, 'GOOGL': 1.46, 'GOOG': 1.47, 'BRK.B': 1.5,
 'XOM': 1.52, 'JPM': 1.53, 'FB': 2.02, 'AMZN': 2.96, 'MSFT': 3.28, 'AAPL': 3.94}


VINIX = {'C': [0.74, -6.51],  'MA': [0.78, 34.77],  'BA': [0.79, 17.01],  'PG': [0.85, -8.81],  'CSCO': [0.88, 18.56],  'VZ': [0.9, 2.16],  'PFE': [0.92, 13.96],  'HD': [0.97, 3.2],  'INTC': [1.0, 2.61],  'T': [1.01, -15.19],  'V': [1.02, 24.0],  'UNH': [1.02, 19.32],  'WFC': [1.05, -3.59],  'CVX': [1.05, -5.77],  'BAC': [1.15, 4.27],  'JNJ': [1.41, -5.58],  'GOOGL': [1.46, 17.84],  'GOOG': [1.47, 17.03],  'BRK.B': [1.5, 4.54],  'XOM': [1.52, -6.87], 
  'JPM': [1.53, 7.66],  'FB': [2.02, 0.91], 'AMZN': [2.96, 62.75], 'MSFT': [3.28, 26.61], 'AAPL': [3.94, 26.01]}



# Quiz: Adding Values to Nested Dictionaries
# Try your hand at working with nested dictionaries. Add another entry, 'is_noble_gas,' to each dictionary
#  in the elements dictionary. After inserting the new entries you should be able to perform these lookups:
elements = {'hydrogen': {'number': 1, 'weight': 1.00794, 'symbol': 'H','is_noble_gas': False},
            'helium': {'number': 2, 'weight': 4.002602, 'symbol': 'He', 'is_noble_gas': True}}

# todo: Add an 'is_noble_gas' entry to the hydrogen and helium dictionaries
# hint: helium is a noble gas, hydrogen isn't
elements['hydrogen']['is_noble_gas'] =  False
elements['helium']['is_noble_gas'] = True
print(elements)