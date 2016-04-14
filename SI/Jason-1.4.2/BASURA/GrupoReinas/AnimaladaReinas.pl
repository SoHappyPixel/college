qfor(Y,Y,L,R):-
mirafila(Y,Y,L,R,Y).
qfor(X,Y,L,[MF|R]):-
X1 is X+1,
mirafila(X,Y,L,MF,Y),
qfor(X1,Y,L,R).

mirafila(X,0,L,[],S):-
ataca([X,0],L,S).
mirafila(X,0,_,[[X,0]],_).
mirafila(X,Y,L,MF,S):-
Y1 is Y-1,
ataca([X,Y],L,S),
mirafila(X,Y1,L,MF,S).
mirafila(X,Y,L,[[X,Y]|MF],S):-
Y1 is Y-1,
mirafila(X,Y1,L,MF,S).

ataca([],[],_).
ataca([X,_],[[X,_]|_],_).
ataca([_,Y],[[_,Y]|_],_).
ataca(Q,[Car|Cdr],P):-
ataca(Q,Cdr,P);

atacaDiag(Q,P,[Car|Cdr]).
atacaDiag([X1,X2],P,[[C1,C2]|R]):-
test(X1,X2,P,[[C1,C2]|R]);
nextlvl([X1,X2],P,[[C1,C2]|R]).

nextlvl(_,0,_):-!,fail.
nextlvl([X1,X2],P,[[C1,C2]|R]):-
P1 is P - 1,
atacaDiag([X1,X2],P1,[[C1,C2]|R]).

test(X1,X2,P,[[C1,C2]|_]):-
X1 is C1+P, X2 is C2+P;
X1 is C1-P, X2 is C2+P;
X1 is C1+P, X2 is C2-P;
X1 is C1-P, X2 is C2-P;
X1 = C1, X2 = C2.
