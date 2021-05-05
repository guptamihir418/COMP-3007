% Mihir Gupta
% 101172281

%player(name(First,Last),team(City),pos(Position),stats(Goals,Assists,Shots))

player(name(alex,ovechkin),team(was),pos(lw),stats(51,38,338)).
player(name(marcus,pettersson),team(pit),pos(d),stats(2,23,87)).
player(name(kevin,fiala),team(min),pos(lw),stats(13,26,174)).
player(name(ryan,hartman),team(min),pos(rw),stats(12,14,145)).
player(name(leon,driasaitl),team(edm),pos(c),stats(50,55,231)).
player(name(john,tavares),team(tor),pos(c),stats(47,41,286)).
player(name(steven,stamkos),team(tb),pos(c),stats(45,53,234)).
player(name(nikita,kucherov),team(tb),pos(rw),stats(41,87,246)).
player(name(nathan,mackinnon),team(col),pos(c),stats(41,58,365)).
player(name(alex,debrincat),team(chi),pos(rw),stats(41,35,220)).
player(name(jake,guentzel),team(pit),pos(lw),stats(40,36,227)).
player(name(jeff,skinner),team(buf),pos(lw),stats(40,23,268)).
player(name(mark,scheifele),team(wpg),pos(c),stats(38,46,199)).
player(name(johnny,gaudreau),team(cgy),pos(lw),stats(36,63,245)).
player(name(mike,hoffman),team(fla),pos(lw),stats(36,34,253)).
player(name(aleksander,barkov),team(fla),pos(c),stats(35,61,206)).
player(name(morgan,rielly),team(tor),pos(d),stats(20,52,223)).
player(name(brent,burns),team(sj),pos(d),stats(16,67,300)).
player(name(patrick,kane),team(chi),pos(rw),stats(44,66,341)).

ryan_details(Team,Position):- player(name(ryan,hartman),team(Team),pos(Position),stats(_,_,_)).

assists(Last_Name):-player(name(_,Last_Name),team(_),pos(_),stats(_,Assists,_)), Assists>=52.

left_wing(Name):-player(name(Name,_),team(_),pos(lw),stats(_,_,_)).

teams(Team):-player(name(alex,_),team(Team),_,stats(_,_,_)).

play_same(Name1,Name2):-player(name(Name1,_),team(Team),pos(_),stats(_,_,_)),player(name(Name2,_),team(Team),pos(_),stats(_,_,_)),not(Name1 = Name2).

points(Name):-player(name(Name,_),team(_),pos(_),stats(Goal,Assists,_)), Points is Goal+Assists,Points>=90,Points=<100.

shot_accuracy(Accuracy):-player(_,_,_,stats(Goals,_,Shots)), Accuracy is Goals/Shots,Goals=2.

accurate(FirstName,LastName,Accuracy):-player(name(FirstName,LastName),_,_,stats(Goals,_,Shots)), Accuracy is Goals/Shots,Goals=50.


%   Queries


%% a
% ryan_details(Team,Position).

%% b
% assists(Last_Name).

%% c
% left_wing(Name).

%% d
% teams(Team).

%% e
% play_same(Name1,Name2).

%% f
% points(Name).

%% g
% shot_accuracy(Accuracy).

%% h
% accurate(FirstName,LastName,Accuracy).















