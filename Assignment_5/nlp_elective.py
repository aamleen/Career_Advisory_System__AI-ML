import numpy as np
import string
import nltk


from nltk.stem import WordNetLemmatizer
from nltk.corpus import stopwords
from nltk.tokenize import sent_tokenize, word_tokenize

nltk.download('wordnet')
nltk.download('stopwords')
nltk.download('punkt')
nltk.download('omw-1.4')

def interface():
    print('-----------Welcome to the Elective Advisory System---------')
    print('Kindly enter your request in simple English Language in well-formed sentences. Also use keywords like interested & cgpa for interested streams & cgpa.')

interface()
user_in= input().lower()
lemmatizer = WordNetLemmatizer()
lemmatizer.lemmatize(user_in)
sentences= sent_tokenize(user_in)
word_sen=[]
for sentence in sentences:
    word_sen.append(word_tokenize(sentence))

stop_Words= set(stopwords.words('english'))
new_word_sen=[]
negation=['not','no','didn\'t']
for words in word_sen:
    sen=[]
    for word in words:
        if word not in string.punctuation and (word not in stop_Words or word in negation):
            sen.append(word)
    new_word_sen.append(sen)

courses=['ai','fcs','ml','cn','ada','dsa','os','ap','nlp','data-science','hpc','network','economics','gt','mb','fcs','cn','in','ip','pns',]
prog_lang= ['python','java','c','c++','r']


def check_lang_cour(sen):
    user_lang=[]
    user_courses=[]
    grade=-1
    grade_flag=-1
    for word in sen:
        if word.isdigit():
            print('------------------\nGRADE: {0}\n------------'.format(word))
            grade=int(word)
        if word in prog_lang:
            user_lang.append(word)
        if word in courses:
            user_courses.append(word)
        if word in ['cgpa','gpa','grade']:
            grade_flag=1
    if grade_flag==-1:
        grade=-1   
    return user_courses,user_lang, grade

user_lang=[]
user_cour=[]
facts_file=open('user_input.pl','w')
facts=[]
cgpa_entered=-1
for sentence in word_sen:
    cour, lang, cgpa= check_lang_cour(sentence)
    if cgpa >=0:
        cgpa_entered=0
        facts.append('grade({0}).\n'.format(cgpa))
    if 'interested' in sentence:
        for i in cour:
            facts.append('interested(\'{0}\').\n'.format(i))
        cour=[]
    user_cour.extend(cour)
    user_lang.extend(lang)

if cgpa_entered==-1:
    cgpa=int(input('Kindly enter your CGPA:'))
    facts.append('grade({0}).\n'.format(cgpa))

if len(user_lang)<=0:
    facts.append('prog_lan(\'none\').\n')

if len(user_cour)<=0:
    facts.append('course_taken(\'none\').\n')

user_lang= list(set(user_lang))
user_cour= list(set(user_cour))

for fact in user_lang:
    facts.append('prog_lang(\'{0}\').\n'.format(fact))

for fact in user_cour:
    facts.append('course_taken(\'{0}\').\n'.format(fact))

facts_file.writelines(facts)
facts_file.close()