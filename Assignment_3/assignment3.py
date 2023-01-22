
from durable.lang import *



with ruleset('career_eligibility'):

    #AI
    @when_all((m.score>=8) & (m.interest == 'Automation') & (m.branch != 'ECE') & (m.coursecount>3) & (m.course1=='Artificial Intelligence') & ((m.course2=='Machine Learning') | (m.course3=='Natural Language Processing')))
    def Automation(c):
        c.assert_fact('career',{'field': 'AI', 'profile': 'Natural Language Processing', 'level': 'pro'})
        c.assert_fact('level_tips',{'level': 'pro'})
    
    @when_all((m.score>=7) & (m.interest == 'Automation') & (m.branch != 'ECE') & (m.coursecount>2) & (m.course1=='Artificial Intelligence') & (m.course5=='Human-Computer Interaction'))
    def Automation(c):
        c.assert_fact('career',{'field': 'AI', 'profile': 'Human-Centered ML Designer', 'level': 'advanced'})
        c.assert_fact('level_tips',{'level': 'advanced'})
    
    @when_all((m.score>=6) & (m.interest == 'Automation') & (m.branch != 'ECE') & (m.coursecount>2) & (m.course1=='Artificial Intelligence'))
    def Automation(c):
        c.assert_fact('career',{'field': 'AI', 'profile': 'Artificial Intelligence', 'level': 'beginner'})
        c.assert_fact('level_tips',{'level': 'beginner'})
    
    @when_all((m.score>=7) & (m.interest == 'Automation') & (m.branch == 'ECE') & (m.course1=='Artificial Intelligence') & (m.course4 == 'Robotics') )
    def Automation(c):
        c.assert_fact('career',{'field': 'AI', 'profile': 'Robotics', 'level': 'intermediate'})
        c.assert_fact('level_tips',{'level': 'intermediate'})
    
    #ML
    @when_all((m.score>=9) & (m.interest == 'Data & Prediction') & (m.coursecount>3) & (m.course1=='Machine Learning') & ((m.course4=='Probability & Stats') | (m.course2 == 'Deep Learning')))
    def ML(c):
        c.assert_fact('career',{'field': 'ML', 'profile': 'Deep Learning Research', 'level': 'pro'})
        c.assert_fact('level_tips',{'level': 'pro'})
    
    @when_all((m.score>=8) & (m.interest == 'Data & Prediction') & (m.coursecount>3) & (m.course1=='Machine Learning') & ((m.course4=='Probability & Stats') | (m.course3=='Neural Networks')))
    def ML(c):
        c.assert_fact('career',{'field': 'ML', 'profile': 'Neural Networks Research', 'level': 'advance'})
        c.assert_fact('level_tips',{'level': 'advanced'})
    
    @when_all((m.score>=6) & (m.interest == 'Data & Prediction') & (m.coursecount>2) & (m.course1=='Machine Learning'))
    def ML(c):
        c.assert_fact('career',{'field': 'ML', 'profile': ' ML Engineer', 'level': 'intermediate'})
        c.assert_fact('level_tips',{'level': 'intermediate'})
    
    @when_all((m.score>=5) & (m.interest == 'Data & Prediction') & (m.coursecount>1) & (m.course1=='Machine Learning') & ((m.course4=='Probability & Stats') | (m.course5=='DataScience')))
    def ML(c):
        c.assert_fact('career',{'field': 'ML', 'profile': 'Data Scientist', 'level': 'beginner'})
        c.assert_fact('level_tips',{'level': 'beginner'})
    
    #Database Management
    @when_all((m.score>=8) & (m.interest == 'Organizing & Filtering Data') & (m.coursecount>3) & (m.course1=='Database Management Systems') & (m.course2=='Database Systems Implementation'))
    def DBMS(c):
        c.assert_fact('career',{'field': 'DBMS', 'profile': 'Database Administrator', 'level': 'advance'})
        c.assert_fact('level_tips',{'level': 'advanced'})
    
    @when_all((m.score<8) & (m.interest == 'Organizing & Filtering Data') & (m.coursecount>2) & (m.course1=='Database Management Systems') & ((m.course2=='Database Systems Implementation') | (m.course3=='DataScience')))
    def DBMS(c):
        c.assert_fact('career',{'field': 'DBMS', 'profile': 'Database Developer', 'level': 'intermediate'})
        c.assert_fact('level_tips',{'level': 'intermediate'})
    
    #Network Security
    @when_all((m.score>=9) & (m.interest == 'Networks') & (m.coursecount>3) & (m.course1=='Network Security') & (m.course2=='Advanced Network Security'))
    def DBMS(c):
        c.assert_fact('career',{'field': 'NS', 'profile': 'Network Security Management & Administration', 'level': 'pro'})
        c.assert_fact('level_tips',{'level': 'pro'})
    
    @when_all((m.score>=8) & (m.interest == 'Networks') & (m.coursecount>3) & (m.course1=='Network Security') & (m.course3=='Cloud Computing'))
    def DBMS(c):
        c.assert_fact('career',{'field': 'NS', 'profile': 'Cloud Security', 'level': 'advance'})
        c.assert_fact('level_tips',{'level': 'advanced'})
    
    @when_all((m.score>=7) & (m.interest == 'Networks') & (m.coursecount>2) & (m.course1=='Network Security') & (m.course4=='Network Loopholes'))
    def DBMS(c):
        c.assert_fact('career',{'field': 'NS', 'profile': 'Ethical Hacking', 'level': 'intermediate'})
        c.assert_fact('level_tips',{'level': 'intermediate'})
    

with ruleset('career'):
    @when_all(m.field == 'AI')
    def AI(c):
        c.assert_fact({'advise': 'Start a career in {0}, in the field of AI'.format(c.m.profile)})

    @when_all(m.field == 'ML')
    def ML(c):
        c.assert_fact({'advise': 'Start a career in {0}, in the field of ML'.format(c.m.profile)})

    @when_all(m.field == 'DBMS')
    def DBMS(c):
        c.assert_fact({'advise': 'Start a career in {0}, in the field of DBMS'.format(c.m.profile)})

    @when_all(m.field == 'NS')
    def NS(c):
        c.assert_fact({'advise': 'Start a career in {0}, in the field of NS'.format(c.m.profile)})

    @when_all(+m.advise)
    def suggest_career(c):
        print("==============================================================")
        print("You can {0}".format(c.m.advise))

with ruleset('level_tips'):

    @when_all(m.level == 'pro')
    def tips(c):
        c.assert_fact({'tip': 'CONGRATS!! You are a pro. You are already doing the best to acquire the results. Keeping consistent is the key'})
    
    @when_all(m.level == 'advanced')
    def tips(c):
        c.assert_fact({'tip': 'Hurray!! You are in the advanced zone for this career track. Keep consistent & a little more push would do wonders for you. Improvise your optional/desirable courses'})
    
    @when_all(m.level == 'intermediate')
    def tips(c):
        c.assert_fact({'tip': 'Yayy!! Your hard work has made you enter the intermediate zone. Boost your motivation to follow your path for this career choice. Look up for more optional courses while excelling in the mandatory ones'})
    
    @when_all(m.level == 'beginner')
    def tips(c):
        c.assert_fact({'tip': 'Nice!! You are a beginner, but excelling fast. Pull up your socks as we need to improve alot. Start by understanding the basics & mandatory courses.'})

    @when_all(+m.tip)
    def display_tips(c):
        print("Tips: {0} \n\n".format(c.m.tip))
        print("==============================================================")
    

def main():
    print("Welcome back to your IIITD Career Advisory friend.")
    print("We met last time during Assignment 1. I am now more improvised & follow durable rules with forward-chaining. \n Basically, I can get the work done, so Test me Out!!")
    print("I have a bit weak memory, kindly provide me with your name so I can save our important counselling")
    name=input()
    print("Enter your branch: ")
    branch=input().upper()
    print("\n Hiii",name,"!! Now select the fields that excites you from the below mentioned fields (in a decreasing priority order & space separated): ")
    interests=['Automation', "Data & Prediction", 'Organizing & Filtering Data', 'Networks']
    courses=[['Artificial Intelligence','Machine Learning','Natural Language Processing', 'Robotics', 'Human-Computer Interaction'],
            ['Machine Learning', 'Deep Learning', 'Neural Networks', 'Probabibility & Stats', 'DataScience'],
            ['Database Management Systems', 'Database Systems Implementation', 'Data Science'],
            ['Network Security', 'Advanced Network Security', 'Cloud Computing', 'Network Loopholes']]

    for i in range(len(interests)):
        print(i,"--> ",interests[i])
    
    user_interests=list(map(int,input().split()))

    for i in user_interests:
        field=interests[i]
        print("\n*********************  Interested Field: {0}*********************".format(field))
        print("\n--------------------  ENTER GRADES  --------------------")
        print("Enter your grade-point (1-10) you got in the course mentioned. If you have not taken it, enter 0")
        grades=[]
        interest_courses=courses[i]
        for j in range(len(interest_courses)):
            print(j,") ",interest_courses[j],": ")
            grades.append(int(input()))
        score=0
        course_count=0
        for k in grades:
            if k==0:
                continue
            score+=k
            course_count+=1
        score/=course_count
        career_eligibility_facts={'interest': field, 'coursecount': course_count, 'score': score, 'branch': branch}
        
        for k in range(len(grades)):
            course=interest_courses[k]
            if (grades[k]==0):
                course=""
            career_eligibility_facts['course{0}'.format(k+1)]=course
        
        print("Your career options are: ")
        career_count=0
        try:
            assert_fact('career_eligibility', career_eligibility_facts)
            career_count+=1
        except:
            if(career_count==0):
                print("Soo Sorry, it would be better if you don't consider your career in this field. Else you can improvise and come back to check for your chances")
        print("Moving to next interested field\n")
        print("**************************************************************************\n")         
    
    print("Thanks for using Career Advisory System. Keep visiting & working!!")

if __name__ == '__main__':
    main()