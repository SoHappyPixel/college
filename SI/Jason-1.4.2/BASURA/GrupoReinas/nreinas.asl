/* Initial beliefs */

ataca([],[],[]).
ataca([X,_],[[X,_]|_],[]).
ataca([_,Y],[[_,Y]|_],[]).

ataca(Q,[Car|Cdr],R):-ataca(Q,Cdr,R)|
					ataca(Q,1,[Car|Cdr],R).

ataca([X1,X2],P,[[C1,C2]|_],[]):-comprueba1(X1,X2,P,C1,C2)|
							  comprueba2(X1,X2,P,C1,C2)|
							  comprueba3(X1,X2,P,C1,C2)|							  
							  comprueba4(X1,X2,P,C1,C2)|							  
							  comprueba5(X1,X2,P,C1,C2).
				 
ataca([X1,X2],P,[_|R],[X1,X2]):- P1 = P + 1&
				   ataca(X,P1,R).
				   

comprueba1(X1,X2,P,C1,C2):-X1 = C1+P &
						   X2 = C2+P.
comprueba2(X1,X2,P,C1,C2):-X1 = C1-P &
						   X2 = C2+P.
comprueba3(X1,X2,P,C1,C2):-X1 = C1-P &
						   X2 = C2+P.
comprueba4(X1,X2,P,C1,C2):-X1 = C1-P &
						   X2 = C2+P.
comprueba5(X1,X2,_,C1,C2):-X1 == C1 & 
						   X2 == C2.

monta([],[]).
monta([Car|Cdr],[[X|Y]|L]):-despieza(Car,X,Y) &
							monta(Cdr,L).
						   
despieza([],[],[]).
despieza(q(X,Y),X,Y).

queen(1,1).
queen(3,1).
queen(2,1).
queen(1,2).
/* Initial goal */
!start.
/* Plans */

+!start:true <-
	.findall(q(C,D),queen(C,D),L);
	monta(L,R);
	print(L).
	

