def count_letters(text):
    letters = 0
    i = 0
    while i < len(text):
        if(text[i].isalpha()):
            letters += 1
        i += 1
    return letters

def count_words(text):
    words = 0
    i = 0
    while i < len(text):
        if(text[i] in [" "]):
            words += 1
        i += 1
    return words + 1

def count_sentences(text):
    sentences = 0
    i = 0
    while i < len(text):
        if(text[i] in [".", "?", "!"]):
            sentences += 1
        i += 1
    return sentences

text = input("Text: ")

letters = count_letters(text)
words = count_words(text)
sentences = count_sentences(text)

L = float(letters / words * 100)
S = float(sentences / words * 100)
index = round(0.0588 * L - 0.296 * S - 15.8)

if(index < 1):
    print("Before Grade 1")

elif(index >= 16):
    print("Grade 16+")
else:
    print("Grade:", index)

