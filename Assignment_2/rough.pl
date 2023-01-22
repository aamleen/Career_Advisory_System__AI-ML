:- dynamic move2/3.
:- dynamic move2_heur/3.

start:-
        writeln("<---------------------------------IIITD Trip Planner----------------------------------->"),
        writeln("Welcome to the AI Application that will help you find the best routes between 2 cities"),
        write("Enter the source city: "),
        read(Src),nl,
        write("Enter the Destination city: "),
        read(Dst),nl,
        write("Enter 0 for Breadth First Search or 1 for A* Approach: "),
        read(AlgoOption),nl,
        (       AlgoOption =:= 0 -> load_data('bfs'), writeln("Data Loaded Successfully"),
                        breadth_FS(Dst, [Src], [],Src);
                AlgoOption =:= 1 -> load_data('bfs'), load_data('heuristics'), writeln("Data Loaded Successfully"),
                        a_star(Src,Dst);
                writeln("Wrong Choice")
        ).

load_data('bfs'):-
        retractall(move2(_,_,_)),
        writeln("Loading Actual Distances"),
        csv_read_file('C:/Users/aamle/OneDrive/Desktop/IIITD Semesters/5th Sem/AI/Assignment 2/distance.csv', BFSDist, [functor(move2)]),
        maplist(assert,BFSDist).

load_data('heuristics'):-
        retractall(move2_heur(_,_,_)),
        writeln("Loading Heuristics"),
        csv_read_file('C:/Users/aamle/OneDrive/Desktop/IIITD Semesters/5th Sem/AI/Assignment 2/heuristics.csv', AHeur, [functor(move2_heur)]),
        maplist(assert,AHeur).


%--------------------------------Breadth First Search Algo Below-------------------------------------
leave_city(_, [], []).
leave_city(Current, [Current|NextCities], NextCities).

breadth_FS(_Dst,[],_,_).
breadth_FS(Dst, Travelled, Route, ActualPath):-
        Travelled = [Current|_],
        Current \== Dst,
        findall(NextCity,
                (move2(Current,NextCity,_Dist), not(member(NextCity,Travelled)), not(member(NextCity,Route))),
                NearestCities),
        append(Travelled, NearestCities, Travel_updated),
        leave_city(Current, Travel_updated, NewTravelled),
        (   member(Dst,NearestCities) ->
                breadth_FS(Dst, NewTravelled, [Current|Route],[ActualPath|Current]);
                breadth_FS(Dst, NewTravelled, [Current|Route],ActualPath)).
        %write(TempPath),nl,
        %breadth_FS(Dst, NewTravelled, [Current|Route],NewTempPath).


breadth_FS(Dst, [Dst|_], Reverse_Route, ActualPath):-
        writeln('--------------------'),
        reverse([Dst|Reverse_Route], Route),
        atomic_list_concat(Route, '-> ', Arrow_Route),
        write("Path as per Breadth First Search is: "),
        write(Arrow_Route),nl,
        write("ActualPath: "),write(ActualPath),write("->"),write(Dst),nl.



%---------------------------------------A* Search Algo Below------------------------------------------

% calc_f(Current,PrevF,Dest,NextStop,F):- write("Current is:
% "),write(Current),write("NextStop is:
% "),write(NextStop),move2(Current,NextStop,G),
% move2_heur(Current,Dest,PrevH), move2_heur(NextStop,Dest,H), Tg is
% PrevF-PrevH, write("Tg is: "),write(Tg), write("G is: "),write(G),
% write("H is: "),write(H),nl,F is Tg+G+H, write("F is: "),writeln(F).


actual_dist([H|_],H,G):-G is 0.
actual_dist([H|T],Current,G):- [Nh|_]=T,move2(H,Nh,Te),actual_dist(T,Current,Ta),G is Ta+Te.

% calc_f(Current,PrevPath,Dest,NextStop,F):- write("Current is:
% "),write(Current),write("NextStop
% is:"),write(NextStop),reverse(PrevPath,PPath),
% actual_dist(PPath,NextStop,G), move2_heur(NextStop,Dest,H), F is G+H,
% write(" F is:"),write(F),write(" G is:"),write(G),nl.

calc_f(_Current,PrevPath,Dest,NextStop,F):-reverse(PrevPath,PPath), actual_dist(PPath,NextStop,G), move2_heur(NextStop,Dest,H), F is G+H.

a_star(Src,Dest):- move2_heur(Src,Dest,H),as_search(Src, Dest, [H-[Src]], []).

as_search(Dest, Dest, OpenS, _):-
        [_-BestPath|_T] = OpenS,
        reverse(BestPath,CorrectPath),
        actual_dist(CorrectPath,Dest,TotalDist),
        write("Shortest Path is (Src->Dest): "),write(CorrectPath),nl,
        write("Total Distance is: "),write(TotalDist),nl.

as_search(Current, Dest, OpenS, Travelled):-
        [_PrevF-BestPath|T] = OpenS,
        [CurrentBest|_Ta] = BestPath,
        findall(F-[NextStop|BestPath],(move2(CurrentBest,NextStop,_), CurrentBest \== NextStop, not(member(NextStop,Travelled)),calc_f(CurrentBest, [NextStop|BestPath], Dest, NextStop, F)),
            NewStops),
        append(NewStops, T, UpdatedStops),
        keysort(UpdatedStops, SrtdStops),
        [_-NextBestPath |_] = SrtdStops,
        [NextBestCity |_] = NextBestPath,
        as_search(NextBestCity, Dest, SrtdStops, [Current|Travelled]).
