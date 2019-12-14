f = open('input.txt')

lines = f.readlines()

cnt = 0
masses = 0
for i in lines:
    masses[cnt] = int(i)
    ++cnt


f.close()