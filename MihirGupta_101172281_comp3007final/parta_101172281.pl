% 1 2 5 7 8
% Q1
split(_,[],[]).
split(A,Lis,Res):- sHelper(A,Lis,R1,R2), split(A,R2,ResT), (R1 = [] -> Res = ResT; append([R1],ResT,Res)),!.

sHelper(_,[],[],[]).
sHelper(A,[H|T],[],R2):- A = H, R2 = T.
sHelper(A,[H|T],[H|RT1],R2):- not(A=H), sHelper(A,T,RT1,R2).

% Q2
slice([],_,_,[]).
slice(_,0,0,[]).
slice(Lis,A,B,Res):- A < 0, slice(Lis,0,B,Res). 
slice(Lis,A,B,Res):- length(Lis,L), B>L, slice(Lis,A,L,Res),!. 
slice([H|T],0,B,[H|RT]):- B>0, B1 is B-1, slice(T,0,B1,RT).
slice([_|T],A,B,RT):- A>0, B>0 ,A1 is A-1, B1 is B-1, slice(T,A1,B1,RT).

% Q5
pos_diffs([],[]).
pos_diffs([_],[]).
pos_diffs([H1,H2|T],[R|RT]):- R is H2-H1, R>=0, pos_diffs([H2|T],RT).
pos_diffs([H1,H2|T],RT):- R is H2-H1, not(R>=0), pos_diffs([H2|T],RT).


% Q7
all_sums(N,K,Result):- N = 0, K = 0 , Result = [0].
all_sums(N,K,Result):- N = 0, \+(K=0), Result = [].
all_sums(N,K,Result):- N>0,  M is N-1, Strt is 10**M, End is (10**N)-1,  findall(X,(between(Strt,End,X)),Lis), filterFunction(Lis,K,Result).

filterFunction([],_,[]).
filterFunction([H|T],K,[H|ResT]):- sumOfDigits(H,K), filterFunction(T,K,ResT).
filterFunction([H|T],K,ResT):- not(sumOfDigits(H,K)), filterFunction(T,K,ResT).

sumOfDigits(X,X):- X = 0.
sumOfDigits(N,S):- M is mod(N,10), NewN is (N-M)/10, sumOfDigits(NewN,S1), S is S1+M,!.


% Q8
prune(L1,Result):- pruneUtil1(L1,L1),  Result = L1.
prune(L1,Result):- pruneUtil1(L1,L2),  not(L1=L2), prune(L2,Result).

pruneUtil2(A):- number(A).
pruneUtil2(A):- atom(A).

pruneUtil1(A,A):- pruneUtil2(A).
pruneUtil1(A,A):- A = [].
pruneUtil1([A|B],R):- A = [], pruneUtil1(B,R).  
pruneUtil1([A|B],R):- \+(A=[]), pruneUtil1(B,New_Tails), pruneUtil1(A,New_Heads), append([New_Heads],New_Tails,R). 


% Testing
% split(x,[1,2,x,4,5],R).
% split(z,[8,3,2,6,1,4],R).
% split(0,[1, 0, 1, 1, 0, 2, 0, 0 ,1],R).
% split(c,[a, b, c, d, e],R).

% slice([a,b,c,d,e,f,g],1,3,R).
% slice([0,1,2,3,4,5],-10,3,R).
% slice([a, b, c, d, e, f, g, h, i, j], 5, 25,R).
% slice([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 3 ,8, R).

% pos_diffs([1,2,3,4,4,6],R).
% pos_diffs([1],R).
% pos_diffs([6, 2, 9, 1, 5, 7, 8],R).

% all_sums(3,4,R).
% all_sums(3,0,R).
% all_sums(2,7,R).

% prune([[],[],[[],1,[[]]]],R).
% prune([1,2,[],3,4],R).
% prune([],R).
% prune([a, [b, [], [c ,[], d]],[],[],[[]], e],R).
% prune([1 ,2, [] ,3, 4],R).