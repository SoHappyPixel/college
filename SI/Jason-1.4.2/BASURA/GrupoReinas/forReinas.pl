qfor(Y,Y,L,R):- mirafila(Y,Y,L,R).

qfor(X,Y,L,[MF|R]):- X1 is X+1,
					 mirafila(X,Y,L,MF),
					 qfor(X1,Y,L,R).

mirafila(X,0,L,[]):- ataca([X,0],L).

mirafila(X,0,_,[[X,0]]).

mirafila(X,Y,L,MF):- Y1 is Y-1,
					 ataca([X,Y],L),
					 mirafila(X,Y1,L,MF).

mirafila(X,Y,L,[[X,Y]|MF]):- Y1 is Y-1,
							 mirafila(X,Y1,L,MF).

ataca([],[]).
ataca([X,_],[[X,_]|_]).
ataca([_,Y],[[_,Y]|_]).

ataca([A,B],P,[[X,Y]|_]):-
X1 is C1-P, X2 is C2-P;
X1 is C1+P, X2 is C2+P;
X1 is C1+P, X2 is C2-P;
X1 is C1-P, X2 is C2+P;
X1 = C1, X2 = C2.


ataca(Q,[Car|Cdr]):- ataca(Q,Cdr); ataca(Q,2,[Car|Cdr]).

ataca(Q,P,[Car|Cdr]):- test(Q,P,Car); P1 is P+1, ataca(Q,P1,Cdr).

%ataca(X,P,[_|R]):- P1 is P+1, write(P1).
ataca(X,P,[_|R]):- P1 is P+1, ataca(X,P1,R).

test([X1,X2],P,[C1,C2]):-
X1 is C1-P, X2 is C2-P;
X1 is C1+P, X2 is C2+P;
X1 is C1+P, X2 is C2-P;
X1 is C1-P, X2 is C2+P;
X1 = C1, X2 = C2.

remover([[]|Xs], Xs).
remover([[A]|Xs], [A|Xs]).
remover([Y|Ys], [Y|Zs]):- remover(Ys, Zs).
