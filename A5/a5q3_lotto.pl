% Mihir Gupta
% 101172281

%% Ques 1
%random_int(Int1,Int2,Random_Int),
random_int(Int1,Int2,Fin):- Lot is Int2-Int1, 
Betw is random(Lot), 
Fin is Betw+Int1.

%% Ques 2
%range(First_List1,First_List2,Final_List).
range(First_List1,First_List2,Final_List):-helper_Func1(First_List1,First_List2,[],Final_List).

helper_Func1(First_List1,First_List2,Final_List,Final_List):- First_List1>First_List2.
helper_Func1(First_List1,First_List2,Final_List,Ans):- First_List1=<First_List2,
Betw is First_List1+1,
append_list(Final_List,[First_List1],Int2),helper_Func1(Betw,First_List2,Int2,Ans).

append_list([],L, L).
append_list([H|T], List2, [H|List]):-append_list(T, List2, List).

%% Ques 3
%remove_nth(Int1,List,N,M).
remove_nth(Int1,List,Int2,M):-helper_Func2(Int1,List,Int2,[],0,M).


helper_Func2(Int1,[Sta|Las],Int2,M,N,Final):- Int1=N,Int2=Sta,
append_list(M,Las,M1),Final=M1.
helper_Func2(Int1,[Sta|Las],Int2,M,N,Final):- not(Int1=N),
N1 is N+1,append_list(M,[Sta],M1),
helper_Func2(Int1,Las,Int2,M1,N1,Final).

%% Ques 4
% select_random(Int,List,Result).
select_random(0,_,[]).
select_random(Int,List,[Sta|Las]):- Int>0, 
Intgr1 is Int-1, length(List,Length), Length>1, random_int(1,Length,M), 
my_nth1(M,List,Sta,Fin),select_random(Intgr1,Fin,Las).

my_nth1(1,[A|B],A,B).
my_nth1(_,L,_,_):-L == [],!,fail.
my_nth1(A,[H|T],B,[H|D]):- (var(A)-> my_nth1(C,T,B,D),A is C + 1 ; C is A - 1,my_nth1(C,T,B,D)).

%% Ques 5
% lotto(List).
lotto(Given_List):- range(1,50,Bw_list), select_random(7,Bw_list,List), 
sort(List,Given_List).

