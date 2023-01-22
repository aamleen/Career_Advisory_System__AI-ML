
guide_me:-
    reconsult('C:/Users/aamle/OneDrive/Desktop/IIITD Semesters/5th Sem/AI/Assignment_1/Prolog files/functions'),
    reconsult('C:/Users/aamle/OneDrive/Desktop/IIITD Semesters/5th Sem/AI/Assignment_1/Prolog files/techtree'),
    retractall(val_pre_done),
    retractall(val_des_count),
    intro.

%starting welcome note
intro:-
    write('---------------------------IIITD ELECTIVE ADVISORY SYSTEM-------------------------------------'),nl,
    writeln(''),
    writeln('Welcome to the Best possible AI Elective Advisory System developed just overnight'),
    write('We understand the tremendous workload of IIITD students. Well seems like you got tricked into it over NSUT & DTU xD.'),
    writeln('No doubt it is counted among the top Engineering Institutes in India, competing with many IITs & NITs, but one place where it has acquired the extreme top leadership spot is its workload. To excel in any field, you need to make some correct education choices at the right time. So here we present to you the Elective Advisory System that will help you select your electives in a few questions, so that you don\'t have to go through the hassle of searching each & everyone & then checking prerequisites'),writeln(''),
    writeln('Now, well since you have already skipped over the above intro, why not provide us with your name:'),
    read(Name),nl,
    format('Hi! ~w . Thanks for providing your name. Let\'s go ahead and get started with the real work',Name),nl,writeln(''),
    Specializations_list=['High Performance Computing','Data Scientist','Machine Learning','Networking', 'Artificial Intelligence','Economoics (Minor)'],
    Specialisation_Code = ['hpc','ds','ml','ns','ai','eco'],
    writeln('These are the specialisations we offer here at IIITD:'),
    print_records(Specializations_list,Specialisation_Code),
    write('Enter preference order using the code, in small letters: '),
    read(Priority),nl,
    next_priority(Priority).

conclude:-
    writeln(''),
    writeln('Seems like there are no more preferred specialisations.'),
    format('
------------------------------------------------------------------------------------------------------------------------------------------
    '),nl,
    write('We hope you have found your electives (workload xD) for this sem. In case you make it to next sem, do visit us. All the best !!'),nl,
    write('Free Advice: NO PLAGIARISM!!'),nl,
    format('
------------------------------------------------------------------------------------------------------------------------------------------
    '),nl,
    abort.


next_priority([]):- conclude.
next_priority([H|T]) :-
    writeln(''),
    specialisation_filter(H,T),
    format('---------------Moving to next preferred Specialization----------

    '),nl,writeln(''),
    next_priority(T).


check_mandatory_prerequisites([]).
check_mandatory_prerequisites([M_H|M_T]):-
    format('~w :',M_H),
    read(Pre_done),
    (   Pre_done =:= 1 -> asserta(val_pre_done(1)),check_mandatory_prerequisites(M_T);
        Pre_done =:= 0 -> !,asserta(val_pre_done(0))).

check_desirable_prerequisites([]).
check_desirable_prerequisites([D_H|D_T]):-
    format('~w :',D_H),
    val_des_count(Count),
    read(Pre_done),
    (   Pre_done =:= 1 -> asserta(val_pre_done(1)),check_desirable_prerequisites(D_T);
        Pre_done =:= 0 -> X is Count-1,asserta(val_des_count(X)),
        (   Count =<0 -> !,asserta(val_pre_done(0));
            Count >0 -> check_desirable_prerequisites(D_T)
        )
    ).

check_prereqs(Mandatory_prereqs,Desirable_prereqs,Spe):-
    writeln(''),
    write('Checking Mandatory PreReqs. Enter 1 if done, else 0'),nl,
    check_mandatory_prerequisites(Mandatory_prereqs),
    val_pre_done(Prereq_res),
    (   Prereq_res =:= 0 ->
        write('Sorry!, You have not done a mandatory prerequisite. Kindly finish that to go ahead with this specialisation'),nl,
        write('Going to next priority Specialisation'),nl,
        next_priority(Spe);
        Prereq_res =:= 1 ->
         writeln(''),
        writeln('Checking Desirable PreReqs. Enter 1 if done, else 0')

    ),

    length(Desirable_prereqs,N),
    Coun is ceiling(N/2),
    asserta(val_des_count(Coun)),
    check_desirable_prerequisites(Desirable_prereqs),
    val_pre_done(D_prereq_res),
    (   D_prereq_res =:= 0 -> !,
        write('Sorry!, You have not done more than 50% desirable prerequisite. Kindly finish that to go ahead with this specialisation'),nl,
        write('Going to next priority Specialisation'),nl,
        next_priority(Spe);
        D_prereq_res =:= 1 ->  writeln(''),writeln('You have completed both Mandatory & 50% Desirable PreRequisites'),nl
    ).
display_electives([]).
display_electives([EH|ET]):-
    writeln(''),
    course(EH),
    writeln(''),
    display_electives(ET).

specialisation_filter(ai,Spe):-
    format('-----------Current Specialisation: Artificial Intelligence---------------'),nl,
    Mandatory_prereqs=['Introduction To Programming','Data Structure & Algorithms'],
    Desirable_prereqs=['Machine Learning','NLP'],
    check_prereqs(Mandatory_prereqs,Desirable_prereqs,Spe),
    write('CONGRATSS!! You are eligible to pursue Artificial Intelligence specialisation'),nl,
    write('Find the below electives that you can take for AI:'),nl,
    Electives=[dl,cv,acv],
    display_electives(Electives),
    format('
    Thats All for now!! You can always come back for more till we find new additions to it.
    -----------------------------------------------------------------------------------------
    Would you like to see the results for your next preferred specialisation?'),
    read(Take_to_next),
    (   Take_to_next =:= 1 -> next_priority(Spe)
    ).

specialisation_filter(hpc,Spe):-
    format('-----------Current Specialisation: High Performance Computing---------------'),nl,
    Mandatory_prereqs=['Advanced Programming'],
    Desirable_prereqs=['Analysis & Desiging Algorithms','Operating Systems'],
    check_prereqs(Mandatory_prereqs,Desirable_prereqs,Spe),
    write('CONGRATSS!! You are eligible to pursue Artificial Intelligence specialisation'),nl,
    write('Find the below electives that you can take for HPC:'),nl,
    Electives=[dl,cv,acv],
    display_electives(Electives),
    format('
    Thats All for now!! You can always come back for more till we find new additions to it.
    -----------------------------------------------------------------------------------------
    Would you like to see the results for your next preferred specialisation?'),
    read(Take_to_next),
    (   Take_to_next =:= 1 -> next_priority(Spe)
    ).

specialisation_filter(ns,Spe):-
    format('-----------Current Specialisation: Network & Security---------------'),nl,
    Mandatory_prereqs=['Network Administration'],
    Desirable_prereqs=['Foundations of Computer Security','Intro to Networks'],
    check_prereqs(Mandatory_prereqs,Desirable_prereqs,Spe),
    write('CONGRATSS!! You are eligible to pursue Network Security specialisation'),nl,
    write('Find the below electives that you can take for NS:'),nl,
    Electives=[dl,cv,acv],
    display_electives(Electives),
    format('
    Thats All for now!! You can always come back for more till we find new additions to it.
    -----------------------------------------------------------------------------------------
    Would you like to see the results for your next preferred specialisation?'),
    read(Take_to_next),
    (   Take_to_next =:= 1 -> next_priority(Spe)
    ).

specialisation_filter(ml,Spe):-
    format('-----------Current Specialisation: Machine Learning---------------'),nl,
    Mandatory_prereqs=['Intro To Programming','Linear Algebra','Probability & Statistics'],
    Desirable_prereqs=['Maths3 Calculus','Real Analysis 1'],
    check_prereqs(Mandatory_prereqs,Desirable_prereqs,Spe),
    write('CONGRATSS!! You are eligible to pursue Machine Learning specialisation'),nl,
    write('Find the below electives that you can take for ML:'),nl,
    Electives=[aml,sml,dl,cv],
    display_electives(Electives),
    format('
Thats All for now!! You can always come back for more till we find new additions to it.
-----------------------------------------------------------------------------------------
\n Would you like to see the results for your next preferred specialisation?'),
    read(Take_to_next),
    (   Take_to_next =:= 1 -> next_priority(Spe)
    ).

specialisation_filter(eco,Spe):-
    format('-----------Current Specialisation: Economics [Minor]---------------'),nl,
    Mandatory_prereqs=['Econometrics 1'],
    Desirable_prereqs=['Game Theory', 'Money & Banking'],
    check_prereqs(Mandatory_prereqs,Desirable_prereqs,Spe),
    write('CONGRATSS!! You are eligible to pursue a minor in Economics specialisation'),nl,
    write('Find the below electives that you can take for ECO:'),nl,
    Electives=[me,econ],
    display_electives(Electives),
    format('
    Thats All for now!! You can always come back for more till we find new additions to it.
    -----------------------------------------------------------------------------------------
    Would you like to see the results for your next preferred specialisation?'),
    read(Take_to_next),
    (   Take_to_next =:= 1 -> next_priority(Spe)
    ).


