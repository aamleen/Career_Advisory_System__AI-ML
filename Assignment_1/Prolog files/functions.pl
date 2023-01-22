:-dynamic val_pre_done/1.
:-dynamic val_des_count/1.


print_records([],[]).
print_records([H|T],[HC|TC]) :-
  format('~w -- Code : ',H),
  format('~w',HC),nl, print_records(T,TC).

read_priority(Priority):- writeln('Enter: '),
    read(In),
    ( In =\= -1 ->
    read_priority(Priority),
    Priorityn=[In|Priority],
    Priority=Priorityn
    ).

search_indez([X|_], X, 0):- !.
search_index([_|T], X, Res):-  search_index(T, X, Res),
   Res is Res+1,!.
