read_facts:-
            %open('C:/Users/aamle/OneDrive/Desktop/IIITD Semesters/5th Sem/AI/Assignment_5/user_input.txt', read, File),
            consult('C:/Users/aamle/OneDrive/Desktop/IIITD Semesters/5th Sem/AI/Assignment_5/user_input.pl'),
            consult('C:/Users/aamle/OneDrive/Desktop/IIITD Semesters/5th Sem/AI/Assignment_5/techtree.pl'),
            retractall(interested),
            retractall(course_taken),
            retractall(prog_lang),
            retractall(grade),
            retractall(course).

start:- read_facts,
        writeln('<-------------------WELCOME TO IIITD ELECTIVE ADVISORY SYSTEM----------------------->'),
        writeln('As per the input provided by you in our python interface, following fields & electives are advised'),
        advise_electives;
        writeln('<------------------------Thanks for Visiting. Work Hard!!---------------------------->').

advise_electives:-  check_interested('ai');
                    check_interested('ml');
                    check_interested('hpc');
                    check_interested('networks');
                    check_interested('ds');
                    check_interested('eco').

check_interested('ai'):- interested('ai'),
                        writeln('#################--Artificial Intelligence---####################'),
                        course_taken('ml'),(
                        course_taken('nlp');
                        course_taken('dsa')),
                        prog_lang('python'),
                        grade(A),
                        (   A > 7.5 -> true;
                            writeln('Grade not eligible for AI electives'),false),
                        suggest_electives([dl,cv,acv,ml]).

check_interested('ml'):- interested('ml'),
                        writeln('##################----Machine Learning---#####################'),
                        course_taken('ip'),
                        course_taken('pns'),
                        prog_lang('python'),
                        grade(B),
                        (   B > 8 -> true;
                            writeln('Grade not eligible for ML electives'),false),
                        suggest_electives([aml,nlp,dl,dm]).

check_interested('ds'):- interested('data-science'),
                        writeln('######################---Data Science---######################'),
                        course_taken('ip'),
                        (prog_lang('python');
                        prog_lang('r')),
                        grade(B),
                        (   B > 6.5 -> true;
                            writeln('Grade not eligible for Data Science electives'),false),
                        suggest_electives([ds,dpm,dm]).

check_interested('hpc'):- interested('hpc'),
                        writeln('#####################----High Performance Computing---#####################'),
                        course_taken('os'),(
                        course_taken('ap');
                        course_taken('ada')),
                        (prog_lang('c');
                        prog_lang('c++')),
                        grade(C),
                        (   C > 8 -> true;
                            writeln('Grade not eligible for HPC electives'),false),
                        suggest_electives([fpp,prmp,cn]).

check_interested('network'):- interested('network'),
                        writeln('############################---Networks----##########################'),
                        course_taken('fcs'),(
                        course_taken('cn');
                        course_taken('in')),
                        (prog_lang('c');
                        prog_lang('c++');
                        prog_lang('java')),
                        grade(C),
                        (   C > 4 -> true;
                            writeln('Grade not eligible for Networking electives'),false),
                        suggest_electives([cn,ns,wn]).

check_interested('eco'):- interested('economics'),
                        writeln('###########################----Economics----###########################'),
                        (
                        course_taken('gt');
                        course_taken('mb')),
                        grade(C),
                        (   C > 4 -> true;
                            writeln('Grade not eligible for Economics electives'),false),
                        suggest_electives([me,econ]).

suggest_electives([Head|Tail]):- course(Head), suggest_electives(Tail).
suggest_electives([]).
