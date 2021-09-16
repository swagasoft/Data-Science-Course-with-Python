
AngkorWat = (13.4125, 103.866667)

print(type(AngkorWat))
# <class 'tuple'="">

print("AngkorWat is at latitude: {}".format(AngkorWat[0]))
# AngkorWat is at latitude: 13.4125

print("AngkorWat is at longitude: {}".format(AngkorWat[1]))
# AngkorWat is at longitude: 103.866667

location = (13.4125, 103.866667)
print("Latitude:", location[0])
print("Longitude:", location[1])

dimensions = 52, 40, 100
length, width, height = dimensions
print("The dimensions are {} x {} x {}".format(length, width, height))