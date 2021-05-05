% Mihir Gupta
% 101172281

%male(name).
male(daniel).
male(sam).
male(kane).
male(raheem).
male(jason).
male(adam).
male(william).
male(charles).

%female(name).
female(angelina).
female(max).
female(caroline).
female(racheal).
female(monica).
female(pheobe).

%father(name).
father(raheem,adam).
father(raheem,william).
father(raheem, pheobe).
father(kane, raheem).
father(sam, racheal).
father(daniel, max).
father(kane, jason).
father(kane, monica).
father(jason,charles).

%mother(name).
mother(racheal,adam).
mother(racheal,william).
mother(racheal, pheobe).
mother(caroline, raheem).
mother(max, racheal).
mother(angelina, max).
mother(caroline, jason).
mother(caroline, monica).

%married(Husband,Wife).
married(raheem,racheal).
married(kane,caroline).
married(sam,max).
married(daniel,angelina).


%% This applies when Mem1 is parent of Mem2.
parent(Mem1,Mem2):-father(Mem1,Mem2).
parent(Mem1,Mem2):-mother(Mem1,Mem2).

%% This applies when Mem1 has a sister.
has_sister(Mem1):-sister(_,Mem1).

%% This applies when Mem1 has a brother.
has_brother(Mem1):-brother(_,Mem1).

%% This applies when Mem1 is sister of Mem2.
sister(Mem1,Mem2) :- female(Mem1),parent(Parent,Mem1),
parent(Parent,Mem2), Mem1 \= Mem2.

%% This applies when Mem1 is brother of Mem2.
brother(Mem1,Mem2) :-  male(Mem1),parent(Parent,Mem1),
parent(Parent,Mem2), Mem1 \= Mem2.

%% This applies when Mem1 and Mem2 are cousins.
cousin(Mem1,Mem2):-parent(Parent1,Mem1),parent(Parent2,Mem2),
brother(Parent1,Parent2).
cousin(Mem1,Mem2):-parent(Parent1,Mem1),parent(Parent2,Mem2),
sister(Parent1,Parent2).

%% This applies when Mem1 and person 2 are sibilings.
sibilings(Mem1,Mem2):-parent(Parent,Mem1),parent(Parent,Mem2),\+(Mem1=Mem2).

%% This applies when Mem2 is grandfather of Mem1.
grandfather(Mem1,Mem2) :- male(Mem1),parent(Mem1,Z),
parent(Z,Mem2).

%% This applies when Mem2 is grandmother of Mem1.
grandmother(Mem1,Mem2) :- female(Mem1),parent(Mem1,Z),
parent(Z,Mem2).

%% This applies when Mem2 is aunt of Mem1.
aunt(Mem1,Mem2) :- female(Mem1),sister(Mem1,Mom),
mother(Mom,Mem2).

%% This applies when Mem2 is aunt of Mem1.
aunt(Mem1,Mem2) :- female(Mem1),sister(Mem1,Dad),
father(Dad,Mem2).

%% This applies when Mem2 is uncle of Mem1.
uncle(Mem1,Mem2) :- brother(Mem1,Parent),parent(Parent,Mem2).

%% This applies when Mem1 is ancestor of Mem2.
ancestor(Mem1, Mem2) :- parent(Mem1,Mem2).
ancestor(Mem1, Mem2) :- parent(Mem1,Z), ancestor(Z,Mem2). 

