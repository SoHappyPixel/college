ataca([],[]).
ataca([X,_],[[X,_]|_]).
ataca([_,Y],[[_,Y]|_]).

ataca(Q,[Car|Cdr]):- ataca(Q,Cdr); ataca(Q,1,[Car|Cdr]).

ataca([X1,X2],P,[[C1,C2]|_]):- 
	test1(X1,X2,P,C1,C2);
	test2(X1,X2,P,C1,C2);
	test3(X1,X2,P,C1,C2);
	test4(X1,X2,P,C1,C2);
	test5(X1,X2,P,C1,C2).

ataca(X,P,[_|R]):- P1 is P+1, ataca(X,P1,R).


test1(X1,X2,P,C1,C2):- X1 is C1+P, X2 is C2+P.
test2(X1,X2,P,C1,C2):- X1 is C1-P, X2 is C2-P.
test3(X1,X2,P,C1,C2):- X1 is C1-P, X2 is C2+P.
test4(X1,X2,P,C1,C2):- X1 is C1+P, X2 is C2-P.
test5(X1,X2,_,C1,C2):- X1 = C1, X2 = C2.
