playAs(0).
playAs(1).

/* PROLOG */
parser([[X,Y]|_],X,Y).

iterator(Y,Y,L,R):- lookfor(Y,Y,L,R,Y).
iterator(X,Y,L,K):- X1=X+1 & link(MF,R,K) & lookfor(X,Y,L,MF,Y) & iterator(X1,Y,L,R).

link([], Cs, Cs).
link([A|As],Bs,[A|Cs]):- link(As, Bs, Cs).

lookfor(X,0,L,[],S):- threat([X,0],L,S).
lookfor(X,0,_,[[X,0]],_).
lookfor(X,Y,L,MF,S):- Y1=Y-1 & threat([X,Y],L,S) & lookfor(X,Y1,L,MF,S).
lookfor(X,Y,L,[[X,Y]|MF],S):- Y1=Y-1 & lookfor(X,Y1,L,MF,S).

threat([],[],_).
threat([X,_],[[X,_]|_],_).
threat([_,Y],[[_,Y]|_],_).
threat(Q,[Car|Cdr],P):- threat(Q,Cdr,P) | checkloop(Q,P,[Car|Cdr]).

checkloop([X1,X2],P,[[C1,C2]|R]):- check(X1,X2,P,[[C1,C2]|R])| onemore([X1,X2],P,[[C1,C2]|R]).
onemore([X1,X2],P,[[C1,C2]|R]):- P>0 & P1=P-1 & checkloop([X1,X2],P1,[[C1,C2]|R]).
check(X1,X2,P,[[C1,C2]|R]):- X1=C1+P & X2=C2+P | X1=C1-P & X2=C2+P | X1=C1+P & X2=C2-P | X1=C1-P & X2=C2-P | X1==C1 & X2==C2.
/* PROLOG */

/* JASON */
+player(P) : playAs(NP) & not P==NP <- .print("No es el turno de",NP).
+player(P) : playAs(P) <- .print("Jugador: ", P); !do.

+!do: true <- !getPos(X,Y); block(X,Y).
//if(not(queen(X,Y))) { move_towards(X,Y); block; } else { !do }.

+!getPos(X,Y) <-
	?size(ES); S=ES-1;
	.findall([I,J],queen(A,O),ALL);
	?iterator(0,S,ALL,FL);
	.findall([I,J],block(I,J),BL);
	.difference(FL,BL,RL);
	if(not(.empty(RL))) { .shuffle(RL,SRL); ?parser(SRL,X,Y); }
	else { .print("FIN."); .kill_agent(r0); .kill_agent(r1); .kill_agent(r2); }.
/* JASON */
