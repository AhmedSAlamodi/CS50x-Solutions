while True:
    try:
        dollar = float(input("Change: "))

        if dollar >= 0:
            break
    except ValueError:
        pass


cent = round(dollar * 100)

quarters = cent // 25
cent %= 25

dimes = cent // 10
cent %= 10

nickels = cent // 5
cent %= 5

pennies = cent

print(quarters + dimes + nickels + pennies)
