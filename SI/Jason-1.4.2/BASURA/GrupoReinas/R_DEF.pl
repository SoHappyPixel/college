qfor(Y,Y,L,R):-
mirafila(Y,Y,L,R).

qfor(X,Y,L,[MF|R]):-
X1 is X+1,
mirafila(X,Y,L,MF),
qfor(X1,Y,L,R).

mirafila(X,0,L,[]):-
ataca([X,0],L).

mirafila(X,0,_,[[X,0]]).

mirafila(X,Y,L,MF):-
Y1 is Y-1,
ataca([X,Y],L),
mirafila(X,Y1,L,MF).

mirafila(X,Y,L,[[X,Y]|MF]):-
Y1 is Y-1,
mirafila(X,Y1,L,MF).

ataca(_,[]):- fail.
ataca([X,_],[[X,_]|_]).
ataca([_,Y],[[_,Y]|_]).
ataca(Q,R):- ataca(Q,1,R).
ataca([X1,X2],P,[[C1,C2]|_]):-
X1 = (C1-P), X2 = (C2-P);
X1 = (C1+P), X2 = (C2+P);
X1 = (C1+P), X2 = (C2-P);
X1 = C1-P, X2 = C2+P;
X1 = C1, X2 = C2.
