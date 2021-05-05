%Name: Mihir Gupta
%Student number: 101172281

%Our network
edge(toronto, montreal,	    505.48).
edge(vancouver, calgary,    676.14 ).
edge(ottawa, edmonton, 	    2836.48).
edge(mississauga, winnipeg,	1500.94).
edge(hamilton, 	quebec, 	792.82).
edge(brampton, kitchener, 	63.3).
edge(surrey, laval, 	    3652.17).
edge(london, victoria, 	    3284.25).
edge(halifax, markham, 	    1248.92).
edge(oshawa, gatineau, 	    304.38).
edge(vaughan, longueuil, 	511.46).
edge(windsor, burnaby, 	    3152.44).
edge(saskatoon, barrie,     2156.81).
edge(regina, richmond, 	    1331.75).
edge(oakville, 	burlington, 14.34).
edge(richmondHill, 	sherbrooke, 621.01).
edge(saguenay, 	stCatharines, 	861.28).
edge(montreal, regina,      2357.61).
edge(stCatharines, stJohns, 2119.33).
edge(waterloo, levis,       820.92).
edge(coquitlam, oakville,    3322.22).
edge(london, terrebonne,    675.47).
edge(thunderBay, kelowna, 	2185.74).
edge(stJohns, saintJohn,    1048.48).
edge(waterloo, 	terrebonne, 597.7).
edge(brantford, ajax, 	    127.48).
edge(ottawa, thunderBay,    1383.57).
edge(levis, troisRivieres, 	116.28).
edge(abbotsford, cambridge, 3244.06).
edge(kingston, 	guelph, 	311.27).
edge(coquitlam, whitby, 	3353.39).
edge(kelowna, laval,        4186.07).
edge(oakville, london,      155.94 ).
edge(cambridge, edmonton,   3385.31 ).
edge(troisRivieres, surrey, 4660.99 ).
edge(victoria,halifax,      6207.31 ).
edge(guelph, waterloo,      23.73 ).
edge(kelowna, gatineau,     3265.9).
edge(stJohns, laval,        1618.64).
edge(barrie,oshawa,         85.46 ).
edge(edmonton, ottawa,      2836.48).
edge(winnipeg, halifax,     2575.26 ).
edge(laval, hamilton,       550.99).
edge(richmond, guelph,      3304.26).
edge(burlington,coquitlam,   4304.81).
edge(ajax, abbotsford,      3320.8 ).
edge(cambridge, victoria,   3333.53 ).
edge(gatineau, saskatoon,   2363.13 ).
edge(saintJohn, hamilton,   1120.76).
edge(terrebonne, toronto,   507.8).

my_predicate1(Node1,Node2,X,[Node2|X]) :-  edge(Node1,Node2,_).
my_predicate1(Node1,Node2,Z,X) :- edge(Node1,Cam,_),not(Cam=Node2),not(member(Cam,Z)),my_predicate1(Cam,Node2,[Cam|Z],X).
my_predicate2(A,X,Y):- A = [_],Y = X.
my_predicate2(Lis,X,Y):- Lis=[Gen|Gen2],Gen2=[Gen3|_],(edge(Gen,Gen3,Edge);edge(Gen3,Gen,Edge)),Con is Edge + X,my_predicate2(Gen2,Con,Y).
my_predicate3(A,[],Con,X,Y,Edge):- A = _, Edge = Con, Y = X.
my_predicate3(A,[Gen|Gen2],Con,Cam,B,Edge):- \+(pathLength(A,Gen,_)),my_predicate3(A,Gen2,Con,Cam,B,Edge). 
my_predicate3(A,[Gen|Gen2],Con,X,B,Edge):- X = _, pathLength(A,Gen,Path),Path > Con,my_predicate3(A,Gen2,Path,Gen,B,Edge). 
my_predicate3(A,[Gen|Gen2],Con,Cam,B,Edge):- pathLength(A,Gen,Path),Path =< Con, my_predicate3(A,Gen2,Con,Cam,B,Edge).


connected(Node1,Node2):- commuterPath(Node1,Node2,_).

commuterPath(Node1,Node2,X) :- my_predicate1(Node1,Node2,[Node1],Y),
reverse(Y,X).

pathLength(Node1,Node2,X):- commuterPath(Node1,Node2,Y),my_predicate2(Y,0,X).

getCycle(Node1,X):- commuterPath(Node1,Node1,X).

longestPath(Node2,X):- findall(Node1,(edge(Node1,_,_);edge(_,Node1,_)),Y),
sort(Y,Z),select(Node2,Z,Edge),
my_predicate3(Node2,Edge,0,1,M,_),commuterPath(Node2,M,X),!.










