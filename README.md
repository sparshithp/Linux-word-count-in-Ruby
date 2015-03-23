# Linux-word-count-in-Ruby

This ruby script simulates the wc command in Linux. 

Run this command :  ruby parser.rb filename


This is the final output of the script as shown in the screenshot:
 
ruby parser.rb constitution.txt 

all:	872	7652	45119	constitution.txt
proper:	872	5919	40554	constitution.txt
Total Articles: 7
Total Sections: 21
Total Sections per Article:
	Article 1: 10
	Article 2: 4
	Article 3: 3
	Article 4: 4
	Article 5: 0
	Article 6: 0
	Article 7: 0






Please read below for some assumptions, particularly regarding filtering the improper words.

For the linux ‘wc’ command clone, it was pretty straightforward to get the correct answer for the constitution file. For some other files, which i tried out of curiosity, it needed a little bit of cleaning with a strip and null check method call. 

For the improper words, I have taken all the improper words. Now, I wasn’t sure if the words given were case sensitive, so I implemented a case insensitive version. For example, the words given in the requirements consisted of “We”, “You”. While counting the character count and the word count, I exclude words with different cases like “we” ,”wE”, “you”, “yoU”, etc.

I also exclude words which have non-alphabetic characters at the ends. For example, if there is a words like   “#;they1”  or “the.” , I don’t include them in the word count. This is accomplished in line number 26: 

stripped_char = w.downcase.gsub(/\A[\d_\W]+|[\d_\W]+\Z/, '') 

the gsub function strips all non-alphabets at the end of the word. This was a pretty open ended approach. So, if we wanted to consider exact match as in the stop word, we remove both downcase and gsub method calls.

In the character count, I exclude the length of the improper word but still include the non alphabetic characters in the character count. For example, if the word is “;they.” I count  characters ‘.’ and  ‘;’ characters and exclude ‘they’. So, the character count would be 2. 

Now the requirements were pretty open ended and If at all you wanted it done differently like case sensitive word exclusion or include words with nonalphabetic characters at the ends , then please do let me know. I can correct it easily within a few minutes and get back to you.
In the third part, I store the articles and the respective section count in a hash.


Please do let me know if you need anything done differently. Maybe i over-complicated the requirements  for counting only proper words. If that is the case, I can correct and send it across. Thank you

