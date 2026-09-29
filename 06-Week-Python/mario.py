while True:
    try:
        Height = int(input("Height: "))
        if 0 < Height <= 8:
            break
    except ValueError:
        pass

for i in range(1, Height + 1):
    print(" " * (Height - i) + "#"* i)
