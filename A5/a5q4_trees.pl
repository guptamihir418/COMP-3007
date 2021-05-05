% Mihir Gupta
% 101172281

%% Ques 1
%list(List).
list([]). 
list([M]):-M=_.
list(M):-M=[_|_].

%% Ques 2
%treeFlat(List,Final).
treeFlat(List,Final) :- not(list(List)), 
Final = [List].
treeFlat([],List):- length(List,0).
treeFlat([Sta|Las],Final) :-  treeFlat(Las,Current_Tails), 
treeFlat(Sta,Current_Heads), 
append_list(Current_Heads,Current_Tails,Final).

append_list([],L, L).
append_list([H|T], List2, [H|List]):-append_list(T, List2, List).

%% Ques 3
%treeSum(List,Final).
treeSum(List,Final):-helper_Func1(List,Final,0).

helper_Func1([],Final,Sum):-Final=Sum.
helper_Func1(List, Final,Sum):- treeFlat(List,M), M=[Sta|Las],Nex_Sum is Sum + Sta , 
helper_Func1(Las,Final,Nex_Sum).

%% Ques 4
%treeSmush(List1,List2).
treeSmush(List1, List2):- helper_Func2(List1, M), not(List1=M), 
treeSmush(M, List2).
treeSmush(List, List):- helper_Func2(List, List).

helper_Func2(M, M):- length(M,0).
helper_Func2(M, M):- not(list(M)).
helper_Func2([M], [N]):- list(M), 
helper_Func2(M,N).   
helper_Func2([Sta|Las],[Sta|Las1]):- not(list(Sta)), 
helper_Func2(Las,Las1). 
helper_Func2([Sta1,Sta2|Las],Final):- list(Sta1), not(list(Sta2)), helper_Func2(Sta1,Betw), 
helper_Func2([Sta2|Las],Las1), append_list([Betw],Las1,Final),!. 
helper_Func2([Sta1,Sta2|Las],Final):- list(Sta2), list(Sta1), helper_Func2(Sta1,Betw), helper_Func2(Sta2,Nex), 
helper_Func2(Las,Las1), append_list(Betw,Nex,Nex1), append_list([Nex1],Las1,Final),!. 
helper_Func2([Head1|Tail],[Head1|Tail_Result]):- not(list(Head1)), 
helper_Func2(Tail,Tail_Result). 

