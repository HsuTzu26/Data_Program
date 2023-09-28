#http://stat545.com/block022_regular-expression.html

# read from internet gDat <-
# read.delim('http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt')

#Life Expectancy by Year
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

files <- list.files()
head(files)

#Now we can use some string functions to extract certain filenames,
#say all documents on director. We can use  grep() function to identify
#filenames including the string ch. 
#If we set the argument value = TRUE,  
#grep() returns the matches, while value = FALSE returns their indices.
#The invert argument let’s you get everything BUT the pattern you 
#specify. grepl() is a similar function but returns a logical vector.
#See here for more information.

grep("ch", files, value = TRUE)
grep("ch", files, value = FALSE)
grepl("ch", files)

#Escape sequences
#There are some special characters in R that cannot be directly
#coded in a string. For example, let’s say you specify your pattern
#with single quotes and you want to find countries with the single
#quote '. You would have to “escape” the single quote in the pattern,
#by preceding it with \, 
#so it’s clear it is not part of the string-specifying machinery:

grep('\'', levels(gDat$country), value = TRUE)

#There are other characters in R that require escaping, 
#and this rule applies to all string functions in R, including regular expressions. 
#See here for a complete list of R esacpe sequences.

#\': single quote. You don’t need to escape single quote inside a double-quoted string, so we can also use "'" in the previous example.
#\": double quote. Similarly, double quotes can be used inside a single-quoted string, i.e. '"'.
#\n: newline.
#\r: carriage return.
#\t: tab character.
#Note: cat() and print() to handle escape sequences differently, 
#if you want to print a string out with these sequences interpreted, use cat().

print("a\nb")

cat("a\nb")

#Quantifiers
#Quantifiers specify how many repetitions of the pattern.

#*: matches at least 0 times.
#+: matches at least 1 times.
#?: matches at most 1 times.
#{n}: matches exactly n times.
#{n,}: matches at least n times.
#{n,m}: matches between n and m times.

(strings <- c("a", "ab", "acb", "accb", "acccb", "accccb"))
grep("ac*b", strings, value = TRUE)
grep("ac+b", strings, value = TRUE)
grep("ac?b", strings, value = TRUE)
grep("ac{2}b", strings, value = TRUE)
grep("ac{2,}b", strings, value = TRUE)
grep("ac{2,3}b", strings, value = TRUE)

#Exercise
#Find all countries with ee in Gapminder using quantifiers.
grep('ee', levels(gDat$country), value = TRUE)
## [1] "Greece"

#Position of pattern within the string
#^: matches the start of the string.
#$: matches the end of the string.
#\b: matches the empty string at either edge of a word. Don’t confuse it with ^ $ which marks the edge of a string.
#\B: matches the empty string provided it is not at an edge of a word.

(strings <- c("abcd", "cdab", "cabd", "c abd"))
grep("ab", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("ab$", strings, value = TRUE)
grep("\\bab", strings, value = TRUE)

#Exercise
#Find all .txt files in the repository.

grep(".txt$",files, value = TRUE)



#Operators
#.: matches any single character, as shown in the first example.
#[...]: a character list, matches any one of the characters inside
#the square brackets. We can also use  - inside the brackets to specify
#a range of characters.
#[^...]: an inverted character list, similar to [...], 
#but matches any characters except those inside the square brackets.
#\: suppress the special meaning of metacharacters in 
#regular expression, i.e.  $ * + . ? [ ] ^ { } | ( ) \, 
#similar to its usage in escape sequences. Since \ itself needs to be 
#escaped in R, we need to escape these metacharacters with double backslash
#like \\$.
#|: an “or” operator, matches patterns on either side of the |.
#(...): grouping in regular expressions. This allows you to retrieve the 
#bits that matched various parts of your regular expression so you can alter 
#them or use them for building up a new string. Each group can than be refer 
#using \\N, with N being the No. of (...) used. This is called backreference.

(strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12"))
grep("ab.", strings, value = TRUE)
grep("ab[c-e]", strings, value = TRUE)
grep("ab[^c]", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("\\^ab", strings, value = TRUE)
grep("abc|abd", strings, value = TRUE)
gsub("(ab) 12", "\\1 34", strings)

#Excercise
#Find countries in Gapminder with letter i or t, 
#and ends with land, and replace land with LAND using backreference.
a1<-grep('i|t', levels(gDat$country), value = TRUE)
a2<-grep('land$', a1, value = TRUE)
sub("land","LAND",a2)


#Character classes
#Character classes allows to – surprise! – specify entire classes of characters, such as numbers, letters, etc. There are two flavors of character classes, one uses [: and :] around a predefined name inside square brackets and the other uses \ and a special character. They are sometimes interchangeable.

#[:digit:] or \d: digits, 0 1 2 3 4 5 6 7 8 9, equivalent to [0-9].
#\D: non-digits, equivalent to [^0-9].
#[:lower:]: lower-case letters, equivalent to [a-z].
#[:upper:]: upper-case letters, equivalent to [A-Z].
#[:alpha:]: alphabetic characters, equivalent to [[:lower:][:upper:]] or [A-z].
#[:alnum:]: alphanumeric characters, equivalent to [[:alpha:][:digit:]] or [A-z0-9].
#\w: word characters, equivalent to [[:alnum:]_] or [A-z0-9_].
#\W: not word, equivalent to [^A-z0-9_].
#[:xdigit:]: hexadecimal digits (base 16), 0 1 2 3 4 5 6 7 8 9 A B C D E F a b c d e f, equivalent to  [0-9A-Fa-f].
#[:blank:]: blank characters, i.e. space and tab.
#[:space:]: space characters: tab, newline, vertical tab, form feed, carriage return, space.
#\s: space, ` `.
#\S: not space.
#[:punct:]: punctuation characters, ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [  ] ^ _ ` { | } ~.
#[:graph:]: graphical (human readable) characters: equivalent to [[:alnum:][:punct:]].
#[:print:]: printable characters, equivalent to [[:alnum:][:punct:]\\s].
#[:cntrl:]: control characters, like \n or \r, [\x00-\x1F\x7F].
#Note:

#[:...:] has to be used inside square brackets, e.g. [[:digit:]].
#\ itself is a special character that needs escape, e.g. \\d. Do not confuse these regular expressions with R escape sequences such as \t.


#General modes for patterns

#There’s one last type of regular expression – “fixed”, 
#meaning that the pattern should be taken literally. 
#Specify this via fixed = TRUE (base R functions) or 
#wrapping with fixed() (stringr functions). 
#For example,  "A.b" as a regular expression will match a string 
#with “A” followed by any single character followed by “b”, 
#but as a fixed pattern, it will only match a literal “A.b”.

(strings <- c("Axbc", "A.bc"))
## [1] "Axbc" "A.bc"
pattern <- "A.b"
grep(pattern, strings, value = TRUE)
## [1] "Axbc" "A.bc"
grep(pattern, strings, value = TRUE, fixed = TRUE)
## [1] "A.bc"

pattern <- "a.b"
grep(pattern, strings, value = TRUE)
## character(0)
grep(pattern, strings, value = TRUE, ignore.case = TRUE)
## [1] "Axbc" "A.bc"

#Exercise
#Find continents in Gapminder with letter o in it.
grep('o|O', levels(gDat$continent), value = TRUE)
## [1] "Europe"  "Oceania"


#Examples and exercises
pattern <- "Report.*exp.*txt"
grep(pattern, files, value = TRUE)

#refine our search
pattern <- "^Report\\d{3}_.*exp.*txt$"
(dplyr_file <- grep(pattern, files, value = TRUE))


