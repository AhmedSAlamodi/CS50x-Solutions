#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);
int letters = 0, words = 0, sentences = 0;
int main(void)
{
    // Prompt the user for some text
    string text = get_string("Text: ");

    // Count the number of letters, words, and sentences in the text
    letters = count_letters(text);
    words = count_words(text);
    sentences = count_sentences(text);
    // Compute the Coleman-Liau index
    float L = (float) letters / (float) words * 100;
    float S = (float) sentences / (float) words * 100;
    int index = round(0.0588 * L - 0.296 * S - 15.8);

    // Print the grade level
    if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", index);
    }
}
int count_letters(string text)
{
    int i = 0;
    int n = strlen(text);
    while (i < n)
    {
        if (isalpha(text[i]))
        {
            letters++;
        }
        i++;
    }
    return letters;
}

int count_words(string text)
{
    int i = 0;
    int n = strlen(text);
    while (i < n)
    {
        if ((text[i]) == ' ')
        {
            words++;
        }
        i++;
    }
    words = words + 1;
    return words;
}

int count_sentences(string text)
{
    int i = 0;
    int n = strlen(text);
    while (i < n)
    {
        if ((text[i]) == '.' || (text[i]) == '!' || (text[i]) == '?')
        {
            sentences++;
        }
        i++;
    }
    return sentences;
}
