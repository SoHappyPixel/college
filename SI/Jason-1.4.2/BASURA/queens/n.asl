ataca([],[],[]).
ataca(q(X,_),[q(X,_)|_],[]).
ataca(q(_,Y),[q(_,Y)|_],[]).

ataca(Q,[Car|Cdr],[L|R]):-
ataca(Q,Cdr,L),
ataca(Q,1,[Car|Cdr],R).

ataca([X1,X2],P,[[C1,C2]|Cdr],[]):-
comprueba1(X1,X2,P,C1,C2);
comprueba2(X1,X2,P,C1,C2);
comprueba3(X1,X2,P,C1,C2);
comprueba4(X1,X2,P,C1,C2);
comprueba5(X1,X2,P,C1,C2).

ataca(X,P,[Car|R],[Car|Cdr]):-
P1 = P+1,
ataca(X,P1,R,Cdr).

comprueba1(X1,X2,P,C1,C2):-
X1 is C1+P, X2 is C2+P.
comprueba2(X1,X2,P,C1,C2):-
X1 is C1-P, X2 is C2+P.
comprueba3(X1,X2,P,C1,C2):-
X1 is C1-P, X2 is C2+P.
comprueba4(X1,X2,P,C1,C2):-
X1 is C1-P, X2 is C2+P.
comprueba5(X1,X2,_,C1,C2):-
X1 = C1, X2 = C2.


/* Initial beliefs and rules */

/* Initial goals */
!start.

/* Plans */
+!start:true <-
	.findall(queen(C,D),queen(C,D),L);
	printf("Q: ", L);
	move_towards(1,1);
	put(queen).
