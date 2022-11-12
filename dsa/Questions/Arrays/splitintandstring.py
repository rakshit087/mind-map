message = input()
numbers = ''
words = ''
for word in list(message):
    if word.isdigit():
      numbers = numbers + word
    else:
        words = words + word
        numbers = numbers + ' '
for n in numbers.split():
    print(n,end=" ")
print()
for n in words.split():
    print(n,end=" ")